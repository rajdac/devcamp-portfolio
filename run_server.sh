APP_BASE_IMAGE="rails5.1.10"
APP_NAME="DevcampPortfolio"
BUNDLER_VERSION="2.0"

# new rebuild run
RUN_MODE="rebuild"
APP_BASE_PATH="/home/msuser1/workspace/projects"

RAILS_ENV="development"
RAILS_VERSION="5.1.6"
APP_IMAGE="app1:v1"
APP_CONTAINER="app1"
GEM_HOME=${APP_BASE_PATH}/gem_home


#${RAILS_ENV:-development}


echo "Stop container if present..................."
#docker stop $APP_CONTAINER

echo "Build the docker..........................."
docker build -t ${APP_IMAGE} --build-arg APP_BASE_IMAGE=$APP_BASE_IMAGE --build-arg APP_NAME=$APP_NAME  -f docker/Dockerfile.app .

#sudo chown -R $USER:$USER .

docker run -it --security-opt apparmor=unconfined --cap-add=SYS_PTRACE -p 3000:3000 --rm -e RAILS_VERSION=$RAILS_VERSION -e BUNDLER_VERSION=$BUNDLER_VERSION -e APP_NAME=$APP_NAME  -e RUN_MODE=$RUN_MODE -e DOCKER_CONTAINER=app -e APP_MODE=web -e RAILS_ENV=$RAILS_ENV --volume=${APP_BASE_PATH}/${APP_NAME}:/opt/${APP_NAME} --volume=${GEM_HOME}:/usr/local/bundle/ --name ${APP_CONTAINER} ${APP_IMAGE}
