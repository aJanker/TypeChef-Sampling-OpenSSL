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
        ./genConfig.sh $feature | tee "$i"_ref.config
        ./build.sh | tee "$i"_ref.build
        ./runtest.sh | tee "$i"_ref.test
        i=`expr $i + 1`
        done

#Clean
git checkout .

#Org Next
i=0

filesToProcess|while read feature; do
 	    echo "Verifiying $1"
        echo "With features: $feature"
        ./genConfig.sh $feature | tee "$i"_org.config
        ./build.sh | tee "$i"_org.build
 	 	./runtest.sh | tee "$i"_org.test
        i=`expr $i + 1`
        done

exit