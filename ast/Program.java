package ast;

import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import ast.Symbol.DeclarationLocation;
import cfg.*;
import llvm.CFGtoLLVM;
import semantic.SemanticVisitor;
import semantic.Visitor;


public class Program {
   private final List<TypeDeclaration> types;
   private final List<Declaration> declarations;
   private final List<Function> functions;
   private List<FunctionWrapper> cfgFunctions;

   public Program(List<TypeDeclaration> types, List<Declaration> declarations,
      List<Function> functions)
   {
      this.types = types;
      this.declarations = declarations;
      this.functions = functions;
      this.cfgFunctions = null;
   }

   public void accept(SemanticVisitor v) {
      v.getSymbols().put("__location__", new Symbol(new VoidType(), DeclarationLocation.PUBLIC));
      for (TypeDeclaration t : this.types) {
         t.accept(v);
      }

      for (Declaration d : this.declarations) {
         d.accept(v);
      }

      for (Function f : this.functions) {
         if (v.getFunctions().containsKey(f.getName())) {
            System.out.printf("function %s already exists%n", f.getName());
            v.addError(1);
         }

         List params = new ArrayList<Type>();
         for (Declaration d : f.getParams()) {
            params.add(d.getType());
         }
         if (f.getRetType() instanceof StructType) {
            v.addFunction(f.getName(), new FunctionType(f.getName(), params, v.getStructs().get(((StructType)f.getRetType()).getName())));
         } else {
            v.addFunction(f.getName(), new FunctionType(f.getName(), params, f.getRetType()));
         }

         Map<String, Symbol> syms = new HashMap<String, Symbol>();
         Map<String, FunctionType> functions = new HashMap<String, FunctionType>();
         Map<String, StructType> structs = new HashMap<String, StructType>();
         syms.putAll(v.getSymbols());
         functions.putAll(v.getFunctions());
         structs.putAll(v.getStructs());
         f.accept(new SemanticVisitor(syms, functions, structs));
      }
   }

   public void accept(ASTtoCFG v) {
      cfgFunctions = new ArrayList<FunctionWrapper>();
      for (Function f : this.functions) {
         ASTtoCFG visitor = new ASTtoCFG(v.getCount());
         f.accept(visitor);
         cfgFunctions.add(new FunctionWrapper(f, visitor.getCFG()));
         v.setCount(visitor.getCount() + (10 - visitor.getCount()%10));
      }
   }

   public void accept(CFGtoLLVM v) {
      v.visit(this);
   }

   public List<FunctionWrapper> getCFGFunctions() {
      return this.cfgFunctions;
   }

   public List<TypeDeclaration> getTypes() {
      return this.types;
   }

   public List<Declaration> getDeclarations() {
      return this.declarations;
   }

   public List<Function> getFunctions() {
      return this.functions;
   }

   public String toString() {
      String output = "Program Structs: \n";
      for (TypeDeclaration t : this.types) {
         output += "  " + t.toString("  ") + "\n";
      }
      output += "Program Declarations: \n";
      for (Declaration d : this.declarations) {
         output += d.toString("  ") + "\n";
      }
      output += "\nProgram Functions: \n";
      for (Function f : this.functions) {
         output += "  " + f.toString("  ") + "\n";
      }
      return output;
   }
}
