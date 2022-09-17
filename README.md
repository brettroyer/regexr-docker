# docker-regexr
Unofficial docker build of the regexr node app.
Uses ubuntu:latest docker image.   I know this probably can be done more efficiently but I couldn't get
gufertum or winkelchri docker images to work.  

## Makefile
```
* Edit first four lines variables.
make build  - Builds container using Dockerfile
make run - Creates temp container - removes when exited.
make sh - open shell command on configured container
make bash - open bash command on configured container
make removeall - remove configured container and image
make tag - tag :latest to image
```
## Credit Links

* [Github](https://github.com/gskinner/regexr) - https://github.com/gskinner/regexr

# Help in creating docker file (Reference Only)
* [Github](https://github.com/gufertum/docker-regexr) - https://github.com/gufertum/docker-regexr
* [Github](https://github.com/winkelchri/docker_regexr) - https://github.com/winkelchri/docker_regexr
