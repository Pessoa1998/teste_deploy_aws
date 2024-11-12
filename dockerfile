# Use uma imagem base do Python
FROM python:3.9-slim

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Copie os arquivos do projeto para dentro do container
COPY . /app

# Instale as dependências do projeto Python
RUN pip install --no-cache-dir -r requirements.txt

# Use uma imagem base do Node (não substitui a anterior)
FROM node:16

# Atualize e instale dependências para Node
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Defina o diretório de trabalho para Node
WORKDIR /app

# Instale as dependências do projeto Node (supondo que você tenha um package.json)
COPY package.json /app
RUN npm install

# Exponha a porta em que a aplicação Python vai rodar
EXPOSE 5000

# Comando para rodar a aplicação Python (ou altere para o que sua aplicação realmente executa)
CMD ["python", "app.py"]
