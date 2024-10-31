FROM ubuntu:latest

# Update the package list and install unzip and openjdk-8-jdk
RUN apt-get update && apt-get install -y unzip openjdk-17-jdk && apt-get install -y unzip && rm -rf /var/lib/apt/lists/*

# Set JAVA_HOME environment variable
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

# Create directory for Mule runtime
RUN mkdir -p /opt/mule
RUN mkdir -p /opt/mule/bin

# Copy Mule runtime to the container
COPY mule-standalone-4.8.0.zip /opt/mule

# Extract Mule runtime
RUN unzip /opt/mule/mule-standalone-4.8.0.zip -d /opt/mule && rm /opt/mule/mule-standalone-4.8.0.zip

# Copy to /opt/mule dir
RUN cd /opt/mule/mule-enterprise-standalone-4.8.0 && cp -r * ../

# Remove runtime folder
RUN cd /opt/mule && rm -rf mule-enterprise-standalone-4.8.0

RUN chmod -R 755 /opt/mule

# Set environment variables
ENV MULE_HOME /opt/mule
ENV PATH $MULE_HOME/bin:$PATH

# Set working directory
WORKDIR /opt/mule

# Expose necessary ports
EXPOSE 8083

COPY ./target/simple-mule-app*.jar /opt/mule/apps/

# Entry point for Mule runtime
ENTRYPOINT ["/opt/mule/bin/mule"]

