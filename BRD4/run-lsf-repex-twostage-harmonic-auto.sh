#!/usr/bin/env bash
# Set walltime limit
#BSUB -W 05:59
#
# Set output file
#BSUB -o BRD4-repex-harmonic-auto.%J.log
#
# Specify node group
#BSUB -m "ls-gpu lt-gpu lp-gpu lg-gpu"
#BSUB -q gpuqueue
#
# nodes: number of nodes and GPU request
#BSUB -n 16 -gpu "j_exclusive=yes:mode=shared" -R "{span[ptile=1] rusage[mem=12,ngpus_physical=1]} || {span[ptile=2] rusage[mem=24,ngpus_physical=2]} || {span[ptile=3] rusage[mem=36,ngpus_physical=3]} || {span[ptile=4] rusage[mem=48,ngpus_physical=4]}"
#
# job name (default = name of script file)
#BSUB -J "BRD4-repex-harmonic-auto"

build_mpirun_configfile "yank script --yaml=repex-twostage-harmonic-auto.yaml"
mpiexec.hydra -f hostfile -configfile configfile
