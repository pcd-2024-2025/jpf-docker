# Use OpenJDK 8 as the base image
FROM openjdk:8

# Set environment variables
ENV JPF_HOME=/opt/jpf
ENV PATH="$JPF_HOME/bin:$PATH"

WORKDIR /jpf-workspace
COPY ./JPF /jpf-workspace

# Command to keep the container running
CMD ["/bin/bash"]
