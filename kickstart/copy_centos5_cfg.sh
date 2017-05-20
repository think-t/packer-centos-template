#!/bin/sh

CURRENT="5.10"

for RELEASE in 5.0 5.1 5.2 5.3 5.4 5.5 5.6 5.7 5.8 5.9
do
  for ARCH in i386 x86_64
  do
    cp -f centos${CURRENT}_${ARCH}.cfg centos${RELEASE}_${ARCH}.cfg
    sed -i "s/${CURRENT}/${RELEASE}/g" centos${RELEASE}_${ARCH}.cfg
  done
done
