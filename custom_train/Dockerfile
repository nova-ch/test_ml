# Base image with Python
FROM python:3.12-slim

# Set environment variables for MLflow
ENV MLFLOW_HOME /mlflow
ENV PATH $MLFLOW_HOME/bin:$PATH
# Upgrade pip to the latest version
RUN pip install --no-cache-dir --upgrade pip

# Install MLflow and TensorFlow
RUN pip install --no-cache-dir mlflow tensorflow==2.17.0

# Create a directory for MLflow and your training scripts
RUN mkdir -p $MLFLOW_HOME/artifacts

# Copy the training script
COPY train_model.py /opt/train_model.py

# Set the working directory
WORKDIR /opt

# Run the MLflow server
CMD ["mlflow", "ui", "--host", "0.0.0.0", "--port", "5000", "--backend-store-uri", "sqlite:///mlflow.db", "--default-artifact-root", "/mlflow/artifacts"]


