RUBY_VERSION="2.4.10"
BUNDLER_VERSION="2.0"
RAILS_VERSION="5.1.6"
PG_MAJOR="11"
NODE_MAJOR="12"
YARN_VERSION="1.13.0"

APP_BASE_PATH="/home/msuser1/workspace/projects"
APP_IMAGE="rails5.1.10"
GEM_HOME=${APP_BASE_PATH}/gem_home

echo "Build the docker base image..........................."
docker build -t ${APP_IMAGE} --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) --build-arg RUBY_VERSION=$RUBY_VERSION --build-arg BUNDLER_VERSION=$BUNDLER_VERSION --build-arg PG_MAJOR=$PG_MAJOR --build-arg NODE_MAJOR=$NODE_MAJOR --build-arg YARN_VERSION=$YARN_VERSION -f docker/Dockerfiler5.base .
