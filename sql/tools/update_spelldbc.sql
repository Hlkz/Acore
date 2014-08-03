
DELETE FROM `spelldbc`;
INSERT INTO `spelldbc` (SELECT * FROM `spelldbc_offi`);
DELETE FROM `spelldbc` WHERE `type` = 0;
