# Byzan GitLab runner with dotnet core、nodejs and docker cli

```sh
$ docker run -d --name gitlab-runner-dotnet \
    --restart always \
    -v /srv/gitlab-runner/dotnet/config:/etc/gitlab-runner \
    -v /srv/gitlab-runner/dotnet/home:/home/gitlab-runner \
    -v /var/run/docker.sock:/var/run/docker.sock \
    gitlab-runner-dotnet:11.7.0
```