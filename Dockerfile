FROM alpine:latest

# Install dependencies
RUN apk add --no-cache openjdk17 wget unzip bash

# Set environment variables
ENV SPOTBUGS_VERSION=4.8.3
ENV SPOTBUGS_HOME=/opt/spotbugs

# Download and unpack SpotBugs
RUN mkdir -p $SPOTBUGS_HOME && \
    wget -q https://github.com/spotbugs/spotbugs/releases/download/${SPOTBUGS_VERSION}/spotbugs-${SPOTBUGS_VERSION}.zip && \
    unzip spotbugs-${SPOTBUGS_VERSION}.zip -d /opt && \
    mv /opt/spotbugs-${SPOTBUGS_VERSION}/* $SPOTBUGS_HOME && \
    rm -rf spotbugs-${SPOTBUGS_VERSION}.zip /opt/spotbugs-${SPOTBUGS_VERSION}

# Add SpotBugs to PATH
ENV PATH="$SPOTBUGS_HOME/bin:$PATH"

# Default shell
CMD ["/bin/sh"]

