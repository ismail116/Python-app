FROM python:3.9-slim

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc \
    libc-dev \
    default-libmysqlclient-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose port 8000 to the outside world
EXPOSE 8000

# Define the command to run your Django application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# Run the application
#CMD ["python", "manage.py"]




#################################################
#this old docker file
# Use the official Python image as the base image
#FROM python:3.9-slim

# Set environment variables
#ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
#WORKDIR /app

# Copy the current directory contents into the container at /app
#COPY . /app

# Install dependencies
#RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8000 to the outside world
#EXPOSE 8000

# Define the command to run your Django application
#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]



