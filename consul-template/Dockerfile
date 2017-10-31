FROM hashicorp/consul-template:alpine

# install docker (copy from docker/17.10/Dockerfile)
RUN apk add --no-cache \
		ca-certificates
RUN [ ! -e /etc/nsswitch.conf ] && echo 'hosts: files dns' > /etc/nsswitch.conf
ENV DOCKER_CHANNEL edge
ENV DOCKER_VERSION 17.10.0-ce
RUN set -ex; \
	apk add --no-cache --virtual .fetch-deps \
		curl \
		tar \
	; \
	\
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		x86_64) dockerArch='x86_64' ;; \
		aarch64) dockerArch='aarch64' ;; \
		ppc64le) dockerArch='ppc64le' ;; \
		s390x) dockerArch='s390x' ;; \
		*) echo >&2 "error: unsupported architecture ($apkArch)"; exit 1 ;;\
	esac; \
	\
	if ! curl -fL -o docker.tgz "https://download.docker.com/linux/static/${DOCKER_CHANNEL}/${dockerArch}/docker-${DOCKER_VERSION}.tgz"; then \
		echo >&2 "error: failed to download 'docker-${DOCKER_VERSION}' from '${DOCKER_CHANNEL}' for '${dockerArch}'"; \
		exit 1; \
	fi; \
	\
	tar --extract \
		--file docker.tgz \
		--strip-components 1 \
		--directory /usr/local/bin/ \
	; \
	rm docker.tgz; \
	\
	apk del .fetch-deps; \
	\
	dockerd -v; \
	docker -v

RUN curl -O https://raw.githubusercontent.com/docker-library/docker/62a456489acfe7443d426cd502ccf22130d1ccf9/17.10/docker-entrypoint.sh; \
  chmod +x docker-entrypoint.sh; \
  mv docker-entrypoint.sh /usr/local/bin/docker-entry.sh
