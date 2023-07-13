docker build . -t antlr:v0
docker image ls  | grep antlr
docker run -it --rm antlr:v0 /bin/bash
