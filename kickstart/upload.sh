#!/bin/sh

BUCKET='packer-kickstart'

for RELEASE in 5.0 5.1 5.2 5.3 5.4 5.5 5.6 5.7 5.8 5.9 5.10 5.11
do
  for ARCH in i386 x86_64
  do
  aws s3 cp ./centos${RELEASE}_${ARCH}.cfg s3://${BUCKET}/centos${RELEASE}_${ARCH}.cfg
  aws s3 ls --recursive s3://${BUCKET}/ | awk '{print $4}' | xargs -P4 -I{} aws s3api put-object-acl --acl public-read --bucket ${BUCKET} --key "{}"
  done
done
