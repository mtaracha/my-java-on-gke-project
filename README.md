# my-java-on-gke-project
Project used to play around with GKE capabilities using Java app

Cmds to run
```
./mvnw -DskipTests spring-boot:run
./mvnw -DskipTests package

# Cloud Registry
./mvnw -DskipTests com.google.cloud.tools:jib-maven-plugin:build \
  -Dimage=gcr.io/$GOOGLE_CLOUD_PROJECT/hello-java:v1
```

GKE
```
kubectl create deployment hello-java \
  --image=gcr.io/$GOOGLE_CLOUD_PROJECT/hello-java:v1

kubectl create service loadbalancer hello-java --tcp=8080:8080

kubectl scale deployment hello-java --replicas=3

kubectl set image deployment/hello-java \
  hello-java=gcr.io/$GOOGLE_CLOUD_PROJECT/hello-java:v2

kubectl rollout undo deployment/hello-java
```
