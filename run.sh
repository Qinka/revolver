#!/bin/bash

#(base) root@qinka-qgkruha7xeud-main:/openbayes/home/revolver# python train.py --help
#Usage: train.py [OPTIONS] EXPERIMENT
#
#Options:
#  --model [fcn32s|fcn32s-lite|fgbg|fgbg-lite|interactive-early|interactive-early-lite|interactive-late|interactive-late-glob|interactive-late-glob-lite|cofeat-early|cofeat-late|cofeat-late-lite|cofeat-late-lite-unshared]
#  --dataset [voc|sbdd|voc-inst|sbdd-inst|coco]
#  --datatype [semantic|fgbg|interactive|interactive-class|early-interactive|early-interactive-class|early-conditional|early-conditional-class|late-conditional|late-conditional-class]
#  --split TEXT
#  --val_dataset [voc|sbdd|voc-inst|sbdd-inst|coco]
#  --val_split TEXT
#  --class_group [all|0|1|2|3]
#  --count INTEGER
#  --shot INTEGER
#  --lr FLOAT
#  --max_iter INTEGER
#  --seed INTEGER
#  --gpu INTEGER
#  --do-eval / --no-eval
#  --help                          Show this message and exit.


exp='voc-interactive-late-glob-lite'
# model='cofeat-late'
model='interactive-late-glob-lite'
dataset='voc'
datatype='interactive'
split='train'
val_dataset='voc'
val_split='val'
lr=1e-5
max_iter=100000
seed=1337
gpu=0


python -u train.py $exp --model $model --dataset $dataset --datatype $datatype --split $split --val-dataset $val_dataset --val-split $val_split --lr $lr --max-iter $max_iter --seed $seed --gpu $gpu --no-eval



# Usage: evaluate.py [OPTIONS] EXPERIMENT

# Options:
#   --model [fcn32s|fcn32s-lite|fgbg|fgbg-lite|interactive-early|interactive-early-lite|interactive-late|interactive-late-glob|interactive-late-glob-lite|cofeat-early|cofeat-late|cofeat-late-lite|cofeat-late-lite-unshared]
#   --weights PATH
#   --dataset [voc|sbdd|voc-inst|sbdd-inst|coco]
#   --datatype [semantic|fgbg|interactive|interactive-class|early-interactive|early-interactive-class|early-conditional|early-conditional-class|late-conditional|late-conditional-class]
#   --split TEXT
#   --count INTEGER
#   --shot INTEGER
#   --save_seg
#   --seed INTEGER
#   --gpu INTEGER
#   --help                          Show this message and exit.

# exp=voc-cofeat-late-late-condifitional

# weight=`dirname $0`/experiments/$exp/snapshot-iter100000.pth
split="val"


for i in $(ls `dirname $0`/experiments/$exp/ | grep pth);
do
    python -u evaluate.py $exp --model $model --weights `dirname $0`/experiments/$exp/$i --dataset $dataset --datatype $datatype --seed $seed --gpu $gpu  --split $split --save-seg
    
done


# python -u evaluate.py $exp --model $model --weights $weight --dataset $dataset --datatype $datatype --seed $seed --gpu $gpu  --split $split --save-seg

