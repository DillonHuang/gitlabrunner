# Byzan GitLab runner android

```sh

$ docker run -d --name gitlab-runner-android \
    --restart always \
    -v /srv/gitlab-runner/android/config:/etc/gitlab-runner \
    -v /srv/gitlab-runner/android/home:/home/gitlab-runner \
    -v /var/run/docker.sock:/var/run/docker.sock \
    gitlab-runner-android:11.2.0
```