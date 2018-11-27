FROM ubuntu:18.04

ENV GRAALVM_URL="https://github.com/oracle/graal/releases/download/vm-1.0.0-rc9/graalvm-ce-1.0.0-rc9-linux-amd64.tar.gz"
ENV GRAALVM_DIR="/opt/graalvm"
ENV KANTONI_DIR="/opt/kantoni"
ENV PATH="${GRAALVM_DIR}/bin:${PATH}"

## Download GraalVM
RUN apt-get update && \
  apt-get install -y curl && \
  curl -L $GRAALVM_URL --output graalvm-ce.tar.gz

## Add GraalVM binaries to PATH
RUN mkdir ${GRAALVM_DIR} ${KANTONI_DIR} && \
  tar xf graalvm-ce.tar.gz -C ${GRAALVM_DIR} --strip 1 && \
  export PATH="${GRAALVM_DIR}/bin:${PATH}"

ADD ./ ${KANTONI_DIR}/
WORKDIR ${KANTONI_DIR}
RUN npm install && npm run transpile


CMD []