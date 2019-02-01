# Byzan GitLab runner with docker-ce-cli

```sh
$ docker run -d --name gitlab-runner-docker \
    --restart always \
    -v /srv/gitlab-runner/docker/config:/etc/gitlab-runner \
    -v /srv/gitlab-runner/docker/home:/home/gitlab-runner \
    -v /var/run/docker.sock:/var/run/docker.sock \
    gitlab-runner-docker:11.7.0
```