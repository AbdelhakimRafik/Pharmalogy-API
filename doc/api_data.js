define({ "api": [
  {
    "type": "post",
    "url": "/api/signin",
    "title": "Authentification",
    "name": "SignIn",
    "group": "User",
    "permission": [
      {
        "name": "public"
      }
    ],
    "description": "<p>Authentify a user with his email and password, and return a token.</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "email",
            "description": "<p>User email addresse.</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "password",
            "description": "<p>User password.</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response",
          "content": "HTTP/1.1 200\n{\n    \"auth\": true\n    \"message\": \"User authenticated successfully\"\n    \"token\": token\n    \"user\":\n        \"firstName\": user firstName\n        \"lastName\": user lastName\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response",
          "content": "HTTP/1.1 401\n{\n    \"auth\": false\n    \"message\": \"Email or password incorrect\"\n}",
          "type": "json"
        }
      ]
    },
    "version": "0.0.0",
    "filename": "src/app/controllers/authController.coffee",
    "groupTitle": "User",
    "sampleRequest": [
      {
        "url": "http://localhost:8000/api/signin"
      }
    ]
  },
  {
    "type": "post",
    "url": "/api/signup",
    "title": "Registration",
    "name": "SignUp",
    "group": "User",
    "permission": [
      {
        "name": "public"
      }
    ],
    "description": "<p>Register new given user if not exist.</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "firstName",
            "description": "<p>User first name.</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "lastName",
            "description": "<p>User last name.</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "email",
            "description": "<p>User email addresse.</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "password",
            "description": "<p>User password.</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "size": "10",
            "optional": true,
            "field": "phone",
            "description": "<p>User number phone.</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "city",
            "description": "<p>User city name.</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "country",
            "description": "<p>User country name.</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response",
          "content": "HTTP/1.1 200\n{\n    \"message\": \"User created successfully\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Email-exists",
          "content": "HTTP/1.1 401\n{\n    \"message\": \"Email already exists\"\n}",
          "type": "json"
        },
        {
          "title": "Error-Data",
          "content": "HTTP/1.1 400\n{\n    \"message\": \"Data errors\"\n    \"errors\": errors list\n    \"errorCount\": number of errors\n}",
          "type": "json"
        }
      ]
    },
    "version": "0.0.0",
    "filename": "src/app/controllers/authController.coffee",
    "groupTitle": "User",
    "sampleRequest": [
      {
        "url": "http://localhost:8000/api/signup"
      }
    ]
  }
] });
