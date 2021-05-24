FROM node:14.16.1-alpine

WORKDIR /opt/api

# 1) Temporarily install C-compiler dependencies that don't come with Alpine Linux
# 2) Install `aws-sam-cli-local` globally (no cache because Docker won't use it)
# 3) Delete dependencies
RUN apk add --no-cache --virtual builddeps gcc musl-dev python3-dev && \
   apk add py3-pip && \
   pip3 --no-cache-dir install aws-sam-cli-local && \
   apk del builddeps

COPY . .

CMD tail -f /dev/null