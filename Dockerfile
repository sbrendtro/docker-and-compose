# Docker
FROM docker:latest AS docker
LABEL image=docker

# Docker Compose is our base
FROM docker/compose:1.24.0 AS compose
LABEL image=compose

ENV PATH /google-cloud-sdk/bin/:$PATH

FROM compose AS final
COPY --from=docker   /usr/local/bin/docker-entrypoint.sh     /usr/local/bin/docker-entrypoint.sh
COPY --from=docker   /usr/local/bin/docker                   /usr/local/bin/docker
ENTRYPOINT ["sh", "/usr/local/bin/docker-entrypoint.sh"]


