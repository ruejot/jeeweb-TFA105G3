-- [日期:0224] [beta_4]版本。
-- MER <table> 的 SHIPPING_METHOD <column> 更新為 VARCHAR(3) <datatype>
-- CS_DETAIL <table> 新增 MER_ID <column>
-- CS_DETAIL <table> 新增 ORDER_ID <column> 

-- [日期:0130] [beta_3]版本。
-- 以後不改database名稱，db改動記錄在註解，。
-- 完成全部22個table整合到一個sql script、紀錄column name、PK,FK,NN,AI,DEFAULT資訊到Excel。
-- 整體DB創建，測試成功。
-- 假資料，沒測試。

-- tfa105_group3 database have 6 [creator].
-- T:TingYu/ S:SiAn/ U:UHan/ Y:YuShan/ J:JinTin/ C:CiaWei.

-- 更新db版本時，記得要確認新db匯入成功。
-- [WAY_1] use "right click" on Navigator window DB name -> select "Drop Schema...".
-- [WAY_2] Executing this script will auto DROP old DATABASE, make sure without any error message.;

-- [0223] 新增view table: v_merimg_mer 
CREATE DATABASE IF NOT EXISTS `pet_g3db_tfa105`;

USE `pet_g3db_tfa105`;
-- ============= total 22 tables====各table紀錄==========
-- `tableName`, [creator], [editStatus: updated/revised]
-- 
-- `MEMBERS`, [T,S], [updated]
-- `BUS`, [T,S], [updated]
-- `MEM_FOLLOW`, [T,S], [updated]
-- `MEM_TRACK_BUS`, [T,S], [updated]
-- `MEM_BLOG_ART`, [U], [updated]
-- `MEM_HEART`, [U], [updated]
-- `MEM_SAVED_ART`, [U], [updated]
-- `MEM_REPLY`, [U], [updated]
-- `MEM_ART_PIC`, [U], [updated]
-- `MER`, [J], [updated]
-- `MER_IMG`, [J], [updated]
-- `BUS_ART`, [J], [updated]
-- `BUS_ART_IMG`, [J], [updated]
-- `SERVICE`, [Y], [updated]
-- `SER_IMG`, [Y], [updated]
-- `PAYMENT`, [J], [updated]
-- `SHIPPING`, [Y], [updated]
-- `ORDER`, [C], [updated]
-- `ORDER_DETAIL`, [C], [updated]
-- `SERORDER`, [Y], [updated]
-- `SERORDER_DETAIL`, [Y], [updated]
-- `CS_DETAIL`, [C], [updated]
-- =============================================


-- 因為FK連結關係，DROP table前後順序就需要在乎，否則語法報錯。
-- 原則，有標記FK column的table要先drop掉，再drop參考的來源table。
-- e.g. need drop `ORDER` in advance, then drop `PAYMENT`.
-- 否則出錯如下；
-- Error Code: 3730. Cannot drop table 'payment' referenced by a foreign key constraint 'order_ibfk_3' on table 'ORDER'.
DROP TABLE IF EXISTS `MEM_FOLLOW`;
DROP TABLE IF EXISTS `MEM_TRACK_BUS`;
DROP TABLE IF EXISTS `MEM_HEART`;
DROP TABLE IF EXISTS `MEM_SAVED_ART`;
DROP TABLE IF EXISTS `MEM_REPLY`;
DROP TABLE IF EXISTS `MEM_ART_PIC`;
DROP TABLE IF EXISTS `MER_IMG`;
DROP TABLE IF EXISTS `BUS_ART_IMG`;
DROP TABLE IF EXISTS `CS_DETAIL`;
DROP TABLE IF EXISTS `ORDER_DETAIL`;
DROP TABLE IF EXISTS `SERORDER_DETAIL`;
DROP TABLE IF EXISTS `SER_IMG`;
DROP TABLE IF EXISTS `SERVICE`;
DROP TABLE IF EXISTS `ORDER`;
DROP TABLE IF EXISTS `SERORDER`;
DROP TABLE IF EXISTS `PAYMENT`;
DROP TABLE IF EXISTS `SHIPPING`;
DROP TABLE IF EXISTS `BUS_ART`;
DROP TABLE IF EXISTS `MEM_BLOG_ART`;
DROP TABLE IF EXISTS `MER`;
DROP TABLE IF EXISTS `MEMBERS`;
DROP TABLE IF EXISTS `BUS`;


