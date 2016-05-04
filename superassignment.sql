# Host: 127.0.0.1  (Version: 5.5.40)
# Date: 2016-05-05 00:58:22
# Generator: MySQL-Front 5.3  (Build 4.120)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "account"
#

CREATE TABLE `account` (
  `id` varchar(255) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `account` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "bankcard"
#

CREATE TABLE `bankcard` (
  `id` varchar(255) NOT NULL DEFAULT '0',
  `money` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "clerk"
#

CREATE TABLE `clerk` (
  `id` varchar(255) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `sex` varchar(255) NOT NULL DEFAULT '',
  `storeid` varchar(255) NOT NULL DEFAULT '',
  `store` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "consumption"
#

CREATE TABLE `consumption` (
  `id` varchar(255) NOT NULL DEFAULT '0',
  `memberid` varchar(255) DEFAULT NULL,
  `storeid` varchar(255) NOT NULL DEFAULT '0',
  `productid` varchar(255) NOT NULL DEFAULT '',
  `member` varchar(255) DEFAULT NULL,
  `store` varchar(255) NOT NULL DEFAULT '',
  `product` varchar(255) NOT NULL DEFAULT '',
  `price` double NOT NULL DEFAULT '0',
  `discountprice` double NOT NULL DEFAULT '0',
  `number` int(11) NOT NULL DEFAULT '0',
  `total` double NOT NULL DEFAULT '0',
  `status` varchar(255) NOT NULL DEFAULT '',
  `time` date NOT NULL DEFAULT '0000-00-00',
  `stockid` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "member"
#

CREATE TABLE `member` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `sex` varchar(255) DEFAULT '0',
  `age` int(11) NOT NULL DEFAULT '0',
  `address` varchar(255) DEFAULT '',
  `point` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `discount` double NOT NULL DEFAULT '1',
  `money` double NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `valid` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "payment"
#

CREATE TABLE `payment` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `memberid` varchar(255) NOT NULL DEFAULT '',
  `member` varchar(255) NOT NULL DEFAULT '',
  `cardid` varchar(255) NOT NULL DEFAULT '',
  `money` int(11) NOT NULL DEFAULT '0',
  `time` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "plan"
#

CREATE TABLE `plan` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `storeid` varchar(255) NOT NULL DEFAULT '',
  `store` varchar(255) NOT NULL DEFAULT '',
  `start` date NOT NULL DEFAULT '0000-00-00',
  `end` date NOT NULL DEFAULT '0000-00-00',
  `status` varchar(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "plan_item"
#

CREATE TABLE `plan_item` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `planid` varchar(255) NOT NULL DEFAULT '',
  `productid` varchar(255) DEFAULT '',
  `product` varchar(255) NOT NULL DEFAULT '',
  `number` int(11) NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "product"
#

CREATE TABLE `product` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "stock"
#

CREATE TABLE `stock` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `storeid` varchar(255) NOT NULL DEFAULT '',
  `store` varchar(255) NOT NULL DEFAULT '',
  `productid` varchar(255) NOT NULL DEFAULT '',
  `product` varchar(255) NOT NULL DEFAULT '',
  `start` date NOT NULL DEFAULT '0000-00-00',
  `end` date NOT NULL DEFAULT '0000-00-00',
  `number` int(11) NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Structure for table "store"
#

CREATE TABLE `store` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `place` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
