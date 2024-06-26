# rhcos-layering
Building layered images fro RHCOS

Mind, this is a draft version to build RHCOS layered images with new kernel and if needed delevl kernel to build drivers based on the new kernel
A web server providing access to the packages to be installed on top of an existing RHCOS image is needed and needs to be adjusted in the Containerfile

How to use this:
 - a registry to push the images to (in this example quay)
 - put needed packages on a web server the system running the build has access to 
 - adjust the Containerfile accordingly (web server address, packages, additional packages may be needed, check errors in build process)
 - adijust the create script to refelct for which RHCOS version you want to build the imagei(s), the path to the registry secret with write permissions and the path in the registry (must exist)
 - after having this done, kick of the create script (see help to choose just building, pushing or both)
