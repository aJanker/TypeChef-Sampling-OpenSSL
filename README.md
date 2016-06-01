# TypeChef Analysis of OpenSSL

Contains various scripts to run static analysis and sampling strategies with TypeChef on OpenSSL.

The setup requires multiple steps. Contact me if there are any issues.

## Setup & Source code

The requiered source code is already included in this case study. 
In case your operating system does not offer the requiered C system headers, you can find the used headers for our evaluation [here](https://github.com/aJanker/TypeChef-GNUCHeader).

## How to run the analysis

To run the analysis on OpenSSL we have to manipulate the makefile: 

For the variability-aware analysis:

    cd openssl
    ./config
    sed -i.bak s+^CC=.*+"CC= $(pwd)/mygcc"+g Makefile
    make
    
    
For the sampling analysis:

    cd openssl
    ./config
    sed -i.bak s+^CC=.*+"CC= $(pwd)/mygcc_sampling"+g Makefile
    make
