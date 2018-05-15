EOS_ENV_DIR=$HOME/opt/eos-dev

if [[ $1 = "up" ]]
then
    echo 'Setting UP EOS dev environment...'
    alias cleos="docker-compose -f $EOS_ENV_DIR/eos-compile-service/docker/docker-compose-dawn4.0.yaml exec keosd /opt/eosio/bin/cleos -u http://docker_nodeosd_1"
    alias eos-deploy="$EOS_ENV_DIR/eos-deploy/eos-deploy.js"
    alias eos-compile="$EOS_ENV_DIR/eos-compile-service/main.js --compiler-bin $EOS_ENV_DIR/eos-compile-service/compile-eosio-contract/compile-eosio-contract"
elif [[ $1 = "down" ]]
then
    echo 'Setting DOWN EOS dev environment...'
    unalias cleos
    unalias eos-deploy
    unalias eos-compile
else
    echo 'Incorrect option'
fi
