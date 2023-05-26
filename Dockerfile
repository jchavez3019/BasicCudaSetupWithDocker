# grabbing devel in order to use nvcc for building CUDA application
# another (maybe better) alternative would be to copy over the object and using only base to run the CUDA object file
FROM nvidia/cuda:11.0.3-devel-ubuntu18.04

WORKDIR /project

# copy the local src folder into the Docker work directory
COPY . .

# install python dependencies
RUN apt-get update
RUN apt install -y python3 python3-pip
RUN python3 -m pip install -r py_requirements.txt

# for running a web application that runs on local host, this exposes the host outside of the container
# EXPOSE 5000

# change work directory to where the src files are at
WORKDIR /project/src

# prints NVIDIA details
# CMD nvidia-smi

# build and run the basic cuda application
CMD nvcc vector_add.cu -o vector_add && ./vector_add && python3 ./test_torch.py

# runs the pyhton file to test if torch works with the gpu
# CMD python3 ./test_torch.py