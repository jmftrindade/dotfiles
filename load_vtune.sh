#!/bin/sh

echo "Enabling ptrace level 0..."
sudo sysctl -w kernel.yama.ptrace_scope=0
echo "Confirming it's set (below should print 0):"
sudo cat /proc/sys/kernel/yama/ptrace_scope

echo "\nEnabling kallsyms kernel module tracing level 0..."
sudo sysctl -w kernel.kptr_restrict=0
echo "Confirming it's set (below should print 0):"
sudo cat /proc/sys/kernel/kptr_restrict

echo "Loading VTune modules..."
sudo sh $VTUNE_HOME/sepdk/src/insmod-sep
