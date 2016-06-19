# Host: 127.0.0.1  (Version: 5.5.40)
# Date: 2016-06-20 01:02:29
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
# Structure for table "address"
#

CREATE TABLE `address` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `memberid` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `prov` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `details` varchar(255) NOT NULL DEFAULT '',
  `zip` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `isDefault` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "banner"
#

CREATE TABLE `banner` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `bookid` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "book"
#

CREATE TABLE `book` (
  `id` varchar(255) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `name_cn` varchar(255) NOT NULL DEFAULT '',
  `introduction` varchar(255) NOT NULL DEFAULT '',
  `author` varchar(255) NOT NULL DEFAULT '',
  `publisher` varchar(255) NOT NULL DEFAULT '',
  `number` int(11) NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `time` date NOT NULL DEFAULT '0000-00-00',
  `level1` int(11) NOT NULL DEFAULT '0',
  `level2` int(11) NOT NULL DEFAULT '0',
  `sales` int(11) NOT NULL DEFAULT '0',
  `score` double NOT NULL DEFAULT '0',
  `discount` double NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "booktopic"
#

CREATE TABLE `booktopic` (
  `id` varchar(255) NOT NULL DEFAULT '0',
  `topicid` varchar(255) NOT NULL DEFAULT '',
  `bookid` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "cart"
#

CREATE TABLE `cart` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `memberid` varchar(255) NOT NULL DEFAULT '',
  `member` varchar(255) NOT NULL DEFAULT '',
  `number` int(11) NOT NULL DEFAULT '0',
  `total` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "cart_item"
#

CREATE TABLE `cart_item` (
  `id` varchar(255) NOT NULL DEFAULT '0',
  `cartid` varchar(255) NOT NULL DEFAULT '',
  `bookid` varchar(255) NOT NULL DEFAULT '',
  `book` varchar(255) NOT NULL DEFAULT '',
  `number` int(11) NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `total` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "comment"
#

CREATE TABLE `comment` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `bookid` varchar(255) NOT NULL DEFAULT '',
  `comment` varchar(3000) NOT NULL DEFAULT '',
  `att` int(11) NOT NULL DEFAULT '0',
  `time` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "member"
#

CREATE TABLE `member` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `nickname` varchar(255) NOT NULL DEFAULT '',
  `sex` varchar(255) DEFAULT '0',
  `age` int(11) NOT NULL DEFAULT '0',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `mail` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "order"
#

CREATE TABLE `order` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `memberid` varchar(255) NOT NULL DEFAULT '',
  `member` varchar(255) NOT NULL DEFAULT '',
  `addressid` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `number` int(11) NOT NULL DEFAULT '0',
  `total` double NOT NULL DEFAULT '0',
  `status` varchar(255) NOT NULL DEFAULT '',
  `time` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "order_item"
#

CREATE TABLE `order_item` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `orderid` varchar(255) NOT NULL DEFAULT '',
  `bookid` varchar(255) NOT NULL DEFAULT '',
  `book` varchar(255) NOT NULL DEFAULT '',
  `price` double NOT NULL DEFAULT '0',
  `number` int(11) NOT NULL DEFAULT '0',
  `total` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for table "topic"
#

CREATE TABLE `topic` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
