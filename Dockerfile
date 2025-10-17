# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy code into container
COPY . /app

# Install dependencies
RUN pip install -r requirements.txt

# Expose port 5000
EXPOSE 5000

# Run the app
CMD ["python3", "app.py"]
