import tensorflow as tf
from tensorflow.python.client import device_lib 

print("1. TensorFlow version: ", tf.__version__)
print("2. Num GPUs Available: ", len(tf.config.list_physical_devices('GPU')))
print("3. List od Devices: ", device_lib.list_local_devices())

# import torch
# from IPython.display import Image  # for displaying images
# import os 
# import random
# import shutil
# from sklearn.model_selection import train_test_split
# import xml.etree.ElementTree as ET
# from xml.dom import minidom
# from tqdm import tqdm
# from PIL import Image, ImageDraw
# import numpy as np
# import matplotlib.pyplot as plt

# random.seed(108)

# # Function to get the data from XML Annotation
# def extract_info_from_xml(xml_file):
#     root = ET.parse(xml_file).getroot()
    
#     # Initialise the info dict 
#     info_dict = {}
#     info_dict['bboxes'] = []

#     # Parse the XML Tree
#     for elem in root:
#         # Get the file name 
#         if elem.tag == "filename":
#             info_dict['filename'] = elem.text
            
#         # Get the image size
#         elif elem.tag == "size":
#             image_size = []
#             for subelem in elem:
#                 image_size.append(int(subelem.text))
            
#             info_dict['image_size'] = tuple(image_size)
        
#         # Get details of the bounding box 
#         elif elem.tag == "object":
#             bbox = {}
#             for subelem in elem:
#                 if subelem.tag == "name":
#                     bbox["class"] = subelem.text
                    
#                 elif subelem.tag == "bndbox":
#                     for subsubelem in subelem:
#                         bbox[subsubelem.tag] = int(subsubelem.text)            
#             info_dict['bboxes'].append(bbox)
    
#     return info_dict