# Use an official Python image as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the application files into the container
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port for the application (set default to 8000)
EXPOSE 8000

# Define the command to run the Uvicorn server
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
