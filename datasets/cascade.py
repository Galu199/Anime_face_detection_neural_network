import fnmatch
from multiprocessing.dummy import Array
import os
from matplotlib import pyplot as plt
import cv2
from numpy import array, double

# Load the cascade
rootFolderPath="./datasets/"
paths_image="train/images/"
paths_labels="train/labels/"
paths_dupa="train/dupa/"

for root,_,files in os.walk(rootFolderPath+paths_image):
    for filename in files:
        file = os.path.join(root,filename)
        print(file)
        if fnmatch.fnmatch(file,'*.jpg'):
            img = cv2.imread(file)       
            h, w, c = img.shape
            filenamewithoutjpg = filename[:-4]
            f = open(rootFolderPath+paths_labels+filenamewithoutjpg+".txt",'r')
            count = 0
            for lines in f.readlines():
                contents = lines.split(" ")
                if(contents != ['']):
                    BX = int(double(contents[1])*w);
                    BY = int(double(contents[2])*h);
                    BW = int(double(contents[3])*w);
                    BH = int(double(contents[4])*h);
                    BYP = BY-int(BH/2)
                    BXP = BX-int(BW/2)
                    crop_face = img[(BYP):(BYP+BH), (BXP):(BXP+BW)]
                    path = os.path.join(rootFolderPath+paths_dupa, filenamewithoutjpg+"_"+str(count)+".jpg")
                    cv2.imwrite(path,crop_face)
                    count += 1
            f.close()
            

           
            