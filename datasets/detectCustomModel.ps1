set-location "./yolov5"
$img = 640 #1280
$weights2 = "runs\train\exp19\weights\last.pt" #"runs\train\exp9\weights\best.pt"
$source = "test2.mkv"

python detect.py --img $img --weights $weights2 --source $source
timeout /t -1