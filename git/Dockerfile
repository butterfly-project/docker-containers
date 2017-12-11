FROM alpine

COPY *.sh /usr/local/lib/script/

RUN apk --update add git openssh bash; \
    rm -rf /var/lib/apt/lists/*; \
    rm /var/cache/apk/*; \
    chmod +x /usr/local/lib/script/*.sh; \
    git config --global alias.flush '!/usr/local/lib/script/git_flush.sh'; \
    git config --global alias.release '!/usr/local/lib/script/git_release.sh'; \
    git config --global alias.hotfix '!/usr/local/lib/script/git_hotfix.sh'

WORKDIR /git

ENTRYPOINT ["git"]
CMD ["--help"]
