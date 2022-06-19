set-location "C:\Users\Seweryn\Desktop\Work\BIAI\datasets\yolov5"

$img = 640 #1280
$batch = 1
$epochs = 20
$weights1 = "runs\train\exp19\weights\last.pt" #"runs\train\exp8\weights\last.pt"
$weights2 = "runs\train\exp20\weights\best.pt" #"runs\train\exp9\weights\best.pt"
$data = "data.yaml"
$cfg = "yolov5c2.yaml"
$source = "test2.mkv" #"test1.jpg" #"test2.mkv"

python train.py --cfg $cfg --weights $weights1 --img $img --batch $batch --epochs $epochs --data $data --cache
python detect.py --img $img --weights $weights2 --source $source

timeout /t -1