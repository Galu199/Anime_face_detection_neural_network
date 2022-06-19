# --weights', type=str, default=ROOT / 'yolov5s.pt', help='initial weights path') 
# --cfg', type=str, default='', help='model.yaml path') 
# --data', type=str, default=ROOT / 'data/coco128.yaml', help='dataset.yaml path') 
# --hyp', type=str, default=ROOT / 'data/hyps/hyp.scratch.yaml', help='hyperparameters path') 
# --epochs', type=int, default=300) 
# --batch-size', type=int, default=16, help='total batch size for all GPUs, -1 for autobatch') 
# --imgsz', '--img', '--img-size', type=int, default=640, help='train, val image size (pixels)') 
# --rect', action='store_true', help='rectangular training') 
# --resume', nargs='?', const=True, default=False, help='resume most recent training') 
# --nosave', action='store_true', help='only save final checkpoint') 
# --noval', action='store_true', help='only validate final epoch') 
# --noautoanchor', action='store_true', help='disable AutoAnchor') 
# --evolve', type=int, nargs='?', const=300, help='evolve hyperparameters for x generations') 
# --bucket', type=str, default='', help='gsutil bucket') 
# --cache', type=str, nargs='?', const='ram', help='--cache images in "ram" (default) or "disk"') 
# --image-weights', action='store_true', help='use weighted image selection for training') 
# --device', default='', help='cuda device, i.e. 0 or 0,1,2,3 or cpu') 
# --multi-scale', action='store_true', help='vary img-size +/- 50%%') 
# --single-cls', action='store_true', help='train multi-class data as single-class') 
# --optimizer', type=str, choices=['SGD', 'Adam', 'AdamW'], default='SGD', help='optimizer') 
# --sync-bn', action='store_true', help='use SyncBatchNorm, only available in DDP mode') 
# --workers', type=int, default=8, help='max dataloader workers (per RANK in DDP mode)') 
# --project', default=ROOT / 'runs/train', help='save to project/name') 
# --name', default='exp', help='save to project/name') 
# --exist-ok', action='store_true', help='existing project/name ok, do not increment') 
# --quad', action='store_true', help='quad dataloader') 
# --linear-lr', action='store_true', help='linear LR') 
# --label-smoothing', type=float, default=0.0, help='Label smoothing epsilon') 
# --patience', type=int, default=100, help='EarlyStopping patience (epochs without improvement)') 
# --freeze', nargs='+', type=int, default=[0], help='Freeze layers: backbone=10, first3=0 1 2') 
# --save-period', type=int, default=-1, help='Save checkpoint every x epochs (disabled if < 1)') 
# --local_rank', type=int, default=-1, help='DDP parameter, do not modify') 

# # Weights & Biases arguments 
# --entity', default=None, help='W&B: Entity') 
# --upload_dataset', nargs='?', const=True, default=False, help='W&B: Upload data, "val" option') 
# --bbox_interval', type=int, default=-1, help='W&B: Set bounding-box image logging interval') 
# --artifact_alias', type=str, default='latest', help='W&B: Version of dataset artifact to use') 

#change directory
set-location "./animeFaceDetection/yolov5"

#Train or Detect
$train = $False

#default 640
$img = 640 

#path to your weights, eg last.pt
$weights1 = " "

#default 1
$batch = 1 

#default 1
$epochs = 1

#Dataset classes and paths
$data = "data.yaml"

#Model
#"yolov5n6.yaml"
#"yolov5s6.yaml"
#"yolov5m6.yaml"
#"yolov5l6.yaml"
#"yolov5x6.yaml"
$cfg = "yolov5s6.yaml"

#path to your weights, eg best.pt
$weights2 = " " 

#path to file for detection
$source = " " 

if($train -eq $True){
    #Training via yolov5
    python train.py --cfg $cfg --weights $weights1 --img $img --batch $batch --epochs $epochs --data $data --cache
}else{
    #Detection
    python detect.py --img $img --weights $weights2 --source $source
}

timeout /t -1