import os
import sys
import subprocess
import time
import filecmp

# Paths and Constants
ANTLRJAR = "/Users/seansponsler/documents/csc431/compiler-sean/antlr-4.8-complete.jar"
JSONJAR = "/Users/seansponsler/documents/csc431/compiler-sean/given_parser/javax.json-1.0.4.jar"
COMPILE_SCRIPT = "./compile.sh"
CLANG = "clang"

# Path to the benchmarks folder
BENCHMARKS_FOLDER = "/Users/seansponsler/documents/csc431/ssponsler-compiler/tests/milestone2/benchmarks/"

def run_command(command, cwd=None):
    result = subprocess.run(command, shell=True, cwd=cwd, capture_output=True, text=True)
    return result.returncode, result.stdout, result.stderr

def run_benchmark(benchmark_folder):
    mini_file = None
    c_file = None
    input_file = None
    compile_mini = False
    compile_c = False
    expected_output_file = None

    compile_flags = "-write"
    if "-o" in sys.argv:
        compile_flags += " -u -c"
        compile_mini = True
    elif "-stack" in sys.argv and len(sys.argv) == 2:
        compile_mini = True
    elif len(sys.argv) == 1:
        compile_mini = True

    for file in os.listdir(benchmark_folder):
        if file.endswith(".mini"):
            mini_file = os.path.join(benchmark_folder, file)
        elif file.endswith(".c"):
            c_file = os.path.join(benchmark_folder, file)
        elif file.endswith(".expected"):
            expected_output_file = os.path.join(benchmark_folder, file)
        elif file.startswith("input"):
            input_file = os.path.join(benchmark_folder, file)

    if not input_file or not expected_output_file:
        print(f"Missing files in benchmark folder: {benchmark_folder}")
        return False

    if c_file and not compile_mini:
        if "-co" in sys.argv:
            compile_command = f"gcc -O3 {c_file} -o a.out"
        elif "-c" in sys.argv:
            compile_command = f"gcc -O0 {c_file} -o a.out"
        else:
            print(f"No .c file compilation flag provided for benchmark folder: {benchmark_folder}")
            return False

        retcode, stdout, stderr = run_command(compile_command, cwd=benchmark_folder)

        if retcode != 0:
            print(f"Compilation failed for {c_file}\n{stderr}")
            return False

    elif mini_file:
        if "-stack" in sys.argv and len(sys.argv) == 2:
            compile_flags = "-write -stack"

        compile_command = f"{COMPILE_SCRIPT} {mini_file} {compile_flags}"
        retcode, stdout, stderr = run_command(compile_command, cwd=os.getcwd())

        if retcode != 0:
            print(f"Compilation failed for {mini_file}\n{stderr}")
            return False

        ll_file = mini_file.replace(".mini", ".ll")

        clang_command = f"{CLANG} {ll_file} -o a.out"
        retcode, stdout, stderr = run_command(clang_command, cwd=benchmark_folder)

        if retcode != 0:
            print(f"Clang compilation failed for {ll_file}\n{stderr}")
            return False

    else:
        print(f"No .mini or .c file found in benchmark folder: {benchmark_folder}")
        return False

    run_exec_command = f"./a.out < {input_file}"
    start_time = time.perf_counter()
    retcode, stdout, stderr = run_command(run_exec_command, cwd=benchmark_folder)
    runtime = time.perf_counter() - start_time

    if retcode != 0:
        print(f"Execution failed for {benchmark_folder}/a.out\n{stderr}")
        return False

    # Compare the output against the expected output
    output_file = os.path.join(benchmark_folder, "output.txt")
    with open(output_file, "w") as f:
        f.write(stdout)

    if filecmp.cmp(output_file, expected_output_file):
        print(f"Benchmark {benchmark_folder} passed in {runtime:.6f} seconds.")
        return True
    else:
        print(f"Benchmark {benchmark_folder} failed. Output differs from expected.")
        return False

# Main function to run all benchmarks
def run_all_benchmarks():
    for root, dirs, files in os.walk(BENCHMARKS_FOLDER):
        for dir in dirs:
            benchmark_folder = os.path.join(root, dir)
            run_benchmark(benchmark_folder)

if __name__ == "__main__":
    run_all_benchmarks()