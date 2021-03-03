# Pharmalogy API

Pharmalogy API is a RESTFUL API that implement different functionalities to manage and organize pharmacies work.

## Features

- Lorem Ipsum is simply dummy text of the printing and typesetting
- Lorem Ipsum is simply dummy text of the printing and typesetting
- Lorem Ipsum is simply dummy text of the printing and typesetting
- Lorem Ipsum is simply dummy text of the printing and typesetting
- Lorem Ipsum is simply dummy text of the printing and typesetting

## Installation

Pharmalogy API requires [Node.js](https://nodejs.org/) v10+ to run.

Clone and install the dependencies and devDependencies and start the server.

```sh
cd Pharmalogy-api
npm i
npm serve
```

For production environments...

```sh
npm i --production
NODE_ENV=production npm serve
```

## Plugins

Pharmalogy API is currently extended with the following plugins.
Instructions on how to use them in your own application are linked below.

| Plugin | README |
| ------ | ------ |
| ExpressJS | [https://expressjs.com/en/starter/installing.html][PlDb] |
| Sequelize | [https://sequelize.org/master/][PlGh] |
| Mysql | [https://www.npmjs.com/package/mysql][PlGh] |
| JsonWebToken | [https://www.npmjs.com/package/jsonwebtoken][PlGd] |
| Bcrypt | [https://www.npmjs.com/package/bcrypt][PlOd] |

## Development

Want to contribute? Great!

Pharmalogy uses Gulp for fast developing.
Make a change in your file and instantaneously see your updates!

Open your favorite Terminal and run these commands.

First Tab:

```sh
gulp
```

Second Tab:

```sh
npm serve
```

#### Building for source

For production release:

```sh
gulp build --prod
```

Generating pre-built zip archives for distribution:

```sh
gulp build dist --prod
```

Verify the API by using [Postman](https://www.postman.com/downloads/) with the following address format.

```sh
127.0.0.1:8000/api/{request}
```

## License

MIT