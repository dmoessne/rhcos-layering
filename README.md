# rhcos-layering
Building layered images fro RHCOS

Mind, this is a draft version to build RHCOS layered images with new kernel and if needed delevl kernel to build drivers based on the new kernel
A web server providing access to the packages to be installed on top of an existing RHCOS image is needed and needs to be adjusted in the Containerfile

How to use this:
 - a registry to push the images to (in this example quay)
 - put needed packages on a web server the system running the build has access to 
 - adjust the `Containerfile` accordingly (web server address, packages, additional packages may be needed, check errors in build process)
 - adijust the variables at the beginning of `create-layered-rhcos.sh`, e.g. 
   - RHCOS version you want to build the image(s) (`USED_TAGS=`, `MAJOR=`, `MINOR=`)
     - `USED_TAGS=` is used as the z-stream you want to build (see your current cluster version) and can be an array to build and push for multiple z-streams
   - your registry Destination (`QUAY_DEST=`) and login secret (`POD_LOGIN=`) to push the created image(s) to 
   - additional tag to add (`QUAY_TAG=`
 - after having this done, kick of the create script (see help to choose just building (`b`), pushing (`p`)or both (`a`))
 - once the image(s) are successfully pushed to the registry you can adjust `machineconfig.yaml` accordingly and apply it to your cluster (**mind** that it will reboot)

