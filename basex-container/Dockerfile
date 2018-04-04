FROM centos:7

ARG basex_version=8.6
ARG archive_name=BaseX86.zip
ARG basex_version_sha256=1533b24f874402fa9183f99f101914313f953712391240bec3142e9441620505
ARG basex_path=/usr/local/lib/basex
ARG basex_user_name=basex
ARG basex_group_name=basex
ARG basex_mysql_connector_java_url=https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/find-ur-pal/mysql-connector-java-5.1.18-bin.jar
ARG basex_mysql_connector_java_sha256=5ce7735be853c1a6deaf88b6ea7659fb0f4aff2beb717430bd28efae3de35695

RUN yum install epel* -y --nogpgcheck
RUN yum update -y --nogpgcheck
RUN yum install -y ca-certificates curl wget gnupg bzr git mercurial openssh-clients subversion procps xz bzip2 unzip which
RUN yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel

RUN wget http://files.basex.org/releases/$basex_version/$archive_name -P /tmp/
RUN cd /tmp && echo "$basex_version_sha256 $archive_name" | sha256sum -c

RUN groupadd basex && \
    useradd basex -c "A special user to run BaseX system service." -s /bin/false -g basex && \
    mkdir -p $basex_path && \
    chmod 755 $basex_path && \
    chgrp basex $basex_path && \
    unzip /tmp/$archive_name -d $basex_path && \
    chmod 755 $basex_path && \
    chgrp -R basex $basex_path && \
    mkdir -p $basex_path/basex/data/.logs && \
    chmod 755 $basex_path/basex/data/.logs && \
    chown basex:basex $basex_path/basex/data/.logs

RUN wget $basex_mysql_connector_java_url -P $basex_path/basex/lib/ && \
    chmod 0755 $basex_path/basex/lib/mysql-connector-java-5.1.18-bin.jar && \
    echo "$basex_mysql_connector_java_sha256 $basex_path/basex/lib/mysql-connector-java-5.1.18-bin.jar" | sha256sum -c

EXPOSE 1984

CMD ["/usr/local/lib/basex/basex/bin/basexserver"]
