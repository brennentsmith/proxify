#!/bin/bash

echo "Building Proxify..." 

eval $(which docker) build --no-cache -t proxify .
