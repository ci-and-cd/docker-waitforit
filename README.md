# docker-waitforit

Dockerfile [ci-and-cd/waitforit on Github](https://github.com/ci-and-cd/waitforit)

[cirepo/waitforit on Docker Hub](https://hub.docker.com/r/cirepo/waitforit/)


## Use this image as a “stage” in multi-stage builds

```dockerfile

FROM alpine:3.9
COPY --from=cirepo/waitforit:2.4.1-archvie /data/root /

```
