#!/bin/bash

if [[ -z "${SPINE_HASH}" ]]; then
  hash="default"
else
  hash="${SPINE_HASH}"
fi
activationcode=${SPINE_ACTIVATION_CODE}

path=$1
output=$2
configfile=$3

mkdir -p /var/cache/spine/${hash}

for dir in `find ${path} -mindepth 1 -maxdepth 1 -type d`; do \
  echo $dir;

  dirhash=`echo ${dir} | md5sum | awk '{print $1}'`
  md5sumfile="/var/cache/spine/${hash}/${dirhash}_md5sum.txt"

  if [ ! -f "$md5sumfile" ]
  then
    echo "Cache not found."
    find ${dir} -type f -exec md5sum '{}' \; > ${md5sumfile}
    for i in `ls ${dir}/*.spine`; do echo "echo $activationcode | spine -i $i -o /var/cache/spine/$hash/$dirhash/ -e $configfile"; done | bash
  else
    echo "Cache exist."
  fi

  if ! md5sum --status -c ${md5sumfile}
  then
    echo "The MD5 sum didn't match. Build"
    find ${dir} -type f -exec md5sum '{}' \; > ${md5sumfile}
    for i in `ls ${dir}/*.spine`; do echo "echo $activationcode | spine -i $i -o /var/cache/spine/$hash/$dirhash/ -e $configfile"; done | bash
  else
    echo "The MD5 sum matched. Get from cache"
  fi

  mkdir -p ${output}
  cp /var/cache/spine/${hash}/${dirhash}/* ${output}
done
