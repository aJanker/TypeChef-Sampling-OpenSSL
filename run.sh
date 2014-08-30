#!/bin/bash 

path=$(cd "$(dirname "$0")"; pwd)


flags=" --bdd \
  	--study openssl --reuseAST --showGui \
        -I $path/openssl \
	-I $path/openssl/include
	-I $path/openssl/include/openssl
	--platfromHeader $path/openssl/platform.h \
        --featureModelDimacs $path/openssl/OpenSSL.dimacs \
	--include $path/openssl/partial_configuration.h \
	--recordTiming --parserstatistics --lexNoStdout"

echo "Analysing $path/openssl/$1"
echo "With settings: $flags"
../Morpheus/morpheus.sh $path/openssl/$1 $flags

exit
