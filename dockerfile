# Use uma imagem base com o Python e o Node
FROM python:3.9-slim

# Instale o Node.js no container
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Instalar Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

# Defina o diretório de trabalho para o projeto
WORKDIR /app

# Copie os arquivos do projeto para dentro do container
COPY . /app

# Instale as dependências do Python
RUN pip install --no-cache-dir -r requirements.txt

# Instale as dependências do Node
COPY package.json /app
RUN npm install

# Exponha a porta que o Python vai rodar (ajuste conforme necessário)
EXPOSE 5000

# Defina o comando padrão para rodar a aplicação
CMD ["python", "app.py"]
