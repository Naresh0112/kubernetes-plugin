FROM csanchez/jenkins-for-volumes

RUN /usr/local/bin/install-plugins.sh durable-task:1.12 credentials:2.1.4 kubernetes:0.7

# ENV VERSION 0.4-SNAPSHOT
# COPY target/kubernetes.hpi /usr/share/jenkins/ref/plugins/kubernetes.hpi
# RUN curl -o /usr/share/jenkins/ref/plugins/kubernetes.hpi \
#  http://repo.jenkins-ci.org/snapshots/org/csanchez/jenkins/plugins/kubernetes/0.4/kubernetes-$VERSION.hpi

# remove executors in master
COPY src/main/docker/master-executors.groovy /usr/share/jenkins/ref/init.groovy.d/

# ENV JAVA_OPTS="-Djava.util.logging.config.file=/var/jenkins_home/log.properties"
