# Byzan GitLab runner for Backend

```sh
$ scp -r ./* user@byzan.iubang.com:~/runner-builder/backend
$ docker build -t byzan/backend-runner:11.2.0 .
$ docker image save -o backend-runner_11.2.0.tar byzan/backend-runner:11.2.0
$ scp backend-runner_11.2.0.tar dev@git.iubang.com:~/
$ docker image load -i backend-runner_11.2.0.tar

$ docker run -d --name gitlab-runner-backend \
    --restart always \
    -v /srv/gitlab-runner/backend/config:/etc/gitlab-runner \
    -v /srv/gitlab-runner/backend/home:/home/gitlab-runner \
    -v /var/run/docker.sock:/var/run/docker.sock \
    byzan/backend-runner:11.2.0
```