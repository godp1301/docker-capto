#!/bin/bash

cat > /usr/local/lib/node_modules/capto/app/config/settings.js <<EOF
'use strict';
var nodemailer = require('nodemailer');
var sendmailTransport = require('nodemailer-sendmail-transport');
var transporter = nodemailer.createTransport(sendmailTransport());

var settings = {
    database: {
        options: { server: {  auto_reconnect: true, socketOptions: { keepAlive: 1 } } },
        url: 'mongodb://${MONGO_HOST}:${MONGO_PORT}/capto',
        debug: false,
        textSearchLanguage: 'english'
    },
    smtp: {
        port: ${SMTP_PORT:-9025},
        ip: ${SMTP_IP:-'127.0.0.1'},
        // defaults to 10mb
        maxMessageSize: 10000000
    },
    http: {
        port: ${HTTP_PORT:-9024},
        ip: ${HTTP_IP:-'127.0.0.1'}
    },
    smtpRelay: {
        transporter: transporter,
        automatic: false
    }
};

module.exports = settings;
EOF

wait-for-mongo mongodb://${MONGO_HOST}:${MONGO_PORT}/capto 30000

capto run
