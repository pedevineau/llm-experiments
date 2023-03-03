MINIO_PATH=TO_BE_REPLACED
TARGET_FOLDER=/home/onyxia/work
LLAMA_FOLDER=/home/onyxia/work/llama
mc cp -r $MINIO_PATH $TARGET_FOLDER
MP=1
torchrun --nproc_per_node $MP ${EXAMPLE_FOLDER}/example.py --ckpt_dir $TARGET_FOLDER/model_size --tokenizer_path $TARGET_FOLDER/tokenizer.model
