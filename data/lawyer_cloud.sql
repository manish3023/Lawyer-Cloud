/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.1.73-community : Database - lawyer_cloud
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`lawyer_cloud` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `lawyer_cloud`;

/*Table structure for table `area_tbl` */

DROP TABLE IF EXISTS `area_tbl`;

CREATE TABLE `area_tbl` (
  `AreaId` int(11) NOT NULL,
  `AreaName` varchar(255) DEFAULT NULL,
  `cityId` int(11) DEFAULT NULL,
  `stateId` int(11) DEFAULT NULL,
  PRIMARY KEY (`AreaId`),
  KEY `FKCB6AA90CFD50CA21` (`stateId`),
  KEY `FKCB6AA90C8619A21F` (`cityId`),
  CONSTRAINT `FKCB6AA90C8619A21F` FOREIGN KEY (`cityId`) REFERENCES `city_tbl` (`CityId`),
  CONSTRAINT `FKCB6AA90CFD50CA21` FOREIGN KEY (`stateId`) REFERENCES `state_tbl` (`StateId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `area_tbl` */

insert  into `area_tbl`(`AreaId`,`AreaName`,`cityId`,`stateId`) values (1,'Sarkhej',2,1),(2,'Juhapura',2,1),(3,'Paldi',2,1),(4,'Sahibaug',2,1),(5,'Mirzapur',2,1),(6,'Dahegam',1,1),(7,'Sector - 28',1,1),(8,'Kalol',1,1),(9,'Ajwa - Road',3,1),(10,'Tandalja',3,1),(11,'Chhani',3,1),(12,'Bardoli',4,1),(13,'Dhoraji',5,1),(14,'Gandhigram',5,1),(15,'GECM',6,1),(16,'Rampark',6,1),(17,'College Road',6,1),(18,'Hajira',6,1),(19,'Andheri',7,2),(20,'Badlapur',7,2),(21,'Bhiwandi',7,2),(22,'Churchgate',7,2),(23,'Colaba',7,2),(24,'Juhu',7,2),(25,'Mira Road',7,2),(26,'Dongri',7,2),(27,'Katraj',8,2),(28,'Jafar Nagar',9,2),(29,'Mumbra',10,2),(30,'Beavar',11,3),(31,'Pushkar',11,3),(32,'Diggi Baazar',11,3),(33,'Khwaja Moinuddin Chisti Dargah',11,3),(34,'Kalwar Road',12,3),(35,'Pataudi',13,4),(36,'Gazipur',14,4),(37,'Faridpur Road',15,4),(38,'Azad Nagar',16,5),(39,'Kolar Road',16,5),(40,'Mirza Road',17,5),(41,'Nizampet Road',18,5),(42,'Ibhrahim Bag',18,5),(43,'Bypass Road',19,6),(44,'Jhalaria',20,6),(45,'Islam Ganj',21,7),(46,'Panchkula',22,7),(47,'Khan Kot',23,7),(48,'Lahori Gate',24,7),(49,'Adil Nagar',25,8),(50,'Hussainabad',25,8),(51,'Allahabad Road',26,8),(52,'Indira Nagar',26,8),(53,'Kala Patther',27,8),(54,'ctm',2,1);

/*Table structure for table `category_tbl` */

DROP TABLE IF EXISTS `category_tbl`;

CREATE TABLE `category_tbl` (
  `CategoryId` int(11) NOT NULL,
  `CategoryName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `category_tbl` */

insert  into `category_tbl`(`CategoryId`,`CategoryName`) values (1,'Criminal'),(2,'Divorce'),(3,'Industrial'),(4,'Corporate'),(5,'Financial'),(6,'Accident'),(7,'Labour'),(8,'Land'),(9,'Family'),(10,'Service');

/*Table structure for table `city_tbl` */

DROP TABLE IF EXISTS `city_tbl`;

CREATE TABLE `city_tbl` (
  `CityId` int(11) NOT NULL,
  `CityName` varchar(255) DEFAULT NULL,
  `stateId` int(11) DEFAULT NULL,
  PRIMARY KEY (`CityId`),
  KEY `FKAB4ADAEAFD50CA21` (`stateId`),
  CONSTRAINT `FKAB4ADAEAFD50CA21` FOREIGN KEY (`stateId`) REFERENCES `state_tbl` (`StateId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `city_tbl` */

insert  into `city_tbl`(`CityId`,`CityName`,`stateId`) values (1,'Gandhinagar',1),(2,'Ahmedabad',1),(3,'Vadodara',1),(4,'Surat',1),(5,'Rajkot',1),(6,'Modasa',1),(7,'Mumbai',2),(8,'Pune',2),(9,'Nagpur',2),(10,'Thane',2),(11,'Ajmer',3),(12,'Jaipur',3),(13,'Gurgaon',4),(14,'Faridabad',4),(15,'Panipat',4),(16,'Bangalore',5),(17,'Mysore',5),(18,'Hyderabad',5),(19,'Bhopal',6),(20,'Indore',6),(21,'Ludhiana',7),(22,'Chandigarh',7),(23,'Amritsar',7),(24,'Patiala',7),(25,'Lucknow',8),(26,'Kanpur',8),(27,'Ghaziabad',8);

/*Table structure for table `clientregister_tbl` */

DROP TABLE IF EXISTS `clientregister_tbl`;

CREATE TABLE `clientregister_tbl` (
  `ClientRegisterId` int(11) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `MobileNumber` varchar(255) DEFAULT NULL,
  `stateId` int(11) DEFAULT NULL,
  `cityId` int(11) DEFAULT NULL,
  `areaId` int(11) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `loginId` int(11) DEFAULT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  `FilePath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ClientRegisterId`),
  KEY `FKC92B038D80358F63` (`areaId`),
  KEY `FKC92B038D84873D1` (`loginId`),
  KEY `FKC92B038DFD50CA21` (`stateId`),
  KEY `FKC92B038D8619A21F` (`cityId`),
  CONSTRAINT `FKC92B038D80358F63` FOREIGN KEY (`areaId`) REFERENCES `area_tbl` (`AreaId`),
  CONSTRAINT `FKC92B038D84873D1` FOREIGN KEY (`loginId`) REFERENCES `login_tbl` (`LoginId`),
  CONSTRAINT `FKC92B038D8619A21F` FOREIGN KEY (`cityId`) REFERENCES `city_tbl` (`CityId`),
  CONSTRAINT `FKC92B038DFD50CA21` FOREIGN KEY (`stateId`) REFERENCES `state_tbl` (`StateId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `clientregister_tbl` */

insert  into `clientregister_tbl`(`ClientRegisterId`,`FirstName`,`LastName`,`MobileNumber`,`stateId`,`cityId`,`areaId`,`Address`,`loginId`,`FileName`,`FilePath`) values (1,'Raj','Kanpurwala','7788990066',3,11,31,'505, Munjal flats',6,'img10.jpg','C:\\Users\\SAIYED\\LawyerCloud\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lawyerCloud\\doc\\'),(2,'Faizan','Saiyed','9976543456',1,2,2,'Saiyed Villa',8,'B612_20170308_150155.jpg','C:\\Users\\SAIYED\\LawyerCloud\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lawyerCloud\\doc\\'),(3,'Wasim','Abbasi','9807654897',3,12,34,'Main Bazaar',14,'img12.jpg','C:\\Users\\SAIYED\\LawyerCloud\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lawyerCloud\\doc\\'),(4,'Sahad','Shaikh','8907654356',2,7,26,'Charnull',15,'img8.jpg','C:\\Users\\SAIYED\\LawyerCloud\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lawyerCloud\\doc\\'),(5,'Parvez','Shaikh','8989098764',2,7,24,'303, Shaikh Appartment',18,'B612_20170310_115817.jpg','C:\\Users\\SAIYED\\LawyerCloud\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lawyerCloud\\doc\\'),(6,'Rehan','Nonsola','9898097865',5,18,41,'303, Ali appartments',19,'images.jpg','C:\\Users\\SAIYED\\LawyerCloud\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lawyerCloud\\doc\\');

/*Table structure for table `complain_tbl` */

DROP TABLE IF EXISTS `complain_tbl`;

CREATE TABLE `complain_tbl` (
  `ComplainId` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `ComplainSubject` varchar(255) DEFAULT NULL,
  `ComplainDescription` varchar(255) DEFAULT NULL,
  `ComplainDateAndTime` varchar(255) DEFAULT NULL,
  `ComplainStatus` varchar(255) DEFAULT NULL,
  `ReplyDescription` varchar(255) DEFAULT NULL,
  `complainFrom` int(11) DEFAULT NULL,
  `complainTo` int(11) DEFAULT NULL,
  `ToName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ComplainId`),
  KEY `FK1B57368D36146B1` (`complainTo`),
  KEY `FK1B57368F59949A0` (`complainFrom`),
  CONSTRAINT `FK1B57368D36146B1` FOREIGN KEY (`complainTo`) REFERENCES `login_tbl` (`LoginId`),
  CONSTRAINT `FK1B57368F59949A0` FOREIGN KEY (`complainFrom`) REFERENCES `login_tbl` (`LoginId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `complain_tbl` */

insert  into `complain_tbl`(`ComplainId`,`Name`,`ComplainSubject`,`ComplainDescription`,`ComplainDateAndTime`,`ComplainStatus`,`ReplyDescription`,`complainFrom`,`complainTo`,`ToName`) values (1,'Faizan Saiyed','Slow Loading','Kindly please check or maintain your site ','Mon Apr 09 22:55:59 IST 2018','Resolved','yeah sure i have updated',8,1,'Admin'),(6,'Faizan Saiyed','Request Processing','Kindly please review my request make sure its urgent','Mon Apr 09 23:16:21 IST 2018','Resolved','ohk',8,9,'Shaile Mehta'),(7,'Sahad Shaikh','About Lawyer','The lawyer which i have requested is not answering me fast plz make sure its urgent','Tue Apr 10 07:16:25 IST 2018','Resolved','ohk i am sending an mail to respected lawyer',15,1,'Admin'),(8,'Wasim Abbasi','Request Processing','Accept My Request Fast','Tue Apr 10 07:19:58 IST 2018','Resolved','yes i have studied your case and your case request is accepted',14,11,'Vyas Deep'),(9,'Faizan Saiyed','Fast','Plz reply me fast i wanna just want to take an advice about how to claim','Tue Apr 10 07:51:33 IST 2018','Pending',NULL,8,7,'Divya Singh'),(10,'Manishsingh Rajput','Loading','Please maintain the web pages vey slow loading','Tue Apr 10 10:54:45 IST 2018','Resolved','ohk thnx for discusswing with us kindly we will see it',17,1,'Admin'),(11,'Manishsingh Rajput','About Content','Please load more cities and areas','Tue Apr 10 13:24:50 IST 2018','Pending',NULL,17,1,'Admin'),(12,'Sahad Shaikh','Request Processing','Accept My Request Fast','Tue Apr 10 13:24:50 IST 2018','Pending',NULL,15,9,'Shaile Mehta'),(13,'Parvez Shaikh','Request Processing','sir plz reply for my request','Wed Apr 11 21:26:47 IST 2018','Pending',NULL,18,17,'Manishsingh Rajput');

/*Table structure for table `contactus_tbl` */

DROP TABLE IF EXISTS `contactus_tbl`;

CREATE TABLE `contactus_tbl` (
  `ContactUsId` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `MobileNumber` varchar(255) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ContactUsId`),
  KEY `FK5EBC0ABD524F3545` (`categoryId`),
  CONSTRAINT `FK5EBC0ABD524F3545` FOREIGN KEY (`categoryId`) REFERENCES `category_tbl` (`CategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `contactus_tbl` */

insert  into `contactus_tbl`(`ContactUsId`,`Name`,`Email`,`MobileNumber`,`categoryId`,`Description`) values (1,'Faizan','mohd.faizan1505@gmail.com','9898767656',3,'Please give me some guidance and guide me with your best laws.'),(2,'Anis','anisshaikh229@gmail.com','8768768744',6,'I want to hire particular respected lawyers for my so and so case'),(3,'shabaaz','shahbazp2526@gmail.com','8787578865',7,'sir kindly i want to share my case details so plz guide me'),(4,'shabaaz','shahbazp2526@gmail.com','7876875877',5,'sir as im new to this portal so what functionalities your portal provides i want to know');

/*Table structure for table `feedback_tbl` */

DROP TABLE IF EXISTS `feedback_tbl`;

CREATE TABLE `feedback_tbl` (
  `FeedbackId` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `FeedbackSubject` varchar(255) DEFAULT NULL,
  `FeedbackDescription` varchar(255) DEFAULT NULL,
  `FeedbackDateAndTime` varchar(255) DEFAULT NULL,
  `feedbackFrom` int(11) DEFAULT NULL,
  `feedbackTo` int(11) DEFAULT NULL,
  `ToName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FeedbackId`),
  KEY `FK992790048D0B663C` (`feedbackFrom`),
  KEY `FK992790041AA9DA4D` (`feedbackTo`),
  CONSTRAINT `FK992790041AA9DA4D` FOREIGN KEY (`feedbackTo`) REFERENCES `login_tbl` (`LoginId`),
  CONSTRAINT `FK992790048D0B663C` FOREIGN KEY (`feedbackFrom`) REFERENCES `login_tbl` (`LoginId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `feedback_tbl` */

insert  into `feedback_tbl`(`FeedbackId`,`Name`,`FeedbackSubject`,`FeedbackDescription`,`FeedbackDateAndTime`,`feedbackFrom`,`feedbackTo`,`ToName`) values (1,'Faizan Saiyed','Thanking You','Thanks for making this portal i have got my case cleared in an small amount of time','Mon Apr 09 22:57:07 IST 2018',8,1,'Admin'),(2,'Himanshu Hirpara','Positive View','This portals design is good','Tue Apr 10 07:21:36 IST 2018',16,1,'Admin'),(3,'Faizan Saiyed','Thanking You','Thnx for supporting me in my legal case','Tue Apr 10 07:55:40 IST 2018',8,7,'Divya Singh'),(4,'Manishsingh Rajput','Thanking You','Thankyou for desingning this portal i have got many clients from this portal','Tue Apr 10 10:55:45 IST 2018',17,1,'Admin');

/*Table structure for table `lawyerregister_tbl` */

DROP TABLE IF EXISTS `lawyerregister_tbl`;

CREATE TABLE `lawyerregister_tbl` (
  `LawyerRegisterId` int(11) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `MobileNumber` varchar(255) DEFAULT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  `FilePath` varchar(255) DEFAULT NULL,
  `stateId` int(11) DEFAULT NULL,
  `cityId` int(11) DEFAULT NULL,
  `areaId` int(11) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `subCategoryId` int(11) DEFAULT NULL,
  `Experience` varchar(255) DEFAULT NULL,
  `Qualification` varchar(255) DEFAULT NULL,
  `loginId` int(11) DEFAULT NULL,
  PRIMARY KEY (`LawyerRegisterId`),
  KEY `FKC84BB84680358F63` (`areaId`),
  KEY `FKC84BB84684873D1` (`loginId`),
  KEY `FKC84BB846FD50CA21` (`stateId`),
  KEY `FKC84BB846A9C278DB` (`subCategoryId`),
  KEY `FKC84BB8468619A21F` (`cityId`),
  KEY `FKC84BB846524F3545` (`categoryId`),
  CONSTRAINT `FKC84BB846524F3545` FOREIGN KEY (`categoryId`) REFERENCES `category_tbl` (`CategoryId`),
  CONSTRAINT `FKC84BB84680358F63` FOREIGN KEY (`areaId`) REFERENCES `area_tbl` (`AreaId`),
  CONSTRAINT `FKC84BB84684873D1` FOREIGN KEY (`loginId`) REFERENCES `login_tbl` (`LoginId`),
  CONSTRAINT `FKC84BB8468619A21F` FOREIGN KEY (`cityId`) REFERENCES `city_tbl` (`CityId`),
  CONSTRAINT `FKC84BB846A9C278DB` FOREIGN KEY (`subCategoryId`) REFERENCES `subcategory_tbl` (`SubCategoryId`),
  CONSTRAINT `FKC84BB846FD50CA21` FOREIGN KEY (`stateId`) REFERENCES `state_tbl` (`StateId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `lawyerregister_tbl` */

insert  into `lawyerregister_tbl`(`LawyerRegisterId`,`FirstName`,`LastName`,`MobileNumber`,`FileName`,`FilePath`,`stateId`,`cityId`,`areaId`,`Address`,`categoryId`,`subCategoryId`,`Experience`,`Qualification`,`loginId`) values (3,'Farah','Faiz','7800006654','advocate-farha-faiz-825.jpg','C:\\Users\\SAIYED\\LawyerCloud\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lawyerCloud\\doc\\',2,7,19,'Andheri West Main Bazaar',3,21,'7','LLB',4),(4,'Divya','Singh','9898767645','Divya-Singh_img2.jpg','C:\\Users\\SAIYED\\LawyerCloud\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lawyerCloud\\doc\\',4,14,36,'Main Bazaar',5,26,'3','LLB',7),(5,'Shaile','Mehta','8675643890','SUDHIR-M-MEHTA-SHAILEE-S-MEHTA-SUDHIR-MEHTA-CO-ADVOCATES-GUJARAT-HIGH-COURT_3443_image_img9.jpg','C:\\Users\\SAIYED\\LawyerCloud\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lawyerCloud\\doc\\',2,9,28,'Tilak Appartment',7,7,'6','LLM',9),(6,'Shahid','Azmi','9876546763','Shahid_Azmi.jpg','C:\\Users\\SAIYED\\LawyerCloud\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lawyerCloud\\doc\\',8,25,49,'Main Bazaar',3,22,'6','LLM',10),(7,'Vyas','Deep','7680987653','img3.jpg','C:\\Users\\SAIYED\\LawyerCloud\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lawyerCloud\\doc\\',6,19,43,'102, Dhaval Arcade',4,24,'10','LLM',11),(8,'Karansinh','Vaghela','7865463322','Karansinh_B_Vaghela_img10.jpg','C:\\Users\\SAIYED\\LawyerCloud\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lawyerCloud\\doc\\',1,5,14,'Sakan Twins',10,15,'8','LLM',12),(9,'Pandit','Parth','7659084322','img14.jpg','C:\\Users\\SAIYED\\LawyerCloud\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lawyerCloud\\doc\\',2,10,29,'105, Main Highway',9,5,'15','Barrister',13),(10,'Manishsingh','Rajput','7876545679','manish.jpg','C:\\Users\\SAIYED\\LawyerCloud\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lawyerCloud\\doc\\',1,2,4,'Main Road',1,4,'3','LLB',17),(11,'S','Ramayan','7687568909','images (1).jpg','C:\\Users\\SAIYED\\LawyerCloud\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lawyerCloud\\doc\\',3,11,32,'Main Bazaar',3,21,'12','LLM',20),(12,'Justice','Pasha','7865744890','justice-pasha.jpg','C:\\Users\\SAIYED\\LawyerCloud\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lawyerCloud\\doc\\',6,20,44,'407, Sakan Twins',4,24,'10','LLM',21);

/*Table structure for table `login_tbl` */

DROP TABLE IF EXISTS `login_tbl`;

CREATE TABLE `login_tbl` (
  `LoginId` int(11) NOT NULL,
  `EmailAdderss` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`LoginId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login_tbl` */

insert  into `login_tbl`(`LoginId`,`EmailAdderss`,`Password`,`Role`) values (1,'lawyercloud10298@gmail.com','lawyercloud@10298','admin'),(3,'khalidshaikh@gmail.com','khalidshaikh','Lawyer'),(4,'farahfaiz@gmail.com','farahfaiz','Lawyer'),(6,'rajkanpurwala@gmail.com','rajkanpurwala','Client'),(7,'divyasingh@gmail.com','divyasingh','Lawyer'),(8,'mohd.faizan1505@gmail.com','mf','Client'),(9,'shailemehta@gmail.com','shailemehta','Lawyer'),(10,'shahidazmi@gmail.com','shahidazmi','Lawyer'),(11,'vyasdeep@gmail.com','vyasdeep','Lawyer'),(12,'karansinhvaghela@gmail.com','karansinhvaghela','Lawyer'),(13,'panditparth@gmail.com','panditparth','Lawyer'),(14,'wasimabbasi@gmail.com','wasimabbasi','Client'),(15,'sahadshaikh@gmail.com','sahadshaikh','Client'),(16,'himanshuhirpara@gmail.com','himanshuhirpara','Client'),(17,'manishsinghrajput874@gmail.com','Manish@8907','Lawyer'),(18,'shaikhparvez.123786@gmail.com','parvezshaikh','Client'),(19,'rehannonsola@gmail.com','rehannonsola','Client'),(20,'sramayan@gmail.com','sramayan','Lawyer'),(21,'justicepasha@gmail.com','justicepasha','Lawyer');

/*Table structure for table `requestlawyer_tbl` */

DROP TABLE IF EXISTS `requestlawyer_tbl`;

CREATE TABLE `requestlawyer_tbl` (
  `RequestLawyerId` int(11) NOT NULL,
  `lawyerId` int(11) DEFAULT NULL,
  `ClientId` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `ClientContactNumber` varchar(255) DEFAULT NULL,
  `RequestDescription` varchar(255) DEFAULT NULL,
  `RequestDateAndTime` varchar(255) DEFAULT NULL,
  `RequestStatus` varchar(255) DEFAULT NULL,
  `RequestReplyDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RequestLawyerId`),
  KEY `FK858EAAF22A05E7B3` (`ClientId`),
  KEY `FK858EAAF2AAF1294` (`lawyerId`),
  KEY `FK858EAAF2524F3545` (`categoryId`),
  CONSTRAINT `FK858EAAF22A05E7B3` FOREIGN KEY (`ClientId`) REFERENCES `login_tbl` (`LoginId`),
  CONSTRAINT `FK858EAAF2524F3545` FOREIGN KEY (`categoryId`) REFERENCES `category_tbl` (`CategoryId`),
  CONSTRAINT `FK858EAAF2AAF1294` FOREIGN KEY (`lawyerId`) REFERENCES `lawyerregister_tbl` (`LawyerRegisterId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `requestlawyer_tbl` */

insert  into `requestlawyer_tbl`(`RequestLawyerId`,`lawyerId`,`ClientId`,`categoryId`,`ClientContactNumber`,`RequestDescription`,`RequestDateAndTime`,`RequestStatus`,`RequestReplyDescription`) values (2,5,8,7,'7898765678','i want to discuss my case urgently','Mon Apr 09 23:15:53 IST 2018','Pending',NULL),(3,4,15,5,'7689756444','I am indulged in an financial case i had bought an car with an down payment of rs 4 lakh and i have an issue with the company please contact me its urgent','Tue Apr 10 07:15:20 IST 2018','Pending',NULL),(4,7,14,4,'7896547679','i have an issue going on with an company named Agro Textile Company regarding my tender','Tue Apr 10 07:18:40 IST 2018','Pending',NULL),(5,10,16,1,'8909089087','Hello sir at my office an attempt of robbery is done by some peoples staying at Gujarat so can we meet for this case.','Tue Apr 10 07:31:01 IST 2018','Accepted','Yeah sure i will handle your case further more i am sending my details structure through an email so thanking you for contacting me'),(6,8,8,10,'9898987676','Sir my neighbour working on Silverwing Private IT company has an issue of the contract signed which includes a bond of 2 years so kindly plz accept my neighbours case its urgent','Tue Apr 10 07:42:15 IST 2018','Pending',NULL),(7,9,8,9,'8767656435','Respected sir i am an agent staying at Ahmedabad, sir my friend who is married have to discuss his current situations with you and has attemted an divorce case so plz reply me as soon as possible so we can meet ','Tue Apr 10 07:44:59 IST 2018','Pending',NULL),(8,5,8,7,'8798766765','There is one more case regarding the aggrements signed by my friend at Iffko Tokio company for the post of worker ','Tue Apr 10 07:47:47 IST 2018','Pending',NULL),(9,4,8,5,'9898767656','What is the procedure to claim the money which was invested to the company named Dheera Investment which nowadays is irresponsible of the investmnet','Tue Apr 10 07:50:31 IST 2018','Accepted','kindly send me full description on my mail id'),(10,10,14,1,'9898765656','I have been charge for a criminal case under bank scams which is totally false because at the time of taking loan it was mentioned clearly that the period is under 15 years but now the bank is indulging me in an false case plz handle my case','Tue Apr 10 08:02:39 IST 2018','Rejected','sorry, but for for next few months my schedule is very hectic and i already have a lot of clients so i am sorry please consult another lawyer.'),(11,4,14,5,'9890987678','Financial case is drawn for me as an bank scams which is totally false so for further details plz contact me','Tue Apr 10 08:04:09 IST 2018','Pending',NULL),(12,10,8,1,'8306020181','Sir i have been entrapped into a fake case i want to consult you','Tue Apr 10 17:59:47 IST 2018','Pending',NULL),(13,8,8,10,'7876878598','sir i want an legal advise for my case so plz kindly mean it','Wed Apr 11 21:02:28 IST 2018','Pending',NULL),(14,10,18,1,'9098787670','sir i nhave been indulged in so and so case plz guide me','Wed Apr 11 21:24:30 IST 2018','Pending',NULL),(15,9,19,9,'9898098987','sir im indulged in one case so plz i want to hire my case to you plz guide me','Fri Apr 13 09:19:08 IST 2018','Pending',NULL),(16,11,8,3,'7878659806','sir i am indulged in new industrial case kindly please help and guide me in an positive path','Fri Apr 13 09:34:38 IST 2018','Pending',NULL);

/*Table structure for table `state_tbl` */

DROP TABLE IF EXISTS `state_tbl`;

CREATE TABLE `state_tbl` (
  `StateId` int(11) NOT NULL,
  `StateName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`StateId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `state_tbl` */

insert  into `state_tbl`(`StateId`,`StateName`) values (1,'Gujarat'),(2,'Maharashtra'),(3,'Rajasthan'),(4,'Haryana'),(5,'Karnataka'),(6,'Madhya Pradesh'),(7,'Punjab'),(8,'Uttar Pradesh');

/*Table structure for table `subcategory_tbl` */

DROP TABLE IF EXISTS `subcategory_tbl`;

CREATE TABLE `subcategory_tbl` (
  `SubCategoryId` int(11) NOT NULL,
  `SubCategoryName` varchar(255) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`SubCategoryId`),
  KEY `FK94EAF5D524F3545` (`categoryId`),
  CONSTRAINT `FK94EAF5D524F3545` FOREIGN KEY (`categoryId`) REFERENCES `category_tbl` (`CategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `subcategory_tbl` */

insert  into `subcategory_tbl`(`SubCategoryId`,`SubCategoryName`,`categoryId`) values (4,'Loot',1),(5,'Divorce',9),(6,'Child Custody',9),(7,'Bonus',7),(8,'Trade Union',7),(9,'Condition of Service',7),(10,'Land Acquistion',8),(11,'Acquisition for defence purpose',8),(12,'Transfer of Land',8),(13,'Agricultural Land Ceiling',8),(14,'Retiral Benefits',10),(15,'Suspension',10),(16,'Promotion',10),(17,'Temporary Appointments',10),(18,'No Fault Divorce',2),(19,'Matrimonial Causes Act',2),(20,'Legal Seperation',2),(21,'Child Labour',3),(22,'Caste Disabilities',3),(23,'Cooperative',4),(24,'Family Owned Business',4),(25,'Public Sector Undertaking',4),(26,'Budget Management',5),(27,'Contract Act',5),(28,'General Damages',6),(29,'Medication',6),(30,'Cost of Rehabilitation',6),(31,'Sexual Harrasment',1),(32,'Murder',1),(33,'Robbery',1),(34,'Bank Scams',1),(35,'Kidnapping',1);

/*Table structure for table `testimonial_tbl` */

DROP TABLE IF EXISTS `testimonial_tbl`;

CREATE TABLE `testimonial_tbl` (
  `TestimonialId` int(11) NOT NULL,
  `testimonialDescription` varchar(255) DEFAULT NULL,
  `TestimonialDateAndTime` varchar(255) DEFAULT NULL,
  `TestimonialStatus` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `loginId` int(11) DEFAULT NULL,
  PRIMARY KEY (`TestimonialId`),
  KEY `FKD4DAAC1E84873D1` (`loginId`),
  CONSTRAINT `FKD4DAAC1E84873D1` FOREIGN KEY (`loginId`) REFERENCES `login_tbl` (`LoginId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `testimonial_tbl` */

insert  into `testimonial_tbl`(`TestimonialId`,`testimonialDescription`,`TestimonialDateAndTime`,`TestimonialStatus`,`Name`,`loginId`) values (1,'As this portal is cool and has good functionalities as email notification, its good working with your portal thanking you','Mon Apr 09 22:59:27 IST 2018','Pending','Faizan Saiyed',8),(2,'I want guidelines from an Family lawyer about my case ','Tue Apr 10 07:22:31 IST 2018','Pending','Himanshu Hirpara',16),(3,'This portal is good to find lawyers instantly','Tue Apr 10 07:31:46 IST 2018','Pending','Himanshu Hirpara',16);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
