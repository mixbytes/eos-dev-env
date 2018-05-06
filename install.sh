#!/bin/bash
EOS_ENV_DIR=$HOME/opt/eos-dev

mkdir -p $EOS_ENV_DIR

if [[ $1 = "remove" ]]; then
    echo 'Uninstalling EOS dev environment'
    sudo rm -rf $EOS_ENV_DIR
else
    echo 'Installing EOS dev environment...'
    if [ ! -d "$EOS_ENV_DIR/eos-compile-service" ]; then
        echo 'Clonning eos-compile-service...'
        git clone git@github.com:mixbytes/eos-compile-service.git -b develop.multi-file-contracts $EOS_ENV_DIR/eos-compile-service
        echo 'Istalling eos-compile-service...'
        sudo npm i -g $EOS_ENV_DIR/eos-compile-service
    else
        echo "Eos-compile-service alredy installed"
    fi

    if [ ! -d "$EOS_ENV_DIR/eos-deploy" ]; then
        echo 'Clonning eos-deploy...'
        git clone git@github.com:mixbytes/eos-deploy.git -b master $EOS_ENV_DIR/eos-deploy
        echo 'Istalling eos-deploy...'
        sudo npm i -g $EOS_ENV_DIR/eos-deploy
    else
        echo "Eos-deploy alredy installed"
    fi

    echo 'Building EOS docker...'
    docker build -t local/eos $EOS_ENV_DIR/eos-compile-service/docker
fi
