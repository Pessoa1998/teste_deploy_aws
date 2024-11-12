# Usando uma imagem Python como base
FROM python:3.10

# Definindo o diretório de trabalho dentro do container
WORKDIR /app

# Copiando o requirements.txt para o container
COPY requirements.txt .

# Instalando as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copiando o código do projeto para dentro do container
COPY . .

# Definindo o comando para rodar a aplicação Flask
CMD ["flask", "run", "--host=0.0.0.0"]
