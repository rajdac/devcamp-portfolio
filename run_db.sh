PG_VERSION="11"
DB_DATA="/home/msuser1/workspace/projects/pgdata"
DB_IMAGE="db:v1"
DB_CONTAINER="db"

echo "Stop container if present..................."
# docker stop db

echo "Build the docker image..........................."
docker build -t ${DB_IMAGE} --build-arg PG_VERSION=$PG_VERSION -f docker/Dockerfile.db .

echo "Create docker container and run"
docker run -d --rm -p 5432:5432 --volume /home/msuser1:/host_msuser1 --volume ${DB_DATA}:/var/lib/postgresql/data --name ${DB_CONTAINER} ${DB_IMAGE}
