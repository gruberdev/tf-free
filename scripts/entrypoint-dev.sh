#!/bin/bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
echo -e "Host *\n\tStrictHostKeyChecking no\n\tIdentityFile ~/ssh_key\n\n" > ~/.ssh/config
ssh-keygen -t rsa -b 4096 -C "${GITHUB_EMAIL}" -N '${GITHUB_USER}' -f /root/.ssh/id_rsa
git config --global url.'https://${GITHUB_USER}:${GITHUB_KEY}@github.com'.insteadOf 'https://github.com'

if [ -f ~/.gcloud/credentials.json ]; then
    export GOOGLE_APPLICATION_CREDENTIALS=~/.gcloud/credentials.json
fi
if [ -f /project/credentials/gcp.json ]; then
    export GOOGLE_APPLICATION_CREDENTIALS=/project/credentials/gcp.json
fi
export GOOGLE_PROJECT=$GCP_PROJECT_ID
export  HAS_ALLOW_UNSAFE=y
clear
curl -sL https://git.io/_has | bash -s git az aws tfscan \
 tfsec terraform-docs terraform go task python bash gcloud
exec ./bin "$@"