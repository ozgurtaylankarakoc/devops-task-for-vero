#!/bin/bash

# env.
export docker_user_name="ozgurtaylankarakoc"
echo $docker_user_name
export mssql_image_name="mssql-server"
export api_image_name="api-server"

# build and push mssql-server images 
current_directory=$(pwd)
cd $current_directory/database
# openssl rand -hex 4 command commits current command line unique 4 digits. Its evading several build conflicts and defines unique name per build
export mssql_image_tag=$(openssl rand -hex 4)
docker build -t $docker_user_name/$mssql_image_name:$mssql_image_tag -f Dockerfile-mssql .
cd ..

# build and push api-server images
current_directory=$(pwd)
cd $current_directory/api
# openssl rand -hex 4 command commits current command line unique 4 digits. Its evading several build conflicts and defines unique name per build
export api_image_tag=$(openssl rand -hex 4)
docker build -t $docker_user_name/$api_image_name:$api_image_tag -f Dockerfile-api .
cd ..

# docker compose up -d / launching app
docker-compose up -d