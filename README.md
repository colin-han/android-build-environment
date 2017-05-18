# Android build environment
You can use this docker image to build android app in docker container. For example, you can use this image for GitLab pipeline.

```yaml
#.gitlab-ci.yml
image: colinhan/android-build-environment

stages:
  - build
  - test

build-android:
  stage: build
  script:
    - ./gradlew assemble
  artifacts:
    paths:
      - app/build/outputs/

unitTests:
  stage: test
  script:
    - ./gradlew test
```

You still can use this image through console to build app like following:

```bash
docker run -v your/code/path:/code
           colinhan/android-build-environment
           /code/gradlew assemble
```
