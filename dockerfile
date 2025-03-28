# Use the official Neo4j image
FROM neo4j:latest

# Set environment variables for Neo4j
ENV NEO4J_AUTH=neo4j/${SERVICE_PASSWORD_NEO4J}

# Expose the necessary ports
EXPOSE 7474 7687

# Set the default working directory
WORKDIR /var/lib/neo4j

# Copy the custom Neo4j configuration file
COPY neo4j.conf /var/lib/neo4j/conf/neo4j.conf

# Volume setup for data, logs, and configurations
VOLUME ["/var/lib/neo4j/data", "/var/log/neo4j", "/var/lib/neo4j/conf"]

# Start Neo4j
CMD ["neo4j"]
