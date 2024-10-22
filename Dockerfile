FROM python:3.13

RUN apt-get update && apt-get install -y python3-distutils

WORKDIR /data

# Create a virtual environment
RUN python -m venv venv

# Activate the virtual environment and install Django
RUN . venv/bin/activate && pip install django==3.2

COPY . .

# Activate the virtual environment and run migrations
RUN . venv/bin/activate && python manage.py migrate
