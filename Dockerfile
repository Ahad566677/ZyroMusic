# Use a newer base image or update the sources to avoid repository issues
FROM python:3.10-bullseye

# Install Node.js and FFmpeg
RUN apt-get update \
    && apt-get install -y --no-install-recommends nodejs ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set up working directory and dependencies
COPY . /app/
WORKDIR /app/
RUN pip3 install --no-cache-dir -U -r requirements.txt

# Start the application
CMD bash start