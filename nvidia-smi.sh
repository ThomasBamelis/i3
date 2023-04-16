#!/bin/sh

nvidia-smi --query-gpu=utilization.gpu,temperature.gpu,memory.used,memory.total --format=csv,noheader,nounits | awk -F',' '{ print ""$1"%",""$2"°C",""$3" /"$4" MiB"}'
