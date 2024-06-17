import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

import cfg.*;
import llvm.CFGtoLLVM;
import llvm.LLVMProgram;
import semantic.SemanticVisitor;
import arm.*;

import java.util.List;
import java.util.HashMap;
import java.io.*;
import javax.json.JsonValue;

public class MiniCompiler
{
   public static void main(String[] args)
   {
      parseParameters(args);

      CommonTokenStream tokens = new CommonTokenStream(createLexer());
      MiniParser parser = new MiniParser(tokens);
      ParseTree tree = parser.program();
      // Removed comment to enable stack allocation
      // CFGtoLLVM.setUseStackAllocation(true);

      if (parser.getNumberOfSyntaxErrors() == 0)
      {
         /*
            This visitor will create a JSON representation of the AST.
            This is primarily intended to allow use of languages other
            than Java.  The parser can thusly be used to generate JSON
            and the next phase of the compiler can read the JSON to build
            a language-specific AST representation.
         */
         //MiniToJsonVisitor jsonVisitor = new MiniToJsonVisitor();
         //JsonValue json = jsonVisitor.visit(tree);

         /*
            This visitor will build an object representation of the AST
            in Java using the provided classes.
         */
         MiniToAstProgramVisitor programVisitor =
            new MiniToAstProgramVisitor();
         ast.Program program = programVisitor.visit(tree);
         //System.out.println("program toString: " + program.toString());

         SemanticVisitor typeCheck = new SemanticVisitor();
         program.accept(typeCheck);

         //System.out.println("errors detected: " + typeCheck.getErrors());

         ASTtoCFG buildCFG = new ASTtoCFG();
         program.accept(buildCFG);

         CFGtoLLVM writeLLVM;
         HashMap<String, Boolean> argsHash = new HashMap<String, Boolean>();
         if (args.length > 1) {
            for (int i = 1; i < args.length; i++) {
               argsHash.put(args[i], false);
               if (args[i].equals("-stack")) {
                  CFGtoLLVM.setUseStackAllocation(true);
               }
            }
            writeLLVM = new CFGtoLLVM(argsHash);
         } else {
            writeLLVM = new CFGtoLLVM();
         }
         program.accept(writeLLVM);

         LLVMProgram llvmProg = writeLLVM.getProgram();

         if (argsHash.containsKey("-llvm")) {
            System.out.println(llvmProg.toString());
         }
         if (argsHash.containsKey("-write")) {
            String outputFileName = _inputFile.replaceAll("\\.mini$", "") + ".ll";
            llvmProg.toFile(outputFileName);
            System.out.println("LLVM output written to: " + outputFileName);
         }
         if (!argsHash.containsKey("-llvm") && !argsHash.containsKey("-write")) {
            System.out.println("attempting to write ARM");
            LLVMtoARM writeARM = new LLVMtoARM();
            writeARM.visit(llvmProg);
            System.out.println("func len:" + writeARM.getFunctions().size());
            for (ARMFunction func : writeARM.getFunctions()) {
               System.out.println(func.toString());
            }
         }
      }
   }

   private static String _inputFile = null;

   private static void parseParameters(String [] args)
   {
      _inputFile = args[0];
   }

   private static void error(String msg)
   {
      System.err.println(msg);
      System.exit(1);
   }

   private static MiniLexer createLexer()
   {
      try
      {
         CharStream input;
         if (_inputFile == null)
         {
            input = CharStreams.fromStream(System.in);
         }
         else
         {
            input = CharStreams.fromFileName(_inputFile);
         }
         return new MiniLexer(input);
      }
      catch (java.io.IOException e)
      {
         System.err.println("file not found: " + _inputFile);
         System.exit(1);
         return null;
      }
   }
}
