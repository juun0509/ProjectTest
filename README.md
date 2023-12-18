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



 product table  (그대로복붙)

 create table product(
name varchar(50) not null primary key,
ingredient text not null,
efficacy text not null,
price int not null,
review text,
cost int default 0,
size int default 0,
up int default 0
);
select * from product;
INSERT INTO product (name, ingredient, efficacy, price)
SELECT
  CONCAT('Product_', LPAD(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)), 3, '0')) AS name,
  CONCAT('Ingredient_', LPAD(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)), 3, '0')) AS ingredient,
  CASE
    WHEN RAND() < 0.1 THEN 'Stomach Diabetes'
     WHEN RAND() < 0.2 THEN 'Brain Rhinitis'
      WHEN RAND() < 0.3 THEN 'Men&Prostate Antioxidant'
       WHEN RAND() < 0.4 THEN 'Fatigue Women'
    WHEN RAND() < 0.5 THEN 'Skin Gut&Bowel Bone&Joint'
    WHEN RAND() < 0.6 THEN 'PregnantWomen Skin'
     WHEN RAND() < 0.7 THEN 'Fatigue Baby&Kids'
      WHEN RAND() < 0.8 THEN 'Liver Eyes'
    WHEN RAND() < 0.9 THEN 'Gut&Bowel Fatigue'
    ELSE 'Diet Antioxidant'
  END AS efficacy,
  FLOOR(RAND() * 10000) AS price
FROM
  information_schema.tables t1
  CROSS JOIN information_schema.tables t2
LIMIT 50;

UPDATE product
SET ingredient = 
    CASE 
        WHEN name = 'Product_001' THEN 'DHA'
        WHEN name = 'Product_002' THEN 'Hawthorn'
        WHEN name = 'Product_003' THEN 'MSM'
        WHEN name = 'Product_004' THEN 'NAC'
        WHEN name = 'Product_005' THEN 'Garcinia'
        WHEN name = 'Product_006' THEN 'Gamma-linolenicAcid'
        WHEN name = 'Product_007' THEN 'Turmeric (Curcumin)'
        WHEN name = 'Product_008' THEN 'Cinnamon'
        WHEN name = 'Product_009' THEN 'ChineseMatrimonyVine'
        WHEN name = 'Product_010' THEN 'Nattokinase'
        WHEN name = 'Product_011' THEN 'Noni'
        WHEN name = 'Product_012' THEN 'Green-lippedMussel'
        WHEN name = 'Product_013' THEN 'DeerAntler'
        WHEN name = 'Product_014' THEN 'Kelp'
        WHEN name = 'Product_015' THEN 'Night-bloomingCereusSeedOil'
        WHEN name = 'Product_016' THEN 'Cordyceps'
        WHEN name = 'Product_017' THEN 'Lycopene'
        WHEN name = 'Product_018' THEN 'RoyalJelly'
        WHEN name = 'Product_019' THEN 'Lutein'
        WHEN name = 'Product_020' THEN 'Ribose'
        WHEN name = 'Product_021' THEN 'R-lipoicAcid'
        WHEN name = 'Product_022' THEN 'Magnesium'
        WHEN name = 'Product_023' THEN 'ManukaHoney'
        WHEN name = 'Product_024' THEN 'Garlic'
        WHEN name = 'Product_025' THEN 'Maca'
        WHEN name = 'Product_026' THEN 'Manganese'
        WHEN name = 'Product_027' THEN 'Melatonin'
        WHEN name = 'Product_028' THEN 'Moringa'
        WHEN name = 'Product_029' THEN 'Mineral'
        WHEN name = 'Product_030' THEN 'MilkThistle'
        WHEN name = 'Product_031' THEN 'Multivitamin'
        WHEN name = 'Product_032' THEN 'EffervescentVitamin'
        WHEN name = 'Product_033' THEN 'VitaminA'
        WHEN name = 'Product_034' THEN 'VitaminB'
        WHEN name = 'Product_035' THEN 'VitaminC'
        WHEN name = 'Product_036' THEN 'VitaminD'
        WHEN name = 'Product_037' THEN 'VitaminE'
        WHEN name = 'Product_038' THEN 'VitaminK'
        WHEN name = 'Product_039' THEN 'Biotin'
        WHEN name = 'Product_040' THEN 'MushroomExtract'
        WHEN name = 'Product_041' THEN 'ImmuneBacterialComplex'
        WHEN name = 'Product_042' THEN 'Bioflavonoids'
        WHEN name = 'Product_043' THEN 'Beta-Carotene'
        WHEN name = 'Product_044' THEN 'BorageOil'
        WHEN name = 'Product_045' THEN 'Boswellia'
        WHEN name = 'Product_046' THEN 'Broccoli'
        WHEN name = 'Product_047' THEN 'Blueberry'
        WHEN name = 'Product_048' THEN 'BlackCherry'
        WHEN name = 'Product_049' THEN 'Serrapeptase'
        WHEN name = 'Product_050' THEN 'DietaryFiber'
        END
WHERE name IN ('Product_001', 'Product_002', 'Product_003', 'Product_004', 'Product_005', 'Product_006', 'Product_007', 'Product_008', 'Product_009', 'Product_010', 'Product_011', 'Product_012', 'Product_013', 'Product_014', 'Product_015', 'Product_016', 'Product_017', 'Product_018', 'Product_019', 'Product_020', 'Product_021', 'Product_022', 'Product_023', 'Product_024', 'Product_025', 'Product_026', 'Product_027', 'Product_028', 'Product_029', 'Product_030', 'Product_031', 'Product_032', 'Product_033', 'Product_034', 'Product_035', 'Product_036', 'Product_037', 'Product_038', 'Product_039', 'Product_040', 'Product_041', 'Product_042', 'Product_043', 'Product_044', 'Product_045', 'Product_046', 'Product_047', 'Product_048', 'Product_049', 'Product_050');
