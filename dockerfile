# Use uma imagem base do Python
FROM python:3.9-slim

# Instale as dependências do sistema operacional
RUN apt-get update && apt-get install -y curl

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Copie o arquivo de dependências (requirements.txt) para o container
COPY requirements.txt /app/

# Instale as dependências do Python
RUN pip install --no-cache-dir -r requirements.txt

# Copie o código da aplicação para o container
COPY . /app/

# Exponha a porta que o Flask irá usar
EXPOSE 5000

# Comando para rodar a aplicação Flask
CMD ["python", "app.py"]
