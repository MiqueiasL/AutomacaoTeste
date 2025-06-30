FROM n8nio/n8n:latest

# Instalar dependências necessárias
USER root
RUN apk add --no-cache curl bash

# Criar script de inicialização
RUN echo '#!/bin/bash' > /start.sh && \
    echo 'export N8N_HOST=0.0.0.0' >> /start.sh && \
    echo 'export N8N_PORT=5678' >> /start.sh && \
    echo 'export N8N_PROTOCOL=http' >> /start.sh && \
    echo 'export N8N_BASIC_AUTH_ACTIVE=true' >> /start.sh && \
    echo 'export N8N_BASIC_AUTH_USER=admin' >> /start.sh && \
    echo 'export N8N_BASIC_AUTH_PASSWORD=senha123' >> /start.sh && \
    echo 'export WEBHOOK_URL=https://automacaoteste.fly.dev/' >> /start.sh && \
    echo 'export N8N_EDITOR_BASE_URL=https://automacaoteste.fly.dev/' >> /start.sh && \
    echo 'echo "Starting n8n on 0.0.0.0:5678..."' >> /start.sh && \
    echo 'exec n8n start' >> /start.sh && \
    chmod +x /start.sh

# Voltar para usuário n8n
USER node

# Expor a porta
EXPOSE 5678

# Usar o script de inicialização
CMD ["/start.sh"]
