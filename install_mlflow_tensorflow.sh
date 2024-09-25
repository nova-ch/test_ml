#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Add the desired Helm repository
add_helm_repo() {
    echo "Adding Helm repositories..."
    helm repo add stable https://charts.helm.sh/stable
    helm repo add bitnami https://charts.bitnami.com/bitnami
    helm repo update
}

# Install MLflow
install_mlflow() {
    echo "Installing MLflow..."
    kubectl create namespace mlflow || true

    # Assuming there is a Helm chart available for MLflow
    # Replace <repo-chart-name> with the correct chart name if available
    # Example usage if MLflow chart exists: helm install mlflow <repo>/mlflow --namespace mlflow
    #helm install mlflow stable/mlflow --namespace mlflow || echo "MLflow chart not found"
    helm install mlflow bitnami/mlflow --namespace mlflow || echo "MLflow chart not found"

}

# Install TensorFlow
install_tensorflow() {
    echo "Installing TensorFlow..."
    kubectl create namespace tensorflow || true

    # Assuming there is a Helm chart available for TensorFlow
    # Replace <repo-chart-name> as needed
    # Example usage if TensorFlow chart exists: helm install tensorflow <repo>/tensorflow-inception -n tensorflow
    helm install tensorflow bitnami/tensorflow-resnet --namespace tensorflow || echo "TensorFlow chart not found" 
    #helm install tensorflow stable/tensorflow-inception --namespace tensorflow || echo "TensorFlow chart not found"
}

# Main execution flow
add_helm_repo
install_mlflow
install_tensorflow

echo "Installation script completed."

