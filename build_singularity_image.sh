#!/usr/bin/env bash

module purge
module load singularity/3.5.3

image_name="text_mining_with_python"
singularity pull -F container.sif docker://rkalescky/${image_name}:latest
SHA=$(sha256sum container.sif | cut -d' ' -f1)
sed -i -e "/local sif_hash/clocal sif_hash = \'$SHA\'" environment.lua
mv container.sif /hpc/applications/singularity_containers/${image_name}_sha256.${SHA}.sif

