CREATE TABLE `tonicbank`.`community` (
  `communityId` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(5) NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `content` TEXT NOT NULL,
  `userId` VARCHAR(16) NOT NULL,
  `createdDate` TIMESTAMP NOT NULL DEFAULT current_timestamp,
  `viewCount` INT NOT NULL DEFAULT 0,
  `likeCount` INT NOT NULL DEFAULT 0,
  `commentCount` INT NOT NULL DEFAULT 0,
  `tonicId` INT NULL,
  PRIMARY KEY (`communityId`)
);

ALTER TABLE community ADD FOREIGN KEY(userId) REFERENCES user(userId) 
ON UPDATE CASCADE ON DELETE CASCADE;
