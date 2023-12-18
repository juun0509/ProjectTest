community 테이블의 tonicId 컬럼을 productName으로 변경

ALTER TABLE `tonicbank`.`community` 
CHANGE COLUMN `tonicId` `productName` VARCHAR(50) NULL DEFAULT NULL ;

자유게시판 좋아요 테이블

CREATE TABLE `tonicbank`.`communitylikes` (
  `communityLikeId` INT NOT NULL AUTO_INCREMENT,
  `userId` VARCHAR(16) NOT NULL,
  `communityId` INT NOT NULL,
  PRIMARY KEY (`communityLikeId`)
);
ALTER TABLE communitylikes ADD FOREIGN KEY(userId) REFERENCES user(userId) 
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE communitylikes ADD FOREIGN KEY(communityId) REFERENCES community(communityId) 
ON UPDATE CASCADE ON DELETE CASCADE;

자유게시판 댓글 테이블

CREATE TABLE `tonicbank`.`communitycomment` (
  `communityCommentId` INT NOT NULL AUTO_INCREMENT,
  `communityId` INT NOT NULL,
  `content` TEXT NOT NULL,
  `userId` VARCHAR(16) NOT NULL,
  `createdDate` TIMESTAMP NOT NULL DEFAULT current_timestamp,
  `parentCommentId` INT NULL DEFAULT 0,
  `group` INT NULL DEFAULT 0,
  `groupOrder` INT NULL DEFAULT 0,
  `step` INT NULL DEFAULT 0,
  `childCount` INT NULL DEFAULT 0,
  `deleteStatus` TINYINT NULL DEFAULT 0,
  PRIMARY KEY (`communityCommentId`)
);
ALTER TABLE communitycomment ADD FOREIGN KEY(communityId) REFERENCES community(communityId) 
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE communitycomment ADD FOREIGN KEY(userId) REFERENCES user(userId) 
ON UPDATE CASCADE ON DELETE CASCADE;
