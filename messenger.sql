CREATE TABLE users (
	id INT NOT NULL AUTO_INCREMENT,
	user_id VARCHAR(32) NOT NULL,
	user_password VARCHAR(32) NOT NULL,
	nickname VARCHAR(16) NOT NULL,
	profile_image VARCHAR(512) NOT NULL,
	profile_bio VARCHAR(64) NOT NULL,
	is_withdrawal TINYINT NOT NULL DEFAULT 0,
	join_date DATE NOT NULL,
	PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE channels (
	id INT NOT NULL AUTO_INCREMENT,
	channel_name VARCHAR(32) NOT NULL,
	creating_user INT,
	capacity INT NOT NULL,
	is_withdrawal TINYINT NOT NULL DEFAULT 0,
	PRIMARY KEY (id),
	FOREIGN KEY (creating_user) REFERENCES users(id) ON DELETE set null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE chats (
	id INT NOT NULL AUTO_INCREMENT,
	message VARCHAR(16384) NOT NULL,
	writer INT NOT NULL,
	channel INT NOT NULL,
	create_date timestamp NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (writer) REFERENCES users(id) ON DELETE cascade,
	FOREIGN KEY (channel) REFERENCES channels(id) ON DELETE cascade
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE follows (
	id INT NOT NULL AUTO_INCREMENT,
	follower INT,
	followee INT,
	PRIMARY KEY (id),
	FOREIGN KEY (follower) REFERENCES users(id) ON DELETE cascade,
	FOREIGN KEY (followee) REFERENCES users(id) ON DELETE cascade
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE blocks (
	id INT NOT NULL AUTO_INCREMENT,
	i_blocked INT,
	blocked_me INT,
	PRIMARY KEY (id),
	FOREIGN KEY (i_blocked) REFERENCES users(id) ON DELETE cascade,
	FOREIGN KEY (blocked_me) REFERENCES users(id) ON DELETE cascade
) ENGINE=InnoDB DEFAULT CHARSET=utf8;