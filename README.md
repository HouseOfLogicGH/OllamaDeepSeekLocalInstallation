# Ollama / DeepSeek Local Installation

## Part 1

Details as per [this YouTube video](https://youtu.be/1VT9JJspNFQ)

### Ollama Installation

Main installation command:
```
curl -fsSL https://ollama.com/install.sh | sh
```

Fix the service binding to allow connection from non-localhost addresses, as per [https://github.com/ollama/ollama/blob/main/docs/faq.md#setting-environment-variables-on-linux](https://github.com/ollama/ollama/blob/main/docs/faq.md#setting-environment-variables-on-linux)

```
systemctl edit ollama.service
```
Add the following lines

```
[Service]
Environment="OLLAMA_HOST=0.0.0.0:11434"
```

Then run:
```
systemctl daemon-reload
systemctl restart ollama
```

### Download DeepSeek model

To download the model, eg deepseek-r1:1.5b
```
ollama pull deepseek-r1:1.5b
```

To test the model using curl (or send the body as a Post in Postman)

```
curl http://localhost:11434/api/generate -d '{
  "model": "deepseek-r1:1.5b",
  "prompt": "Why is the sky blue?",
  "stream": false
}'
```

### Ollama API pages

[https://github.com/ollama/ollama/blob/main/docs/api.md](https://github.com/ollama/ollama/blob/main/docs/api.md)

## Part 2

### open webui
[https://github.com/open-webui/open-webui](https://github.com/open-webui/open-webui)

Check python version - should be at least 3.11
```
python3 --version
```
Install pre-requisites
```
sudo apt-get install python3-pip
sudo apt-get install python3.12-venv
```

Create virtual env
```
mkdir open-webui
python3 -m venv /home/user/open-webui
```
Install open-webui using pip - note, lots of space is needed!
```
cd open-webui

./bin/pip install open-webui
```

Run open-webui
```
./bin/open-webui serve
```

