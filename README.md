# About

This repository is meant set up a Docker container that uses CUDA. After doing the first time setup, your local machine should be able to run any Docker containers that require a GPU. This repo will show you the basics of getting set up and how to get started creating your own Docker CUDA container. 

# First time set up

To run this programs, you will need to have installed:

	-WSL (if running Windows)
	-Docker
	-NVIDIA's Docker support toolkit

## Docker Setup

If you do not have docker installed as of yet, please go to the following website for help setting up on your local machine. If you are running Windows, you will actually want to set up Docker in WSL. If you do not have WSL set up, you can follow the instructions at the following website. 

## Setting Up Docker with GPU Support

Once you have Docker setup, you will need to install the NVIDIA support for docker so that Docker can use the onboard GPU on your local system. You can do this with the following commands:

```sh
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \ && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \ && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update

sudo apt-get install -y nvidia-docker2

sudo systemctl restart docker
```

To test if your GPU was properly configured with Docker, you can check with the following command:

```sh
sudo docker run --rm --gpus all nvidia/cuda:11.0.3-base-ubuntu18.04 nvidia-smi
```

For future reference, if you are ever running a container that requires a GPU, you will need to run the container with the '--gpus all' flag so that the container can access the local GPU.


# Building and Running

Once you have downloaded the repository, you can simply build by running the following command:

```sh
sudo docker build -t basiccuda .
```

Where 'basiccuda' can be any tagline you choose, but I chose basiccuda for my example. Once the image has built, you can run with the following command:

```sh
sudo docker run --gpus all basiccuda
```

Remember once again that '--gpus all' needs to be set so that the container can use the GPU. 
