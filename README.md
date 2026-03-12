= Code forked from Powersort for paper "Multiway Powersort in Rust"

This code has been forked from [Powersort](https://github.com/sebawild/powersort) and subjected
to minor modifications to generate the data used in the papers study.
See [Multiway Powersort expeirments](https://github.com/HannesFeil/multiway-powersort-experiments)
for how this data was used.

To reproduce the raw data, run the `experiments.sh` Bash script.
The code assumes a typical Unix development environment and uses `cmake`.
The code is optimized for compilation with `g++` (from the GNU Compiler Collection),
but should also work with `clang++` (from LLVM).
The output data will be written into a `results` subdirectory.

The largest inputs (100M 16-byte objects) use up to 10 GB of main memory
(buffers are not shared across algorithms); comment these runs out in `experiments.sh`
if you do not have sufficient memory.
The full set of experiments runs for ~1 day.

# Dev shell

`flake.nix` contains a devshell with the required dependencies.
