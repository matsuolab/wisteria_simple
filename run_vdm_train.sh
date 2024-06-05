#!/bin/bash

#PJM -L rscgrp=debug-a
#PJM -L node=1
#PJM -L elapse=0:10:00
#PJM -L jobenv=singularity
#PJM -j

module load singularity

cd /work/gb20/b20034

singularity exec --bind /work/gb20/b20034:/mnt --nv s6fast_env.sif bash /mnt/train_vdm_init.sh
