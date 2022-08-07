#!/bin/bash
# Map host's display socket to docker
BASE_NAME=$1
DOCKER_ARGS+=("-v /tmp/.X11-unix:/tmp/.X11-unix")
DOCKER_ARGS+=("-e DISPLAY")
DOCKER_ARGS+=("-e NVIDIA_VISIBLE_DEVICES=all")
DOCKER_ARGS+=("-e NVIDIA_DRIVER_CAPABILITIES=all")
DOCKER_ARGS+=("-v /usr/bin/tegrastats:/usr/bin/tegrastats")
DOCKER_ARGS+=("-v /tmp/argus_socket:/tmp/argus_socket")
DOCKER_ARGS+=("-v /usr/lib/aarch64-linux-gnu/tegra:/usr/lib/aarch64-linux-gnu/tegra")
DOCKER_ARGS+=("-v /usr/src/jetson_multimedia_api:/usr/src/jetson_multimedia_api")
DOCKER_ARGS+=("-v /usr/sbin/nvargus-daemon:/usr/sbin/nvargus-daemon")


ISAAC_ROS_DEV_DIR="$HOME/workspaces/isaac_ros-dev"
#--entrypoint /usr/local/bin/scripts/workspace-entrypoint.sh \
docker run -it \
    --privileged --network host \
    ${DOCKER_ARGS[@]} \
    -v $ISAAC_ROS_DEV_DIR:/workspaces/isaac_ros-dev \
    --name "$CONTAINER_NAME" \
    --runtime nvidia \
    --user="admin" \
    --workdir /workspaces/isaac_ros-dev \
    $BASE_NAME \
    /bin/bash
