DROP TABLE IF EXISTS `<TABLE>`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `<TABLE>` (
  `ID` int(15) NOT NULL auto_increment,
  `MyKey` text,
  `Value` text,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
