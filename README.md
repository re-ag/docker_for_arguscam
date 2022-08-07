# Docker scripts for ros argus camera node

This scipts are from [Isaac ROS Common](https://github.com/NVIDIA-ISAAC-ROS/isaac_ros_common). 



## System Requirements
### Jetson
- [Jetson AGX Xavier and NX Xavier](https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/)
- [JetPack 4.6](https://developer.nvidia.com/embedded/jetpack)


### Docker

You must first install the [Nvidia Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html) to make use of the Docker container development/runtime environment.

Configure `nvidia-container-runtime` as the default runtime for Docker by editing `/etc/docker/daemon.json` to include the following:
```
    "runtimes": {
        "nvidia": {
            "path": "nvidia-container-runtime",
            "runtimeArgs": []
        }
    },
    "default-runtime": "nvidia"
```
and then restarting Docker: `sudo systemctl daemon-reload && sudo systemctl restart docker`

## Quickstart
1. Clone this repository:
`git clone https://github.com/re-ag/docker_for_arguscam.git && cd docker_for_arguscam`

2. Build docker image. By default, the directory `/workspaces/isaac_ros-dev` in the container is mapped from `~/workspaces/isaac_ros-dev` on the host machine if it exists OR the current working directory from where the script was invoked otherwise. 

      `./build.sh <path-to-workspace>`


3. Run docker container. Without `--rm` option, the container is persistent even if reboot : 

    `./run.sh <image-name>`



