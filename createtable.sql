CREATE TABLE cities (
  `country_code` varchar(10) DEFAULT NULL,
  `region` varchar(256) DEFAULT NULL,
  `population` int(10) unsigned DEFAULT NULL,
  `latitude` varchar(256) DEFAULT NULL,
  `longitude` varchar(256) DEFAULT NULL,
  `combined` varchar(256) DEFAULT NULL,
  KEY `combined` (`combined`)
)Engine=InnoDB;