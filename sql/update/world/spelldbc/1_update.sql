
INSERT IGNORE INTO `spelldbc` (SELECT * FROM `spelldbc_offi` WHERE type != 0);
