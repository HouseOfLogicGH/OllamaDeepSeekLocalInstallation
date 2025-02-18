# part 1

# install
curl -fsSL https://ollama.com/install.sh | sh

# fix binding to allow connection from non-localhost addresses
# as per https://github.com/ollama/ollama/blob/main/docs/faq.md#setting-environment-variables-on-linux
systemctl edit ollama.service

# add the following
#[Service]
#Environment="OLLAMA_HOST=0.0.0.0:11434"

systemctl daemon-reload
systemctl restart ollama

# download model, eg 
ollama pull deepseek-r1:1.5b

# get response with streaming disabled
curl http://localhost:11434/api/generate -d '{
  "model": "deepseek-r1:1.5b",
  "prompt": "Why is the sky blue?",
  "stream": false
}'

# api pages
https://github.com/ollama/ollama/blob/main/docs/api.md

# part 2

# open webui
https://github.com/open-webui/open-webui

# check python version - should be at least 3.11
python3 --version

sudo apt-get install python3-pip
sudo apt-get install python3.12-venv

#create virtual env
mkdir open-webui

python3 -m venv /home/user/open-webui
cd open-webui
./bin/pip install open-webui

# lots of disk space needed!

./bin/open-webui serve


