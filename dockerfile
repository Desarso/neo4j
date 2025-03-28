# Use the official Neo4j image
FROM neo4j:latest

# Set environment variables for Neo4j
ENV NEO4J_AUTH=neo4j/potato123

# Expose the necessary ports
EXPOSE 7474 7687

# Set the default working directory
WORKDIR /var/lib/neo4j


# Install APOC Plugin
# 1. Download APOC
RUN apt-get update && apt-get install -y wget curl
ARG APOC_VERSION=5.28.0 # Replace with the APOC version matching your Neo4j version
RUN wget "https://github.com/neo4j/apoc/releases/download/${APOC_VERSION}/apoc-${APOC_VERSION}-all.jar" -O /var/lib/neo4j/plugins/apoc-${APOC_VERSION}-all.jar

# Copy the custom Neo4j configuration file
COPY neo4j.conf /var/lib/neo4j/conf/neo4j.conf

# Volume setup for data, logs, and configurations
VOLUME ["/var/lib/neo4j/data", "/var/log/neo4j", "/var/lib/neo4j/conf"]

# Start Neo4j
CMD ["neo4j"]
