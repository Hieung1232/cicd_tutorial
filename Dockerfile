FROM ubuntu:latest
MAINTAINER Tuan Thai "tuanthai@example.com"

# Install necessary packages
RUN apt update -y && \
    apt install -y python3-pip python3-dev build-essential python3-venv

# Create a directory for the app
WORKDIR /flask_app

# Add application files
ADD . /flask_app

# Create a virtual environment and install requirements
RUN python3 -m venv venv && \
    . venv/bin/activate && \
    pip install -r requirements.txt

# Set the entrypoint to the virtual environment's Python
ENTRYPOINT ["venv/bin/python"]
CMD ["flask_docker.py"]  # Ensure this matches the file name and path

