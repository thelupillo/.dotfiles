#!/bin/bash

# https://rpmfusion.org/Howto/NVIDIA

sudo dnf install akmod-nvidia kmod-nvidia nvidia-modprobe nvidia-query-resource-opengl nvidia-query-resource-opengl-lib nvidia-settings nvidia-xconfig xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs

# CUDA
sudo dnf install xorg-x11-drv-nvidia-cuda

# Suspend
sudo dnf install xorg-x11-drv-nvidia-power
sudo systemctl enable nvidia-{suspend,resume,hibernate}

# NVENC/NVDEC
sudo dnf install xorg-x11-drv-nvidia-cuda-libs

# VDPAU/VAAPI
sudo dnf install vdpauinfo libva-vdpau-driver libva-utils

# For CUDA Dev:
# https://rpmfusion.org/Howto/CUDA
# Optimus:
# https://rpmfusion.org/Howto/Optimus
