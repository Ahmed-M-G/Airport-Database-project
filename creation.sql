-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema airport
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema airport
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `airport` DEFAULT CHARACTER SET utf8 ;
USE `airport` ;

-- -----------------------------------------------------
-- Table `airport`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airport`.`person` ;

CREATE TABLE IF NOT EXISTS `airport`.`person` (
  `fname` VARCHAR(15) NULL,
  `lname` VARCHAR(15) NULL,
  `sex` VARCHAR(45) NULL,
  `address` VARCHAR(55) NULL,
  `BDate` DATE NULL,
  `ID` INT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airport`.`phone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airport`.`phone` ;

CREATE TABLE IF NOT EXISTS `airport`.`phone` (
  `phone` INT NOT NULL,
  `person_ID` INT NOT NULL,
  INDEX `fk_phone_person_idx` (`person_ID` ASC),
  PRIMARY KEY (`person_ID`, `phone`),
  CONSTRAINT `fk_phone_person`
    FOREIGN KEY (`person_ID`)
    REFERENCES `airport`.`person` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airport`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airport`.`employee` ;

CREATE TABLE IF NOT EXISTS `airport`.`employee` (
  `job` VARCHAR(20) NULL,
  `salary` FLOAT NULL,
  `ID` INT NOT NULL,
  INDEX `fk_employee_person1_idx` (`ID` ASC),
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_employee_person1`
    FOREIGN KEY (`ID`)
    REFERENCES `airport`.`person` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airport`.`passenger`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airport`.`passenger` ;

CREATE TABLE IF NOT EXISTS `airport`.`passenger` (
  `e-mail` VARCHAR(25) NULL,
  `ID` INT NOT NULL,
  INDEX `fk_passenger_person1_idx` (`ID` ASC),
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_passenger_person1`
    FOREIGN KEY (`ID`)
    REFERENCES `airport`.`person` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airport`.`dependant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airport`.`dependant` ;

CREATE TABLE IF NOT EXISTS `airport`.`dependant` (
  `dname` VARCHAR(15) NOT NULL,
  `sex` VARCHAR(50) NULL,
  `BDate` DATE NULL,
  `relation` VARCHAR(20) NULL,
  `employee_ID` INT NOT NULL,
  INDEX `fk_dependant_employee1_idx` (`employee_ID` ASC),
  PRIMARY KEY (`employee_ID`, `dname`),
  CONSTRAINT `fk_dependant_employee1`
    FOREIGN KEY (`employee_ID`)
    REFERENCES `airport`.`employee` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airport`.`plane`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airport`.`plane` ;

CREATE TABLE IF NOT EXISTS `airport`.`plane` (
  `p_no` VARCHAR(50) NOT NULL,
  `capacity` INT NULL,
  `wieght` FLOAT NULL,
  `type` VARCHAR(45) NULL,
  PRIMARY KEY (`p_no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airport`.`flight`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airport`.`flight` ;

CREATE TABLE IF NOT EXISTS `airport`.`flight` (
  `f_no` VARCHAR(20) NOT NULL,
  `f_name` VARCHAR(20) NULL,
  `plane_p_no` VARCHAR(20) NOT NULL,
  `date` VARCHAR(45) NULL,
  PRIMARY KEY (`f_no`),
  INDEX `fk_flight_plane1_idx` (`plane_p_no` ASC),
  CONSTRAINT `fk_flight_plane1`
    FOREIGN KEY (`plane_p_no`)
    REFERENCES `airport`.`plane` (`p_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airport`.`Ticket`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airport`.`Ticket` ;

CREATE TABLE IF NOT EXISTS `airport`.`Ticket` (
  `price` FLOAT NULL,
  `degree` VARCHAR(20) NULL,
  `t_NO` INT NOT NULL,
  `flight_f_no` VARCHAR(20) NOT NULL,
  `passenger_ID` INT NOT NULL,
  `type_booking` VARCHAR(45) NULL,
  `from` VARCHAR(45) NULL,
  `to` VARCHAR(45) NULL,
  `Date_leave` VARCHAR(40) NULL,
  `Date_back` VARCHAR(40) NULL,
  PRIMARY KEY (`t_NO`),
  INDEX `fk_Ticket_passenger1_idx` (`passenger_ID` ASC),
  INDEX `fk_Ticket_flight1_idx` (`flight_f_no` ASC),
  CONSTRAINT `fk_Ticket_flight1`
    FOREIGN KEY (`flight_f_no`)
    REFERENCES `airport`.`flight` (`f_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ticket_passenger1`
    FOREIGN KEY (`passenger_ID`)
    REFERENCES `airport`.`passenger` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airport`.`works_on`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airport`.`works_on` ;

CREATE TABLE IF NOT EXISTS `airport`.`works_on` (
  `employee_ID` INT NOT NULL,
  `flight_f_no` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`employee_ID`, `flight_f_no`),
  INDEX `fk_employee_has_flight_flight1_idx` (`flight_f_no` ASC),
  INDEX `fk_employee_has_flight_employee1_idx` (`employee_ID` ASC),
  CONSTRAINT `fk_employee_has_flight_employee1`
    FOREIGN KEY (`employee_ID`)
    REFERENCES `airport`.`employee` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_flight_flight1`
    FOREIGN KEY (`flight_f_no`)
    REFERENCES `airport`.`flight` (`f_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `airport`.`person`
-- -----------------------------------------------------
START TRANSACTION;
USE `airport`;
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('john', 'Bader', 'm', '234 West 42nd Street', '1983-09-22', 123454326);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('Alex', 'ram', 'm', '1335 Avenue of the Americas', '1980-07-11', 123214778);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('Emeli', 'Deen', 'f', '102 West 57th Street', '1979-11-09', 321445325);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('Doom', 'Arsen', 'm', '304 East 42nd Street', '1982-08-22', 312423543);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('Ali', 'Smith', 'm', '243 Hosyoun 24nd street', '1984-12-05', 462365122);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('Mohamed', 'Zain', 'm', '342 Jofdohn 25nd street', '1999-07-24', 712687688);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('Sara', 'Ali', 'f', '556 grafword 65nd street', '1987-05-22', 675765757);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('Kavin', 'Doom', 'm', '675 gtasteen 22nd street', '1991-09-17', 126876888);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('Samer', 'John', 'm', '32 sersses 33nd street', '1970-04-10', 126576577);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('Tony', 'Lahm', 'm', 'sesone 66nd street', '1987-09-02', 123123123);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('Mickle', 'Towm', 'm', '22 aman 16nd street', '1979-09-08', 655327517);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('Orozco', 'Green', 'm', 'lama 44 cave 17nd strret', '1980-08-24', 232433657);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('Rose', 'Wood', 'f', '21 orozco 44nd street', '1976-06-27', 123123546);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('Sara', 'Bradley', 'f', 'sdeem 12-33nd street', '1980-08-14', 897897654);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('angeline', 'Beckerman', 'f', 'jampay 21nd street', '1979-12-22', 121233398);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('foog 1', 'bamm', 'm', 'sadedsa 12nd street', '1987-04-04', 987238912);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('seven', 'dam', 'm', '891-gamp street', '1970-09-22', 871265217);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('gamila', 'adam', 'f', '765-stream 22nd street', '1980-09-15', 678681929);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('hany ', 'cajole', 'm', '821-kalamn 12nd street', '1988-07-22', 123907980);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('kalow', 'seman', 'f', '78 grand street', '1977-02-29', 980128733);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('seman ', 'bow', 'f', '88 albs 22nd street', '1987-08-22', 190123809);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('tony ', 'baoul', 'm', '279 kalama street', '1986-12-11', 218379131);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('jomana', 'sam', 'f', '121 kalama street', '1999-12-10', 219879173);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('kareem', 'adam', 'm', '891-gamp street', '1980-10-11', 191287312);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('samo', 'ram', 'm', '31 gampol street', '1972-11-19', 123124888);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('ali', 'asam', 'm', '12 kama street', '1988-11-12 ', 213686193);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('sara', 'damm', 'f', '25 kama street', '1980-11-18', 123186287);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('tom', 'geen', 'm', '121 kalama street', '1977-09-06', 768132961);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('ramy', 'thom', 'm', '88 albs 22nd street', '1992-07-22', 978012832);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('kameen', 'thoral', 'm', '31 gampol street', '1992-09-12', 129703812);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('samy', 'ramm', 'm', 'sadedsa 12nd street', '1998-02-12', 918203792);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('koma', 'fhog', 'f', '21 orozco 44nd street', '1980-12-09', 293078234);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('reem', 'dann', 'f', '32 sersses 33nd street', '1987-11-19', 190283123);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('seman', 'beem', 'f', '32 sersses 33nd street', '1987-08-09', 879123123);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('korol', 'looff', 'm', '556 grafword 65nd street', '1978-09-08', 171239873);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('mickel', 'sam', 'm', '102 West 57th Street', '1988-07-22', 128937098);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('kolam', 'jhon', 'm', '675 gtasteen 22nd street', '1978-02-22', 298361273);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('feeb', 'dam', 'm', '304 East 42nd Street', '1992-10-11', 123712538);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('ghoman', 'alam', 'm', '102 West 57th Street', '1988-10-18', 987981237);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('seven', 'gooma', 'm', '675 gtasteen 22nd street', '1978-12-22', 891729898);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('tnoma', 'seev', 'f', '12 kama street', '1988-10-28', 897123989);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('sevan', 'ramam', 'm', 'sesone 66nd street', '1999-12-10', 219371246);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('soma', 'depan', 'f', '765-stream 22nd street', '1988-07-22', 298374290);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('flep', 'deinan', 'm', '102 West 57th Street', '1978-02-22', 324720747);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('roma', 'ivann', 'f', '21 orozco 44nd street', '1977-09-06', 723470327);
INSERT INTO `airport`.`person` (`fname`, `lname`, `sex`, `address`, `BDate`, `ID`) VALUES ('deep', 'staven', 'm', '31 gampol street', '1970-12-31', 123789072);

COMMIT;


-- -----------------------------------------------------
-- Data for table `airport`.`phone`
-- -----------------------------------------------------
START TRANSACTION;
USE `airport`;
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0142589752, 123454326);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0128534712, 123454326);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0123621534, 123214778);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0123761234, 123214778);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0236172432, 321445325);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0875127833, 312423543);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0123786128, 462365122);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0162351263, 712687688);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0261835748, 712687688);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0652364125, 987238912 );
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0725376687, 871265217);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0761237789, 678681929);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0123656878, 678681929);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0127356788, 123907980);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0253765189, 980128733);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0756243578, 190123809);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0576453799, 218379131);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0235761577, 219879173);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0875273578, 191287312);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0872563879, 918203792);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0128316381, 293078234);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0128736871, 293078234);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0198723687, 190283123);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0128963133, 879123123);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0123987682, 171239873);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0981736878, 128937098);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0812739883, 128937098);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0921863981, 298361273);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0129873912, 298361273);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0129379122, 123712538);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0128379128, 123712538);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0918237979, 987981237);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0129837862, 891729898);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0912873992, 675765757);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0982173621, 126876888);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0921735632, 126576577);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0129837902, 123123123);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0981273988, 655327517);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0192378912, 232433657 );
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0192839012, 123123546);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0982173123, 897897654);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0129873093, 121233398);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0982173900, 123124888 );
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0981273090, 213686193);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0012937809, 123186287);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0218937912, 768132961);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0928739183, 978012832);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0082739182, 978012832);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0912830992, 129703812);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0981273987, 129703812);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0982173987, 897123989);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0981273987, 897123989);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0897213097, 219371246);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0998263828, 219371246);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0298799123, 298374290);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0892739879, 324720747);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0982378279, 723470327);
INSERT INTO `airport`.`phone` (`phone`, `person_ID`) VALUES (0876757298, 123789072);

COMMIT;


-- -----------------------------------------------------
-- Data for table `airport`.`employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `airport`;
INSERT INTO `airport`.`employee` (`job`, `salary`, `ID`) VALUES ('pilot', 40000, 675765757);
INSERT INTO `airport`.`employee` (`job`, `salary`, `ID`) VALUES ('pilot', 40000, 126876888);
INSERT INTO `airport`.`employee` (`job`, `salary`, `ID`) VALUES ('pilot', 40000, 126576577);
INSERT INTO `airport`.`employee` (`job`, `salary`, `ID`) VALUES ('pilot', 40000, 123123123);
INSERT INTO `airport`.`employee` (`job`, `salary`, `ID`) VALUES ('air host', 12000, 655327517);
INSERT INTO `airport`.`employee` (`job`, `salary`, `ID`) VALUES ('air host', 12000, 232433657);
INSERT INTO `airport`.`employee` (`job`, `salary`, `ID`) VALUES ('air host', 12000, 123123546);
INSERT INTO `airport`.`employee` (`job`, `salary`, `ID`) VALUES ('air host', 12000, 897897654);
INSERT INTO `airport`.`employee` (`job`, `salary`, `ID`) VALUES ('co-pilot', 30000, 121233398);
INSERT INTO `airport`.`employee` (`job`, `salary`, `ID`) VALUES ('co-pilot', 30000, 123124888 );
INSERT INTO `airport`.`employee` (`job`, `salary`, `ID`) VALUES ('co-pilot', 30000, 213686193);
INSERT INTO `airport`.`employee` (`job`, `salary`, `ID`) VALUES ('co-pilot', 30000, 123186287);
INSERT INTO `airport`.`employee` (`job`, `salary`, `ID`) VALUES ('secretary', 6000, 768132961);
INSERT INTO `airport`.`employee` (`job`, `salary`, `ID`) VALUES ('secretary', 6000, 978012832);
INSERT INTO `airport`.`employee` (`job`, `salary`, `ID`) VALUES ('secretary', 6000, 129703812);
INSERT INTO `airport`.`employee` (`job`, `salary`, `ID`) VALUES ('elctronics', 25000, 897123989);
INSERT INTO `airport`.`employee` (`job`, `salary`, `ID`) VALUES ('elctronics', 25000, 219371246);
INSERT INTO `airport`.`employee` (`job`, `salary`, `ID`) VALUES ('mechanic engineer', 29000, 298374290);
INSERT INTO `airport`.`employee` (`job`, `salary`, `ID`) VALUES ('mechanic engineer', 29000, 324720747);
INSERT INTO `airport`.`employee` (`job`, `salary`, `ID`) VALUES ('flight engineer', 35000, 723470327);
INSERT INTO `airport`.`employee` (`job`, `salary`, `ID`) VALUES ('flight engineer', 35000, 123789072);

COMMIT;


-- -----------------------------------------------------
-- Data for table `airport`.`passenger`
-- -----------------------------------------------------
START TRANSACTION;
USE `airport`;
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('msad_22@gmail.com', 123454326);
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('asda22@yahoo.com', 123214778);
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('sadqw22@gmail.com', 321445325);
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('sadjj@gmail.com', 312423543);
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('sadddg@gmail.com', 462365122);
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('ssdssd22@gmail.com', 712687688);
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('jsdyhjasd@gmail.com', 987238912 );
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('vashgdjv@gmail.com', 871265217);
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('bahdsgjhsadg@gmail.com', 678681929);
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('vasdfhjadsf@gmail.com', 123907980);
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('ajsgdjsa@gmail.com', 980128733);
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('hjasgdjasdh@gmail.com', 190123809);
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('asdghhgsda@gmail.com', 218379131);
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('asdgajdhg@gmail.com', 219879173);
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('asdjgajdhg@gmail.com', 191287312);
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('asfhfsad@gmail.com', 918203792);
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('asgdfhjafd@gmail.com', 293078234);
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('asjdgsahfd@gmail.com', 190283123);
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('asklhdjasghdf@gmail.com', 879123123);
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('asdhajdg@gmail.com', 171239873);
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('asdhasjd@gmail.com', 128937098);
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('askhdkajd@gmail.com', 298361273);
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('asdjhkjadg@gmail.com', 123712538);
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('lkasjlpoad@gmail.com', 987981237);
INSERT INTO `airport`.`passenger` (`e-mail`, `ID`) VALUES ('ayudiasdo@gmail.com', 891729898);

COMMIT;


-- -----------------------------------------------------
-- Data for table `airport`.`dependant`
-- -----------------------------------------------------
START TRANSACTION;
USE `airport`;
INSERT INTO `airport`.`dependant` (`dname`, `sex`, `BDate`, `relation`, `employee_ID`) VALUES ('bradley', 'male', '1997-08-19', 'son', 675765757);
INSERT INTO `airport`.`dependant` (`dname`, `sex`, `BDate`, `relation`, `employee_ID`) VALUES ('jones', 'male', '1993-12-03', 'cousin', 675765757);
INSERT INTO `airport`.`dependant` (`dname`, `sex`, `BDate`, `relation`, `employee_ID`) VALUES ('yedlin', 'male', '1970-12-22', 'father', 675765757);
INSERT INTO `airport`.`dependant` (`dname`, `sex`, `BDate`, `relation`, `employee_ID`) VALUES ('sara', 'female', '1976-02-11', 'mother', 126876888);
INSERT INTO `airport`.`dependant` (`dname`, `sex`, `BDate`, `relation`, `employee_ID`) VALUES ('alaves', 'male', '1980-09-22', 'uncle', 126876888);
INSERT INTO `airport`.`dependant` (`dname`, `sex`, `BDate`, `relation`, `employee_ID`) VALUES ('alex', 'male', '1987-12-03', 'cousin', 126576577);
INSERT INTO `airport`.`dependant` (`dname`, `sex`, `BDate`, `relation`, `employee_ID`) VALUES ('castillo', 'male', '1998-02-19', 'son', 126576577);
INSERT INTO `airport`.`dependant` (`dname`, `sex`, `BDate`, `relation`, `employee_ID`) VALUES ('doom', 'male ', '1987-12-09', 'cousin', 123123123);
INSERT INTO `airport`.`dependant` (`dname`, `sex`, `BDate`, `relation`, `employee_ID`) VALUES ('jack', 'male', '1990-09-18', 'uncle', 655327517);
INSERT INTO `airport`.`dependant` (`dname`, `sex`, `BDate`, `relation`, `employee_ID`) VALUES ('jack', 'male', '1998-08-12', 'cousin', 232433657);
INSERT INTO `airport`.`dependant` (`dname`, `sex`, `BDate`, `relation`, `employee_ID`) VALUES ('jhon', 'male', '1987-12-09', 'uncle', 213686193);
INSERT INTO `airport`.`dependant` (`dname`, `sex`, `BDate`, `relation`, `employee_ID`) VALUES ('tony', 'male', '1998-02-19', 'son', 213686193);
INSERT INTO `airport`.`dependant` (`dname`, `sex`, `BDate`, `relation`, `employee_ID`) VALUES ('lema', 'female', '1970-05-29', 'mother', 123186287);
INSERT INTO `airport`.`dependant` (`dname`, `sex`, `BDate`, `relation`, `employee_ID`) VALUES ('seman', 'female', '1998-07-22', 'daughter', 768132961);
INSERT INTO `airport`.`dependant` (`dname`, `sex`, `BDate`, `relation`, `employee_ID`) VALUES ('luve', 'male', '1965-05-29', 'father', 768132961);
INSERT INTO `airport`.`dependant` (`dname`, `sex`, `BDate`, `relation`, `employee_ID`) VALUES ('sara', 'female', '1988-02-11', 'daughter', 978012832);
INSERT INTO `airport`.`dependant` (`dname`, `sex`, `BDate`, `relation`, `employee_ID`) VALUES ('keimo', 'male', '1998-11-21', 'son', 978012832);
INSERT INTO `airport`.`dependant` (`dname`, `sex`, `BDate`, `relation`, `employee_ID`) VALUES ('sveen', 'female', '1987-08-22', 'cousin', 129703812);
INSERT INTO `airport`.`dependant` (`dname`, `sex`, `BDate`, `relation`, `employee_ID`) VALUES ('lama', 'female', '1988-12-11', 'cousin', 129703812);
INSERT INTO `airport`.`dependant` (`dname`, `sex`, `BDate`, `relation`, `employee_ID`) VALUES ('foke', 'male', '1987-11-12', 'cousin', 897123989);
INSERT INTO `airport`.`dependant` (`dname`, `sex`, `BDate`, `relation`, `employee_ID`) VALUES ('soultan', 'male', '1988-12-30', 'cousin', 219371246);

COMMIT;


-- -----------------------------------------------------
-- Data for table `airport`.`plane`
-- -----------------------------------------------------
START TRANSACTION;
USE `airport`;
INSERT INTO `airport`.`plane` (`p_no`, `capacity`, `wieght`, `type`) VALUES ('c763', 200 , 5000, 'passenger plan');
INSERT INTO `airport`.`plane` (`p_no`, `capacity`, `wieght`, `type`) VALUES ('ass7382', 350, 6000, 'passenger plan');
INSERT INTO `airport`.`plane` (`p_no`, `capacity`, `wieght`, `type`) VALUES ('c5467', 200, 5000, 'passenger plan');
INSERT INTO `airport`.`plane` (`p_no`, `capacity`, `wieght`, `type`) VALUES ('b76632', 500, 10000, 'aircraft');
INSERT INTO `airport`.`plane` (`p_no`, `capacity`, `wieght`, `type`) VALUES ('g12398', 250, 5200, 'passenger plan');
INSERT INTO `airport`.`plane` (`p_no`, `capacity`, `wieght`, `type`) VALUES ('hfa887', 300, 5600, 'passenger plan');
INSERT INTO `airport`.`plane` (`p_no`, `capacity`, `wieght`, `type`) VALUES ('cf676', 200, 5000, 'passenger plan');
INSERT INTO `airport`.`plane` (`p_no`, `capacity`, `wieght`, `type`) VALUES ('vhf886', 500, 10000, 'aircraft');
INSERT INTO `airport`.`plane` (`p_no`, `capacity`, `wieght`, `type`) VALUES ('fvb9123', 250, 5200, 'passenger plan');
INSERT INTO `airport`.`plane` (`p_no`, `capacity`, `wieght`, `type`) VALUES ('ca7751', 300, 5700, 'aircraft');

COMMIT;


-- -----------------------------------------------------
-- Data for table `airport`.`flight`
-- -----------------------------------------------------
START TRANSACTION;
USE `airport`;
INSERT INTO `airport`.`flight` (`f_no`, `f_name`, `plane_p_no`, `date`) VALUES ('A-884', 'paris-22', 'c763', '03-13 ');
INSERT INTO `airport`.`flight` (`f_no`, `f_name`, `plane_p_no`, `date`) VALUES ('A-773', 'cairo-44', 'ass7382', '12-11 ');
INSERT INTO `airport`.`flight` (`f_no`, `f_name`, `plane_p_no`, `date`) VALUES ('C-712', 'london-09', 'c5467', '02-10');
INSERT INTO `airport`.`flight` (`f_no`, `f_name`, `plane_p_no`, `date`) VALUES ('C-652', 'berlin-77', 'b76632', '01-11 ');
INSERT INTO `airport`.`flight` (`f_no`, `f_name`, `plane_p_no`, `date`) VALUES ('A-272', 'roma-78', 'g12398', '11-09 ');
INSERT INTO `airport`.`flight` (`f_no`, `f_name`, `plane_p_no`, `date`) VALUES ('B-432', 'paris-65', 'hfa887', '12-08 ');
INSERT INTO `airport`.`flight` (`f_no`, `f_name`, `plane_p_no`, `date`) VALUES ('A-654', 'kentaky-90', 'cf676', '02-10 ');
INSERT INTO `airport`.`flight` (`f_no`, `f_name`, `plane_p_no`, `date`) VALUES ('C-667', 'mumpai-009', 'vhf886', '12-13 ');
INSERT INTO `airport`.`flight` (`f_no`, `f_name`, `plane_p_no`, `date`) VALUES ('V-765', 'sharm el shiekh-98', 'fvb9123', '11-12 ');
INSERT INTO `airport`.`flight` (`f_no`, `f_name`, `plane_p_no`, `date`) VALUES ('D-412', 'stamford-0928', 'ca7751', '01-12 ');
INSERT INTO `airport`.`flight` (`f_no`, `f_name`, `plane_p_no`, `date`) VALUES ('A-723', 'stamford-028', 'c763', '02-10 ');
INSERT INTO `airport`.`flight` (`f_no`, `f_name`, `plane_p_no`, `date`) VALUES ('F-128', 'sharm el shiekh-928', 'c763', '01-11');
INSERT INTO `airport`.`flight` (`f_no`, `f_name`, `plane_p_no`, `date`) VALUES ('D-218', 'mumpai-023', 'ass7382', '11-02');
INSERT INTO `airport`.`flight` (`f_no`, `f_name`, `plane_p_no`, `date`) VALUES ('E-128', 'mumpai-029', 'ass7382', '03-11');
INSERT INTO `airport`.`flight` (`f_no`, `f_name`, `plane_p_no`, `date`) VALUES ('J-928', 'berlin-11', 'c5467', '01-22');
INSERT INTO `airport`.`flight` (`f_no`, `f_name`, `plane_p_no`, `date`) VALUES ('A-975', 'berlin-73', 'b76632', '12-22');
INSERT INTO `airport`.`flight` (`f_no`, `f_name`, `plane_p_no`, `date`) VALUES ('H-127', 'roma-738', 'g12398', '12-03');
INSERT INTO `airport`.`flight` (`f_no`, `f_name`, `plane_p_no`, `date`) VALUES ('H-891', 'roma-782', 'hfa887', '11-14');
INSERT INTO `airport`.`flight` (`f_no`, `f_name`, `plane_p_no`, `date`) VALUES ('R-863', 'paris-908', 'hfa887', '01-02');
INSERT INTO `airport`.`flight` (`f_no`, `f_name`, `plane_p_no`, `date`) VALUES ('J-982', 'london-987', 'ca7751', '02-12');
INSERT INTO `airport`.`flight` (`f_no`, `f_name`, `plane_p_no`, `date`) VALUES ('K-975', 'cairo-982', 'ca7751', '03-12');

COMMIT;


-- -----------------------------------------------------
-- Data for table `airport`.`Ticket`
-- -----------------------------------------------------
START TRANSACTION;
USE `airport`;
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (5000, 'highclass', 1150, 'A-884', 123454326, 'One way trip', 'los angeles', 'paris', '03-13 ( 6 AM )', NULL);
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (4300, 'economy', 1222, 'A-884', 312423543 , 'One way trip', 'los angeles', 'paris', '03-13 ( 6 AM )', NULL);
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (2344, 'economy', 1263, 'A-773', 123214778 , 'Round trip', 'los angeles', 'cairo', '02-10 ( 4 PM )', '03-11 ( 7 PM )');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (3234, 'hightclass', 1233, 'A-773', 123907980 , 'Round trip', 'los angeles', 'cairo', '02-10 ( 4 PM )', '02-01 ( 5 AM )');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (4234, 'highclass', 4211, 'C-712', 321445325 , 'Round trip', 'los angeles', 'london ', '11-09 ( 3 PM )', '11-29 ( 6 AM )');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (4234, 'highclass', 3133, 'C-712', 987238912 , 'One way trip', 'los angeles', 'london ', '11-09 ( 3 PM )', NULL);
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (4232, 'economy', 1231, 'C-652', 987238912 , 'One way trip', 'los angeles', 'berlin', '02-10 ( 4 PM )', NULL);
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (4232, 'economy', 1221, 'C-652', 871265217 , 'One way trip', 'los angeles', 'berlin', '02-10 ( 4 PM )', NULL);
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (4323, 'highclass', 1239, 'A-272', 871265217 , 'Round trip', 'los angeles', 'roma', '11-12 ( 5 AM )', '12-01 ( 6 PM )');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (4323, 'highclass', 2333, 'A-272', 980128733 , 'Round trip', 'los angeles', 'roma', '11-12 ( 5 AM )', '01-29 ( 9 AM )');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (4500, 'economy', 3424, 'B-432', 218379131 , 'One way trip', 'los angeles', 'paris', '12-08 ( 3 AM )', NULL);
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (5000, 'highclass', 2354, 'B-432', 312423543 , 'One way trip', 'los angeles', 'paris', '12-08 ( 8 PM )', NULL);
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (1000, 'highclass', 2343, 'A-654 ', 462365122 , 'One way trip', 'los angeles', 'kentaky', '02-10 ( 12 AM )', NULL);
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (800, 'economy', 8643, 'A-654 ', 190123809 , 'Round trip', 'los angeles', 'kentaky', '02-10 ( 8 AM )', '03-22 ( 7 AM )');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (4000, 'highclass', 4782, 'C-667', 462365122 , 'One way trip', 'los angeles', 'mumpai', '12-13 ( 10 PM )', NULL);
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (3700, 'economy', 9832, 'C-667', 171239873 , 'One way trip', 'los angeles', 'mumpai', '12-13 ( 8 AM )', NULL);
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (4300, 'highclass', 9033, 'V-765', 219879173 , 'One way trip', 'los angeles', 'sharm el shiekh', '11-12 ( 9 AM )', NULL);
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (4000, 'economy', 0084, 'V-765', 712687688 , 'Round trip', 'los angeles', 'sharm el shiekh', '11-12 ( 6 PM )', '11-22 ( 6 PM )');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (5000, 'highclass', 0234, 'D-412', 987981237 , 'Round trip', 'los angeles', 'stamford', '01-12 ( 4 AM )', '02-12 ( 3 PM )');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (4800, 'economy', 9328, 'D-412', 219879173 , 'Round trip', 'los angeles', 'stamford', '01-12 ( 10 PM )', '02-12 ( 7 PM )');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (5000, 'highclass', 0743, 'A-723', 918203792 , 'Round trip', 'los angeles', 'stamford', '02-10 ( 12 AM )', '02-31 ( 6 PM )');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (4800, 'economy', 0243, 'A-723', 712687688 , 'Round trip', 'los angeles', 'stamford', '02-10 ( 11 AM )', '03-12 ( 7 PM )');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (5000, 'highclass', 0987, 'F-128', 123907980 , 'One way trip', 'los angeles', 'sharm el shiekh', '01-11 ( 8 AM )', '');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (4700, 'economy', 0965, 'F-128', 891729898 , 'Round trip', 'los angeles', 'sharm el shiekh', '01-11 ( 5 AM )', '01-21 ( 5 AM )');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (4700, 'highclass', 0254, 'D-218', 293078234 , 'One way trip', 'los angeles', 'mumpai', '11-02 ( 8 AM )', '');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (4500, 'economy', 0654, 'D-218', 219879173 , 'One way trip', 'los angeles', 'mumpai', '11-02 ( 8 PM )', '');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (4700, 'highclass', 0767, 'E-128', 191287312 , 'Round trip', 'los angeles', 'mumpai', '03-11 ( 8 AM )', '03-29 ( 7 AM )');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (4500, 'economy', 8753, 'E-128', 462365122 , 'Round trip', 'los angeles', 'mumpai', '03-11 ( 8 AM )', '03-25 ( 3 AM )');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (5400, 'highclass', 8624, 'J-928', 712687688 , 'One way trip', 'los angeles', 'berlin', '01-22 ( 9 AM )', '');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (5100, 'economy', 8325, 'J-928', 128937098 , 'One way trip', 'los angeles', 'berlin', '01-22 ( 8 PM )', NULL);
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (5400, 'highclass', 8222, 'A-975', 191287312 , 'Round trip', 'los angeles', 'berlin', '12-22 ( 2 AM )', '01-22 ( 8 AM )');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (5100, 'economy', 0986, 'A-975', 678681929 , 'Round trip', 'los angeles', 'berlin', '12-22 ( 7 PM )', '02-22 ( 7 PM )');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (5600, 'highclass', 0123, 'H-127', 190283123 , 'One way trip', 'los angeles', 'roma', '12-03 ( 3 AM )', '');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (5400, 'economy', 0111, 'H-127', 879123123 , 'One way trip', 'los angeles', 'roma', '12-03 ( 7 PM )', '');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (5600, 'highclass', 2222, 'H-891 ', 123712538 , 'Round trip', 'los angeles', 'roma', '11-14 ( 5 AM )', '12-14 ( 5 AM )');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (5400, 'economy', 3333, 'H-891 ', 293078234 , 'Round trip', 'los angeles', 'roma', '11-14 ( 11 PM )', '12-14 ( 5 AM )');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (5300, 'highclass', 4444, 'R-863', 128937098 , 'One way trip', 'los angeles', 'paris', '01-02 ( 1 AM )', '');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (5000, 'economy', 5555, 'R-863', 871265217 , 'Round trip', 'los angeles', 'paris', '01-02 ( 9 PM )', '01-24 ( 5 AM )');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (5100, 'highclass', 6666, 'J-982', 879123123 , 'One way trip', 'los angeles', 'london', '02-12 ( 6 AM )', '');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (4900, 'economy', 7777, 'J-982', 891729898 , 'One way trip', 'los angeles', 'london', '02-12 ( 5 AM )', '');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (4900, 'highclass', 8888, 'K-975', 128937098 , 'Round trip', 'los angeles', 'cairo', '03-12 ( 3 PM )', '03-29 ( 6 AM )');
INSERT INTO `airport`.`Ticket` (`price`, `degree`, `t_NO`, `flight_f_no`, `passenger_ID`, `type_booking`, `from`, `to`, `Date_leave`, `Date_back`) VALUES (4700, 'economy', 9999, 'K-975', 190123809 , 'Round trip', 'los angeles', 'cairo', '03-12 ( 2 AM )', '03-29 ( 6 AM )');

COMMIT;


-- -----------------------------------------------------
-- Data for table `airport`.`works_on`
-- -----------------------------------------------------
START TRANSACTION;
USE `airport`;
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (675765757 , 'A-884');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (655327517 , 'A-884');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (121233398 , 'A-884');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (126876888 , 'A-773');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (232433657 , 'A-773');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (123124888 , 'A-773');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (126576577 , 'C-712');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (123123546 , 'C-712');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (213686193 , 'C-712');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (123123123 , 'C-652');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (897897654 , 'C-652');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (123186287 , 'C-652');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (675765757 , 'A-272');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (655327517 , 'A-272');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (121233398 , 'A-272');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (126876888 , 'B-432');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (232433657 , 'B-432');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (123124888 , 'B-432');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (126576577 , 'A-654');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (123123546 , 'A-654');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (213686193 , 'A-654');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (123123123 , 'C-667');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (897897654 , 'C-667');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (123186287 , 'C-667');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (675765757 , 'V-765');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (655327517 , 'V-765');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (121233398 , 'V-765');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (126876888 , 'D-412 ');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (232433657 , 'D-412 ');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (123124888 , 'D-412 ');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (126576577 , 'A-723');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (123123546 , 'A-723');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (213686193 , 'A-723');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (123123123 , 'F-128');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (897897654 , 'F-128');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (123186287 , 'F-128');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (675765757 , 'D-218');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (655327517 , 'D-218');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (121233398 , 'D-218');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (126876888 , 'E-128');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (232433657 , 'E-128');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (123124888 , 'E-128');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (126576577 , 'J-928');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (123123546 , 'J-928');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (213686193 , 'J-928');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (123123123 , 'A-975');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (897897654 , 'A-975');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (123186287 , 'A-975');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (675765757 , 'H-127');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (655327517 , 'H-127');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (121233398 , 'H-127');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (126876888 , 'H-891');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (232433657 , 'H-891');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (123124888 , 'H-891');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (126576577 , 'R-863');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (123123546 , 'R-863');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (213686193 , 'R-863');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (123123123 , 'J-982');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (897897654 , 'J-982');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (123186287 , 'J-982');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (675765757 , 'K-975');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (655327517 , 'K-975');
INSERT INTO `airport`.`works_on` (`employee_ID`, `flight_f_no`) VALUES (121233398 , 'K-975');

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
