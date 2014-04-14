#!/bin/bash 

path=$(cd "$(dirname "$0")"; pwd)

filesToProcess() {
  local listFile=openssl_files
  cat $listFile
}

flags=" --bdd \
  	--study busybox --reuseAST --refEval rename --refLink $path/CLinking.interface \
	-I /usr/local/include \
	-I /usr/lib/gcc/x86_64-linux-gnu/4.6/include-fixed \
	-I /usr/lib/gcc/x86_64-linux-gnu/4.6/include \
	-I /usr/include/x86_64-linux-gnu \
	-I /usr/include \
        -I $path/openssl \
	 -I $path/openssl/include
	-I $path/openssl/include/openssl
	--platfromHeader $path/openssl/platform.h \
        --featureModelDimacs $path/openssl/OpenSSL.dimacs \
	--include $path/openssl/partial_configuration.h \
	--recordTiming --parserstatistics --lexNoStdout"

filesToProcess|while read i; do
         echo "Analysing $path/openssl/$i.c"
         echo "With settings: $flags"
         ../TypeChef/cRefactor.sh $path/openssl/$i.c $flags
         echo "Verifiying $path/openssl/$i.c"
	 openssl/verify.sh $path/openssl/$i.c
         done

exit
