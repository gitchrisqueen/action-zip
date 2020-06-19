FROM alpine:3.10.1

ENV VERSION=0.0.3
ENV GITHUB_HEAD_REF = ""

ARG VERSION

LABEL "com.github.actions.name"="Create Zip File or Unzip a file"
LABEL "com.github.actions.description"="Create a zip file containing specific files from your repository or unzip a file"
LABEL "com.github.actions.icon"="folder-plus"
LABEL "com.github.actions.color"="gray-dark"

LABEL "repository"="https://github.com/gitchrisqueen/action-zip"
LABEL "homepage"="https://github.com/gitchrisqueen/action-zip"
LABEL "maintainer"="Christopher Queen <chris@christopherqueenconsulting.com>"
LABEL "version"=$VERSION

RUN apk add --update --no-cache bash zip

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]