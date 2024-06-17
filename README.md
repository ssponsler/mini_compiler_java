# mini_compiler_java

# To run compiler
* make clean (wait until completion)
* make

# To compile an individual file
java -cp .:$ANTLRJAR:$JSONJAR MiniCompiler <flags>
compile.sh simply contains this command

# Compilation flags
* -llvm: Prints LLVM output to terminal
* -write: Writes LLVM output to <input_file_name>.ll
* -c     : CFG Compaction
* -u     : Useless Code Removal
* No arguments: Print ARM to console

# To run benchmarks
* Modify benchmark.py with appropriate ANTLRJAR, JSONJAR, BENCHMARKS_FOLDER locations
* python benchmark.py <flags>

# Benchmark flags
* -o: MiniCompiler with CFG Compaction and UCE optimizations
* -c: GCC compiler with no optimizations (-O0)
* -co: GCC compiler with optimizations (-03)
* No arguments: MiniCompiler with no optimizations
