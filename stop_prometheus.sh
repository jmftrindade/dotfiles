#!/bin/sh

echo "Stopping prometheus services..."
sudo systemctl stop prometheus-node-exporter
sudo systemctl stop prometheus
echo "Done."