CREATE TABLE `pet_g3db_tfa105`.`MEMBERS` (
  `MEMBER_ID` INT NOT NULL AUTO_INCREMENT COMMENT '會員流水號ID',
  `NAME` VARCHAR(25) NOT NULL COMMENT '姓名',
  `MOBILE` VARCHAR(10) NOT NULL COMMENT '手機',
  `PHONE` VARCHAR(25) DEFAULT NULL COMMENT '電話',
  `ADDRESS` VARCHAR(50) DEFAULT NULL COMMENT '住址',
  `DATE` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '註冊日期',
  `EMAIL` VARCHAR(50) NOT NULL COMMENT '信箱',
  `PASSWORD` VARCHAR(25) NOT NULL COMMENT '密碼',
  `NICKNAME` VARCHAR(25) DEFAULT NULL COMMENT '暱稱',
  `INTRO` VARCHAR(250) DEFAULT NULL COMMENT '簡介',
  `PHOTO` BLOB DEFAULT NULL COMMENT '大頭貼',
  PRIMARY KEY (`MEMBER_ID`),
  UNIQUE INDEX `UK_MEMBERS_EMAIL` (`EMAIL` ASC) VISIBLE)
COMMENT = '會員資料表';

CREATE TABLE `pet_g3db_tfa105`.`BUS` (
  `BUS_ID` INT NOT NULL AUTO_INCREMENT COMMENT '商家ID',
  `NAME` VARCHAR(25) NOT NULL COMMENT '商家名稱',
  `PHONE` VARCHAR(25) NOT NULL COMMENT '電話',
  `ADDRESS` VARCHAR(50) NOT NULL COMMENT '地址',
  `TAX_ID` VARCHAR(8) NULL COMMENT '統編',
  `DATE` TIMESTAMP NULL DEFAULT NOW() COMMENT '註冊日期',
  `EMAIL` VARCHAR(25) NOT NULL COMMENT '帳號',
  `PASSWORD` VARCHAR(25) NOT NULL COMMENT '密碼',
  `INTRO` VARCHAR(250) NULL COMMENT '簡介',
  `PHOTO` BLOB NULL COMMENT '大頭貼',
  `FB` VARCHAR(30) NULL COMMENT 'FB',
  `IG` VARCHAR(30) NULL COMMENT 'IG',
  `WEBSITE` VARCHAR(30) NULL COMMENT '官方網站',
  `PAYMENT_PROVIDE` VARCHAR(4) NULL COMMENT '提供的付款方式',
  PRIMARY KEY (`BUS_ID`),
  UNIQUE INDEX `UK_BUS_NAME` (`NAME` ASC) VISIBLE,
  UNIQUE INDEX `UK_BUS_TAX_ID` (`TAX_ID` ASC) VISIBLE,
  UNIQUE INDEX `UK_BUS_EMAIL` (`EMAIL` ASC) VISIBLE)
COMMENT = '商家會員資料表';

CREATE TABLE `pet_g3db_tfa105`.`MEM_FOLLOW` (
  `FRIENDSHIP_ID` INT NOT NULL AUTO_INCREMENT COMMENT '追蹤ID流水編號',
  `MEMBER_ID` INT NOT NULL COMMENT '會員ID',
  `FOLLOWEE` INT NOT NULL COMMENT '對象會員ID',
  `FRIENDSHIP` VARCHAR(1) DEFAULT 0 COMMENT '關係,',
  PRIMARY KEY (`FRIENDSHIP_ID`),
  INDEX `FK_FOLLOW_MEMBER_ID_idx` (`MEMBER_ID` ASC) VISIBLE,
  INDEX `FK_FOLLOW_FOLLOWEE_idx` (`FOLLOWEE` ASC) VISIBLE,
  CONSTRAINT `FK_FOLLOW_MEMBER_ID`
    FOREIGN KEY (`MEMBER_ID`)
    REFERENCES `MEMBERS` (`MEMBER_ID`),
  CONSTRAINT `FK_FOLLOW_FOLLOWEE`
    FOREIGN KEY (`FOLLOWEE`)
    REFERENCES `MEMBERS` (`MEMBER_ID`)
)COMMENT = '追蹤_黑名單的個人';

