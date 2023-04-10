# Use a Python 3.7 runtime as a parent image
FROM python:3.7

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Set environment variables
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000

# Expose port 5000 for Flask web server
EXPOSE 5000

# Set the entry point to the Flask web server
ENTRYPOINT ["flask", "run"]
