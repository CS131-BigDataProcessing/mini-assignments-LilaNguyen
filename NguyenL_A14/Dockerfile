# Start with a base image
FROM python:3.8-slim

# Set working directory
WORKDIR /app

# Copy app files to the container
COPY . /app

# Install dependencies
RUN pip install -r requirements.txt

# Run the app
CMD ["python", "app.py"]