CREATE TABLE `pet_g3db_tfa105`.`MEM_TRACK_BUS` (
  `BUSFOLLOW_ID` INT NOT NULL AUTO_INCREMENT COMMENT'流水編號',
  `MEMBER_ID` INT NOT NULL COMMENT '會員ID',
  `BUS_ID` INT NOT NULL COMMENT '商家ID',
  PRIMARY KEY (`BUSFOLLOW_ID`),
  INDEX `MEMBER_ID_idx` (`MEMBER_ID` ASC) VISIBLE,
  INDEX `BUS_ID_idx` (`BUS_ID` ASC) VISIBLE,
  CONSTRAINT `MEMBER_ID`
    FOREIGN KEY (`MEMBER_ID`)
    REFERENCES `MEMBERS` (`MEMBER_ID`),
  CONSTRAINT `BUS_ID`
    FOREIGN KEY (`BUS_ID`)
    REFERENCES `BUS` (`BUS_ID`)
)COMMENT = '追蹤的商家';

CREATE TABLE `MEM_BLOG_ART` (
    `ART_ID` INTEGER NOT NULL AUTO_INCREMENT COMMENT '文章ID(流水號)',
    `MEMBER_ID` INTEGER NOT NULL COMMENT '會員ID',
    `TITLE` VARCHAR(100) NULL COMMENT '標題',
    `POSTTIME` TIMESTAMP DEFAULT NOW() COMMENT '發文時間',
    `HEART` INTEGER DEFAULT 0 COMMENT '愛心數',
    `CONTENT` VARCHAR(1000) NULL COMMENT '內文',
    PRIMARY KEY (`ART_ID`),
    FOREIGN KEY (`MEMBER_ID`) REFERENCES `MEMBERS`(`MEMBER_ID`)
)COMMENT = '論壇文章';

CREATE TABLE `MEM_HEART` (
    `HE_ART_ID` INTEGER NOT NULL AUTO_INCREMENT COMMENT '文章ID(流水號)',
    `HE_MEMBER_ID` INTEGER NOT NULL COMMENT '會員ID',
    `TIME` TIMESTAMP DEFAULT NOW() COMMENT '時間',
    PRIMARY KEY(`HE_ART_ID`, `HE_MEMBER_ID`),
    FOREIGN KEY(`HE_ART_ID`) REFERENCES `MEM_BLOG_ART`(`ART_ID`),
    FOREIGN KEY(`HE_MEMBER_ID`) REFERENCES `MEMBERS`(`MEMBER_ID`)
)COMMENT = '愛心數紀錄';

CREATE TABLE `MEM_SAVED_ART` (
    `SAV_ID` INTEGER NOT NULL AUTO_INCREMENT COMMENT '流水編號',
    `SAV_MEMBER_ID` INTEGER NOT NULL COMMENT '會員ID',
    `SAV_ART_ID` INTEGER NOT NULL COMMENT '文章ID(流水號)',
    `TIME` TIMESTAMP DEFAULT NOW() COMMENT '時間',
    PRIMARY KEY(`SAV_ID`),
    FOREIGN KEY(`SAV_ART_ID`) REFERENCES `MEM_BLOG_ART`(`ART_ID`),
    FOREIGN KEY(`SAV_MEMBER_ID`) REFERENCES `MEMBERS`(`MEMBER_ID`)
)COMMENT = '用戶收藏的文章';

CREATE TABLE `MEM_REPLY` (
    `RE_ID` INTEGER NOT NULL AUTO_INCREMENT COMMENT '回應流水ID',
    `RE_ART_ID` INTEGER NOT NULL COMMENT '文章ID(流水號)',
    `RE_MEMBER_ID` INTEGER NOT NULL COMMENT '會員ID',
    `RE` VARCHAR(255) NULL COMMENT '留言回應內容',
    `TIME` TIMESTAMP DEFAULT NOW() COMMENT '時間',
    PRIMARY KEY(`RE_ID`),
    FOREIGN KEY(`RE_ART_ID`) REFERENCES `MEM_BLOG_ART`(`ART_ID`),
    FOREIGN KEY(`RE_MEMBER_ID`) REFERENCES `MEMBERS`(`MEMBER_ID`)
)COMMENT = '留言回應';

