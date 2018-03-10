# The beauty of Jenkins Pipelines and Docker, simply all you need

Just one of these tutorials to run jenkins pipelines on blueocean in Docker container. Just to show how easy things can be. Dear developers dont let yourself caught into the proprietary scheisse like S2I and overhead like openshift. This will not improve you productivity and certainly not make your mood good. You simple dont need this stuff, however what you need... for all these born developers who love the stuff produced by OS communities...

* Jenkins Pipelines and Groovy
* Jenkins [Docker agents](https://jenkins.io/doc/book/pipeline/docker/) 
* Plain Docker and Docker compose 
* Blue ocean, [read this great stuff](https://jenkins.io/doc/tutorials/create-a-pipeline-in-blue-ocean/)

The everlasting discussion, do we need Docker container management and clustering solutions to do our development work, the answer is a definite NO... Most of you probably are fimiliair with XP and [YAGNI](https://en.wikipedia.org/wiki/You_aren%27t_gonna_need_it), get away from all the redundancy and do the following...

Just take a Linux VM, put docker on it, see that you get a company private central Docker registry like [NEXUS 3](http://books.sonatype.com/nexus-book/3.0/reference/docker.html) and run all your CI/CD builds with Jenkins Pipelines.
And if, you want to deploy your containers to productive environments and you look for a solid solution for tracking your pipelines on JIRA tickets have a look at the beautiful JIRA integration library for Jenkins Pipelines, read [JIRA pipeline steps](https://jenkinsci.github.io/jira-steps-plugin/index.html). Its all free to get and backed up by a hudge community effort and experience.


No need for OpenShift build configs and S2I builder images, all overhead, simply rely on Jenkins Pipeline agent, read [Running Maven from Pipelines](https://jenkins.io/doc/book/pipeline/docker/)

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
