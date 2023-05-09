#!/bin/bash

# Main PC startcommands!
# This script acts as an extension to the i3 config, that only runs
# if the system is defined as the main pc (by defining env ismainpc).

# Check if mainpc
if [[ -z "${ismainpc}" ]]; then
    echo "ismainpc not defined, is not mainpc"
    exit
else
    echo "ismainpc defined, assuming mainpc"
fi

# Put stuff to only happen on Main PC here! (i will forget about this wont i)
