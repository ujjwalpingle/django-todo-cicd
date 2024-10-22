FROM python:3

# Install necessary packages
RUN apt-get update && apt-get install -y python3-distutils

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install -r requirements.txt

# Copy the project files
COPY . .

# Run migrations
RUN python manage.py migrate

# Expose the port
EXPOSE 8000

# Command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
