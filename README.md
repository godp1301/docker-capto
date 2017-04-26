# A simple capto mail server deployment

## Building the image locally
`docker build .`

## Running the containers locally using compose
`docker-compose up`

## Configuration options
### Options are passed as environment variables. They should be declared in the docker-compose file.
* MONGO_HOST
* SMTP_PORT
* SMTP_IP
* HTTP_PORT
* HTTP_IP