CREATE TABLE `MEM_ART_PIC` (
    `BL_ARTPIC_ID` INTEGER NOT NULL AUTO_INCREMENT COMMENT '文圖關聯ID(流水號)',
    `BL_ART_ID` INTEGER NOT NULL COMMENT '文章ID',
    `BL_ART_PIC` BLOB COMMENT '圖片',
    `TIME` DATE NULL COMMENT '時間', -- DATE cannot use DEFAULT NOW()
    PRIMARY KEY(`BL_ARTPIC_ID`),
    FOREIGN KEY(`BL_ART_ID`) REFERENCES `MEM_BLOG_ART`(`ART_ID`)
)COMMENT = '文章的圖片';

CREATE TABLE `pet_g3db_tfa105`.`MER` (
  `MER_ID` INT NOT NULL AUTO_INCREMENT COMMENT '商品ID流水編號',
  `BUS_ID` INT NOT NULL COMMENT '商家ID',
  `NAME` VARCHAR(25) NOT NULL COMMENT '商品名稱',
  `PRICE` INT NOT NULL COMMENT '商品價格',
  `STOCK` INT NOT NULL COMMENT '庫存量',
  `SHELF_DATE` DATE NULL COMMENT '上架日期',
  `STATUS` INT NULL COMMENT '上架狀態',
  `DESCRIPTION` VARCHAR(250) NULL COMMENT '商品描述',
  `SHIPPING_METHOD` VARCHAR(4) NULL COMMENT '提供的出貨方式',
  `MAIN_CATEGORY` VARCHAR(50) NULL COMMENT '主商品類別',
  `SUB_CATEGORY` VARCHAR(50) NULL COMMENT '子商品類別',
  PRIMARY KEY (`MER_ID`),
  FOREIGN KEY (`BUS_ID`) REFERENCES `BUS`(`BUS_ID`)
) COMMENT '商品資料表';

CREATE TABLE `pet_g3db_tfa105`.`MER_IMG` (
  `IMG_ID` INT NOT NULL AUTO_INCREMENT COMMENT '商品圖流水編號',
  `MER_ID` INT NOT NULL COMMENT '商品ID',
  `MER_PIC` BLOB NULL COMMENT '圖片',
  `TIME` DATE NULL COMMENT '時間',
  PRIMARY KEY (`IMG_ID`),
  FOREIGN KEY (`MER_ID`) REFERENCES `MER` (`MER_ID`)
) COMMENT '商品的圖片';

CREATE TABLE `pet_g3db_tfa105`.`BUS_ART` (
  `ART_ID` INT NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `BUS_ID` INT NOT NULL COMMENT '商家ID',
  `TITLE` VARCHAR(25) NULL COMMENT '標題',
  `ARTICLE` VARCHAR(500) NULL COMMENT '內文',
  `TIME` DATE NULL COMMENT '時間',
  PRIMARY KEY (`ART_ID`),
  FOREIGN KEY (`BUS_ID`) REFERENCES `BUS` (`BUS_ID`)
) COMMENT '商家文章';

CREATE TABLE `pet_g3db_tfa105`.`BUS_ART_IMG` (
  `IMG_ID` INT NOT NULL AUTO_INCREMENT COMMENT '文章圖流水編號',
  `ART_ID` INT NOT NULL COMMENT '文章ID',
  `ART_PIC` BLOB NULL COMMENT '圖片',
  `TIME` DATE NULL COMMENT '時間',
  PRIMARY KEY (`IMG_ID`),
  FOREIGN KEY (`ART_ID`) REFERENCES `BUS_ART` (`ART_ID`)
) COMMENT '文章的圖片';

CREATE TABLE `SERVICE` (
    `SER_ID` INT NOT NULL COMMENT '服務ID', -- SERVICE.SER_ID不採取AI，打算用有意義的命名
    `BUS_ID` INT NOT NULL COMMENT '商家ID',
    `NAME` VARCHAR(25) NOT NULL COMMENT '名稱',
    `PRICE` INT NOT NULL COMMENT '價格',
    `TIME` DATE NULL COMMENT '上架日期',
    `STATUS` VARCHAR(25) NULL COMMENT '上架狀態',
    `DESCRIPTION` VARCHAR(250) NULL COMMENT '描述',
    `HOLIDAY` VARCHAR(7) NOT NULL COMMENT '公休日',
    `AVAILABLE` VARCHAR(24) NOT NULL COMMENT '營業時間',
    `STOCK` VARCHAR(24) NOT NULL COMMENT '可預約數量',
    PRIMARY KEY (`SER_ID`),
    CONSTRAINT `FK_SERVICE_BUSID` FOREIGN KEY (`BUS_ID`) REFERENCES `BUS` (`BUS_ID`)
) COMMENT '服務資料表';

