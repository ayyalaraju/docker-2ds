#!/bin/bash
set -e
echo "#------------------------------------------------------------------------------------------"
echo "Setup the build environment on travis"
echo "#------------------------------------------------------------------------------------------"
#git clone git@github.com:ayyalaraju/docker-2ds.git
export REPO=`pwd`
ls -lrt
echo "#------------------------------------------------------------------------------------------"
echo "Login to Artifactory"
echo "#------------------------------------------------------------------------------------------"
export DOCKER_REPO=akoundin/hello
export DOCKER_PASSWORD=${DOCKER_REPO_KEY}
export DOCKER_USERNAME=akoundin
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
echo "#------------------------------------------------------------------------------------------"
echo "Build Docker Image"
echo "#------------------------------------------------------------------------------------------"
docker build -t akoundin/hello:latest $REPO/.
echo "#------------------------------------------------------------------------------------------"
echo "Push to Docker Repo"
echo "#------------------------------------------------------------------------------------------"
docker push akoundin/hello:latest
echo "#------------------------------------------------------------------------------------------"
echo "Finish Build"
echo "#------------------------------------------------------------------------------------------"
