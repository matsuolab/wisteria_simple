cd /mnt/s5_diffusion

wandb login bbe013ae2d44a6c1468b2ed9fd646a2a6b2ddf77

python3 train_video-diffusion.py \
--timesteps 256 --loss_type l2 --train_lr 0.0003 --train_num_steps 700000 --train_batch_size 8 --gradient_accumulate_every 1 --ema_decay 0.995 \
--base_channel_size 64 --attn_dim_head 64 --attn_heads 8 \
--dataset 'minerl' --image_size 32 --num_frames 64 \
--folder 'minerl_navigate-torch/train/' \
--temporal_layer 'bi-s4d' --s4d_hidden_dim 32 --s4d_linear_dim 512 --s4d_version 1 \
--results_folder 'save/mine32_test' \
--device_ids 0 1 2 3 4 5 6 7