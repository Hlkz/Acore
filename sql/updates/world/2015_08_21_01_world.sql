DELETE FROM `command` WHERE `name` = 'debug loadcells';
INSERT INTO `command` (`name`, `security`, `help`) VALUES ('debug loadcells', 4, 'Syntax: .debug loadcells [mapId]\nLoads all cells for debugging purposes');
