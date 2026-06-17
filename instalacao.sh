```bash
#!/bin/bash

REPO_APP="https://github.com/Jorglcs/app.git"

PROJECT_DIR="/home/ubuntu"

echo "Iniciando instalacao"

# Atualiza pacotes
sudo apt update && sudo apt upgrade -y

# Docker
docker -v
if [ $? = 0 ]; then
    echo "Docker ja instalado"
else
    echo "Instalando Docker..."
    sudo apt install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -aG docker "$USER"
    echo "Docker instalado."
fi

# Docker Compose
docker-compose -v
if [ $? = 0 ]; then
    echo "Docker Compose ja instalado"
else
    echo "Instalando Docker Compose..."
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    echo "Docker Compose instalado."
fi

# Transformando outros arquivos em executaveis
sudo chmod +x /home/ubuntu/infra/pipeline.sh
sudo chmod +x /home/ubuntu/infra/scriptcron.sh

# Repositorio
echo "Clonando repositorio..."
cd "$PROJECT_DIR"
git clone "$REPO_APP"

echo "Concluido."
```
