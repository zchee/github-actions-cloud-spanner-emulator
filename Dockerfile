# syntax=docker/dockerfile-upstream:1.4

ARG CLOUD_SPANNER_EMULATOR_VERSION
FROM --platform=${TARGETPLATFORM} gcr.io/cloud-spanner-emulator/emulator:${CLOUD_SPANNER_EMULATOR_VERSION} AS cloud-spanner-emulator

FROM --platform=${TARGETPLATFORM} debian:bullseye-slim AS spanner-emulator

LABEL org.opencontainers.image.authors       "The github-actions-cloud-spanner-emulator authors"
LABEL org.opencontainers.image.url           "https://github.com/zchee/github-actions-cloud-spanner-emulator"
LABEL org.opencontainers.image.source        "https://github.com/zchee/github-actions-cloud-spanner-emulator/blob/main/Dockerfile"
LABEL org.opencontainers.image.documentation "Cloud Spanner Emulator for GitHub Actions"
LABEL org.opencontainers.image.base.name     "debian:bullseye-slim"
LABEL org.opencontainers.image.version       "${CLOUD_SPANNER_EMULATOR_VERSION}"
LABEL org.opencontainers.image.licenses      "Apache-2.0"

COPY --link --from=cloud-spanner-emulator /emulator_main /
COPY --link ./entrypoint.bash /
EXPOSE 9010

CMD ["/entrypoint.bash"]
