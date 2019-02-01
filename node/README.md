# GitLab runner with nodejs

```sh
$ docker run -d --name gitlab-runner-node \
    --restart always \
    -v /srv/gitlab-runner/node/config:/etc/gitlab-runner \
    -v /srv/gitlab-runner/node/home:/home/gitlab-runner \
    -v /var/run/docker.sock:/var/run/docker.sock \
    gitlab-runner-node:11.7.0
```