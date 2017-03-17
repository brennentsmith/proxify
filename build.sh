#!/bin/bash

echo "Cleaning old builds..."

eval $(which docker) rmi brennents/proxify:latest

echo "Building Proxify..." 

eval $(which docker) build --no-cache -t brennents/proxify:latest .
