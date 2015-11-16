var path = require('path'),
    config;

config = {
  production: {
    url: process.env.GHOST_URL,

    mail: {
      transport: 'SMTP',
      options: {
        service: 'Mailgun',
        auth: {
          user: process.env.MAILGUN_USER,
          pass: process.env.MAILGUN_PASS
        }
      }
    },

    database: {
      client: 'sqlite3',
      connection: {
        filename: path.join(process.env.GHOST_CONTENT, '/data/ghost.db')
      },
      debug: false
    },

    server: {
      host: '0.0.0.0',
      port: '2368'
    },

    paths: {
      contentPath: process.env.GHOST_CONTENT
    }
  },

  development: {
    url: 'http://localhost:2368',

    mail: {
      transport: 'SMTP',
      options: {
        service: 'Mailgun',
        auth: {
          user: process.env.MAILGUN_USER,
          pass: process.env.MAILGUN_PASS
        }
      }
    },

    database: {
      client: 'sqlite3',
      connection: {
        filename: path.join(process.env.GHOST_CONTENT, '/data/ghost-dev.db')
      },
      debug: false
    },

    server: {
      host: '0.0.0.0',
      port: '2368'
    },

    paths: {
      contentPath: process.env.GHOST_CONTENT
    }
  }
};

module.exports = config;
