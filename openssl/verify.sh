#!/bin/bash 

filesToProcess() {
  local listFile=configFlags
  cat $listFile
}

cd openssl

#Ref first
i=0
filesToProcess|while read feature; do
        echo "Verifiying $1"
        echo "With features: $feature"
        echo "$i"_ref.config
        ./genConfig.sh $feature | tee $i_ref.config
        ./build.sh | tee $i_ref.build
        ./runtest.sh | tee $i_ref.test
        i=`expr $i + 1`
        done

#Clean
git checkout .

#Org Next
i=0
filesToProcess|while read feature; do
	    echo "Verifiying $1"
        echo "With features: $feature"
        ./genConfig.sh $feature | tee $i_org.config
        ./build.sh | tee $i_org.build
	 	./runtest.sh | tee $i_org.test
        i=`expr $i + 1`
        done

exit