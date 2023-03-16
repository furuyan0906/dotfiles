#!/usr/bin/bash

if [ "$(uname)" == "Linux" ]; then
    ./ubuntu/setup
else
    echo "Platform: $(uname -a)"
    echo "This platform is not supported."
fi

