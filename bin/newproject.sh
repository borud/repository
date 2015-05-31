#!/bin/sh
#
# Creates maven artifact using default prototype artifact.  This script is
# used by me to just quickly make Maven projects.  I would not recommend you
# just blindly start to use this since I might change it or even remove it
# without any notice.
#

if [ $# -lt 2 ]; then
    echo "*** Usage:"
    echo "***"
    echo "***    newproject.sh <groupId> <artifactId>"
    echo "***"
    exit 1
fi

if [ -d $2 ]; then
    echo
    echo "*** Directory $2 appears to exist.  Bailing out."
    echo
    exit 2
fi

GROUP_ID=$1
ARTIFACT_ID=$2

ARCHETYPE_REPOSITORY="https://raw.github.com/borud/repository/mvn-repo/"
ARCHETYPE_GROUP_ID="org.borud"
ARCHETYPE_ARTIFACT_ID="proto"
ARCHETYPE_VERSION="1.0"

DEFAULT_VERSION="1.0-SNAPSHOT"

mvn archetype:generate \
    -DarchetypeRepository=$ARCHETYPE_REPOSITORY  \
    -DarchetypeGroupId=$ARCHETYPE_GROUP_ID       \
    -DarchetypeArtifactId=$ARCHETYPE_ARTIFACT_ID \
    -DarchetypeVersion=$ARCHETYPE_VERSION        \
    -DgroupId=$GROUP_ID                          \
    -DartifactId=$ARTIFACT_ID                    \
    -Dversion=$DEFAULT_VERSION                   \
    -DinteractiveMode=false
