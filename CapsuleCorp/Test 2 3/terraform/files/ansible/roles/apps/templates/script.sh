#!/bin/bash

git clone https://github.com/mikecao/umami.git
cd umami
npm install

psql -h hostname -U username -d databasename -f sql/schema.postgresql.sql

export DATABASE_URL=connection url
export HASH_SALT=any random string

npm run build

npm start