CREATE TABLE `SER_IMG` (
    `ID` INT NOT NULL AUTO_INCREMENT COMMENT '流水編號',
    `SER_ID` INT NOT NULL COMMENT '服務ID',
    `SER_IMG` BLOB COMMENT '圖片', 
    `TIME` DATE NULL COMMENT '時間',
    PRIMARY KEY (`ID`),
    CONSTRAINT `FK_SERIMG_SERID` FOREIGN KEY (`SER_ID`) REFERENCES `SERVICE` (`SER_ID`)
) COMMENT '服務的圖片';

CREATE TABLE `pet_g3db_tfa105`.`PAYMENT` (
  `PAYMENT_ID` INT NOT NULL AUTO_INCREMENT COMMENT '付款方式編號',
  `PAYMENT_METHOD` VARCHAR(10) NOT NULL COMMENT '付款方式',
  PRIMARY KEY (`PAYMENT_ID`)
) COMMENT '付款方式資料表';

CREATE TABLE `SHIPPING` (
    `SHIPPING_ID` INT NOT NULL COMMENT '出貨方式編號',
    `SHIPPING_METHOD` VARCHAR(10) NOT NULL COMMENT '出貨方式',
	PRIMARY KEY (`SHIPPING_ID`)
) COMMENT '出貨方式資料表';

CREATE TABLE `pet_g3db_tfa105`.`ORDER` (
  `ORDER_ID` INT NOT NULL AUTO_INCREMENT COMMENT '訂單流水編號',
  `MEMBER_ID` INT NOT NULL COMMENT '會員ID',
  `BUS_ID` INT NOT NULL COMMENT '商家ID',
  `ORDER_TIME` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '訂購時間',
  `ORDER_SUM` INT NOT NULL COMMENT '總金額',
  `PAYMENT_ID` INT NULL COMMENT '付款方式編號',
  `SHIPPING_ID` INT NULL COMMENT '出貨方式編號',
  `TRACKING` INT NULL COMMENT '追蹤碼',
  `ORDER_STATUS` INT DEFAULT 1 COMMENT '訂單狀態',
  `INVOICE_ID` VARCHAR(10) NULL COMMENT '發票號碼',
  `RECEIVER` VARCHAR(25) NULL COMMENT '收件人',
  `RECEIVER_ADDR` VARCHAR(50) NULL COMMENT '收件地址',
  `RECEIVER_PHONE` VARCHAR(25) NULL COMMENT '收件電話',
  PRIMARY KEY (`ORDER_ID`),
  FOREIGN KEY (`MEMBER_ID`) REFERENCES `MEMBERS`(`MEMBER_ID`),
  FOREIGN KEY (`BUS_ID`) REFERENCES `BUS`(`BUS_ID`),
  FOREIGN KEY (`PAYMENT_ID`) REFERENCES `PAYMENT`(`PAYMENT_ID`), 
  FOREIGN KEY (`SHIPPING_ID`) REFERENCES `SHIPPING`(`SHIPPING_ID`)
) COMMENT = '商品訂單資料表';

CREATE TABLE `pet_g3db_tfa105`.`ORDER_DETAIL` (
  `ORDER_ID` INT NOT NULL COMMENT '訂單流水編號',
  `MER_ID` INT NOT NULL COMMENT '商品ID',
  `QTY` INT NOT NULL COMMENT '商品數量',
  `UNIT_PRICE` INT NOT NULL COMMENT '商品單價',
  `RANKING` INT NULL COMMENT '評價',
  `COMMENT` VARCHAR(250) NULL COMMENT '評價文字',
  PRIMARY KEY (`ORDER_ID`, `MER_ID`),
  FOREIGN KEY (`ORDER_ID`) REFERENCES `ORDER`(`ORDER_ID`),
  FOREIGN KEY (`MER_ID`) REFERENCES `MER`(`MER_ID`)
) COMMENT = '商品訂單明細';

