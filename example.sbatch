#!/usr/bin/env bash
#SBATCH -J example                     # Job name
#SBATCH -o example.out                 # Output file name
#SBATCH -p standard-mem-s              # Partition (queue)
#SBATCH -c 36                          # Cores per task
#SBATCH --mem=250G                     # Total memory required per node
#SBATCH --exclusive                    # Exclusive access to the node

module purge                           # Unload all modules
module use #"environment_path"         # Path to directory containing environment.lua
module load environment                # Load environment

python3 example.py                      # Edit Python script name as needed

