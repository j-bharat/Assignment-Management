-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: assignment_management
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assignedto`
--

DROP TABLE IF EXISTS `assignedto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignedto` (
  `Student_ID` int NOT NULL,
  `Assignment_ID` int NOT NULL,
  `Status` tinyint(1) NOT NULL,
  PRIMARY KEY (`Student_ID`,`Assignment_ID`),
  KEY `Assignment_ID` (`Assignment_ID`),
  CONSTRAINT `assignedto_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `students` (`ID`),
  CONSTRAINT `assignedto_ibfk_2` FOREIGN KEY (`Assignment_ID`) REFERENCES `assignments` (`Assignment_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignedto`
--

LOCK TABLES `assignedto` WRITE;
/*!40000 ALTER TABLE `assignedto` DISABLE KEYS */;
INSERT INTO `assignedto` VALUES (20051,1,1),(20051,3,1),(20051,4,1),(20051,5,1),(20052,1,1),(20053,1,1),(20056,1,1),(20056,5,1),(20060,3,0),(20061,3,0),(20062,3,0),(20067,3,1),(20067,5,1),(20069,5,1),(20070,5,1);
/*!40000 ALTER TABLE `assignedto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignments` (
  `Assignment_ID` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `date_assigned` timestamp NOT NULL,
  `due_date` date NOT NULL,
  `Teacher_ID` int NOT NULL,
  PRIMARY KEY (`Assignment_ID`),
  KEY `Teacher_ID` (`Teacher_ID`),
  CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`Teacher_ID`) REFERENCES `teachers` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES (1,'Assignment1','Easy','2023-04-06 18:30:00','2023-04-10',10051),(2,'Assignment2','medium','2023-04-06 18:30:00','2023-03-10',10052),(3,'Quantum Mechanics','basic problems','2023-04-06 18:30:00','2023-04-08',10059),(4,'photosynthesis','textbook problems','2023-04-07 18:30:00','2023-04-10',10057),(5,'DBMS PROJECT','Assignment-Management-System','2023-04-07 18:30:00','2023-04-12',10052);
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `ID` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `E_MAIL` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `E_MAIL` (`E_MAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (20051,'Alok','alok@student.com','newpass'),(20052,'Amit','amit@student.com','amitpass'),(20053,'Anil','anil@student.com','anilpass'),(20054,'Anita','anita@student.com','anitapass'),(20055,'Anjali','anjali@student.com','anjalipass'),(20056,'Ankur','ankur@student.com','ankurpass'),(20057,'Anu','anu@student.com','anupass'),(20058,'Asha','asha@student.com','ashapass'),(20059,'Ashok','ashok@student.com','ashokpass'),(20060,'Babita','babita@student.com','babitapass'),(20061,'Bhavna','bhavna@student.com','bhavnapass'),(20062,'Bina','bina@student.com','binapass'),(20063,'Chetan','chetan@student.com','chetanpass'),(20064,'Deepa','deepa@student.com','deepapass'),(20065,'Deepak','deepak@student.com','deepakpass'),(20066,'Dinesh','dinesh@student.com','dineshpass'),(20067,'Gaurav','gaurav@student.com','gauravpass'),(20068,'vineet','vineet@email.com','vineetpass'),(20069,'Ajay','ajay@email.com','ajaypass'),(20070,'Shalini','shalini@email.com','shalinipass');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submissions` (
  `Submission_ID` int NOT NULL AUTO_INCREMENT,
  `File` varchar(255) NOT NULL,
  `date_submitted` timestamp NOT NULL,
  `Assignment_ID` int NOT NULL,
  `Student_ID` int NOT NULL,
  `grade` int DEFAULT NULL,
  `Feedback` varchar(255) DEFAULT NULL,
  `Teacher_ID` int NOT NULL,
  PRIMARY KEY (`Submission_ID`),
  KEY `Assignment_ID` (`Assignment_ID`),
  KEY `Student_ID` (`Student_ID`),
  KEY `Teacher_ID` (`Teacher_ID`),
  CONSTRAINT `submissions_ibfk_1` FOREIGN KEY (`Assignment_ID`) REFERENCES `assignments` (`Assignment_ID`),
  CONSTRAINT `submissions_ibfk_2` FOREIGN KEY (`Student_ID`) REFERENCES `students` (`ID`),
  CONSTRAINT `submissions_ibfk_3` FOREIGN KEY (`Teacher_ID`) REFERENCES `teachers` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,'20051_1.pdf','2023-04-06 18:30:00',1,20051,50,'Average',10051),(2,'20056_1.pdf','2023-04-06 18:30:00',1,20056,100,'Perfect',10051),(3,'20052_1.pdf','2023-04-06 18:30:00',1,20052,65,'above average',10051),(4,'20053_1.pdf','2023-04-06 18:30:00',1,20053,30,'below average',10051),(5,'20051.pdf','2023-04-06 18:30:00',3,20051,88,'good',10059),(6,'20067.pdf','2023-04-06 18:30:00',3,20067,85,'good',10059),(7,'20051.pdf','2023-04-07 18:30:00',4,20051,89,'good',10057),(8,'20070.sql','2023-04-07 18:30:00',5,20070,88,'goodwork',10052),(9,'20056.sql','2023-04-07 18:30:00',5,20056,40,'poor',10052),(10,'20067.sql','2023-04-07 18:30:00',5,20067,80,'goodwork',10052),(11,'20069.sql','2023-04-07 18:30:00',5,20069,100,'perfect',10052),(12,'20051.sql','2023-04-07 18:30:00',5,20051,65,'good effort',10052);
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `ID` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `E_MAIL` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Education` varchar(255) DEFAULT NULL,
  `Research_Interest` varchar(255) DEFAULT NULL,
  `Contact_No` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `unique_email` (`E_MAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (10051,'Aarav','aarav@email.com','passaarav','bits pilani','graph theory','8017356603'),(10052,'Aryan','aryan@email.com','newpassaryan','BITS PILANI',NULL,'9830228833'),(10053,'Diya','diya@email.com','passdiya',NULL,NULL,NULL),(10054,'Ishaan','ishaan@email.com','passishaan',NULL,NULL,NULL),(10055,'Jhanvi','jhanvi@email.com','passjhanvi',NULL,NULL,NULL),(10056,'Kabir','kabir@email.com','passkabir','mumbai university','quantum mechanics','999876324'),(10057,'Navya','navya@email.com','passnavya',NULL,NULL,NULL),(10058,'Riya','riya@email.com','passriya',NULL,NULL,NULL),(10059,'Saanvi','saanvi@email.com','passsaanvi','xaviers university','statistics',NULL),(10060,'Vihaan','vihaan@email.com','passvihaan',NULL,NULL,NULL),(10061,'divyan','divyan@email.com','passdivyan',NULL,NULL,NULL);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'assignment_management'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_assignment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_assignment`(
    IN title VARCHAR(255),
    IN description TEXT,
    IN due_date DATE,
    IN teacher_email VARCHAR(255)
)
BEGIN
    DECLARE user_type VARCHAR(255);

    START TRANSACTION;

    
    IF EXISTS (
        SELECT *
        FROM Teachers
        WHERE E_MAIL = teacher_email
    ) THEN
        
        INSERT INTO Assignments (Title, Description, Due_Date, Teacher_ID, Date_Assigned)
        VALUES (title, description, due_date, 
                (SELECT ID FROM Teachers WHERE E_MAIL = teacher_email), 
                CURRENT_DATE);
        
        SELECT 'Assignment added successfully' AS Result;
    ELSE
        
        SELECT 'Error: User is not authorized to add assignments' AS Result;
    END IF;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_student_to_assignment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_student_to_assignment`(
    IN assignment_id INT,
    IN student_email VARCHAR(255),
    IN teacher_email VARCHAR(255)
)
BEGIN
    DECLARE user_type VARCHAR(255);

    START TRANSACTION;

    
    IF EXISTS (
        SELECT *
        FROM Teachers t
        JOIN Assignments a ON t.ID = a.Teacher_ID
        WHERE t.E_MAIL = teacher_email AND a.Assignment_ID = assignment_id
    ) THEN
        
        IF EXISTS (
            SELECT *
            FROM Students
            WHERE E_mail = student_email
        ) THEN
            
            INSERT INTO AssignedTo (Student_ID, Assignment_ID, Status)
            VALUES (
                (SELECT ID FROM Students WHERE E_mail = student_email),
                assignment_id,
                false
            );
            
            SELECT 'Student added to assignment successfully' AS Result;
        ELSE
            
            SELECT 'Error: Student email does not exist' AS Result;
        END IF;
    ELSE
        
        SELECT 'Error: Teacher email does not exist or is not the one who made the assignment' AS Result;
    END IF;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_submission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_submission`(
    IN p_student_id INT,
    IN p_assignment_id INT,
    IN p_file VARCHAR(255)
)
BEGIN
    DECLARE v_due_date DATE;
    DECLARE v_status BOOLEAN;
    DECLARE v_submission_count INT;
    DECLARE v_teacher_id INT;

    START TRANSACTION;

    
    SELECT COUNT(*) INTO v_submission_count
    FROM AssignedTo
    WHERE Student_ID = p_student_id AND Assignment_ID = p_assignment_id;

    IF v_submission_count = 0 THEN
        SELECT 'Student is not assigned this assignment' AS Error;
    ELSE
        
        SELECT Due_Date, Teacher_ID INTO v_due_date, v_teacher_id
        FROM Assignments
        WHERE Assignment_ID = p_assignment_id;

        IF CURRENT_DATE > v_due_date THEN
            SELECT 'Due date has passed' AS Error;
        ELSE
            
            SELECT COUNT(*) INTO v_submission_count
            FROM submissions
            WHERE Student_ID = p_student_id AND Assignment_ID = p_assignment_id;

            IF v_submission_count > 0 THEN
                SELECT 'Student has already submitted this assignment' AS Error;
            ELSE
                
                INSERT INTO submissions (File, Date_Submitted, Assignment_ID, Student_ID, Teacher_ID)
                VALUES (p_file, CURRENT_DATE, p_assignment_id, p_student_id, v_teacher_id);

                
                UPDATE AssignedTo
                SET Status = TRUE
                WHERE Student_ID = p_student_id AND Assignment_ID = p_assignment_id;

                SELECT 'Submission added successfully' AS Success;
            END IF;
        END IF;
    END IF;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `assignment_completion_rate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `assignment_completion_rate`(
    IN p_assignment_id INT
)
BEGIN
    DECLARE v_total_students INT;
    DECLARE v_completed_students INT;
    DECLARE v_assignment_count INT;

    START TRANSACTION;

    
    SELECT COUNT(*) INTO v_assignment_count
    FROM Assignments
    WHERE Assignment_ID = p_assignment_id;

    IF v_assignment_count = 0 THEN
        SELECT 'Assignment does not exist' AS Error;
    ELSE
        
        SELECT COUNT(*) INTO v_total_students
        FROM AssignedTo
        WHERE Assignment_ID = p_assignment_id;

        
        SELECT COUNT(*) INTO v_completed_students
        FROM AssignedTo
        WHERE Assignment_ID = p_assignment_id AND Status = TRUE;

        
        SELECT (v_completed_students / v_total_students) * 100 AS CompletionRate;
    END IF;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `assignment_statistics` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `assignment_statistics`(
    IN p_assignment_id INT
)
BEGIN
    
    SELECT AVG(Grade) AS Average,
           MIN(Grade) AS Lowest,
           MAX(Grade) AS Highest
    FROM submissions
    WHERE Assignment_ID = p_assignment_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `grade_submission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `grade_submission`(
    IN p_teacher_id INT,
    IN p_submission_id INT,
    IN p_grade INT,
    IN p_feedback TEXT
)
BEGIN
    DECLARE v_assignment_id INT;
    DECLARE v_assignment_count INT;

    START TRANSACTION;

    
    SELECT Assignment_ID INTO v_assignment_id
    FROM submissions
    WHERE Submission_ID = p_submission_id;

    
    SELECT COUNT(*) INTO v_assignment_count
    FROM Assignments
    WHERE Assignment_ID = v_assignment_id AND Teacher_ID = p_teacher_id;

    IF v_assignment_count = 0 THEN
        SELECT 'Teacher did not create this assignment' AS Error;
    ELSE
        
        UPDATE submissions
        SET Grade = p_grade, Feedback = p_feedback
        WHERE Submission_ID = p_submission_id;

        SELECT 'Grade and feedback updated successfully' AS Success;
    END IF;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `register_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register_user`(IN name VARCHAR(255), IN email VARCHAR(255), IN password VARCHAR(255), IN role VARCHAR(255))
BEGIN
    DECLARE new_id INT;

    
    START TRANSACTION;

    IF role = 'Teacher' THEN
        SET new_id = (SELECT MAX(ID) + 1 FROM Teachers);
        INSERT INTO Teachers (ID, Name, E_MAIL, Password)
        VALUES (new_id, name, email, password);
        SELECT CONCAT('Teacher with name ', name, ' and email ', email, ' has been registered.') AS message;
    ELSEIF role = 'Student' THEN
        SET new_id = (SELECT MAX(ID) + 1 FROM Students);
        INSERT INTO Students (ID, Name, E_MAIL, Password)
        VALUES (new_id, name, email, password);
        SELECT CONCAT('Student with name ', name, ' and email ', email, ' has been registered.') AS message;
    END IF;

    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reset_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reset_password`(IN email VARCHAR(255), IN password VARCHAR(255))
BEGIN
    DECLARE user_type VARCHAR(255);

    START TRANSACTION;

    
    UPDATE Students
    SET Password = password
    WHERE E_MAIL = email;

    
    UPDATE Teachers
    SET Password = password
    WHERE E_MAIL = email;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateTeacherProfile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateTeacherProfile`(
    IN TeacherEmail VARCHAR(100),
    IN Education VARCHAR(100),
    IN ResearchInterest VARCHAR(100),
    IN ContactNo VARCHAR(20)
)
BEGIN
    UPDATE Teachers
    SET Education = Education,
        Research_Interest = ResearchInterest,
        Contact_No = ContactNo
    WHERE E_MAIL = TeacherEmail;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validate_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validate_user`(
    IN email VARCHAR(255),
    IN password1 VARCHAR(255)
)
BEGIN
    DECLARE user_type VARCHAR(255);

    
    START TRANSACTION;

    
    SELECT UserType INTO user_type FROM (
        SELECT 'Student' AS UserType, E_MAIL, Password
        FROM Students
        UNION ALL
        SELECT 'Teacher' AS UserType, E_MAIL, Password
        FROM Teachers
    ) AS UserTable
    WHERE E_MAIL = email;

    
    IF user_type IS NULL THEN
        SELECT 'Invalid user';
    
    ELSEIF EXISTS (
        SELECT *
        FROM (
            SELECT ID, 'Student' AS UserType, E_MAIL, Password
            FROM Students
            WHERE E_MAIL = email AND Password = password1
            UNION ALL
            SELECT ID, 'Teacher' AS UserType, E_MAIL, Password
            FROM Teachers
            WHERE E_MAIL = email AND Password = password1
        ) AS ValidUserTable
    ) THEN
        
        SELECT CONCAT(user_type, ' login successful') as 'SUCCESS' ;
    ELSE
        
        SELECT CONCAT('Incorrect password for ', user_type) as 'ERROR';
    END IF;

    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-09  9:33:03
