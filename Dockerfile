# Use an official Python runtime as the base image
FROM python:3.9-slim

# Create a non-root user
RUN adduser --disabled-password --gecos '' norootuser

# Set the working directory to /app
WORKDIR /app

# Change the ownership of the working directory to the new user
RUN chown -R norootuser:norootuser /app

# Switch to the new user
USER norootuser

# Copy the current directory contents into the container at /app
COPY . /app

# Install the required packages
RUN pip install prometheus_client requests Flask

# Set the default command for the container
CMD ["python", "app.py"]
