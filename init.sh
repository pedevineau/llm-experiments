#!/bin/sh

# change the session name and the working directory if necessary
SESSION=onyxia
WORK_DIR=/home/${SESSION}/work

CLONE_DIR=${WORK_DIR}/llm-experiments
ENV_DIR=${WORK_DIR}/llm-env
# Clone course repository
REPO_URL=git@github.com:llm-experiments.git

git clone --depth 1 $REPO_URL $CLONE_DIR

python -m virtualenv $ENV_DIR
source ${ENV_DIR}/bin/activate

# Install additional packages if needed
REQUIREMENTS_FILE=${CLONE_DIR}/requirements.txt
python -m pip install -r $REQUIREMENTS_FILE

# the last line is for onyxia
sudo chown ${SESSION} -R /home/${SESSION}/ # Otherwise onyxia user has no rights on the local repo folder.
