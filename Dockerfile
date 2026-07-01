# Use the official Python 3.12 Debian Bookworm image
FROM python:3.12-bookworm

# Set the working directory in the container
WORKDIR /app

# 1. Install system dependencies
# Bookworm has many build tools pre-installed, but we ensure wget and git are present
RUN apt-get update && apt-get install -y \
    git \
    wget \
    graphviz \
    && rm -rf /var/lib/apt/lists/*

# 2. Install Bazel 3.0.0
ENV BAZEL_VERSION="3.0.0"
RUN wget https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh -q \
    && chmod +x bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh \
    && ./bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh \
    && rm bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh

# 3. Copy the requirements file into the container
COPY requirements.txt .

# 4. Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of your application code
COPY . .

# 6. Expose the default Gradio port
EXPOSE 7860 5678 8080

# 7. Set Gradio network variables
ENV GRADIO_SERVER_NAME="0.0.0.0"
ENV GRADIO_SERVER_PORT=7860

# 8. Command to run the application
CMD ["python", "app.py"]