# SETTING UP THE POSTGRES ENVIRONMENT

 Navigate to the github repo (https://github.com/lucompsoc/sql-demo-env)
 Clone the repo (or download as ZIP -> Extract)
‘cd’ into the directory
 Run the following commands (n.b. You will need podman or docker to run the container, if you are using docker, replace podman with docker in the following commands)

## Build the container on your device

> podman build -t sql-demo .

## Start the container

> podman run -it --name sql-demo-container sql-demo

## Connect to the database
> psql -d sql_demo

If you need to restart the database environment you should, first remove the previous container (or use a different name) and use the command to start the container
> podman rm sql-demo-container
