#!/bin/bash
# embedded options to bsub - start with #BSUB
# -- our name ---
#BSUB -J gpuCorePython 
#BSUB -q gpuv100
### request the number of GPUs
#BSUB -gpu "num=1:mode=exclusive_process"
### request the number of CPU cores (at least 4x the number of GPUs)
#BSUB -n 4 
### we want to have this on a single node
#BSUB -R "span[hosts=1]"
### we need to request CPU memory, too (note: this is per CPU core)
#BSUB -R "rusage[mem=8GB]"
#BSUB -B
# -- Notify me by email when execution ends   --
#BSUB -N
#BSUB -u s194702@student.dtu.dk
# -- Output File --
#BSUB -o Output_%J.out
# -- Error File --
#BSUB -e Output_%J.err
# -- estimated wall clock time (execution time): hh:mm -- 
#BSUB -W 24:00 




# Create a virtual environment using Python 3.8
#python -m venv .venv

# Activate the virtual environment

#source .venv_gaussian_in_wild/bin/activate
#pip list
module load colmap
#pip uninstall -y matplotlib pandas
#pip install --no-cache-dir --user --force-reinstall "matplotlib" "pandas" "imageio" "imageio-ffmpeg" "lpips" "kornia" "importlib_metadata"
#python -c "import numpy; print(numpy.__version__)"
#pip install --user --no-cache-dir "pandas>=2.1"
#pip install --user --upgrade --force-reinstall scipy matplotlib
#pip install pandas plyfile imageio imageio-ffmpeg  lpips matplotlib kornia importlib_metadata

#pip install Gaussian-Wild/submodules/diff-gaussian-rasterization
p#ip install Gaussian-Wild/submodules/simple-knn

#python gaussian-splatting/train.py -s first6

python Gaussian-Wild/train.py --source_path first6_Gaussian_Wild --scene_name confined --model_path outputs/confined/full  --iterations 70000

#deactivate
