FROM ubuntu:18.04

ENV GRAALVM_URL="https://github.com/oracle/graal/releases/download/vm-1.0.0-rc9/graalvm-ce-1.0.0-rc9-linux-amd64.tar.gz"
ENV GRAALVM_DIR="/opt/graalvm"
ENV KANTONI_DIR="/opt/kantoni"
ENV PATH="${GRAALVM_DIR}/bin:${PATH}"

## Download GraalVM
RUN apt-get update && \
  apt-get install -y curl python python-dev build-essential zlib1g-dev libssl-dev && \
  curl -L $GRAALVM_URL --output graalvm-ce.tar.gz

## Add GraalVM binaries to PATH
RUN mkdir ${GRAALVM_DIR} ${KANTONI_DIR} && \
  tar xf graalvm-ce.tar.gz -C ${GRAALVM_DIR} --strip 1 && \
  export PATH="${GRAALVM_DIR}/bin:${PATH}"

ADD ./package.json ${KANTONI_DIR}/
ADD ./package-lock.json ${KANTONI_DIR}}/
WORKDIR ${KANTONI_DIR}
RUN npm install --build-from-source

ADD ./src/ ./src/
ADD ./src/lang ./target/lang
ADD ./src/stub ./target/stub
RUN npm run build

CMD ["node", "./target/grpc/main.js", "--jvm", "--polyglot"]