#!/bin/bash

./mvnw -DskipTests package
./mvnw -DskipTests com.google.cloud.tools:jib-maven-plugin:build \
  -Dimage=gcr.io/$PROJECT_ID/hello-java:v1