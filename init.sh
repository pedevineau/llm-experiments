#!/bin/sh

# change the session name and the working directory if necessary
SESSION=onyxia
WORK_DIR=/home/${SESSION}/work
MODEL_PATH=pdevineau/sentenceCamenBERT

mc cp --r s3/${MODEL_PATH} $WORK_DIR

CLONE_DIR=${WORK_DIR}/llm-experiments
LLAMA_DIR=${WORK_DIR}/llama
ENV_DIR=${WORK_DIR}/llm-env
# Clone course repository
REPO_URL=git@github.com:llm-experiments.git
LLAMA_URL=git@github.com:facebookresearch/llama.git

git clone --depth 1 $REPO_URL $CLONE_DIR
git clone --depth 1 $LLAMA_URL $CLONE_DIR

python3 -m venv $ENV_DIR
# Install additional packages if needed
REQUIREMENTS_FILE=${CLONE_DIR}/requirements.txt
python -m pip install -r $REQUIREMENTS_FILE
cd $LLAMA_DIR & python -m pip install -e 

# the last line is for onyxia
sudo chown ${SESSION} -R /home/${SESSION}/ # Otherwise onyxia user has no rights on the local repo folder.
