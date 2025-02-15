# Use an official Python base image
FROM python:3.12

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install Tesseract (Required for pytesseract)
RUN apt-get update && apt-get install -y tesseract-ocr

# Set environment variable for Tesseract
ENV TESSERACT_CMD=/usr/bin/tesseract

# Copy all project files
COPY . .

# Expose port 8000 for FastAPI
EXPOSE 8000

# Default command to run FastAPI
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
