# Use uma imagem base do Python
FROM python:3.9-slim

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Copie os arquivos do projeto para dentro do container
COPY . /app

# Instale as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# Exponha a porta em que a aplicação vai rodar
EXPOSE 5000

# Comando para rodar a aplicação
CMD ["python", "app.py"]
