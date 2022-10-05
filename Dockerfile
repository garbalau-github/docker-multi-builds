FROM node

WORKDIR /app

# Everytime the line is changed, Docker runs
# all commands below that line

# Cache result (it doesn't change very often)
# Only when we change our package.json
# We want to run next step
COPY package.json .

# Cache result
# RUN is Image command
# Runs without cache only if we changed our package.json
RUN npm install

# Cache result (re-run everytime we change our source code)
COPY . .

# Environment variables
ENV REACT_APP_NAME=myName
ENV CHINESE_FOOD=good

EXPOSE 3000

# CMD is Container command
CMD ["npm", "start"]