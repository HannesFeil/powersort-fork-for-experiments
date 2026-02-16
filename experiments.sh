#! /bin/sh
BUILDDIR=cmake-build-release
mkdir -p $BUILDDIR
cd $BUILDDIR
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ..
cmake --build .
cd ..

PREFIX="taskset -c 0 $BUILDDIR/src"
SEED=439569436534

mkdir -p ./results

## Usage: mergesorts [reps] [n1,n2,n3] [inputs] [contestants] [seed] [outfile]

echo "Experiment 1: int, random runs, various n"

${PREFIX}/mergesorts 1001     10000 runs-sqrtn '*' ${SEED} results/times-runs-int-e4 >> results/times-runs-int.out
${PREFIX}/mergesorts 1001    100000 runs-sqrtn '*' ${SEED} results/times-runs-int-e5 >> results/times-runs-int.out
${PREFIX}/mergesorts 1001   1000000 runs-sqrtn '*' ${SEED} results/times-runs-int-e6 >> results/times-runs-int.out
${PREFIX}/mergesorts  101  10000000 runs-sqrtn '*' ${SEED} results/times-runs-int-e7 >> results/times-runs-int.out
${PREFIX}/mergesorts  101 100000000 runs-sqrtn '*' ${SEED} results/times-runs-int-e8 >> results/times-runs-int.out


echo "Experiment 2: 10^7 ints distribution, random runs"

for runs in 3 30 300 3000 30000 300000 3000000
do
  ${PREFIX}/mergesorts 101 10000000 runs$runs '*' ${SEED} results/times-runs${runs}-int-e7 >> results/times-runs${runs}-int.out
done



echo "Experiment 3: long+pointer, random runs, various n"

${PREFIX}/mergesorts-long+pointer 1001     10000 runs-sqrtn '*' ${SEED} results/times-runs-l+p-e4 >> results/times-runs-l+p.out
${PREFIX}/mergesorts-long+pointer 1001    100000 runs-sqrtn '*' ${SEED} results/times-runs-l+p-e5 >> results/times-runs-l+p.out
${PREFIX}/mergesorts-long+pointer 1001   1000000 runs-sqrtn '*' ${SEED} results/times-runs-l+p-e6 >> results/times-runs-l+p.out
${PREFIX}/mergesorts-long+pointer  101  10000000 runs-sqrtn '*' ${SEED} results/times-runs-l+p-e7 >> results/times-runs-l+p.out
${PREFIX}/mergesorts-long+pointer  101 100000000 runs-sqrtn '*' ${SEED} results/times-runs-l+p-e8 >> results/times-runs-l+p.out


echo "Experiment 4: int, random permutations, various n"

${PREFIX}/mergesorts 1001     10000 random-permutations '*' ${SEED} results/times-rp-int-e4 >> results/times-rp-int.out
${PREFIX}/mergesorts 1001    100000 random-permutations '*' ${SEED} results/times-rp-int-e5 >> results/times-rp-int.out
${PREFIX}/mergesorts 1001   1000000 random-permutations '*' ${SEED} results/times-rp-int-e6 >> results/times-rp-int.out
${PREFIX}/mergesorts  101  10000000 random-permutations '*' ${SEED} results/times-rp-int-e7 >> results/times-rp-int.out
${PREFIX}/mergesorts  101 100000000 random-permutations '*' ${SEED} results/times-rp-int-e8 >> results/times-rp-int.out


echo "Experiment 5: count comparisons and merge cost, random runs, various n"

${PREFIX}/mergesorts-count-cmps 1001     10000 runs-sqrtn '*' ${SEED} results/times-runs-int-cmp-e4 >> results/times-runs-cmps.out
${PREFIX}/mergesorts-count-cmps 1001    100000 runs-sqrtn '*' ${SEED} results/times-runs-int-cmp-e5 >> results/times-runs-cmps.out
${PREFIX}/mergesorts-count-cmps 1001   1000000 runs-sqrtn '*' ${SEED} results/times-runs-int-cmp-e6 >> results/times-runs-cmps.out
${PREFIX}/mergesorts-count-cmps  101  10000000 runs-sqrtn '*' ${SEED} results/times-runs-int-cmp-e7 >> results/times-runs-cmps.out
${PREFIX}/mergesorts-count-cmps  101 100000000 runs-sqrtn '*' ${SEED} results/times-runs-int-cmp-e8 >> results/times-runs-cmps.out


# TODO: do this one too
# echo "Experiment 6: Cachegrind"

# BUILDDIR=cmake-build-relwithdebuginfo
# mkdir -p $BUILDDIR
# cd $BUILDDIR
# cmake -D CMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ..
# cmake --build .
# cd ..
# for algo in 0 1 2 3 5
# do
# 	valgrind --tool=callgrind --simulate-cache=yes  ${BUILDDIR}/src/mergesorts 1 100000000 runs-sqrtn $algo | tee -a cachegrind-ints-e8
# done
