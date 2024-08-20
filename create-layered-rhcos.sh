#!/bin/bash
# VARS
## set tags to be build
#USED_TAGS=(21 22 23 24 25) 
USED_TAGS=(5 6)
## set major and minor version to be used
MAJOR=4
MINOR=16
## set destination in quay to push
QUAY_DEST=quay.io/dmoessne/rhel-46814-bisect
QUAY_TAG=8
## set name of the Containerfile
CONT_FILE=Containerfile
## set location of podman login file for private repo
POD_LOGIN="/home/dmoessne/.config/containers/dmoessne-dmoessne-quay-auth.json"
## VARS END

build () {
   for TAG in "${USED_TAGS[@]}";do
       echo -n "${TAG} : "
       RHCOS_VER=`oc adm release info quay.io/openshift-release-dev/ocp-release:${MAJOR}.${MINOR}.${TAG}-x86_64 --image-for=rhel-coreos` #>&/dev/null
       podman build --network host -t ${QUAY_DEST}:${MAJOR}.${MINOR}.${TAG}-${QUAY_TAG} --build-arg RHCOS_VER=${RHCOS_VER}  -f ${CONT_FILE} #>&/dev/null 
       if [ $? -ne 0 ]
       then
         echo "something went wrong with build of ${TAG}"
         exit 1
       else
         echo "build successfully"
       fi
  done
}

push () {
   for TAG in "${USED_TAGS[@]}";do
       echo "     pushing image"
       podman push --authfile=${POD_LOGIN} ${QUAY_DEST}:${MAJOR}.${MINOR}.${TAG}-${QUAY_TAG} #>&/dev/null
       if [ $? -ne 0 ]
       then
         echo "     something went wrong with pushing of ${TAG} to quay"
         exit 1
       else
       echo "     successfully pushed"
     fi
   done
}

help () {
   echo "please provide what should be done"
   echo
   echo "b for building"
   echo "p for pushing"
   echo "a for building and pushing"
   echo
}

case $1 in 
	b)
	  build
	  ;;
	p)
          push
	  ;;
        a)
         build
	 push
	 ;;
	*)
	 help
	 ;;
esac
