#install kaggle for dataset
pip3 install -q kaggle 

#create new folder
new-item -Name "animeFaceDetection" -ItemType "directory"

#move kaggle.json
move-item kaggle.json "$env:USERPROFILE/.kaggle"

#change location
set-location animeFaceDetection

#download dataset
kaggle datasets download -d andy8744/annotated-anime-faces-dataset 

#unzip dataset
Expand-Archive annotated-anime-faces-dataset.zip -d animeFaceDataset

#download tools form github
git clone https://github.com/ultralytics/yolov5.git

#move data.yaml to yolov5
move-item "data.yaml" "./yolov5"

#go into yolov5
set-location yolov5

timeout /t -1