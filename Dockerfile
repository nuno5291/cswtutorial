FROM oracle/openjdk

RUN yum install -y git

RUN yum install -y wget

RUN wget --no-verbose -O /tmp/apache-maven-3.5.3.tar.gz http://archive.apache.org/dist/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.tar.gz

RUN tar xzf /tmp/apache-maven-3.5.3.tar.gz -C /opt/ && \
    ln -s /opt/apache-maven-3.5.3 /opt/maven && \
    ln -s /opt/maven/bin/mvn /usr/local/bin && \
    rm -f /tmp/apache-maven-3.5.3.tar.gz

RUN cd /opt && git clone https://github.com/mikolas132/tutorial.git

WORKDIR /opt/tutorial

RUN mvn compile

EXPOSE 8080

CMD git pull && mvn clean install jetty:run