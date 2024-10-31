FROM openjdk:8-jdk-alpine

# Set environment variables
ENV MULE_HOME /opt/mule
ENV PATH $MULE_HOME/bin:$PATH

# Create directory for Mule runtime
RUN mkdir -p /opt/mule

# Copy Mule runtime to the container
COPY mule-standalone-4.5.3.tar.gz /opt/mule

# Extract Mule runtime
RUN cd /opt/mule && tar -xzf mule-standalone-4.5.3.tar.gz && rm mule-standalone-4.5.3.tar.gz

# Set working directory
WORKDIR /opt/mule

# Expose necessary ports
EXPOSE 8083

CMD [ "/opt/mule/bin/mule"]


# Entry point for Mule runtime
#ENTRYPOINT ["/opt/mule/bin/mule"]
