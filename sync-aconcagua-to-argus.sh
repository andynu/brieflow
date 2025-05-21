#!/bin/bash -x
set ex

export SOURCE='aconcagua_output'
export DESTINATION='jane@argus:/disk1/brieflow_datasets/aconcagua'


rsync --progress -av --prune-empty-dirs \
    ./$SOURCE/* \
    $DESTINATION/.
    
