FROM gitpod/openvscode-server:latest

ENV OPENVSCODE_SERVER_ROOT="/home/.openvscode-server"
ENV OPENVSCODE="${OPENVSCODE_SERVER_ROOT}/bin/openvscode-server"

SHELL ["/bin/bash", "-c"]
RUN \
    urls=(\
        https://github.com/jatan-ops/hellofromjinal2/releases/download/v1.1/helloworld-sample-0.0.1.vsix \
    )\
    && tdir=/tmp/exts && mkdir -p "${tdir}" && cd "${tdir}" \
    && wget "${urls[@]}" && \
    exts=(\
        gitpod.gitpod-theme \
        "${tdir}"/* \
    )\
    && for ext in "${exts[@]}"; do ${OPENVSCODE} --install-extension "${ext}"; done