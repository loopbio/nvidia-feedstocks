#!/usr/bin/env bash
# Builds all the populated packages.

# --- Directories

pushd `dirname $0` > /dev/null
myDir=`pwd`
popd > /dev/null

localRepoDir="${myDir}/build_artefacts"
mkdir -p localRepoDir

logsDir="${myDir}/build_logs"
mkdir -p "${logsDir}"

# --- Packages
declare -a packages=("cuda-feature"
                     "cudnn-feature"
                     "cuda-dev-feature")

# --- Build!

for package in "${packages[@]}"
do
   conda build "${package}" \
   --output-folder ${localRepoDir} \
   &> >(tee ${logsDir}/${package}-build.log)
done

# --- Suggest upload
# Of course we could automate upload, for example, by using --user loopbio in conda build
# I think it is better not to...

echo "
----* Great *----
All done, please upload the new artifacts to anaconda.org like:"
for package in "${packages[@]}"
do
  echo "  " `cat ${logsDir}/${package}-build.log | grep "anaconda upload"`
done
echo "add \"-u {channel}\" to upload to a different organization (e.g. \"-u loopbio\")."
