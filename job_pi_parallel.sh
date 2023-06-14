#!/bin/bash 
#SBATCH --job-name=pi_parallel
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=8
#SBATCH --ntasks=32
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=2GB
#SBATCH --time=00:10:00
#SBATCH --partition=gpu
#SBATCH --reservation=bootcamp
#SBATCH --account=hpcsuppt_613

module purge
module load usc/11.3.0

export UCX_LOG_LEVEL=error

ulimit -s unlimited

cd ${SLURM_SUBMIT_DIR}
mpirun -np $SLURM_NTASKS ./monte-carlo-pi-parallel.x > pi_parallel.log

