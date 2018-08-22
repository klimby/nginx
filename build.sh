#!/bin/bash -l
#$ -S /bin/bash
echo $1
if [[ $1 ]]
then
    docker build -t klimby/e-nginx:$1 -t klimby/e-nginx:latest .
    docker push klimby/e-nginx:$1
    docker push klimby/e-nginx:latest
    docker save klimby/e-nginx:$1 klimby/e-nginx:latest > e-nginx.$1.tar
    ls -sh e-nginx.$1.tar
else
    docker build -t klimby/e-nginx:latest .
    docker push klimby/e-nginx:latest
    docker save klimby/e-nginx:latest > e-nginx.latest.tar
    ls -sh e-nginx.latest.tar

fi



