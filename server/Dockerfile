# Use the Anaconda base image as a parent image
FROM continuumio/anaconda3:latest

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Set up the environment
RUN conda create -n jarvis python=3.8
RUN echo "conda activate jarvis" >> ~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"
RUN conda install pytorch torchvision torchaudio pytorch-cuda=11.7 -c pytorch -c nvidia
RUN pip install -r requirements.txt


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
