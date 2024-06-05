# wisteria_simple
A Simple Tutorial on Wisteria

## Document
公式ドキュメントは，https://wisteria-www.cc.u-tokyo.ac.jp/cgi-bin/hpcportal.ja/index.cgi にログインすることでダウンロードできる

## login
```
ssh ssh -l b***** wisteria.cc.u-tokyo.ac.jp
```

初回は鍵の設定をしたのち，`~/.ssh/config`に以下を追加
```
Host wisteria
     HostName wisteria.cc.u-tokyo.ac.jp
     User bxxxxx
     IdentityFile ~/.ssh/id_rsa
     ForwardX11 yes
     ServerAliveInterval 60
     TCPKeepAlive yes
```
参考：https://www.cc.u-tokyo.ac.jp/events/lectures/156/20210604_OnlineClass.pdf 

## basic commands
トークン使用状況確認：`show_token`　　
メモリ使用状況確認：`show_quota`　　
バッチ実行：`pjsub`（ABCIをqをpjに置換して使う感覚）　　
キューの状態確認：`pjstat` 　　
混雑状況確認：`pjstat --rscuse` / `pjstat --rsc -b`　　


## batch job
```
# グループ(松尾研はgb20)の work dir に移動 (homeではjobを投げられない)
cd /work/gb20/bxxxxx

# jobを投げる
pjsub -g gb20 run_vdm_train.sh
```
### run_vdm_train.sh について
```
#!/bin/bash

#PJM -L rscgrp=debug-a
#PJM -L node=1
#PJM -L elapse=0:10:00
#PJM -L jobenv=singularity
#PJM -j

module load singularity

cd /work/gb20/b20034

singularity exec --bind /work/gb20/b20034:/mnt --nv s6fast_env.sif bash /mnt/train_vdm_init.sh
```
`#PJM -L jobenv=singularity`：singularityを用いる場合のみ，を用いる時のみ必要．  
他はabciとほぼ同じ．

## conda
```
python3 -m venv ~/$conda_env_name
source ~/$conda_env_name/bin/activate
pip3 install ...
```