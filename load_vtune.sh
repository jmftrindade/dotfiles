#!/bin/sh

echo "Enabling ptrace level 0..."
echo "0" | sudo tee /proc/sys/kernel/yama/ptrace_scope

echo "Loading VTune modules..."
. $VTUNE_HOME/sepdk/src/insmod-sep
