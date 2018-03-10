# Jenkins pipelines and Docker

tutorial to run jenkins pipelines on blueocean in Docker container. Just to show how easy things are. Dear developers dont let yourself caught into the shit like S2I and proprietary stuff like openshift. You simple dont need it, you need

* Jenkins Pipelines and Groovy
* Jenkins [Docker agents](https://jenkins.io/doc/book/pipeline/docker/) 
* Plain Docker and Docker compose 
* Blue ocean, [read this great stuff](https://jenkins.io/doc/tutorials/create-a-pipeline-in-blue-ocean/)

## Docker agents to run Maven get rid of S2I shit

No need for OpenShift build configs and S2I builder images, all overhead, real answer comes from Jenkins Pipeline agent, read [Running Maven from Pipelines](https://jenkins.io/doc/book/pipeline/docker/)

## Run Docker in Container

Bind host Docker sockets into your jenkins blueocean container.
read [Jenkins in Container](https://jenkins.io/doc/tutorials/create-a-pipeline-in-blue-ocean/)

## Play with Docker
[play with docker](https://labs.play-with-docker.com/)

## Run jenkins in container and bind host docker

* create directory /jenkins
* docker run -d --name jenkins -u root -p 8080:8080 -v /jenkins:/var/jenkins_home -v /* var/run/docker.sock:/var/run/docker.sock jenkinsci/blueocean
* docker logs -f jenkins
* docker exec -ti jenkins bash
* docker ps -a
* browse to http://localhost:8080 and wait until the Unlock Jenkins page appears.
* get password from /jenkins/secrets/initialAdminPassword
