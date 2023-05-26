DROP DATABASE Wadachi;
DROP USER 'gruper'@'10.0.0.202';

CREATE USER 'gruper'@'10.0.0.202' IDENTIFIED BY 'Spring_e6';
CREATE DATABASE Wadachi;
USE Wadachi
GRANT ALL PRIVILEGES ON Wadachi.* TO 'gruper'@'10.0.0.202';

-- usersテーブルの作成
CREATE TABLE users (
    user_id VARCHAR(255) PRIMARY KEY NOT NULL,
    user_name VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    goal TEXT,
    limit_ DATE,
    start_date DATE NOT NULL
);

-- channelsテーブルの作成
CREATE TABLE channels (
    ch_id SERIAL PRIMARY KEY,
    user_id VARCHAR(255) REFERENCES users(user_id),
    ch_name VARCHAR(255) UNIQUE NOT NULL,
    summary VARCHAR(255),
    main_category VARCHAR(255),
    sub_category VARCHAR(255),
    created_date TIMESTAMP NOT NULL default current_timestamp
);

-- messagesテーブルの作成
CREATE TABLE messages (
    message_id SERIAL PRIMARY KEY,
    user_id VARCHAR(255) REFERENCES users(user_id),
    ch_id INT REFERENCES channel(ch_id) ON DELETE CASCADE,
    message TEXT,
    created_date TIMESTAMP NOT NULL default current_timestamp,
    reaction INT
);

-- postsテーブルの作成
CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    user_id VARCHAR(255) REFERENCES users(user_id),
    title VARCHAR(255) NOT NULL,
    post TEXT,
    created_date TIMESTAMP NOT NULL default current_timestamp,
    study_time INT,
    reaction INT
);
