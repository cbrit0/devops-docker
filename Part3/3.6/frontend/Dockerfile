FROM node:14

ENV REACT_APP_BACKEND_URL=http://localhost:8080

EXPOSE 5000

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install && \
    npm install -g serve && \
    useradd -m appuser

COPY . .
RUN npm run build

USER appuser

CMD ["serve", "-s", "-l", "5000", "build"]