FROM python:3.13

# Install distutils
RUN apt-get update && apt-get install -y python3-distutils

# Set working directory
WORKDIR /data

# Install Django
RUN pip install django==3.2

# Copy application code
COPY . .

# Run database migrations
RUN python manage.py migrate

# Expose the necessary port
EXPOSE 8000

# Command to run your application (if needed)
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
