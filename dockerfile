FROM python:3.10-slim

# Atualizar o pip e instalar dependências de sistema
RUN pip install --upgrade pip \
    && apt-get update \
    && apt-get install -y --no-install-recommends build-essential

# Criar o usuário e diretório de trabalho
RUN groupadd -r puser && useradd -r -m -g puser -G audio,video puser
WORKDIR /app

# Copiar e instalar dependências
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
