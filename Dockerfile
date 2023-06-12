# Menggunakan official image node:14.21-alpine
FROM node:14.21-alpine

# Menetapkan working directory di dalam kontainer
WORKDIR /app

# Copy the remaining application files to the container
COPY . .

# Menlakan perintah npm install untuk menginstal dependensi
RUN npm install

# Expose port aplikasi di dalam kontainer
EXPOSE 3000

# Menjalankan npm start untuk memulai aplikasi
CMD ["npm", "start"]