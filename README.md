Morpheus-OpenSSLEvaluation
===========================

This project contains all evaluation-related files for the OpenSSL 1.18.5 case study using the variability-aware C refactoring engine [Morpheus](https://github.com/joliebig/Morpheus).


Installation and Usage
----------------------

To run this case study a version of [Morpheus](https://github.com/joliebig/Morpheus) is required. See the project page for installation notes.

Run the Evaluation
-----------------

If you want to start the OpenSSL evaluation of the refactoring engine [Morpheus](https://github.com/joliebig/Morpheus). First we need to generate the requiered .tunit files by manipulating the makefile: 

    cd openssl
    ./config
    sed -i.bak s+CC=.*+"CC= $(pwd)/mygcc"+g Makefile
    make
    cd ..

Afterwards run `prepare.sh` to create the required .interface and .pr files. Now you can edit `eval.sh` to choose your desired refactoring method: rename, extract- or inline function and subsequently run `./eval.sh` to execute the evalution.

Run the experimental GUI
-----------------

In order to show a GUI and refactor a single file of this case study "ide-like" generate the requiered .tunit files explained before and execute `./run.sh <file/to/refactor>`.


Good luck. In case of problems contact [me](mailto:janker@fim.uni-passau.de).

This case study is published as open source under LGPL 3.0. See [LICENSE](LICENSE.md).
The included source code of [OpenSSL](https://www.openssl.org/) is published as open source.  See [LICENSE](https://www.openssl.org/source/license.html) for details.
