FROM python:3.13

# Install necessary packages
RUN apt-get update && apt-get install -y python3-distutils

# Set the working directory
WORKDIR /data

# Create a virtual environment
RUN python -m venv venv

# Activate the virtual environment and install Django
RUN . venv/bin/activate && pip install django==3.2

# Copy project files
COPY . .

# Run migrations (activate the virtual environment first)
RUN . venv/bin/activate && python manage.py migrate
