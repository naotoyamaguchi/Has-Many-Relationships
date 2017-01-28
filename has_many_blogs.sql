DROP DATABASE IF EXISTS has_many_blogs;
DROP USER IF EXISTS has_many_user;
CREATE USER has_many_user;
CREATE DATABASE has_many_blogs WITH OWNER has_many_user;

\c has_many_blogs

DROP TABLE IF EXISTS users;
CREATE TABLE users(
  id SERIAL NOT NULL PRIMARY KEY,
  username varchar(90) NOT NULL,
  first_name varchar(90) NULL DEFAULT NULL,
  last_name varchar(90) NULL DEFAULT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

DROP TABLE IF EXISTS posts;
CREATE TABLE posts(
  id SERIAL NOT NULL PRIMARY KEY,
  title varchar(100) NULL DEFAULT NULL,
  url varchar(510) NULL DEFAULT NULL,
  content TEXT NULL DEFAULT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  users_id INTEGER REFERENCES users(id) NOT NULL
);

DROP TABLE IF EXISTS comments;
CREATE TABLE comments(
  id SERIAL NOT NULL PRIMARY KEY,
  body varchar(510) NULL DEFAULT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  users_id INTEGER REFERENCES users(id) NOT NULL,
  posts_id INTEGER REFERENCES posts(id) NOT NULL
);

\i scripts/blog_data.sql