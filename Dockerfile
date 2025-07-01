FROM n8nio/n8n:latest

# Manter usuário padrão
USER node

# Expor porta
EXPOSE 5678

# Comando simples - SEM --tunnel
CMD ["n8n", "start"]
