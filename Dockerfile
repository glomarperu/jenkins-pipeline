FROM node:18

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar archivos esenciales y evitar copiar node_modules
COPY package.json ./
RUN npm install

# Copiar el resto del código
COPY . .

# Exponer el puerto 3000
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["node", "server.js"]