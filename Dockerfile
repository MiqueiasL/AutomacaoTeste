# Usar node 18 slim como base
FROM node:18-slim

# Criar diretório da aplicação
WORKDIR /home/node/app

# Copiar package.json e package-lock.json
COPY package*.json ./

# Instalar dependências
RUN npm install --production

# Copiar o resto da aplicação
COPY . .

# Expor a porta padrão do n8n
EXPOSE 5678

# Rodar o n8n com autenticação básica
CMD [ "npx", "n8n", "start", "--tunnel" ]
