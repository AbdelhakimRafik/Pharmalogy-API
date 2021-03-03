###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

# return system configuration
module.exports =

    server:
        host: "localhost"
        port: 8000

    db:
        dialect: "mysql"
        host: "localhost"
        username: "root"
        password: ""
        dbName: "pharmalogy"

    jwb:
        secret: "this is my secret"

    bcrypt:
        key: "this is my key"