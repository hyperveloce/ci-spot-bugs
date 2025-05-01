FROM alpine:latest

# Install Java and utilities
RUN apk add --no-cache openjdk17 wget unzip bash

# Set environment variables
ENV SPOTBUGS_VERSION=4.8.3
ENV FINDBUGS_HOME=/opt/spotbugs
ENV FINDBUGS_PLUGIN_DIR=$FINDBUGS_HOME/plugin

# Install SpotBugs
RUN mkdir -p $FINDBUGS_HOME && \
    wget -q https://github.com/spotbugs/spotbugs/releases/download/${SPOTBUGS_VERSION}/spotbugs-${SPOTBUGS_VERSION}.zip && \
    unzip spotbugs-${SPOTBUGS_VERSION}.zip -d /opt && \
    mv /opt/spotbugs-${SPOTBUGS_VERSION}/* $FINDBUGS_HOME && \
    rm -rf spotbugs-${SPOTBUGS_VERSION}.zip /opt/spotbugs-${SPOTBUGS_VERSION}

# Install FindSecBugs plugin
RUN mkdir -p $FINDBUGS_PLUGIN_DIR && \
    wget -q https://github.com/find-sec-bugs/find-sec-bugs/releases/download/version-1.12.0/findsecbugs-plugin-1.12.0.jar -O $FINDBUGS_PLUGIN_DIR/findsecbugs-plugin.jar

# Add SpotBugs to PATH
ENV PATH="$FINDBUGS_HOME/bin:$PATH"

# Default command
CMD ["/bin/sh"]
