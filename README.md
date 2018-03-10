#Jenkins pipelines and Docker
tutorial to run jenkins pipelines on blueocean in Docker container.
##Docker agents to run Maven (get rid of S2I shit)
No need for OpenShift build configs and S2I builder images, all overhead, real answer comes from Jenkins Pipeline agent
[Running Maven from Pipelines](https://jenkins.io/doc/book/pipeline/docker/)
##Run Docker in Container
Bind host Docker sockets into your jenkins blueocean container
[Jenkins in Container](https://jenkins.io/doc/tutorials/create-a-pipeline-in-blue-ocean/)