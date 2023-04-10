# Use a Python 3.8 runtime as a parent image
FROM python:3.8

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install system dependencies
RUN apt-get update && apt-get install -y git-lfs

# Set up the environment
RUN conda create -n jarvis python=3.8 && \
    echo "conda activate jarvis" >> ~/.bashrc && \
    /bin/bash -c "source ~/.bashrc" && \
    conda install pytorch torchvision torchaudio pytorch-cuda=11.1 -c pytorch -c nvidia && \
    pip install -r requirements.txt

# Download models
RUN cd models && \
    bash download.sh && \
    cd ..

# Set environment variables
ENV FLASK_APP=awesome_chat.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000

# Expose port 5000 for Flask web server
EXPOSE 5000

# Set the entry point to the Flask web server
ENTRYPOINT ["flask", "run", "--config", "config.yaml", "--mode", "server"]
