import mlflow
import numpy as np
import tensorflow as tf

# Start MLflow run
mlflow.start_run()

# Log parameters
mlflow.log_param("num_features", 10)
mlflow.log_param("num_samples", 100)
mlflow.log_param("epochs", 5)

# Generate random data (features and labels)
features = np.random.rand(100, 10)
labels = np.random.rand(100, 1)

# Build a simple model
model = tf.keras.models.Sequential([
    tf.keras.layers.Dense(10, activation='relu', input_shape=(10,)),
    tf.keras.layers.Dense(1)
])

# Compile the model
model.compile(optimizer='adam', loss='mean_squared_error')

# Train the model
history = model.fit(features, labels, epochs=5)

# Log metrics
for epoch in range(len(history.history['loss'])):
    mlflow.log_metric("loss", history.history['loss'][epoch], step=epoch)

# Save the model
model.save("my_model.h5")
mlflow.keras.log_model(model, "model")

print("Model training completed and logged to MLflow.")
mlflow.end_run()

