import tensorflow as tf
from tensorflow.python.client import device_lib 

print("1. TensorFlow version: ", tf.__version__)
print("2. Num GPUs Available: ", len(tf.config.list_physical_devices('GPU')))
print("3. List od Devices: ", device_lib.list_local_devices())
