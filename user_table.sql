CREATE TABLE user (
   userId varchar(16) NOT NULL,
   pwd varchar(20) NOT NULL,
   nick varchar(10) NOT NULL,
   email varchar(45) NOT NULL,
   regDate timestamp NULL DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (userId),
   UNIQUE KEY email_UNIQUE (email),
   UNIQUE KEY nick_UNIQUE (nick)
 );