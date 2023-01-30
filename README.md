# JW Notes Merger Server

Simple server using [Express](https://expressjs.com/) and [Node.js](https://nodejs.org/) for merging JW Library's notes, bookmarks and markup.

# Pre-requisites

- Install [Node.js](https://nodejs.org/en/) version 15 or higher

# Getting started

- Clone the repository

```shell
git clone https://github.com/LeomaiaJr/JW-Notes-Merger-Server
```

- Install dependencies

```shell
cd JW-Notes-Merger-Server
npm install
```

- Define environment variables, following the [.env.example](.env.example) file

```shell
API_PORT=8080
```

- Run the server in development mode with watch mode

```shell
npm run dev
```

- Build the server for production

```shell
npm run build
```

## Containerization

- Build the container

```shell
docker build -t jw-notes-merger-server .
```

- Run the container

```shell
docker run -d -it --rm --name jw-notes-merger-server -p 8080:8080 jw-notes-merger-server:latest
```

To run it with logging, leave the `-d` out of the above command, or run the following after the above:

```shell
docker logs -f jw-notes-merger-server
```

Use `ctrl+c` to exit.

To stop and remove the container, run the following:

```shell
docker stop jw-notes-merger-server && docker rm -f jw-notes-merger-server
```

# Endpoints

    - /merge-db
        - POST
        - Merge 2 notes files into 1
        - Accepts 2 notes files with .jwlibrary extension
        - Returns a File with the following properties:
            - name: merged
            - extension: .jwlibrary
        - Example error:
            - 400 Bad Request
                - `{ "message": "Two valid files are required" }`
                - `{ "message": "Only .jwlibrary files are allowed" }`
            - 500 Internal Server Error
                - `{ "message": "Unexpected error" }`

# Production Environment

- Server

  - [Repo](https://github.com/LeomaiaJr/JW-Notes-Merger-Server)
  - [Link](https://notes-merger-server.leomaiajr.dev)

- Frontend
  - [Repo](https://github.com/LeomaiaJr/JW-Notes-Merger)
  - [Link](https://jw-notes-merger.leomaiajr.dev/)
