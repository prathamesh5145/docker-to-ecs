FROM ubuntu:22.04
RUN apt update && apt install -y openjdk-17-jdk wget tar && \
    apt clean
RUN apt-get install -y unzip
RUN apt-get install -y curl
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN bash /aws/install
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.93/bin/apache-tomcat-9.0.93.tar.gz ./
RUN tar -xzf apache-tomcat-9.0.93.tar.gz -C /opt/ && \
    rm -rf ./apache-tomcat-9.0.93.tar.gz
WORKDIR /opt/apache-tomcat-9.0.93/webapps/
COPY s3.sh /opt/apache-tomcat-9.0.93/webapps/
RUN chmod +x /opt/apache-tomcat-9.0.93/webapps/s3.sh
RUN bash /opt/apache-tomcat-9.0.93/webapps/s3.sh
EXPOSE 8080
WORKDIR /opt/apache-tomcat-9.0.93/
CMD ["./bin/catalina.sh", "run"]
