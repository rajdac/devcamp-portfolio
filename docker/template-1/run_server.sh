APP_NAME="DevcampPortfolio"
RUBY_VERSION="2.4.10"
BUNDLER_VERSION="2.0"
PG_MAJOR="11"
NODE_MAJOR="12"
YARN_VERSION="1.13.0"

# new rebuild run
RUN_MODE="rebuild"
APP_BASE_PATH="/home/msuser1/workspace/projects"

RAILS_ENV="development"
RAILS_VERSION="5.1.6"
APP_IMAGE="app:v1"
APP_CONTAINER="app1"
GEM_HOME=${APP_BASE_PATH}/gem_home


#${RAILS_ENV:-development}


echo "Stop container if present..................."
#docker stop $APP_CONTAINER

echo "Build the docker..........................."
docker build -t ${APP_IMAGE} --build-arg APP_NAME=$APP_NAME --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) --build-arg RUBY_VERSION=$RUBY_VERSION --build-arg BUNDLER_VERSION=$BUNDLER_VERSION  --build-arg PG_MAJOR=$PG_MAJOR --build-arg NODE_MAJOR=$NODE_MAJOR --build-arg YARN_VERSION=$YARN_VERSION -f docker/Dockerfile.app .

#sudo chown -R $USER:$USER .

docker run -it --security-opt apparmor=unconfined --cap-add=SYS_PTRACE -p 3000:3000 --rm -e RAILS_VERSION=$RAILS_VERSION -e BUNDLER_VERSION=$BUNDLER_VERSION -e APP_NAME=$APP_NAME  -e RUN_MODE=$RUN_MODE -e DOCKER_CONTAINER=app -e APP_MODE=web -e RAILS_ENV=$RAILS_ENV --volume=${APP_BASE_PATH}/${APP_NAME}:/opt/${APP_NAME} --volume=${GEM_HOME}:/usr/local/bundle/ --name ${APP_CONTAINER} ${APP_IMAGE}
