#!/bin/sh

GITHUB_HEAD_REF=$GITHUB_HEAD_REF
GITHUB_REF=$GITHUB_REF
GITHUB_SHA=$GITHUB_SHA
GITHUB_REPOSITORY=$GITHUB_REPOSITORY
GITHUB_ACTOR=$GITHUB_ACTOR
GITHUB_WORKFLOW=$GITHUB_WORKFLOW
GITHUB_BASE_REF=$GITHUB_BASE_REF
GITHUB_EVENT_NAME=$GITHUB_EVENT_NAME
GITHUB_WORKSPACE=$GITHUB_WORKSPACE
GITHUB_ACTION=$GITHUB_ACTION
GITHUB_EVENT_PATH=$GITHUB_EVENT_PATH

echo $GITHUB_HEAD_REF

args="$1"
zipFile="$2"
zipFolder="$3"

# Using $@ to store command and options
set -- "$args" -qq

if  [[ $args == zip* ]] ;
then
  set -- "$@" -r
   # cmd="zip -qq -r $zipFile $zipFolder"
fi

set -- "$@" "$zipFile"

if  [[ $args == unzip* ]] ;
then
  set -- "$@" -d
  #cmd="unzip -qq $zipFile -d $zipFolder"
fi

set -- "$@" "$zipFolder"

echo "Running: $@"
"$@"
echo "::set-output name=outputPath::$zipFolder"
echo "::add-path::$zipFolder"