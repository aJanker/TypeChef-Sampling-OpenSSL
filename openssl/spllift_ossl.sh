#!/bin/sh

flags="/home/janker/Masterarbeit/TypeChef-Sampling-OpenSSL/openssl/minimalAES.c \
--bdd --dimacsFeaturePrefix \"\" --featureModelDimacs /home/janker/Masterarbeit/TypeChef-Sampling-OpenSSL/openssl/OpenSSL.dimacs \
--platfromHeader /home/janker/Masterarbeit/TypeChef-GNUCHeader/platform.h \
-I /home/janker/Masterarbeit/TypeChef-GNUCHeader/usr_include/ \
-I /home/janker/Masterarbeit/TypeChef-GNUCHeader/x86_64-linux-gnu/4.8/include \
-I /home/janker/Masterarbeit/TypeChef-GNUCHeader/x86_64-linux-gnu/4.8/include-fixed \
-I /home/janker/Masterarbeit/TypeChef-GNUCHeader/x86_64-linux-gnu \
--openFeat /home/janker/Masterarbeit/TypeChef-GNUCHeader/openfeatures.txt \
-I /home/janker/Masterarbeit/TypeChef-Sampling-OpenSSL/openssl/include \
--spllift taint --spllift callgraph  \
--recordTiming \
--linkingInterface /home/janker/Masterarbeit/TypeChef-Sampling-OpenSSL/openssl/CModuleInterface.interface"

time /home/janker/Masterarbeit/CSPLlift/lift.sh $flags
