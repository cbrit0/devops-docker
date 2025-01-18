FROM node:14

ENV REACT_APP_BACKEND_URL=http://localhost:8080

EXPOSE 5000

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

RUN npm install -g serve

RUN useradd -m appuser

USER appuser

CMD ["serve", "-s", "-l", "5000", "build"]