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
CMD [ "npx", "n8n", "start", "--tunnel", "--host=0.0.0.0", "--port=5678", "--auth.basic.active=true", "--auth.basic.user=${N8N_BASIC_AUTH_USER}", "--auth.basic.password=${N8N_BASIC_AUTH_PASSWORD}" ]
