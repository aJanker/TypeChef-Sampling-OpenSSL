#!/bin/bash 

path=$(cd "$(dirname "$0")"; pwd)

filesToProcess() {
  local listFile=openssl_files
  cat $listFile
}

flags=" --bdd \
  	--writePi --serializeAST --study openssl --writeBuildCondition \
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
	--recordTiming --parserstatistics --lexNoStdout \
	-D OPENSSL_THREADS -D _REENTRANT -D DSO_DLFCN -D HAVE_DLFCN_H -D L_ENDIAN -D TERMIO -D OPENSSL_IA32_SSE2 -D OPENSSL_BN_ASM_MONT -D OPENSSL_BN_ASM_MONT5 -D OPENSSL_BN_ASM_GF2m -D SHA1_ASM -D SHA256_ASM -D SHA512_ASM -D MD5_ASM -D AES_ASM -D VPAES_ASM -D BSAES_ASM -D WHIRLPOOL_ASM -D GHASH_ASM"

filesToProcess|while read i; do
         echo "Analysing $path/openssl/$i.c"
         echo "With settings: $flags"
         ../TypeChef/cRefactor.sh $path/openssl/$i.pi $flags
         done

exit
