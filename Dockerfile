FROM python:3.9  # Ensure you're using an appropriate Python version

# Install required system packages
RUN apt-get update && apt-get install -y \
    python3-distutils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /data
COPY . .

# Install Python packages
RUN pip install --upgrade pip
RUN pip install django==3.2

# Run migrations
RUN python manage.py migrate

EXPOSE 8000