CREATE TABLE `SERORDER` (
    `ORDER_ID` INT NOT NULL COMMENT '訂單編號', -- SERORDER.ORDER_ID不採取AI，打算用有意義的命名
    `MEMBER_ID` INT NOT NULL COMMENT '會員ID',
    `BUS_ID` INT NOT NULL COMMENT '商家ID',
    `ORDER_TIME` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '訂購時間',
    `TOTAL` INT NOT NULL COMMENT '總金額',
    `ORD_STATUS` INT DEFAULT 1 COMMENT '訂單狀態',
    `INVOICE_ID` VARCHAR(10) COMMENT '發票號碼',
    `RECEIVER` VARCHAR(25) NULL COMMENT '訂購人',
    `RECEIVER_PHONE` VARCHAR(25) NULL COMMENT '訂購人電話',
    PRIMARY KEY (`ORDER_ID`),
    CONSTRAINT `FK_SERORDER_MEMBERID` FOREIGN KEY (`MEMBER_ID`) REFERENCES `MEMBERS` (`MEMBER_ID`),
    CONSTRAINT `FK_SERORDER_BUSID` FOREIGN KEY (`BUS_ID`) REFERENCES `BUS` (`BUS_ID`)
) COMMENT '服務訂單資料表';

CREATE TABLE `SERORDER_DETAIL` (
    `ORDER_ID` INT NOT NULL COMMENT '訂單編號',
    `SER_ID` INT NOT NULL COMMENT '服務ID',
    `SER_DATE` DATE NOT NULL COMMENT '服務日期',
    `SER_QTY` VARCHAR(24) NOT NULL COMMENT '預約數量',
    `UNIT_PRICE` INT NOT NULL COMMENT '單價',
    COMMENT VARCHAR(250) NULL COMMENT '評價文字',
    PRIMARY KEY (`ORDER_ID`, `SER_ID`),
    CONSTRAINT `FK_SERORDERDETAIL_ORDERID` FOREIGN KEY (`ORDER_ID`)
    REFERENCES `SERORDER` (`ORDER_ID`),
    CONSTRAINT `FK_SERORDERDETAIL_SERID` FOREIGN KEY (`SER_ID`)
    REFERENCES `SERVICE` (`SER_ID`)
) COMMENT '服務訂單明細';

  CREATE TABLE `pet_g3db_tfa105`.`CS_DETAIL` (
  `CASE_ID` INT NOT NULL AUTO_INCREMENT COMMENT '客服案流水號',
  `MEMBER_ID` INT NOT NULL COMMENT '會員ID',
  `BUS_ID` INT NOT NULL COMMENT '商家ID',
  `MER_ID` INT NULL COMMENT '詢問的商品ID',
  `ORDER_ID` INT NULL COMMENT '詢問的訂單ID',
  `CASE_TIME` DATE NULL COMMENT '立案時間',
  `FEEDBACK` VARCHAR(500) NULL COMMENT '意見內容',
  `REPLY_STATUS` INT DEFAULT 1 COMMENT '回覆狀態',
  `REPLY_CONTENT` VARCHAR(500) NULL COMMENT '回覆內容',
  `REPLY_TIME` DATE NULL COMMENT '回覆時間',
  PRIMARY KEY (`CASE_ID`),
  FOREIGN KEY (`MEMBER_ID`) REFERENCES `MEMBERS`(`MEMBER_ID`),
  FOREIGN KEY (`BUS_ID`) REFERENCES `BUS`(`BUS_ID`),
  FOREIGN KEY (`MER_ID`) REFERENCES `MER` (`MER_ID`),
  FOREIGN KEY (`ORDER_ID`) REFERENCES `ORDER`(`ORDER_ID`)
  ) COMMENT = '客服明細';

CREATE VIEW pet_g3db_tfa105.v_merimg_mer (IMG_ID, MER_ID, BUS_ID, MER_NAME,  MER_PIC, PRICE, STOCK, MAIN_CATEGORY, SUB_CATEGORY,DESCRIPTION)
AS SELECT i.IMG_ID, m.MER_ID, m.BUS_ID, m.NAME, i.MER_PIC, m.PRICE, m.STOCK, m.MAIN_CATEGORY, m.SUB_CATEGORY,m.DESCRIPTION
FROM MER_IMG i right join MER m on i.MER_ID = m.MER_ID;