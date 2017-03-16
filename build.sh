#!/bin/bash

echo "Cleaning old builds..."

eval $(which docker) rmi proxify:latest

echo "Building Proxify..." 

eval $(which docker) build --no-cache -t proxify:latest .
