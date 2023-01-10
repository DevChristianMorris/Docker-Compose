# 03 Exercise - Docker Compose

## Scenario

Your team has been running the components of the Todo application code repo to assist with their planning of the app. They have found that it has become a time intensive task and that they need to keep track of differences in the setup across different computers.

Your tech lead has asked you to use containerization technology to improve the Todo application so that it is fast, consistent and easy to run.

## Brief

If you need a quick refresher - the codebase used in this Todo app boilerplate is based on a fork of the source code from this youtube tutorial [PERN Stack Course - Postgres, Express, React, and Node](https://www.youtube.com/watch?v=ldYcgPKEZC8) but has been updated so that you can follow along with your friendly Developers Institute tech lead in the below videos.

## Instructions
Follow Mark's tutorial videos where he will walk you through how to use [Docker](https://docs.docker.com/get-started/overview/) to containerize the separate components of the Todo application and [Docker Compose](https://docs.docker.com/compose/) to run them all at once with one command.

Make sure that you read the bullet points for each section before following along with the video.

### Part A - Getting Started

Run the existing Todos app.

- Don't forget to `npm install` in the correct folders
- You can create your own database container using the below command in your terminal.
  ```zsh
    docker run -d \
      --name postgres \
      -p 5432:5432 \
      -e POSTGRES_PASSWORD=password \
      -v postgres:/var/lib/postgresql/data \
      -v "$(pwd)/server:/docker-entrypoint-initdb.d" \
      -d \
      postgres
    ```
  - Navigate to `http://localhost:5001/api/spec` in your browser to view the [Swagger UI](https://swagger.io/tools/swagger-ui/) generated API docs.

### Part B - Watch 'Why Docker?'
[Docker-compose - 01 Why](https://vimeo.com/developersinstitute/review/554086338/41c03fd188) (8min)
- Mark takes us through why using Docker Compose is beneficial for our projects.
- Note: In this video you can ignore that the port Mark has used for the server is different from the one in this repo.

### Part C - Watch 'Why Docker? #2'
[Docker-compose - 02 Why Part 2 - Use Diff Tool to Solve a Mystery](https://vimeo.com/developersinstitute/review/554086441/067bfdf1e3) (7min)
- Mark takes us through a real example of an issue that can occur with projects that don't use Docker Compose.

### Part D - Containerize your Database
[Docker-compose - 03 Database Config](https://vimeo.com/554086533/f2b088ef94) (24min)
- Mark takes us through creating a `docker-compose.yml` file for the project, and containerizing the Database with a `Dockerfile`.
- Use the `postgres:14.0-alpine3.14` image in the Database Dockerfile instead of Postgres version 13.

### Part E - Containerize your Server
[Docker-compose - 04 Dockerize the Server](https://vimeo.com/554086820/35f114cdbd) (17min)
- Mark takes us through containerizing the server.
- Before you begin, in your repo's `/server/.env` change `EXPRESS_PORT=5001` to `EXPRESS_PORT=5000`. Doing this will change the port that your server is listening on in your `sever/index.js` file, because when Dockerizing the server we will want the server to be listening on PORT 5000. 
- Use the `node:16-alpine` image in the Server Dockerfile of Node instead of Node version 12.

### Part F - Containerize your Client
[Docker-compose - 05 Dockerize the Client](https://vimeo.com/554087251/4ae21a0aef) (13min)
- Mark takes us through containerizing the client.
- Use the `node:16-alpine3.11` image in the Client Dockerfile instead of Node version 12.

### Part G - Create a Bind Mount
[Docker-compose - Hot Reloading with Bind Mounts](https://vimeo.com/manage/videos/554087933/7a76b47f6b) (17min)
- Mark shows us how to use Bind Mounts on the client and server so that changes we make to the files living on our machine are automatically copied to our running Docker containers.

### Part H - Enable Auto-reloading
[Docker-compose - Hot Reloading on the Client (Chokidar)](https://vimeo.com/manage/videos/554087844/5062ac591c) (3min)
- Mark shows us how to get auto-reloading in our todo app without having to click the refresh button in the browser.