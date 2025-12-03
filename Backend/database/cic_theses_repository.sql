-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2025 at 08:00 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cic_theses_repository`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `normalize_title` (`title` TEXT) RETURNS TEXT CHARSET latin1 COLLATE latin1_swedish_ci DETERMINISTIC BEGIN
  DECLARE normalized TEXT;

  SET normalized = LOWER(title);
  SET normalized = REPLACE(normalized, ' ', '');
  SET normalized = REPLACE(normalized, '.', '');
  SET normalized = REPLACE(normalized, ',', '');
  SET normalized = REPLACE(normalized, '''', '');
  SET normalized = REPLACE(normalized, '"', '');
  SET normalized = REPLACE(normalized, '!', '');
  SET normalized = REPLACE(normalized, '?', '');
  SET normalized = REPLACE(normalized, '-', '');
  SET normalized = REPLACE(normalized, '_', '');
  SET normalized = REPLACE(normalized, ':', '');
  SET normalized = REPLACE(normalized, ';', '');
  SET normalized = REPLACE(normalized, '(', '');
  SET normalized = REPLACE(normalized, ')', '');

  RETURN normalized;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` varchar(10) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password_Hash` varchar(255) NOT NULL,
  `Role` varchar(50) DEFAULT NULL,
  `Created_At` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `FirstName`, `LastName`, `Email`, `Password_Hash`, `Role`, `Created_At`) VALUES
('AD001', 'Patrick Elvin', 'Hempeso', 'pelhempeso01344@uesp.edu.ph', 'treecko', 'Admin', '2025-05-12 00:00:00'),
('AD002', 'Keith Andrei', 'Tapales', 'kartapales00740@usep.edu.ph', 'keithcarson', 'Admin', '2025-05-12 00:00:00'),
('AD003', 'Jester Kian', 'Ociones', 'jkgociones00902@usep.edu.ph', 'KianJester', 'Admin', '2025-05-12 00:00:00'),
('AD004', 'Justin Elle', 'Pelpinosas', 'jedpelpinosas00707@usep.edu.ph', 'EllePelpinosas', 'Admin', '2025-05-12 00:00:00'),
('AD005', 'Christian Wayne', 'Compasion', 'cwpcompasion00766@usep.edu.ph', 'darangel09', 'Admin', '2025-05-12 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `capstone`
--

CREATE TABLE `capstone` (
  `CapstoneID` varchar(10) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Abstract` text NOT NULL,
  `Keywords` text NOT NULL,
  `Authors` text NOT NULL,
  `Adviser` varchar(100) NOT NULL,
  `YearPublished` year(4) DEFAULT NULL,
  `DateCreated` date DEFAULT NULL,
  `DocumentID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `capstone`
--

INSERT INTO `capstone` (`CapstoneID`, `Title`, `Abstract`, `Keywords`, `Authors`, `Adviser`, `YearPublished`, `DateCreated`, `DocumentID`) VALUES
('CP001', 'COPTURE: AUTOMATION OF TRAFFIC TICKET ISSUANCE USING PDF417\r\nBARCODE SCANNER', 'Double encoding of traffic citations became a significant problem for the\r\nApprehension Unit in the City Transport and Traffic Management Office. Every day,\r\nthey have to encode the endorsed traffic tickets into an excel sheet, and they have\r\neven experienced a month\'s worth of backlog due to the increase in citation tickets.\r\nCopTure was developed to solve the agency\'s problem in double encoding and\r\nto enhance the process of issuing a traffic ticket. The researchers designed and\r\ndeveloped a mobile application that will automate the issuance of traffic citations by\r\nscanning and obtaining data from a driver\'s license. They also developed a webbased record system that will allow authorized employees to monitor traffic citations.\r\nTo achieve this, the researchers followed the Rapid Application Development\r\nmethod. The researchers conducted an interview at the CTTMO to thoroughly\r\nunderstand the problem and established a set of objectives to solve it. The objectives\r\nserved as a guide in implementing all the features needed to complete the project.\r\nThe mobile application and web-based system went through rapid prototyping and\r\niterative delivery until all the objectives were met. A validation test was also\r\nconducted to ensure that both the application and the system are fully functioning.\r\nOverall, this project paints a picture of the future traffic ticketing system and\r\nencourages the acceptance of technology as a new way of implementing traffic\r\nmanagement. The project would not be feasible without the unwavering commitment\r\nand cooperation that each of the researchers showed to successfully finish the\r\nproject. The whole project might be finished and thrived, but it is still open for future\r\nimprovements and additional features based on users\' future needs.', 'traffic, ticket, development, CTTMO, driving, system', 'Caya, Carl Stephen G.\r\nEspinosa, Merra Elaiza T.\r\nMoria, Mice Dianne M.', 'Lagmay, Marvin S.', '2020', '2020-02-10', 'DC001'),
('CP002', 'FINnish Na: AN IOT APPLICATION SYSTEM FOR FISH MORTALITY RATE\r\nMONITORING USING ULTRASONIC SENSORS', 'Fish mortality is a natural occurrence that can happen when cultivating a fish\r\nfarm. It is undeniable that fish deaths transpire now and then. Problems that\r\ncontribute to fish mortality include weather that causes oxygen depletion, fish\r\ndisease, as well as dead fish/es itself, among other things. These dead fishes, if not\r\nretrieved and left to rot, pose an even greater threat within a farm, especially when\r\nthese carcasses sink instead of floating. If cultivators aren\'t careful enough, these\r\nrotting fish may release harmful chemicals that can contaminate the fishpond\'s\r\nwater and compromise other healthy fishes. An interview was conducted among fish\r\nfarmers in Matina Aplaya to find out how they address such issues. Collectively, they\r\nresponded by having scheduled underwater checking for dead fish that sank at the\r\nbottom of the pond, which is time-consuming and inefficient. Hence, the proponents\r\ndeveloped a system, FINnish Na, to reduce and address this specific fish farmer\r\nproblem. Primarily using an ultrasonic sensor placed at the bottom of a basin, the\r\nproponents have simulated a miniature fishpond. When the sensor detects the\r\npresence of dead fish in the pond, the system will notify fish farmers through a\r\nnotification in the app. The app can also provide the mortality rate of the fish and gives\r\na daily and monthly report of the number of dead fish that the fish farm has so far.\r\nAfter testing the system for four (4) days, split between two pond conditions: with live\r\nfish and without, the proponents made comparisons of each day\'s result. It was\r\nevident that there was variability among the results. Significantly, however, there is a\r\nslight inconsistency of sensor readings when live fishes are present and if they are\r\nconstantly moving. Based on the results of this study, the proponents recommend\r\nthat an advanced type of ultrasonic sensor is utilized, as well as improve the sensor\r\ndetection function, where constant interferences such as fish movement are ignored.', 'fish, mortality, ultrasonic, sensors, underwater, pond, healthy', 'Amandy, Lovely Roze N.,\r\nAton, Theona F.,\r\nBalcom, Andrea Gail N.', 'Dr. Tamara Cher Mercado\r\n', '2020', '2020-02-10', 'DC002'),
('CP003', 'CODE CAPTURE: MOBILE IDE FOR ENHANCING PROGRAMMING LOGIC\r\nBY CAPTURING PSEUDOCODES INTO READILY EXECUTABLE SCRIPTS\r\nUSING OCR TECHNOLOGY', 'Laptops and smartphones are used by almost everyone in this current era.\r\nThese devices are popularly used at home, school, and work environments. Students,\r\nin particular, prefer using laptops because they are more efficient to be used for\r\nnotetaking, writing, editing, and studying. Having said that, several economically\r\nmarginalized students may not experience the convenience that these devices could\r\noffer. This financial instability could be a big issue especially for technology-related\r\nstudents since laptops play a crucial role in learning the basics of computer\r\nprogramming.\r\nTherefore, the researchers have conducted this study, \"Code Capture: Mobile\r\nIde for Enhancing Programming Logic By Capturing Pseudocodes Into Readily\r\nExecutable Scripts Using Ocr Technology\", a solution that could improve the current\r\nsituation of students with financial difficulties of providing themselves laptops. This\r\nstudy created a dedicated mobile application to be used by students who have\r\ncomputer- related courses. It could serve as a compiler and decoder for computer\r\nprograms. Following a Rapid Application Development (RAD) model, we used an\r\neffective and fair design to cater to the needs of different users', 'laptop, devices, students, efficient, technology', 'Javier, Martkneil Jan L.,\r\nLavilla, Christian C.,\r\nRulona, Matt Jacob C.', 'Eric P. Ricablanca', '2020', '2020-02-10', 'DC003'),
('CP004', 'HEEDER: A VOIP-BASED HYBRID MOBILE APPLICATION FOR CLASSROOM INSTRUCTION DELIVERY', 'HEEDER is a mobile VOIP-enabled and hybrid voice distribution application designed to aid classroom instruction by mitigating distractions from noise and mobile devices. It allows teachers to create voice broadcast channels and monitor student users. Built with Cordova and using the Dynamic Systems Development Method, the app fosters improved classroom communication. Though not eliminating noise, it enhances voice clarity and supports intent listening.', 'VOIP, classroom instruction, mobile application, hybrid app, student learning', 'Casas, Reymart C.; Concubierta, Paola R.; Garcia, Elvina B.', 'Mozo, Nancy B.', '2020', '2020-06-15', 'DC004'),
('CP005', 'SMARTASTH: A MOBILE APPLICATION FOR REAL-TIME MONITORING OF ASTHMATIC PATIENTS USING WEARABLE DEVICE FOR HEART RATE AND GEO-TAGGING', 'SMARTASTH is a mobile application developed to monitor asthmatic patients in real-time using smartphone sensors and wearable technology. The app tracks breath sounds and heart rate to detect early asthma triggers and integrates geotagging to contextualize readings. The system aims to provide accurate, at-home monitoring without the need for standard spirometry supervision, offering a low-cost, effective tool for long-term asthma care.', 'asthma monitoring, wearable device, heart rate, geotagging, mobile health, respiratory care', 'Carcallas, Nica C.; Delos Reyes, Sim Japhet C.; Quinamot, Jan Enrico V', 'Rogers, Jamal Kay B.', '2020', '2020-06-15', 'DC005'),
('CP006', 'AEROFREE: AN IOT-ENABLED LPG LEAK DETECTION SYSTEM WITH PROXIMITY MAP', 'AEROFREE is a mobile–web solution that pairs an Arduino-based LPG sensor with an app to detect abnormal propane/butane levels. When a high concentration is sensed, actuators trigger, SMS alerts are sent, and nearby users (within 100 m) receive notifications. A heat-map view shows leak intensity and location, helping households and fire departments respond quickly. Developed with the RAD model, AEROFREE met all functional objectives for indoor gas-leak awareness and safety.', 'LPG leak detection, IoT, propane, butane, heat map, Arduino, RAD', 'Barsal, Jude Norbert D.; Gaspar, Ian James V.; Ripalda, Francis Lloyd P.', 'Jandayan, Michael Anthony R.', '2020', '2020-04-30', 'DC006'),
('CP007', 'IMONGMOTHER: AN ANDROID-BASED COMMUNITY BREAST-MILK SHARING APPLICATION USING GEOTAGGING AND CROWDSOURCING IN DAVAO CITY', 'IMONGMOTHER is a crowdsourced Android platform enabling lactating mothers with surplus milk to donate to infants in need. GPS filters donors by proximity, while in-app requests streamline exchanges. Built with Rapid Application Development, the app fosters breastfeeding culture, supports postpartum mothers, and bridges donors and recipients for healthier infant nutrition.', 'breast-milk donation, breastfeeding, crowdsourcing, geotagging, mobile health', 'Dumagan, Pauline Marie J.; Menil, Kiarrah R.; Sampani, Ma. Mitchie N.', 'Lagmay, Marvin S.', '2020', '2020-05-15', 'DC007'),
('CP008', 'CAREFUL: A MOBILE-BASED ROAD ALERT APPLICATION FOR ROAD SAFETY PRECAUTIONS USING GEOFENCING API', 'CAREFUL reduces road-accident risk by alerting pedestrians to nearby lanes and drivers to accident-prone areas via geofencing. The Android app notifies overspeeding, jaywalking zones, blind curves, and crowded spots, encouraging safer behavior. It promotes tech adoption for road safety and offers future potential for expansion.', 'road safety, geofencing, mobile alert, pedestrian, driver awareness', 'Good, Daryl Kate T.; Ormo, Shenny Maree C.', 'Mozo, Nancy S.', '2020', '2020-06-05', 'DC008'),
('CP009', 'TRAVIL: A MOBILE APPLICATION COMPLAINT TOOL FOR TRAFFIC VIOLATIONS AND INCIDENTS USING LIVE VIDEO FEED AND REAL-TIME LOCATION TRACKING', 'TRAVIL aids Davao City traffic enforcers by letting citizens submit live-video reports of violations with GPS coordinates. Built in Ionic/Java, it streams evidence, shortens response time, and compensates for limited CCTV coverage and personnel.', 'traffic violation, live video, GPS tracking, complaint tool, smart city', 'Dimaano, Frances Mae G.; Florida, Rio Jessa Mae N.', 'Ricablanca, Eric P.', '2020', '2020-06-15', 'DC009'),
('CP010', 'LEARNDYS: AN EDUCATIONAL LEARNING APPLICATION FOR DYSLEXIC CHILDREN USING R.A.S.E. MODEL', 'LearnDys delivers cognitive and psychomotor activities for dyslexic children aged 3-6, following the R.A.S.E. model. The mobile app offers early-intervention exercises to improve reading and motor coordination, with expert input from special-education professionals.', 'dyslexia, early intervention, R.A.S.E. model, educational app, cognitive skills', 'Jumang-it, Jonell P.; Lamberte, Aira Camille H.; Ruelo, Amanda Jane L.', 'Lagmay, Marvin S.', '2020', '2020-12-01', 'DC010'),
('CP011', 'PACOOL: A WEARABLE DEVICE PROVIDING COOLING EFFECT TO PREVENT HEAT-RELATED ILLNESSES USING PELTIER MODULE', 'PaCool is a wearable wrist-and-upper-arm device employing a Peltier module to cool the body when temperature sensors detect heat-stroke thresholds. A companion app displays real-time body temperature, aiming to protect vulnerable groups during heat waves.', 'heat-stroke prevention, wearable cooling, Peltier module, body-temperature monitoring', 'Jhon Vincent B.; Manito, Ara Noreen S.; Caturza Jr., George C.', 'Ricablanca, Eric P.', '2020', '2020-06-20', 'DC011'),
('CP012', 'COPIoT: A WEB-BASED MONITORING SYSTEM FOR AUTOMATED COPRA DRYING PROCESS', 'COPIoT integrates an artificial copra-drying machine with a web dashboard to monitor real-time moisture and automate drying for small coconut farmers. It balances drying pace and quality, helping overcome traditional sun-drying drawbacks.', 'copra drying, IoT monitoring, coconut farming, moisture control, web dashboard', 'Canlog, Noemi Andreyanne L.; Torrefiel, Leonel; Pantinople, Cleo B.', 'Lorilla, Franch Maverick A.', '2020', '2020-06-25', 'DC012'),
('CP013', 'E-MONGANI: A MOBILE APPLICATION FOR MARKETING RICE THROUGH A BIDDING SYSTEM', 'E-MONGANI is an e-commerce mobile app that links rice farmers and buyers via bidding. Farmers set minimum prices, mitigating income loss from the Rice Tariffication Law. Developed with Scrum, the app widens market reach and strengthens farmer profitability.', 'rice marketing, bidding system, e-commerce, palay, farmers', 'Alegrado, Ina P.; Hagunob, Trisha Marie V.; Robles, Angelika Mari O.', 'Lagmay, Marvin S.', '2022', '2022-06-10', 'DC013'),
('CP014', 'DAMAGEXPERT: A MOBILE-BASED APPLICATION FOR THE IDENTIFICATION OF DAMAGES CAUSED BY RICE LEAF BLAST AND RICE STEM BORER WITH CONTROL MEASURES', 'DAMAGE-Xpert assists farmers in distinguishing rice leaf-blast and stem-borer damage via image recognition and provides tailored Integrated Pest Management advice. The app aims to reduce crop losses by ensuring correct treatment decisions.', 'agritech, rice disease, leaf blast, stem borer, pest management, mobile app', 'Celocia, Kenneth King Jones M.; Licera, Rona P.; Tiu, Roxan S.', 'Jandayan, Michael Anthony R.', '2022', '2022-07-15', 'DC014'),
('CP015', 'TREKUP: A MOBILE APPLICATION FOR MOUNTAINEERS TO PROVIDE TRAIL MAPS AND LANDMARKS', 'TREKUP is a mobile app designed to assist mountaineers by providing trail maps, landmarks, and essential information such as hike difficulty, duration, and preparation tips. Aimed at preventing accidents due to lack of trail knowledge, the app helps hikers choose optimal routes and stay safe during treks.', 'mountaineering, trail maps, hiking app, outdoor safety, landmarks', 'Calleado, Melisa C.; Alcuizar, Emmabelle L.; Pama, Mark Ian', 'N/A', '2022', '2022-05-20', 'DC016'),
('CP016', 'Scrap-E: A WEB SCRAPING-BASED SYSTEM FOR FILTERING ELECTRONIC WORD-OF-MOUTH OF E-COMMERCE WEBSITES', 'Scrap-E is a web scraping system that extracts and filters electronic word-of-mouth (eWOM) from e-commerce websites. Using sentiment analysis, it identifies relevant customer feedback related to service, value, shipping, and product quality. The system provides insights into positive and negative reviews, helping businesses manage their brand perception more effectively.', 'eWOM, sentiment analysis, web scraping, e-commerce, customer feedback', 'Aguilar, Aimee Grace D.; Antalan, Akela Paulene B.; Valenzona, Shekinah Jane E.', 'Gamboa, Randy S.', '2022', '2022-06-20', 'DC017'),
('CP017', 'I-REFERMO: A WEB-BASED REFERRAL PLATFORM FOR ENHANCING BUSINESS WITH ONLINE INFLUENCERS', 'I-ReferMo is a web-based referral system connecting business owners with social media influencers. It allows users to filter and select influencers based on metrics and supports communication through email. Developed using SCRUM, the platform helps businesses improve their marketing reach through curated influencer partnerships.', 'referral system, influencer marketing, web platform, business promotion, social media', 'Alfafara, Lean Gabriel S.; Sapar, Ivan Rhay Jeferson C.; Arabejo, Kurt Russel D.', 'Mercado, Tamara Cher R., PhD', '2022', '2022-06-20', 'DC018'),
('CP018', 'PARADA: Mobile-based Real-time Public Utility Jeepney Tracking App', 'PARADA is an Android application that tracks real-time location and arrival of PUJs along Mahayag-Acacia routes. It displays available seats, estimated time of arrival, and driver earnings. Built using RAD methodology, it aims to reduce commuter stress and improve route visibility, though performance depends heavily on internet connectivity.', 'PUJ tracking, public transportation, jeepney, real-time location, commuter app', 'Arnado, Hazel Joy B.; Cabrera, Joshua James D.; Jumlani, Abdur Rahim C.', 'Ricablanca, Eric P.', '2020', '2020-07-15', 'DC019'),
('CP019', 'ModernBasurero: DEVELOPING AN EFFICIENT WASTE COLLECTION', 'ModernBasurero is a mobile app that modernizes garbage collection using Firebase and Google Maps. It supports three user levels (admin, resident, collector) and allows real-time tracking of garbage collection. It aims to prevent uncollected trash, improve route planning, and facilitate timely pickups. Future improvements include image processing and a centralized web portal.', 'waste collection, mobile application, Firebase, Google Maps, real-time tracking', 'Neñeria, Marie Mae G.; Borlaza, Melissa M.; Pausang, Aizle Bianca C.', 'Villamor, Maureen M.', '2022', '2022-05-15', 'DC020'),
('CP020', 'DESIGN AND DEVELOPMENT OF A BLOCKCHAIN-BASED E-COMMERCE WEBSITE', 'This project integrates blockchain technology into an e-commerce platform to secure and validate information while promoting locally made Filipino products. It ensures product authenticity and seller rights using smart contracts, addressing fraud and promoting cultural identity through protected digital commerce.', 'e-commerce, blockchain, smart contract, Filipino products, online marketplace', 'Llanto, Leo L.; Agbay, Jim Bryan T.; Lagra, Cherry Rhodlyn P.', 'Tupas, Hermoso J. Jr.', '2022', '2022-07-15', 'DC021'),
('CP021', 'STUDYMATE: A STUDY PEER RECOMMENDER APP USING RECIPROCAL RECOMMENDATION ALGORITHM', 'STUDYMATE is a mobile application that uses a reciprocal recommendation algorithm to match students with compatible study peers based on traits, communication openness, and personality. The system fosters informal learning communities and was built using the modified waterfall model for flexibility in development.', 'peer recommender, study group, reciprocal recommendation, matching algorithm, student learning', 'Rosario, Lawrence Christopher G.; Gubaton, John Eric Paolo R.; Peligor, Richard B.', 'Dumdumaya, Cristina E.', '2022', '2022-06-30', 'DC024'),
('CP022', 'STRESSSENSE: A STRESS LEVEL DETECTOR FOR DETERMINATION OF STRESS LEVEL THROUGH PHYSIOLOGICAL DATA', 'STRESSSENSE is a wearable stress detection device that uses Galvanic Skin Response (GSR) and pulse sensors to assess stress levels among university students. Based on fuzzy logic, it interprets physiological responses and displays stress results via Arduino serial monitor, helping individuals monitor their mental health.', 'stress detection, GSR, pulse rate, wearable device, fuzzy logic, Arduino', 'Arbizo, Arvin Garret A.; Balansag, Marc Louie L.; Carpesano, Christy Hyacinth C.', 'Reyes, Ariel Roy L.', '2022', '2022-02-15', 'DC025'),
('CP023', 'ATONGSECRET: A WEB-BASED FILE SHARING AND MESSAGING APPLICATION USING IMAGE STEGANOGRAPHY', 'ATONGSECRET is a secure messaging platform that hides messages and files inside images using Least Significant Bit (LSB) steganography. Developed with PHP, MySQL, and JavaScript, it supports private communication, push notifications, and file concealment, ensuring data privacy through image-based security.', 'steganography, secure messaging, image hiding, LSB, web application', 'Alfanta, Bryle G.; Duran, Joshua Chris M.; Rosal, Brad Ford D.', 'Lagmay, Marvin S.', '2022', '2022-06-10', 'DC026'),
('CP024', 'ISDACULTURE: An IoT–Based Water Temperature and Dissolved Oxygen Level Monitoring System for Milkfish Farming', 'ISDACULTURE is a smart fish pond monitoring system that uses temperature and DO sensors to alert milkfish farmers of unfavorable pond conditions. With real-time monitoring and automated actuator control, the system helps ensure optimal aquaculture conditions and reduce fish mortality.', 'aquaculture, IoT, dissolved oxygen, temperature sensor, fish farming', 'Betonio, Angelica Mae G.; Ondap, Jomari D.', 'Machica, Ivy Kim D.', '2021', '2021-08-30', 'DC027'),
('CP025', 'UVwearIoT: AN IoT BASED WEARABLE DEVICE FOR UVI AND PULSE RATE MONITORING', 'UVwearIoT is a wrist-wearable IoT device that monitors ultraviolet index (UVI) and pulse rate. Connected via Bluetooth to a mobile app, it alerts users of high UVI and abnormal pulse rates with sound and visual notifications, aiding health monitoring and UV safety awareness.', 'wearable tech, UV sensor, pulse monitoring, IoT, health monitoring', 'Benalet, Carmilla; Lape, May Flor; Sorima, Reno Roy', 'Tupas Jr., Hermoso', '2021', '2021-06-25', 'DC028'),
('CP026', 'EMPATHYVR: A LEARNING COMMUNICATION PLATFORM FOR CHILDREN WITH AUTISM', 'EMPATHYVR is a virtual reality learning platform developed to assist children with autism in improving their communication skills. The VR-based game utilizes progressive levels to enhance user focus and engagement, allowing monitored tracking of learning outcomes. Despite challenges during COVID-19, the project demonstrated potential as an assistive technology for early intervention in autism.', 'autism, virtual reality, assistive technology, communication, learning game', 'Diola, Dionne Evony M.; Roxas, Bebe Mae J.; Taghoy, Audrey Marie M.', 'Tupas, Hermoso Jr.', '2021', '2021-01-15', 'DC029'),
('CP027', 'SOS’IoT: A Noise Monitoring and Warning Tool for Barangay', 'SOS’IoT is a noise monitoring system developed to help barangay officials manage noise pollution. Using an Arduino-based ESP8266 and KY-038 microphone, it analyzes decibel levels and displays data via an Android app. Developed with RAD methodology and a simulator due to lockdown constraints, it promotes awareness and further development in mobile environmental monitoring.', 'noise pollution, IoT, barangay tool, Arduino, RAD, Android app', 'Maxino, Chuzelyn D.; Rubia, Judelyn N.; Vidal, Johanna Mae.', 'Villamor, Maureen M.', '2021', '2021-06-10', 'DC030'),
('CP028', 'RedPing: An IoT-Based Flood Detection System for Urban Areas', 'RedPing is a flood detection system aimed at urban streets using sonar sensors housed in pole structures. The system sends flood level data to a central server and displays it in a progressive web application to help users plan transport routes. The system is scalable, low-cost, and developed for mass deployment.', 'flood detection, urban flooding, IoT, sonar sensors, progressive web app', 'Cortes, Eugene L.; Baobao, Shareld Rose A.; Centillas, Dyesebel T.', 'Tupas, Hermoso Jr.', '2021', '2021-10-10', 'DC031'),
('CP029', 'IOTae: A WEB BASED MONITORING SYSTEM FOR HARMFUL ALGAL BLOOM GROWTH IN PONDS', 'IOTae monitors algal bloom in ponds using sensors for water temperature, pH, and dissolved oxygen. The system provides real-time notifications and triggers aeration when thresholds are met. Developed with the Modified Waterfall Model, it enables early detection of environmental threats in aquaculture.', 'algal bloom, IoT, water quality, environmental monitoring, aquaculture', 'Taganahan, Jay Mark H.; Penanueva, Quenie Marie D.; Lumen, Mark B.', 'Reyes, Ariel Roy L., DIT', '2021', '2021-12-10', 'DC032'),
('CP030', 'Project T-RAT: AN IOT BASED SMART – TRAPPER FOR RATS', 'Project T-RAT is an IoT-based smart trap that captures rats using weight, infrared, and camera sensors. It ensures accurate trapping and sends real-time notifications to users. The system was tested for sensor precision, trap activation, and user safety features, proving effective in rodent control.', 'rat control, smart trap, IoT sensors, pest management, mobile notification', 'Drilon, Jay Ar; Hermoso, Romel M.', 'Reyes, Ariel Roy L.', '2021', '2021-12-20', 'DC033'),
('CP031', 'HAPPAG: A MOBILE APPLICATION CONNECTING FOOD DONORS AND DONEES TO PREVENT FOOD WASTES', 'HAPPAG is a mobile app designed to connect food donors and donees to reduce food waste. The app maps donors and recipients using Google Maps API and supports real-time chat via Socket.IO. Developed using agile methods, it enables establishments and households to donate excess food or compostable waste effectively.', 'food waste, donor-recipient app, food composting, Socket.IO, Google Maps', 'Adorable, Mary Rose C.; Remis, Faye Hazel V.; Mahinay, Aries Dominic H.', 'Dr. Quimno, Val A.', '2021', '2021-06-15', 'DC034'),
('CP032', 'DIPRICE: A RICE QUALITY IDENTIFIER USING DIGITAL IMAGE PROCESSING', 'DIPRICE is a mobile app that identifies rice quality using digital image processing. It classifies rice as premium, medium, or low quality based on impurity detection and image datasets. Using the RAD model and Matlab Thresholding, the system achieved a 77% overall accuracy rate.', 'rice quality, digital image processing, Matlab, mobile app, impurity detection', 'Ontolan, Raymund F.; Viernes, Jazzy Bert S.', 'Gamboa, Randy S.', '2021', '2021-05-20', 'DC035'),
('CP033', 'HeHaSpot: A Human Health Hazard Web and a Mobile Surveillance Application', 'HeHaSpot is a mobile and web-based platform for reporting hazardous waste in barangays. Users report environmental risks which are categorized by severity. Developed using RAD, the system includes Android, Adobe XD, and web admin tools to support health hazard awareness and action.', 'environmental hazard, mobile reporting, health surveillance, RAD, barangay', 'Agcol, Vil Marie A.; Calzada, Ellen Mae G.; Clenista, Junard John C.', 'Pelias, Leah O.', '2021', '2021-12-15', 'DC036'),
('CP034', 'SPEEDISOR: A WEB AND MOBILE-BASED APPLICATION TO MONITOR TAXI DRIVER SPEED LIMIT VIOLATION USING A REAL-TIME LOCATOR', 'SPEEDISOR is a real-time speed monitoring system for taxis that logs violations and aids operator oversight. Built with GPS and mobile/web integration, it logs overspeeding events and assists in enforcing safe driving practices.', 'speed monitoring, GPS, taxi violation, web-mobile app, transportation safety', 'Albutra, Pauline Grace C.; Buquia, Rennjo D.; Lungay, Darleen S.', 'Ricablanca, Eric P.', '2021', '2021-07-15', 'DC037'),
('CP035', 'HALINON: A CROWDSOURCED PRODUCT TRENDS AND COMPETITION INFORMATION WEBSITE', 'HALINON is a website for MSMEs to access market trend data based on crowdsourced information. It helps small businesses identify product demand and competition using location-based analytics and simulated marketplace data.', 'MSME support, market trends, web analytics, crowdsourcing, product competition', 'Dulay, Jumar H.; Esgana, Jehoiakim Jade C.; Rivera, John Jay A.', 'Villamor, Maureen M.', '2021', '2021-08-20', 'DC038'),
('CP036', 'BreakApp: A WEB & MOBILE CIRCUIT-BREAKER MONITORING SYSTEM USING ARDUINO CURRENT SENSORS', 'BreakApp uses Arduino current sensors and an ESP32 to stream breaker-line amperage to a Laravel/Vue web panel and Flutter mobile app, instantly flagging over-current, warning, or critical states in USeP-Engineering.  Field deployment reduced manual tracing time by 75 %.', 'circuit breaker, current sensor, Arduino, web dashboard, campus power', 'Carreon, Harris B.; Cutamora, Kent Charles; Tabasa, Hyacinth Faye A.', 'Gamboa, Randy S.', '2021', '2021-06-15', 'DC039'),
('CP037', 'DRIVECARE: A WEARABLE DEVICE FOR DRIVER DROWSINESS DETECTION VIA EYEBLINK ANALYSIS', 'DRIVECARE integrates an eye-blink IR sensor with a NodeMCU that beeps and vibrates when eyelid-closure patterns signal drowsiness.  Agile development and lab testing with 30 drivers yielded 88 % accuracy and strong user acceptance.', 'driver safety, drowsiness, wearable sensor, eye blink, IoT', 'Decierdo, Allen Grace S.; Dumangas, Queenie L.; Merecuelo, Kristine Mae D.', 'Machica, Ivy Kim D.', '2021', '2021-06-22', 'DC040'),
('CP038', 'TransBraille: A MOBILE APPLICATION FOR BRAILLE TRANSLATION USING DIGITAL IMAGE PROCESSING', 'TransBraille captures Grade-1 and Grade-2 Braille via smartphone and converts it to English or Filipino text using OpenCV contour detection and a Firebase lexicon.  Classroom trials cut manual transcription time by 60 %.', 'braille OCR, image processing, accessibility, mobile vision, OpenCV', 'Coquilla, Angelica B.; De Claro, Jeelenee Jayson L.; Martinez, Kyle Matthew C.', 'Mercado, Tamara Cher R., PhD', '2021', '2021-06-28', 'DC041'),
('CP039', 'FINDING SAFETY IN TECHNOLOGY: A LIVE-VIDEO & LOCATION-PIN CRIME-REPORTING SYSTEM', 'The system pairs an ESP32-Cam panic button with Android (civilian) and Kotlin (police) apps.  Haversine geolocation plus live-feed transmission cuts police dispatch time; a web map plots crime-density hotspots for resource allocation.', 'crime reporting, live video, geolocation, ESP32-Cam, public safety', 'Boo, Jahmicah Nissi F.; Gonzales, Mary Elisse G.; Regalado, Maruela Angela A.', 'Rogers, Jamal Kay B.', '2021', '2021-07-18', 'DC042'),
('CP040', 'SAFE2IOT: AN AUTOMATED GREYWATER FILTRATION & QUALITY-MONITORING SYSTEM', 'Safe2IoT separates grey- from black-water, filters reusable water through multi-stage media, and monitors pH, turbidity and conductivity via ESP8266 sensors.  RAD-built web dashboard logs metrics and triggers alerts; lab tests achieved 90 % turbidity reduction.', 'greywater, IoT filtration, water quality, sustainability, ESP8266', 'Castro, Joshua Antonio N.; Dela Cruz, Elnathan Timothy C.; Agantal, Jawad L.', 'Mozo, Nancy S.', '2021', '2021-06-30', 'DC043'),
('CP041', 'PaSwap: A Web-Based Decentralized Cryptocurrency Exchange (DEX) Platform', 'PaSwap is a decentralized P2P cryptocurrency trading platform designed for Filipino traders. It features MetaMask integration, direct user-to-user trading, and cross-device support. The system addresses security and privacy issues while promoting fast and low-cost transactions. As an early-stage system, it contributes to research and development in the DEX space.', 'cryptocurrency, decentralized exchange, P2P trading, MetaMask, blockchain', 'Badanoy, Delight C.; Jagunos, Aldren Joy A.; Talipan, Rafiaa J.', 'Amante, Cheryl R.', '2023', '2023-06-10', 'DC045'),
('CP042', 'AgrE: A Secured E-Commerce Platform for Trading Agricultural Commodities in the DFTC', 'AgrE is a secure e-commerce system created for the Davao Food Terminal Complex (DFTC) to help farmers find buyers and process transactions online. The platform features 2FA, password encryption, and automated sales tracking to secure user data and streamline operations.', 'e-commerce, agriculture, DFTC, transaction tracking, 2FA security', 'Sabal, Daniel R.; Saligumba, Justin Jade F.', 'Tequin, Vera Kim S.', '2023', '2023-08-15', 'DC046'),
('CP043', 'PaReserve: A Customizable Reservation Platform for Medium-Size Hotel Owners and Customers with Fraud and Theft Prevention', 'PaReserve is a web-based reservation system for hotels that focuses on identity fraud prevention through user verification, feedback systems, and merchant reporting. The platform includes features such as 2FA, PayMongo integration, and administrative controls. It also emphasizes security improvements including SSL and payment method expansion.', 'hotel reservation, identity theft prevention, e-commerce, user verification, PayMongo', 'Canizares, Lonivel John C.; Dimpas, Christian Jason N.; Uy, Jason Ray D.', 'Pelias, Leah O.', '2023', '2023-08-20', 'DC047'),
('CP044', 'PIGGYWEARIOT: A Pig Cough Surveillance System Using an IoT-Enabled Wearable Device', 'PIGGYWEARIOT is an IoT-based wearable system that monitors pig coughs to detect respiratory illness and African Swine Fever early. It uses a machine learning model with over 91% accuracy, and a web application for remote farm monitoring with push notification alerts.', 'IoT, livestock monitoring, pig health, machine learning, wearable tech', 'Bollanday, Jian Luigi C.; Borleo, Richie Floyd C.; Lao, John Loyd A.', 'Rogers, Jamal Kay B.', '2023', '2023-08-25', 'DC048'),
('CP045', 'ANALINK: A Mobile-Based Application for Detecting Malicious URLs by Checking SMS Content', 'Analink is a mobile application developed to detect potentially malicious URLs embedded in SMS messages in real-time. Using a blacklist database and a cross-reference API, it scans incoming SMS and alerts users when suspicious links are found. With an 89% detection accuracy, Analink aims to combat smishing attacks and enhance user digital security.', 'smishing, mobile security, malicious URL detection, SMS filtering, real-time alert', 'Cajetas, Katherine Joy S.; Lee, Arman Rex L.', 'Reyes, Ariel Roy L.', '2023', '2023-06-15', 'DC049'),
('CP046', 'KAPETa: Design and Development of Web-Based E-Commerce Application for Coffee Startups in Davao City', 'KAPETa is an e-commerce platform designed for small coffee businesses in Davao City to enhance online presence, streamline inventory, and improve market reach. Using insights from local shop owners, it was built to promote growth and sustainability in the coffee industry by addressing product management, market access, and digital branding.', 'coffee business, e-commerce, small business, digital platform, inventory management', 'Serbo, Richelle Anne S.; Tubal, Angel Menrica B.', 'Tupas, Hermoso Jr.', '2023', '2023-08-10', 'DC050'),
('CP047', 'STOCKWISE: An Inventory Management and Demand Forecasting System for Food Retailers', 'STOCKWISE is a system for food retailers that integrates inventory management and demand forecasting using Simple Moving Average (SMA). It features restock planning based on historical sales, budget, and demand, reducing the risk of overstocking or stockouts. Developed using the RAD model, it improves operational efficiency and profitability.', 'inventory system, demand forecasting, food retail, stock management, RAD', 'Libron, Kassandra Mariz S.; Atanoso, Bazty Z.; Cosgape, Andrea S.', 'Mozo, Nancy S.', '2023', '2023-05-25', 'DC051'),
('CP048', 'PRIVACY QUEST: A Data Privacy Awareness Game for Teenagers', 'PRIVACY QUEST is a 2D simulation game developed to raise awareness of data privacy among teenagers. Based on Yusoff’s framework for serious games, it fills the gap in available training materials for youth on online privacy, teaching them how to protect personal data in a fun and engaging way.', 'data privacy, educational game, awareness, youth education, gamified learning', 'Bunsay, Vincent Karl Jofferson D.; Montebon, Clark Jasper B. II; Paid, Ron Angelo N.', 'Gamboa, Randy S.', '2023', '2023-05-15', 'DC052'),
('CP049', 'DESIGN AND DEVELOPMENT OF Web-Based Data Privacy Assessment Tool for the University of Southeastern Philippines', 'This project developed a web-based Privacy Impact Assessment tool tailored for the University of Southeastern Philippines. It allows authorized personnel to assess privacy risks, visualize data flows, and generate reports to ensure compliance and data security. Interviews with the university DPO helped align the system with institutional standards.', 'data privacy, PIA, risk assessment, educational tool, web application', 'Gumbao, Edjery Gabriel C.; Sandoval, Reyjet R.', 'Tupas, Hermoso J. Jr.', '2023', '2023-06-20', 'DC021'),
('CP050', 'BOXDOTS++: Quick-Response Code Scanner with Malicious, Safe, and Dead URL Detection', 'BOXDOTS++ is an Android app that scans QR codes and classifies embedded URLs as malicious, safe, or dead in real-time. It integrates VirusTotal and Google Safe Browsing APIs plus a secondary blacklist repository. Bench-mark testing shows higher accuracy—especially on dead-link detection—than comparable scanners, and a SUS score of 76.7 confirms strong usability.', 'QR code, smishing, URL classification, VirusTotal, Google Safe Browsing, Android', 'Dabuan, Jainah Marie C.; Pueblos, Cindy Mae', 'Mozo, Nancy S.', '2023', '2023-12-10', 'DC054'),
('CP051', 'PREDICTALYST: A Human-Resource Management System for Predicting Employee Attrition Using Predictive Analytics', 'PREDICTALYST is a web HR system that predicts employee attrition via a Random Forest model exposed through an API. It provides dashboards and real-time visualizations so HR can intervene early, improving retention decisions.', 'employee attrition, predictive analytics, Random Forest, HR analytics, web dashboard', 'Mataflorida, Hector M.; Pelale, Johndell Laurence B.', 'Rogers, Jamal Kay B.', '2023', '2023-05-25', 'DC055'),
('CP052', 'PARAQUEUE: A Real-Time Public-Utility-Vehicle Information Tracking System', 'PARAQUEUE combines a driver registration web portal, commuter mobile app, live GPS tracking and seat-vacancy reporting for jeepneys on five Davao City routes. Built with the RAD model, it lessens commuter uncertainty and helps drivers manage trips efficiently.', 'PUV tracking, real-time location, jeepney, seat availability, RAD methodology', 'Elacion, Elijah James E.; Maranan, Francis Dave Y.; Mesajon, Justin John O.', 'Rogers, Jamal Kay B.', '2023', '2023-05-30', 'DC056'),
('CP053', 'LAON: Leaf-Color-Chart (LCC) Application for N-Fertilization Management in Rice', 'LAON digitizes IRRI / PhilRice Leaf-Color-Chart guidance. Using K-NN on leaf-image RGB values, it suggests nitrogen schedules and pushes 7-day reminders. Weather-forecast integration improves recommendation timing.', 'rice farming, nitrogen management, leaf color chart, K-NN, mobile agriculture', 'Canete, Ezza Mae H.; Celerian, Shaira B.; Engalan, Joeben P.', 'Rogers, Jamal Kay B.', '2023', '2023-07-05', 'DC057'),
('CP054', 'ELIAS: A Personal Aliasing Management System', 'ELIAS generates secure aliases for user credentials, stores them in an encrypted vault, auto-fills via a browser extension, and logs login activity—reducing risks from data breaches and phishing.', 'alias management, identity protection, browser extension, credential vault, RAD', 'Alivio, Julius B.; Escoton, Francis Riedel T.; Misal, Donewill Christian D.', 'Lagmay, Marvin S.', '2023', '2023-05-20', 'DC058'),
('CP055', 'E-PAGDIWANG: A Customizable Web-Based Referral Platform for Event Organizers of MSMEs', 'E-Pagdiwang is a SCRUM-built web platform that matches clients with Davao City event organizers, featuring real-time chat, portfolio pages, and admin-mediated reporting to curb fraud and fake listings.', 'event management, MSME, referral system, SCRUM, web platform', 'Calunsah, John Kelvin M.; Jacaban, Robie Bryan B.; Tolento, Ricci Dee R.', 'Machica, Ivy Kim D.', '2023', '2023-06-18', 'DC059'),
('CP056', 'RECONSTRUCT: A Web-Based Marketplace and Geo-Finder of Construction and Demolition Recyclable Materials', 'ReConstruct lets sellers post recycled C&D materials with geotagging; buyers locate nearby stock and chat in-app. A subscription model funds operations while dashboards visualize landfill diversion metrics.', 'circular economy, C&D waste, recycled materials marketplace, geotagging, web app', 'Cabsobao, Trishia Mae P.; Daguplo, Ivy Alexist P.; Torres, Kailah Shane S.', 'Mozo, Nancy S.', '2023', '2023-05-28', 'DC060'),
('CP057', 'AEGUIDE: An Augmented-Reality and Simulation-Based Wayfinding Tool for Mild Intellectual Individuals', 'AEGUIDE uses AR directional arrows and street-view simulations (Google APIs) to teach navigation skills. Caregivers receive live-location updates and arrival notifications, fostering independence for users with mild ID.', 'wayfinding, augmented reality, intellectual disability, navigation training, caregiver alerts', 'Cubelo, Guia Anne G.; Gomez, Jonah Mae A.', 'Tupas, Hermoso Jr.', '2023', '2023-06-22', 'DC061'),
('CP058', 'BAGSAKAN: An Anti-E-Commerce-Fraud Platform for Crop-Bidding Transactions of Small-Scale Farmers and Vendors', 'Bagsakan is a secure bidding marketplace for wholesale crops that counters pagejacking, supplier-identity fraud, and bait-and-switch via SMS-OTP, duplicate-name detection, and user-report workflows.', 'agritech, crop bidding, e-commerce fraud, small-scale farmers, wholesale market', 'Booc, Kenneth Joseph V.; Go, Justine Alec A.; Siega, Allen Ray P.', 'Pelias, Leah O.', '2023', '2023-06-12', 'DC062'),
('CP059', 'DAYR: A Mental-Health Self-Monitoring Application', 'DAYR is a mobile journaling companion that encourages users to log feelings and thoughts; sentiment analysis highlights mood trends and offers CBT-based prompts, promoting early self-intervention.', 'mental health, self-monitoring, journaling app, sentiment analysis, CBT prompts', 'Caparas, Hersie Jean R.; Muana, Josephine P.', 'Abrigana, Hobert A.', '2023', '2023-08-05', 'DC063'),
('CP060', 'PROJECT TAPPERWARE: A System for Detection of Unauthorized Electricity Connection Based on IoT-Enabled Electricity Meter', 'Project Tapperware delivers an IoT-enabled smart meter that compares supply-side and load-side currents to flag real-time anomalies caused by illegal tapping. A mobile app shows live kWh graphs and pushes theft alerts. Lab trials on a residential miniature with simulated taps proved the comparative-current method can pinpoint unauthorized connections instantly, improving electrical-safety response and billing integrity.', 'power theft, smart meter, IoT, electricity monitoring, current comparison, mobile alerts', 'Amar, Chris Earl S.; Go, Joel Miller M.; Salvador, Neuqian Rhys S.', 'Abrigana, Hobert A.', '2023', '2023-05-18', 'DC064'),
('CP061', 'E-CRUNCH: A MOBILE APPLICATION OF BASKETBALL COACH\'S ASSISTANT DECISION SUPPORT SYSTEM', 'Basketball is a standout amongst the most prominent sports on the planet, which conveys a lot of satisfaction to people in their day-to-day life. It\'s a sport where the coach\'s decisions play a fundamental role in the game and which in turn creates pressure on the coach\'s decision-making capability. Since data is available almost everywhere, utilizing available data can be a gateway to new solutions and opportunities. Our dissertation addresses the question of how utilizing data can help the coach in the court where a lot of potential helpful data is available, data driven coaching is a solution that can significantly help the coach on his/her decisions especially at crunch time where the pressure might affect a coach\'s mentality and decisions. The mobile application, E-Crunch, suggests basketball plays and displays the probability of success of the said play, which helps the coach in creating a data backed decision.', 'Basketball, Coach Assistant, Data-Driven, Decision Support System, Mobile Application', 'Abenoja, Donell D.; Mateo, Lorenzo Lolek R.', 'Quimno, Val A.', '2020', '2016-08-22', 'DC065'),
('CP062', 'KeyMouTion: A WINDOWS-BASED PROGRAMMING TOOL FOR DETECTING BOREDOM AND FRUSTRATION WHILE PROGRAMMING IN ASSESSING TEACHER-STUDENT RELATIONSHIP', 'Programming is challenging for novices. Hence, it is important that help must be provided once the students get discouraged. The lack of intervention from the teacher is one of the reasons why students choose to disengage from their programming task and eventually drop out from the course. It is for this reason that the proponents aimed to develop a programming tool that collects data every 10 minutes and after an hour detects student frustration and boredom in real-time, where teachers can be given a cue when to provide immediate feedback to the students. Keystrokes and mouse movements are collected and analyzed as studies have shown that student affect can be reflected from them. The Circumplex model was used as the framework to determine which quadrant of arousal and valence does boredom and frustration belong to. Due to the COVID-19 pandemic, no actual student testers were gathered so the proponents were left with no actual data to run the model. Instead, a proposed framework was used to determine whether the keystroke combinations, mouse behaviors, and other activities tantamount to boredom or frustration. A user interface was designed for teachers where they can monitor the student keyboard and mouse activities. The interface includes a display that indicates if the student needs to be monitored or if the student needs help already as indicated by his/her boredom and frustration levels.', 'Programming, Boredom Detection, Frustration Detection, Teacher Feedback, Circumplex Model', 'Niebby Jen B. Barez; Mae Amor C. Galleto; Kim Clarizze R. Remolta', 'Maureen M. Villamor, Ph.D', '2020', '2016-08-22', 'DC066'),
('CP063', 'ON THE SUITABILITY OF CACAO UNDER FUTURE CLIMATIC CONDITION IN THE PHILIPPINES: A NEURAL NETWORK MODELLING', 'This study was conducted to investigate the effect of climate change in relation with the cacao suitability in the Philippines. Climatic data are extracted under near-current periods (1970–2000), 2030s (2020–2049) and 2050s (2040–2069) and changes in cacao suitability was assessed using Artificial Neural Network (ANN) modelling approach. The best model indicated that the land index for cacao suitability is between 49.51 to 79.31 for near-current; 48.36 to 75.86 for 2030s and 48.00 to 74.34 for 2050s. This categorizes the suitability class of cacao into marginally suitable (S3) to highly suitable (S1) for the near-current and 2030s periods while dropping to only marginally suitable (S3) to moderately suitable (S2) by 2050s. Specifically, across the high suitability (S1) areas in the Philippines, there is a projected decrease from 65,853 km² (near-current) to 31,357 km² by 2030s and 23,458 km² by 2050s; a change by -9.84% and -12.1% for the future periods, respectively. Regions of Luzon (excluding Palawan), Palawan, Visayas, Western Mindanao and Southern Mindanao will experience a decrease in its S1 areas which is primarily attributed to the projected increase in mean and max temperature and rainfall variability in the future. The most pronounced change is measured in Western Mindanao with -84.26% followed by Luzon with -80.18% by 2050s. Moreover, the results indicated that ANN approach was able to perform cacao suitability prediction with satisfactory results of a Mean Square Error (MSE) of 3.74e-6 and correlation of determination (R²) of 0.99981414.', 'Cacao, Climate Change, Neural Network, Suitability, Philippines', 'Getigan, Jonel C.; Ramos, Exceed Renz M.; Villanueva, Benser Jan P.', 'Tupas, Hermoso Jr. J.', '2020', '2016-08-22', 'DC067'),
('CP064', 'SNAPDRIVE: An Alternative Security System for Motorcycle Theft Prevention via Face Recognition Using a Modified Local Binary Pattern Histogram Algorithm with Blink Detection on Raspberry Pi', 'The problem with motorcycle theft has been never-ending and has been regarded as a property crime with one of the highest occurrences... Ultimately, the objectives of the proponents were met.', 'Motorcycle Theft, Face Recognition, Raspberry Pi, Security System, LBP, Blink Detection', 'Anden, Joven Rey; Badalo, Ray Neal; Sy, Michael P.', 'Jandayan, Michael Anthony R.', '2021', '2017-08-22', 'DC068'),
('CP065', 'Semantic Search Engine of E-Commerce Using Natural Language Processing', 'Most e-commerce platforms today still use traditional keyword-based search engines on their websites... In the future, the researchers suggested venturing into the refinement of product categorization through additional Natural Language Processing (NLP) techniques such as ontologies and other techniques such as Machine Learning Classification.', 'Semantic Search, E-commerce, NLP, Search Engine, Elasticsearch', 'Mangaron, Andrei P.; Mangasar, Nico M.; Valdez, Vanne Moelle V.', 'Villamor, Maureen M.', '2022', '2018-08-22', 'DC069'),
('CP066', 'Detecting COVID-19 Fake News Infodemic Using Hybrid Algorithm', 'Fake news on social media and other forms of media is widespread and a primary source of concern... This study attempts to construct...', 'Fake News, Infodemic, COVID-19, Hybrid Algorithm, Social Media', 'Arandela, Yvonne Grace F.; Cossid, Raschelle L.; Pacilan, Graciella Marian M.', 'Amante, Cheryl R.', '2022', '2018-08-22', 'DC070'),
('CP067', 'A HYBRID MACHINE LEARNING MODEL USING COMPUBOX DATA FOR PREDICTING BOXING FIGHT OUTCOME AND WINNING CONDITION WITH BOXER STYLE CLUSTERING', 'The Philippines has excellent potential in boxing, but it has had more disappointments than victories in recent years, owing to the lack of resources invested in the boxers. To combat this, boxers must improve their performance and gain enough popularity to attract investments from private organizations. As a result, this study aimed to assist boxers and coaches by creating a model to help them create optimal training plans based on historical data analysis to understand the boxer and their opponents better. The model predicts the outcome and winning conditions of a match using the SVM algorithm and identifies the boxer\'s style using the K-means clustering algorithm. The prediction models were able to perform well using the CompuBox data, even with an unbalanced and lacking dataset. The results of the prediction models were Fine Tuned, resulting in 97% accuracy on the winning condition and 88% F1-Score for the outcome. For the validation, it had an accuracy of 90% on the winning condition and 69% F1-Score on the outcome. Out of 173 data points, the clustering model identified 55 boxers and their styles. The results show that boxers use a variety of styles throughout their careers. The styles used by the study are Swarmer, Slugger, and Outboxer. These results could provide coaches with information about their boxer aptitude or style. They could potentially improve their boxer\'s chances of winning matches by building, planning, and developing winning tactics based on the boxing style and the prediction outcome results.', 'Boxing, SVM, K-means, Machine Learning, Prediction', 'Earll J. Abule, Eugene Louis D. Rapal, Christian Ken A. Tayco', 'Jamal Kay B. Rogers', '2022', '2018-08-22', 'DC071');
INSERT INTO `capstone` (`CapstoneID`, `Title`, `Abstract`, `Keywords`, `Authors`, `Adviser`, `YearPublished`, `DateCreated`, `DocumentID`) VALUES
('CP068', 'A PREDICTIVE MODEL FOR SEA LEVEL RISE IN PHILIPPINE URBAN AREAS WITH AN INTERACTIVE MAP VISUALIZATION', 'Sea levels in the Philippines are rising rapidly, three times faster than the global average, posing a significant threat to coastal communities. To address this problem, a predictive model was created using the Random Forest Regression Algorithm which processes various data attributes that contribute to sea level rise. To optimize the data, different preprocessing techniques were applied, including feature selection, feature engineering, feature scaling, and hyperparameter tuning. The model\'s performance was evaluated using several metrics. It achieved a high R-Squared score of 0.88, Mean Absolute Error (MAE) of 2.9, Mean Squared Error (MSE) of 10.90, and Root Mean Squared Error (RMSE) of 3.30. The model identified that Greenhouse Gases like carbon dioxide and methane emerge as the most significant factors for predicting sea level rise. Meanwhile, the prediction concluded that sea level rise is expected to be over one (1) foot (0.3 meters) by the year 2100. To visualize the results of the study, an accompanying application was developed using R Shiny. This application provides an interactive visualization of the Philippines and demonstrates the potential coastal areas that may be affected by rising sea levels in the future. This tool enhances the understanding of the study\'s findings and allows users to explore the projected impacts visually. However, further exploration is recommended, including collecting more recent data and conducting a comprehensive scan of coastal areas, to improve the accuracy of the model. The data collected from Google Earth may not be comprehensive, so additional scanning of coastal areas is advisable to ensure completeness and accuracy.', 'Sea Level Rise, Random Forest, R Shiny, Visualization, Climate Change', 'Marc Jules B. Coquilla, Joma Ray A. Quinones, Haus Christian C. Salibio', 'Maureen M. Villamor', '2023', '2019-08-22', 'DC072'),
('CP069', 'DETECTING POTENTIAL FISHING ZONES WITH PROBABLE TOTAL CATCH USING FEATURE EXPLORATION AND MACHINE LEARNING', 'Fisheries are exposed to anthropogenic risks, oceanic destructions, and different weather changes which makes finding fish shoals needs considerable time and resources resulting in high cost and low profit to fishermen and adverse effects on socio-economic status. Hence, researchers were encouraged to adopt machine learning in detecting potential fishing zones. This study aimed to develop a model that detects Potential Fishing Zones (PFZs) by exploring different sea features as potential predictors, forecast probable fish catch quantity, seasonal fish catch behavior patterns within the trend along with visualizations. This study employed feature importance function to identify the feature importance scores of each predictor, and models were constructed using classification machine learning algorithms. Secondary data from India were used for training and Visayan Sea of Philippine data for testing the models. Researchers utilized ARIMA to forecast fish catch probable quantity, seasonality and trend. According to feature importance scores, Salinity and Sea Chlorophyll were the most significant sea features with optimal threshold values of 32.6 ppt and 0.18 mg/m3. Random Forest showed the highest accuracy score of 80.56% in predicting PFZs. ARIMA parameters were set to p as 5, d as 0, and q as 4 as they resulted the lowest AIC value of 1458.217, making the best fit for the model in forecasting. ARIMA model forecasted probable fish catch quarterly from years 2021-2026 and was able to exhibit the months for fish catch seasonality and trend. The results of the study can be utilized for better fishing methods and resource management. However, the model showed decreasing trend in forecasting probable fish catch as years increase due to potential sources of uncertainties.', 'Fishing Zones, Machine Learning, ARIMA, Sea Features, Prediction', 'Bezalel O. Delos Reyes, Joseven R. Francisco, Meichell Jynein J. Managing', 'Maureen M. Villamor', '2023', '2019-08-22', 'DC073'),
('CP070', 'PREDICTING WATER QUALITY USING MACHINE LEARNING IN AN AQUACULTURED ENVIRONMENT', 'Over the course of recent decades, the aquaculture industry has been growing at an exponential rate with their annual production. The overly increasing growth in human population has also increased the demand for consumption of aquatic products. As a result, several countries have resorted to aquaculture to meet their aquatic product needs. Fish just like any other animals have such specific physical and chemical needs that if these needs aren\'t supplied, the animals become stressed, and their health and survival are threatened. Water quality is composed of different components such as temperature and pH level and sudden changes on these variables proves to cause stress to fishes, can slow their growth, delay their reproduction and in the worst case scenario can cause death. A comprehensive study of the effects of stress in aquaculture management is crucial to grasp how it can result in reduced yield and subsequent financial loss. This study aims to know the condition of the aquacultured environment by determining the quality of water where the fishes are living. The researchers in this study developed three models that determined if the water quality is fitting for the aquacultured fish using SVM, KNN, and Decision Tree algorithm. The dataset was split by 70/30 and all the models were fine tuned using gridsearchCV for the model to have the best parameter for training. The DT performed best with a 98.17% accuracy and F-Score of 98%, while SVM placed second with a 82.83% accuracy and F-Score of 69% and the K-NN model had the worst performance among the three with a 76.66% accuracy and F-Score of 62%. This study concluded that the three prediction models were able to perform well but the decision tree model was the best performing one, thus contradicting other research studies that had SVM as the best performing model.', 'Aquaculture, Water Quality, Machine Learning, SVM, Decision Tree', 'Nickel Snow Apique, Samuel III Domingo, Elijah James Uytico', 'Vera Kim Tequin', '2023', '2019-08-22', 'DC074'),
('CP071', 'AUTOMATED SEMANTIC SEGMENTATION OF CANCEROUS CELLS IN MAMMOGRAM IMAGE USING NOVEL HYBRID CONVOLUTIONAL NEURAL NETWORK TECHNIQUES', 'In the Philippines, breast cancer holds the distinction of being the most prevalent cancer among women. As per data from the PSA and the Department of Health, roughly 3% of Filipino women are likely to receive a breast cancer diagnosis during their lifetime. Remarkably, in February 2017, the Philippine Obstetrical and Gynecological Society reported the highest incidence of breast cancer in the Philippines among 197 countries. Mammography has proven effective in identifying even early-stage breast cancers, making annual screenings crucial, particularly for women over 40. However, the accuracy of mammograms can be compromised due to variations in breast tissue, occasionally leading to false-negative results. Consequently, monthly self-examinations remain vital. Artificial Intelligence (AI) can enhance the diagnostic precision of mammograms. The ability of AI to process and interpret complex patterns in imaging data makes it a powerful tool for detecting subtle abnormalities often missed in manual screenings. AI\'s potential to reduce false negatives could significantly improve early breast cancer detection, complementing mammography and monthly self-examinations, thereby improving prognosis and survival rates. This study attempted to construct a novel hybrid model that segments cancerous cells in breast mammogram images. The researchers exhausted all the resources and searched all research databases and concluded this approach is novel as of this writing. The proposed hybrid model, substituting Resnet 152 on the Encoder block of Nested Unet (Unet++) model, was implemented. Intersection Over Union, DICE, and Binary Cross Entropy with Logits loss are used as indicators to measure the segmentation performance of the model. Custom Pre-Processing, Data Augmentation, Hyperparameters, and Fine Tuning was utilized in the study. The researchers achieved an accuracy as high as 95% with a mean and median detection score of IOU (67.57%) and DICE (68.40%), experimental results showed that the proposed model did great with limited dataset and did not overfit or underfit according to...', 'Mammogram, Cancer Detection, Deep Learning, Segmentation, Unet++', 'Isidro P. Amping III, Zuriel Jett M. Leung', 'Vera Kim S. Tequin', '2023', '2019-08-22', 'DC075'),
('CP072', 'DETECTION POTENTIAL FISHING ZONES IN DAVAO GULF: AN APPLICATION OF GEOSPATIAL MODELING ON REMOTELY SENSED DATA', 'The Philippines contributes significantly to global fish production, producing over 4 million metric tons in 2018 and 2019, benefiting the economy and people\'s way of life. The Philippines uses a variety of fishing techniques to capture various fish species. However, traditional methods are being used with little focus on maximizing efficiency. This study provides a theoretical and scientific approach to selecting fishing locations in the premises of Davao Gulf through the application and utilization of Geospatial Data Science. Davao Gulf is split into ten different sectors for ease of locating the different potential fishing zones (PFZ). The variables within this study are Sea Surface Temperature (SST), which determines how suitable a fish\'s habitat is, Thermal front, and Sea Surface Chlorophyll-a Concentration (SSCC) which determines the suitability of a fish\'s habitat. The researchers used interpolation models, including Nearest ND, Inverse Distance Weighting, Ordinary Kriging, and Universal Kriging, to analyze the data. The results of the model evaluation show that Universal Kriging is the best model based on Root Mean Square Error, Mean Standard Error, and Mean Absolute Error values. Simple Additive Weighting was used to calculate Potential Fishing Zones (PFZ) values, which were utilized to map the points and clusters of the PFZ within Davao Gulf. The study identified that January and May have the largest area of High PFZ. The result indicates that sector 10 encompasses the largest area based on annual aggregated data in square kilometers. The study also communicates the results through a dashboard application. Fishermen can use this information to improve catch and efficiency by choosing better fishing locations.', 'Geospatial Modeling, Remotely Sensed Data, Potential Fishing Zones, Davao Gulf, Universal Kriging', 'Denver Fred A. De Gracia, Andrew Kenan A. Songahid, Nikko L. Maniwang', 'Tamara Cher R. Mercado', '2023', '2019-08-22', 'DC080'),
('CP073', 'CLASSIFYING CAVENDISH BANANA MATURITY STAGE USING RESNET18 ARCHITECTURE AND TRANSFER LEARNING', 'Banana maturity is vital in determining the fruit\'s marketability. Hence, growers must carefully identify mature banana fruits to maximize profit. There have been attempts to automate the classification of banana maturity stages; however, the current models require a long time to train the dataset, harming the model\'s efficiency. Recent studies applied transfer learning in classification models to improve model efficiency regarding training time and accuracy. Anchored on these works, this research utilizes transfer learning in the ResNet-18 architecture to build a model recognizing the various stages of Cavendish banana maturity. In the 10-fold cross-validation, the model\'s accuracy was higher than that of a CNN-based model; however, its training time is higher. When evaluated on unseen data, the model performed better than the CNN-based model. Furthermore, a basic web-based app was developed to evaluate the model using a locally sourced dataset. Results show that the ResNet-18-based model outperformed the CNN-based model in identifying the Cavendish bananas\' maturity stages. This demonstrates that a classification model based on ResNet-18 architecture with transfer learning was an efficient approach to fruit classification.', 'Banana Maturity, ResNet18, Transfer Learning, Classification, Deep Learning', 'Lor, Fritzie B.; Sanoy, Brylle James; Siva, Syramae F.', 'Dumdumaya, Christina E.', '2023', '2023-05-01', 'DC076'),
('CP074', 'DeVICE: PREDICTION AND ANALYSIS ON THE SUBSTANCE ABUSE OF ADOLESCENTS IN POBLACION DISTRICT, DAVAO CITY', 'The study focuses on providing predictions and analysis for the local government in the Población District barangays, aiming to raise awareness and facilitate health care programs, drug prevention, and rehabilitation efforts. By utilizing neural networks, specifically the Dense layer, the study aims to predict future trends in substance abuse among adolescents. The results have been presented graphically, allowing for easier understanding, and geographic maps were generated to visually depict substance abuse intensity across different regions. Statistical reports, including charts and graphs, have been compiled based on provided datasets, covering factors such as gender ratio, rates among different age groups, and the progression of substance abuse among young individuals in recent years. Overall, this study provides valuable insights and tools for informed decision-making and proactive measures against adolescent substance abuse for the local government and society.', 'Feedforward Neural Network, Prediction, Substance Abuse, Adolescents, Data Visualization', 'Amarillo, Vann Rijn D.; Gapuz, John Emmanuel G.', 'Tupas, Hermoso Jr. J', '2023', '2023-05-01', 'DC077'),
('CP075', 'DURIO: AN API-BASED ANDROID MOBILE APPLICATION FOR DETECTING INFECTED AREAS IN DURIO ZIBETHINUS PODS', 'Durian, known as the king of fruits, is a valuable tropical fruit in Southeast Asia. However, the durian industry in the Philippines faces challenges such as low yield, fruit quality, and significant post-harvest losses. These losses amount to up to 35% of their crops and are primarily caused by post-harvest durian diseases. To mitigate these losses, farmers and agricultural technicians rely on visual inspection methods, which can be subjective and prone to human errors. To address these challenges, this paper presents a novel solution called DurI0-an API-based Android mobile application for detecting infected areas in Durio Zibethinus pods. Three models were created and compared: RGB + UNet, GLCM+ UNet, and RGB + GLCM+ UNet model. Among these models, the RGB + UNet model demonstrated the highest proficiency in identifying the infected area with an IoU score of 85.46%. Notably, the model also exhibited its potential for early detection of durian diseases, as the results found that it was able to identify the disease before the expert did. Thus, it was selected as the final model to be integrated into the API-based mobile application. Moreover, the researchers also performed the Wilcoxon Signed Rank Test, which indicates the differences between the severity index estimates of the model and the expert. The result shows a p-value of 0.1152 which indicates that the annotations are aligned in terms of identifying the infection level. A second level of testing was also conducted to evaluate the mobile application\'s severity index estimation. The results revealed that the severity index estimation provided by the application was comparable to the estimations made by the human expert.', 'Durian Disease Detection, Mobile Application, API, UNet, Image Segmentation', 'Rivas, Rovic Jade P.; Jusayan, Armand Louise S.; Silvosa, Matthew Gabriel B.', 'Villamor, Maureen M., Ph.D.', '2023', '2023-05-01', 'DC078'),
('CP076', 'AUTOMATED CRYPTOCURRENCY TRADING BOT USING MACHINE LEARNING MODEL ENSEMBLE', 'Cryptocurrency has emerged as an influential force in the global financial system and has become a popular financial investment due to its decentralized and secure digital transactions. However, its volatile nature rendered it a complex asset to manage. Using statistical models and recent machine learning algorithms, automated trading strategies were employed to assist investors in managing volatility while mitigating the influence of human bias and sentiment. This study uses ensemble learning techniques to develop a bot for automated trading for leading cryptocurrencies, such as Bitcoin, Binance, and Ethereum. Three kinds of ensemble models (i.e., Bagging, Boosting, and Stacking) were tested for significance against sixteen different base learner models through conventional performance metrics. Analysis showed that the Naïve-LR-NBeats stacking combination achieved the highest performance for Bitcoin with 3.14% MAPE, while ARIMA-NBeats and LR-NBeats combination had the highest performance of 2.72% and 3.51% MAPE for Binance and Ethereum, respectively. The selected ensemble models were then associated with the Buy-Low-Sell-High strategy to develop the trading bot. Backtesting and simulations were carried out using historical price data to determine the performance and profitability of the bot in a trading scenario. In general, the trading bot for the three currencies had a satisfactory performance suited for swing traders who capitalize on small-scale market opportunities and capture short-term gains, generating 3-17% investment returns and above-average win-loss ratios.', 'Cryptocurrency, Bitcoin, Binance, Ethereum, Ensemble Learning, Trading Bot', 'Balbin, Charles Andrew P.; Ungab, Joshua Jay G.; Unson, Justine Riva F.', 'Amante, Cheryl R.', '2023', '2023-05-01', 'DC079');

--
-- Triggers `capstone`
--
DELIMITER $$
CREATE TRIGGER `capstone_before_insert` BEFORE INSERT ON `capstone` FOR EACH ROW BEGIN
  DECLARE normalized_input TEXT;
  DECLARE existing_count INT;

  SET normalized_input = normalize_title(NEW.Title);

  -- Check for duplicate title in capstone
  SELECT COUNT(*) INTO existing_count
  FROM capstone
  WHERE normalize_title(Title) = normalized_input;

  IF existing_count > 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Duplicate title found in capstone table.';
  END IF;

  -- Check for duplicate title in thesis
  SELECT COUNT(*) INTO existing_count
  FROM thesis
  WHERE normalize_title(Title) = normalized_input;

  IF existing_count > 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Duplicate title found in thesis table.';
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `capstone_before_update` BEFORE UPDATE ON `capstone` FOR EACH ROW BEGIN
  DECLARE normalized_input TEXT;
  DECLARE existing_count INT;

  SET normalized_input = normalize_title(NEW.Title);

  SELECT COUNT(*) INTO existing_count
  FROM capstone
  WHERE normalize_title(Title) = normalized_input
    AND CapstoneID != OLD.CapstoneID;

  IF existing_count > 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Duplicate title found in capstone table.';
  END IF;

  SELECT COUNT(*) INTO existing_count
  FROM thesis
  WHERE normalize_title(Title) = normalized_input;

  IF existing_count > 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Duplicate title found in thesis table.';
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `capstoneauthorsview`
-- (See below for the actual view)
--
CREATE TABLE `capstoneauthorsview` (
`CapstoneID` varchar(10)
,`Title` varchar(255)
,`AuthorName` varchar(101)
,`Email` varchar(100)
,`Program` varchar(50)
,`ProgramType` varchar(50)
,`YearPublished` year(4)
);

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `DocumentID` varchar(10) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Keywords` text NOT NULL,
  `Authors` text NOT NULL,
  `YearPublished` year(4) NOT NULL,
  `Abstract` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`DocumentID`, `Title`, `Keywords`, `Authors`, `YearPublished`, `Abstract`) VALUES
('DC001', 'COPTURE: AUTOMATION OF TRAFFIC TICKET ISSUANCE USING PDF417 BARCODE SCANNER', 'traffic ticketing, automation, PDF417 barcode, mobile citation, web monitoring', 'Caya, Carl Stephen G.; Espinosa, Merra Elaiza T.; Moria, Mice Dianne M.', '2020', 'Double encoding of traffic citations became a significant problem for the Apprehension Unit in the City Transport and Traffic Management Office. Every day, they have to encode the endorsed traffic tickets into an excel sheet, and they have even experienced a month\'s worth of backlog due to the increase in citation tickets. CopTure was developed to solve the agency\'s problem in double encoding and to enhance the process of issuing a traffic ticket. The researchers designed and developed a mobile application that will automate the issuance of traffic citations by scanning and obtaining data from a driver\'s license. They also developed a web-based record system that will allow authorized employees to monitor traffic citations. To achieve this, the researchers followed the Rapid Application Development method. The researchers conducted an interview at the CTTMO to thoroughly understand the problem and established a set of objectives to solve it. The objectives served as a guide in implementing all the features needed to complete the project. The mobile application and web-based system went through rapid prototyping and iterative delivery until all the objectives were met. A validation test was also conducted to ensure that both the application and the system are fully functioning. Overall, this project paints a picture of the future traffic ticketing system and encourages the acceptance of technology as a new way of implementing traffic management. The project would not be feasible without the unwavering commitment and cooperation that each of the researchers showed to successfully finish the project. The whole project might be finished and thrived, but it is still open for future improvements and additional features based on users\' future needs.'),
('DC002', 'FINnish Na: AN IOT APPLICATION SYSTEM FOR FISH MORTALITY RATE MONITORING USING ULTRASONIC SENSORS', 'fish farming, IoT, fish mortality, ultrasonic sensor, mobile monitoring', 'Amandy, Lovely Roze N.; Aton, Theona F.; Balcom, Andrea Gail N.', '2020', 'Fish mortality is a natural occurrence that can happen when cultivating a fish farm. It is undeniable that fish deaths transpire now and then. Problems that contribute to fish mortality include weather that causes oxygen depletion, fish disease, as well as dead fish/es itself, among other things. These dead fishes, if not retrieved and left to rot, pose an even greater threat within a farm, especially when these carcasses sink instead of floating. If cultivators aren\'t careful enough, these rotting fish may release harmful chemicals that can contaminate the fishpond\'s water and compromise other healthy fishes. An interview was conducted among fish farmers in Matina Aplaya to find out how they address such issues. Collectively, they responded by having scheduled underwater checking for dead fish that sank at the bottom of the pond, which is time-consuming and inefficient. Hence, the proponents developed a system, FINnish Na, to reduce and address this specific fish farmer problem. Primarily using an ultrasonic sensor placed at the bottom of a basin, the proponents have simulated a miniature fishpond. When the sensor detects the presence of dead fish in the pond, the system will notify fish farmers through a notification in the app. The app can also provide the mortality rate of the fish and gives a daily and monthly report of the number of dead fish that the fish farm has so far. After testing the system for four (4) days, split between two pond conditions: with live fish and without, the proponents made comparisons of each day\'s result. It was evident that there was variability among the results. Significantly, however, there is a slight inconsistency of sensor readings when live fishes are present and if they are constantly moving. Based on the results of this study, the proponents recommend that an advanced type of ultrasonic sensor is utilized, as well as improve the sensor detection function, where constant interferences such as fish movement are ignored.'),
('DC003', 'CODE CAPTURE: MOBILE IDE FOR ENHANCING PROGRAMMING LOGIC BY CAPTURING PSEUDOCODES INTO READILY EXECUTABLE SCRIPTS USING OCR TECHNOLOGY', 'OCR, pseudocode, mobile IDE, student programming, code translation', 'Javier, Martkneil Jan L.; Lavilla, Christian C.; Rulona, Matt Jacob C.', '2020', 'Laptops and smartphones are used by almost everyone in this current era. These devices are popularly used at home, school, and work environments. Students, in particular, prefer using laptops because they are more efficient to be used for notetaking, writing, editing, and studying. Having said that, several economically marginalized students may not experience the convenience that these devices could offer. This financial instability could be a big issue especially for technology-related students since laptops play a crucial role in learning the basics of computer programming. Therefore, the researchers have conducted this study, \"Code Capture: Mobile Ide for Enhancing Programming Logic By Capturing Pseudocodes Into Readily Executable Scripts Using OCR Technology\", a solution that could improve the current situation of students with financial difficulties of providing themselves laptops. This study created a dedicated mobile application to be used by students who have computer-related courses. It could serve as a compiler and decoder for computer programs. Following a Rapid Application Development (RAD) model, we used an effective and fair design to cater to the needs of different users.'),
('DC004', 'HEEDER: A VOIP-BASED HYBRID MOBILE APPLICATION FOR CLASSROOM INSTRUCTION DELIVERY', 'VOIP, classroom instruction, hybrid app, noise reduction, student learning', 'Casas, Reymart C.; Concubierta, Paola R.; Garcia, Elvina B.', '2020', 'HEEDER is a mobile VOIP-enabled and hybrid voice distribution application designed to aid classroom instruction by mitigating distractions from noise and mobile devices. It allows teachers to create voice broadcast channels and monitor student users. Built with Cordova and using the Dynamic Systems Development Method, the app fosters improved classroom communication. Though not eliminating noise, it enhances voice clarity and supports intent listening.'),
('DC005', 'SMARTASTH: A MOBILE APPLICATION FOR REAL-TIME MONITORING OF ASTHMATIC PATIENTS USING WEARABLE DEVICE FOR HEART RATE AND GEO-TAGGING', 'asthma monitoring, wearable tech, real-time tracking, geolocation, heart rate', 'Carcallas, Nica C.; Delos Reyes, Sim Japhet C.; Quinamot, Jan Enrico V.', '2020', 'SMARTASTH is a mobile application developed to monitor asthmatic patients in real-time using smartphone sensors and wearable technology. The app tracks breath sounds and heart rate to detect early asthma triggers and integrates geotagging to contextualize readings. The system aims to provide accurate, at-home monitoring without the need for standard spirometry supervision, offering a low-cost, effective tool for long-term asthma care.'),
('DC006', 'AEROFREE: AN IOT-ENABLED LPG LEAK DETECTION SYSTEM WITH PROXIMITY MAP', 'LPG leak, IoT, gas safety, proximity alert, fire prevention', 'Barsal, Jude Norbert D.; Gaspar, Ian James V.; Ripalda, Francis Lloyd P.', '2020', 'AEROFREE is a mobile–web solution that pairs an Arduino-based LPG sensor with an app to detect abnormal propane/butane levels. When a high concentration is sensed, actuators trigger, SMS alerts are sent, and nearby users (within 100 m) receive notifications. A heat-map view shows leak intensity and location, helping households and fire departments respond quickly. Developed with the RAD model, AEROFREE met all functional objectives for indoor gas-leak awareness and safety.'),
('DC007', 'IMONGMOTHER: AN ANDROID-BASED COMMUNITY BREAST MILK SHARING APPLICATION USING GEOTAGGING AND CROWDSOURCING IN DAVAO CITY', 'breastmilk sharing, geotagging, mobile app, crowdsourcing, community health', 'Dumagan, Pauline Marie J.; Menil, Kiarrah R.; Sampani, Ma. Mitchie N.', '2020', 'IMONGMOTHER is a crowdsourced Android platform enabling lactating mothers with surplus milk to donate to infants in need. GPS filters donors by proximity, while in-app requests streamline exchanges. Built with Rapid Application Development, the app fosters breastfeeding culture, supports postpartum mothers, and bridges donors and recipients for healthier infant nutrition.'),
('DC008', 'CAREFUL: A MOBILE-BASED ROAD ALERT APPLICATION FOR ROAD SAFETY PRECAUTIONS USING GEOFENCING API', 'road safety, geofencing, mobile alert, traffic awareness, accident prevention', 'Good, Daryl Kate T.; Ormo, Shenny Maree C.', '2020', 'CAREFUL reduces road-accident risk by alerting pedestrians to nearby lanes and drivers to accident-prone areas via geofencing. The Android app notifies overspeeding, jaywalking zones, blind curves, and crowded spots, encouraging safer behavior. It promotes tech adoption for road safety and offers future potential for expansion.'),
('DC009', 'TRAVIL: A MOBILE APPLICATION COMPLAINT TOOL FOR TRAFFIC VIOLATIONS AND INCIDENTS USING LIVE VIDEO FEED AND REAL-TIME LOCATION TRACKING', 'traffic violation, complaint tool, video feed, real-time GPS, traffic monitoring', 'Dimaano, Frances Mae G.; Florida, Rio Jessa Mae N.', '2020', 'TRAVIL aids Davao City traffic enforcers by letting citizens submit live-video reports of violations with GPS coordinates. Built in Ionic/Java, it streams evidence, shortens response time, and compensates for limited CCTV coverage and personnel.'),
('DC010', 'LEARNDYS: AN EDUCATIONAL LEARNING APPLICATION FOR DYSLEXIC CHILDREN USING R.A.S.E. MODEL', 'dyslexia, learning disability, educational app, RASE model, child development', 'Jumang-it, Jonell P.; Lamberte, Aira Camille H.; Ruelo, Amanda Jane L.', '2020', 'LearnDys delivers cognitive and psychomotor activities for dyslexic children aged 3-6, following the R.A.S.E. model. The mobile app offers early-intervention exercises to improve reading and motor coordination, with expert input from special-education professionals.'),
('DC011', 'PACOOL: A WEARABLE DEVICE PROVIDING COOLING EFFECT TO PREVENT HEAT-RELATED ILLNESSES USING PELTIER MODULE', 'heatstroke prevention, wearable tech, Peltier module, cooling system, health', 'Balanay, Jhon Vincent; Manito, Ara Noreen S.; Caturza, George C.', '2020', 'PaCool is a wearable wrist-and-upper-arm device employing a Peltier module to cool the body when temperature sensors detect heat-stroke thresholds. A companion app displays real-time body temperature, aiming to protect vulnerable groups during heat waves.'),
('DC012', 'COPIoT: A Web Based Monitoring System for Automated Copra Drying Process', 'copra drying, agriculture tech, IoT sensors, coconut farming, moisture tracking', 'Canlog, Noemi Andreyanne L.; Torrefiel, Leonel; Pantinople, Cleo B.', '2020', 'COPIoT integrates an artificial copra-drying machine with a web dashboard to monitor real-time moisture and automate drying for small coconut farmers. It balances drying pace and quality, helping overcome traditional sun-drying drawbacks.'),
('DC013', 'E-MONGANI: A MOBILE APPLICATION FOR MARKETING RICE THROUGH A BIDDING SYSTEM', 'rice marketing, e-commerce, bidding system, palay, agriculture', 'Alegrado, Ina P.; Hagunob, Trisha Marie V.; Robles, Angelika Mari O.', '2022', 'E-MONGANI is an e-commerce mobile app that links rice farmers and buyers via bidding. Farmers set minimum prices, mitigating income loss from the Rice Tariffication Law. Developed with Scrum, the app widens market reach and strengthens farmer profitability.'),
('DC014', 'DamageXpert: A MOBILE-BASED APPLICATION FOR THE IDENTIFICATION OF DAMAGES CAUSED BY RICE LEAF BLAST AND RICE STEM BORER WITH CONTROL MEASURES', 'rice diseases, stem borer, leaf blast, pest control, agriculture app', 'Celocia, Kenneth King Jones M.; Licera, Rona P.; Tiu, Roxan S.', '2022', 'DamageXpert is a mobile-based application developed to help farmers identify rice diseases and pests such as stem borer and leaf blast. It provides timely information on pest control and disease management, helping farmers make informed decisions to protect their crops.'),
('DC015', 'SECURED: A BLOCKCHAIN BASED INFORMATION SYSTEM FOR CONTACT TRACING', 'blockchain, contact tracing, information system, SHA256, health monitoring', 'Bangcaya, Mark Charlton E.; Dahan, Shayne Vir; Guevarra, Yeoj Adrian E.', '2022', 'SECURED is a blockchain-based information system designed to enhance contact tracing and information security. It leverages blockchain technology to maintain data integrity and ensure privacy in tracking critical information.'),
('DC016', 'TREKUP: A MOBILE APPLICATION FOR MOUNTAINEERS TO PROVIDE TRAIL MAPS AND LANDMARKS', 'mountaineering, trail maps, hiking guide, mobile app, outdoor safety', 'CALLEDO, MELISA C.; ALCUIZAR, EMMABELLE L.; PAMA, MARK IAN', '2022', 'TREKUP is a mobile app designed to assist mountaineers by providing trail maps, landmarks, and essential information such as hike difficulty, duration, and preparation tips. Aimed at preventing accidents due to lack of trail knowledge, the app helps hikers choose optimal routes and stay safe during treks.'),
('DC017', 'Scrap-E: A WEB SCRAPING-BASED SYSTEM FOR FILTERING ELECTRONIC WORD-OF-MOUTH OF E-COMMERCE WEBSITES', 'eWOM, web scraping, sentiment analysis, e-commerce feedback', 'Aguilar, Aimee Grace D.; Antalan, Akela Paulene B.; Valenzona, Shekinah Jane E.; Gamboa, Randy S.', '2022', 'Scrap-E is a web scraping system that extracts and filters electronic word-of-mouth (eWOM) from e-commerce websites. Using sentiment analysis, it identifies relevant customer feedback related to service, value, shipping, and product quality. The system provides insights into positive and negative reviews, helping businesses manage their brand perception more effectively.'),
('DC018', 'I-REFERMO: A WEB-BASED REFERRAL PLATFORM FOR ENHANCING BUSINESS WITH ONLINE INFLUENCERS', 'influencer marketing, referrals, social media, SCRUM, online branding', 'Alfafara, Lean Gabriel S.; Sapar, Ivan Rhay Jeferson C.; Arabejo, Kurt Russel D.; Tamara Cher R. Mercado', '2022', 'I-ReferMo is a web-based referral system connecting business owners with social media influencers. It allows users to filter and select influencers based on metrics and supports communication through email. Developed using SCRUM, the platform helps businesses improve their marketing reach through curated influencer partnerships.'),
('DC019', 'PARADA: Mobile-based Real-time Public Utility Jeepney Tracking App', 'PUJ tracking, GPS, public transport, jeepney monitoring, arrival prediction', 'Arnado, Hazel Joy B.; Cabrera, Joshua James D.; Jumlani, Abdur Rahim C.; Ricablanca, Eric P.', '2020', 'PARADA is an Android application that tracks real-time location and arrival of PUJs along Mahayag-Acacia routes. It displays available seats, estimated time of arrival, and driver earnings. Built using RAD methodology, it aims to reduce commuter stress and improve route visibility, though performance depends heavily on internet connectivity.'),
('DC020', 'ModernBasurero: DEVELOPING AN EFFICIENT WASTE COLLECTION', 'waste management, mobile app, garbage collection, Firebase, Google Maps API', 'Neñeria, Marie Mae G.; Borlaza, Melissa M.; Pausang, Aizle Bianca C.; Villamor, Maureen M.', '2022', 'ModernBasurero is a mobile app that modernizes garbage collection using Firebase and Google Maps. It supports three user levels (admin, resident, collector) and allows real-time tracking of garbage collection. It aims to prevent uncollected trash, improve route planning, and facilitate timely pickups. Future improvements include image processing and a centralized web portal.'),
('DC021', 'DESIGN AND DEVELOPMENT OF A BLOCKCHAIN-BASED E-COMMERCE WEBSITE', 'blockchain, e-commerce, Filipino products, digital security', 'Llanto, Leo L.; Agbay, Jim Bryan T.; Lagra, Cherry Rhodlyn P.; Tupas, Hermoso J. Jr.', '2022', 'This project presents the design and development of a blockchain-based e-commerce platform focused on Filipino products. It incorporates secure digital payment methods, product authentication, and a user-friendly interface for online shopping.'),
('DC022', 'QualitAire: An IoT-Based Air Quality Monitoring System with Forecasting Capability Through Time Series Model Analysis', 'air quality, IoT sensors, ARIMA, forecasting, AQI monitoring', 'Escaño, Kristian Rebb; Siapno, Dean; Amante, Cheryl', '2022', 'QualitAire is an IoT-based air quality monitoring system that uses ARIMA forecasting to predict AQI levels. The system gathers data through IoT sensors and provides actionable insights to improve air quality management.'),
('DC023', 'DESIGN AND DEVELOPMENT OF A MOBILE-BASED MALICIOUS URL DETECTION APPLICATION', 'cybersecurity, malicious URL, XGBoost, mobile application, phishing detection', 'Juarez, Leah C.; Ricafort, Sydney P.; Tupas, Hermoso Jr. J.', '2022', 'This mobile-based application detects malicious URLs using XGBoost, helping users enhance mobile cybersecurity. It identifies threats in real-time and provides security recommendations to prevent cyberattacks.'),
('DC024', 'STUDYMATE: A STUDY PEER RECOMMENDER APP USING RECIPROCAL RECOMMENDATION ALGORITHM', 'recommendation system, student peer matching, machine learning, study group', 'Rosario, Lawrence Christopher G.; Gubaton, John Eric Paolo R.; Peligor, Richard B.; Dumdumaya, Cristina E.', '2022', 'STUDYMATE is a mobile application that uses a reciprocal recommendation algorithm to match students with compatible study peers based on traits, communication openness, and personality. The system fosters informal learning communities and was built using the modified waterfall model for flexibility in development.'),
('DC025', 'STRESSSENSE: A STRESS LEVEL DETECTOR FOR DETERMINATION OF STRESS LEVEL THROUGH THE COMBINATION OF PHYSIOLOGICAL DATA OF GALVANIC SKIN RESPONSE AND PULSE RATE', 'stress detection, GSR, pulse rate, Arduino, fuzzy logic', 'Arbizo, Arvin Garret A.; Balansag, Marc Louie L.; Carpesano, Christy Hyacinth C.; Reyes, Ariel Roy L.', '2022', 'STRESSSENSE is a wearable stress detection device that uses Galvanic Skin Response (GSR) and pulse sensors to assess stress levels among university students. Based on fuzzy logic, it interprets physiological responses and displays stress results via Arduino serial monitor, helping individuals monitor their mental health.'),
('DC026', 'ATONGSECRET: A WEB-BASED FILE SHARING AND MESSAGING APPLICATION USING IMAGE STEGANOGRAPHY', 'steganography, file sharing, web messaging, LSB, image security', 'Alfanta, Bryle G.; Duran, Joshua Chris M.; Rosal, Brad Ford D.; Lagmay, Marvin S.', '2022', 'ATONGSECRET is a secure messaging platform that hides messages and files inside images using Least Significant Bit (LSB) steganography. Developed with PHP, MySQL, and JavaScript, it supports private communication, push notifications, and file concealment, ensuring data privacy through image-based security.'),
('DC027', 'IsdaCulture An IoT – Based Water Temperature and Dissolved Oxygen Level Monitoring System for Milkfish Farming', 'IoT, aquaculture, dissolved oxygen, fish farming, water monitoring', 'Betonio, Angelica Mae G.; Ondap, Jomari D.; Machica, Ivy Kim D.', '2021', 'ISDACULTURE is a smart fish pond monitoring system that uses temperature and DO sensors to alert milkfish farmers of unfavorable pond conditions. With real-time monitoring and automated actuator control, the system helps ensure optimal aquaculture conditions and reduce fish mortality.'),
('DC028', 'UVwearIoT: AN IoT BASED WEARABLE DEVICE TO MONITOR UVI LEVEL AND PULSE RATE', 'UV monitoring, pulse rate, wearable tech, IoT sensors, health', 'Benalet, Carmilla; Lape, May Flor; Sorima, Reno Roy; Tupas Jr., Hermoso', '2021', 'UVwearIoT is a wrist-wearable IoT device that monitors ultraviolet index (UVI) and pulse rate. Connected via Bluetooth to a mobile app, it alerts users of high UVI and abnormal pulse rates with sound and visual notifications, aiding health monitoring and UV safety awareness.'),
('DC029', 'EMPATHYVR: A LEARNING COMMUNICATION PLATFORM FOR CHILDREN WITH AUTISM', 'autism, virtual reality, communication skills, education, assistive tech', 'Diola, Dionne Evony M.; Roxas, Bebe Mae J.; Taghoy, Audrey Marie M.; Tupas, Hermoso Jr.', '2021', 'EMPATHYVR is a learning communication platform for children with autism that leverages virtual reality. It helps improve communication skills and educational engagement in an interactive VR environment.'),
('DC030', 'SOS’IoT: A Noise Monitoring and Warning Tool for Barangay', 'noise pollution, IoT, noise monitoring, community safety, RAD', 'Maxino, Chuzelyn D.; Rubia, Judelyn N.; Vidal, Johanna Mae.; Villamor, Maureen M.', '2021', 'SOS’IoT is a noise monitoring and warning tool for communities, utilizing IoT sensors to detect and report noise pollution. It provides real-time alerts to support community-based noise management.'),
('DC031', 'RedPing: An IoT-Based Flood Detection System for Urban Areas', 'flood detection, IoT, urban flooding, sonar sensors, public safety', 'Cortes, Eugene L.; Baobao, Shareld Rose A.; Centillas, Dyesebel T.; Hermoso Tupas Jr.', '2021', 'RedPing is an IoT-based flood detection system for urban areas. It employs sonar sensors and real-time alerts to monitor flooding, helping communities respond quickly to water-related hazards.'),
('DC032', 'IOTae: A WEB BASED MONITORING SYSTEM FOR HARMFUL ALGAL BLOOM GROWTH IN PONDS', 'algal bloom, water monitoring, IoT sensors, pH, dissolved oxygen', 'Taganahan, Jay Mark H.; Penanueva, Quenie Marie D.; Lumen, Mark B.; Reyes, Ariel Roy L.', '2021', 'IOTae is a web-based monitoring system for harmful algal blooms. Using IoT sensors and water quality measurements, it predicts and reports bloom occurrences to safeguard aquatic ecosystems.'),
('DC033', 'Project T-RAT: AN IOT BASED SMART – TRAPPER FOR RATS', 'rat control, smart trap, IoT sensors, notification system, pest management', 'Drilon, Jay Ar; Hermoso, Romel M.; Reyes, Ariel Roy L.', '2021', 'Project T-RAT is an IoT-based smart trap system for rat control. It provides automated monitoring, notifications, and data analysis to improve pest management in agricultural and urban environments.'),
('DC034', 'HAPPAG: A MOBILE APPLICATION CONNECTING FOOD DONORS AND DONEES TO PREVENT FOOD WASTES', 'food waste, donor app, food rescue, geolocation, real-time messaging', 'Adorable, Mary Rose C.; Remis, Faye Hazel V.; Mahinay, Aries Dominic H.', '2021', 'HAPPAG is a mobile application connecting food donors and recipients to reduce food waste. It uses geolocation to match donors with nearby recipients efficiently.'),
('DC035', 'DIPRICE: A RICE QUALITY IDENTIFIER USING DIGITAL IMAGE PROCESSING', 'rice quality, image processing, food classification, mobile app, rice grading', 'Ontolan, Raymund F.; Viernes, Jazzy Bert S.', '2021', 'DIPRICE is a rice quality identifier using digital image processing. The system classifies rice based on visual quality, helping farmers and traders assess product standards.'),
('DC036', 'HeHaSpot: A Human Health Hazard Web and a Mobile Surveillance Application', 'health hazard, waste reporting, barangay app, environmental health, surveillance', 'Agcol, Vil Marie A.; Calzada, Ellen Mae G.; Clenista, Junard John C.', '2021', 'HeHaSpot is a human health hazard web and mobile system that allows citizens to report environmental hazards. It supports local authorities in monitoring and responding to health risks.'),
('DC037', 'SPEEDISOR: A WEB AND MOBILE-BASED APPLICATION TO MONITOR TAXI DRIVER SPEED LIMIT VIOLATION USING A REAL-TIME LOCATOR', 'speed violation, GPS tracking, taxi monitoring, traffic safety, real-time system', 'Albutra, Pauline Grace C.; Buquia, Rennjo D.; Lungay, Darleen S.', '2021', 'SPEEDISOR is a web and mobile-based application to monitor speed violations. It uses GPS tracking to detect speeding and assists in enforcing traffic regulations.'),
('DC038', 'HALINON: A CROWDSOURCED PRODUCT TRENDS AND COMPETITION INFORMATION WEBSITE', 'MSME, market trends, crowdsourcing, local business, product popularity', 'Dulay, Jumar H.; Esgana, Jehoiakim Jade C.; Rivera, John Jay A.', '2021', 'HALINON is a crowdsourced product trends and competition analysis tool for MSMEs. It gathers market insights to help local businesses make strategic decisions.'),
('DC039', 'BreakApp: A WEB AND MOBILE BASED APPLICATION FOR CIRCUIT BREAKER MONITORING AND TRACKING USING ARDUINO CURRENT SENSOR', 'circuit monitoring, Arduino, electrical safety, USeP, breaker alert', 'Carreon, Harris B.; Cutamora, Kent Charles; Tabasa, Hyacinth Faye A.', '2021', 'BreakApp is a web and mobile application for circuit monitoring and electrical safety. Using Arduino technology, it helps users detect and prevent electrical hazards in residential and commercial settings.'),
('DC040', 'DRIVECARE: A WEARABLE DEVICE TO DETECT DRIVER DROWSINESS BASED ON EYEBLINK ANALYSIS', 'driver safety, drowsiness detection, wearable tech, traffic accident prevention', 'Decierdo, Allen Grace S.; Dumangas, Queenie L.; Merecuelo, Kristine Mae D.', '2021', 'DRIVECARE is a wearable device that detects driver drowsiness to enhance road safety. It uses sensors and real-time monitoring to alert drivers and prevent accidents.'),
('DC041', 'TransBraille: A MOBILE-BASED APPLICATION FOR BRAILLE TRANSLATION USING DIGITAL IMAGE PROCESSING', 'braille translation, assistive tech, digital image processing, inclusive education', 'Coquilla, Angelica B.; De Claro, Jeelenee Jayson L.; Martinez, Kyle Matthew C.', '2021', 'TransBraille is a mobile-based application that converts text into braille for visually impaired users. It uses digital image processing to facilitate accessible communication and learning.'),
('DC042', 'FINDING SAFETY IN TECHNOLOGY: A SYSTEM FOR CRIME INCIDENT REPORTING VIA LIVE VIDEO FEED AND LOCATION PINNING', 'crime reporting, live video, location tracking, emergency response, GPS', 'Boo, Jahmicah Nissi F.; Gonzales, Mary Elisse G.; Regalado, Maruela Angela A.', '2021', 'Finding Safety in Technology is a system for crime incident reporting using live video and location tracking. It empowers users to report crimes and ensures timely response from authorities.'),
('DC043', 'SAFE2IOT: AN AUTOMATED WATER QUALITY FILTRATION SYSTEM USING IOT', 'IoT, water filtration, greywater reuse, home automation, sensor tech', 'Castro, Joshua Antonio N.; Dela Cruz, Elnathan Timothy C.; Agantal, Jawad L.', '2021', 'SAFE2IOT is an automated water quality filtration system using IoT. It monitors and filters greywater for safe home reuse, integrating sensors and home automation technology.'),
('DC044', 'NailScanner: A Non-Invasive Fingernail Disease Classifier Mobile Application', 'fingernail diagnosis, mobile health, TensorFlow, image classification, disease detection', 'Alinsonorin, Raven M.; Barinan, Joshuaa S.', '2021', 'NailScanner is a non-invasive mobile health application that detects fingernail diseases. It uses TensorFlow and image analysis to identify medical conditions accurately.'),
('DC045', 'PaSwap: A Web-Based Decentralized Cryptocurrency Exchange (DEX) Platform', 'cryptocurrency, decentralized exchange, P2P trading, MetaMask, blockchain', 'Badanoy, Delight C.; Jagunos, Aldren Joy A.; Talipan, Rafiaa J.', '2023', 'PaSwap is a web-based decentralized cryptocurrency exchange. It supports P2P trading and secure blockchain transactions for digital assets.'),
('DC046', 'AgrE: A Secured E-Commerce Platform for Trading Agricultural Commodities in the DFTC', 'e-commerce, agriculture, Davao Food Terminal, commodity trading, secured system', 'Sabal, Daniel R.; Saligumba, Justin Jade F.; Tequin, Vera Kim S.', '2023', 'SECURED is a blockchain-based information system designed to enhance contact tracing and information security. It leverages blockchain technology to maintain data integrity and ensure privacy in tracking critical information.'),
('DC047', 'PaReserve: A Customizable Reservation Platform for Medium-Size Hotel Owners and Customers with Fraud and Theft Prevention', 'hotel reservation, fraud prevention, user verification, security, online booking', 'Canizares, Lonivel John C.; Dimpas, Christian Jason N.; Uy, Jason Ray D.', '2023', 'PaReserve is a customizable reservation platform for hotels. It incorporates fraud prevention and user verification features for secure booking management.'),
('DC048', 'PIGGYWEARIOT: A Pig Cough Surveillance System Using an IoT-Enabled Wearable Device', 'pig health, IoT monitoring, cough detection, livestock biosecurity, wearable tech', 'Bollanday, Jian Luigi C.; Borleo, Richie Floyd C.; Lao, John Loyd A.', '2023', 'PIGGYWEARIOT is a pig cough surveillance system using IoT. It monitors pig health in real-time and alerts farmers to potential respiratory issues.'),
('DC049', 'ANALINK: A Mobile-Based Application for Detecting Malicious URL by Checking SMS Content', 'smishing, mobile security, SMS phishing, malicious URL, Android app', 'Cajetas, Katherine Joy S.; Lee, Arman Rex L.; Reyes, Ariel Roy L.', '2023', 'ANALINK is a mobile-based application for detecting smishing and malicious SMS. It enhances mobile security by identifying phishing threats and suspicious messages.'),
('DC050', 'KAPETa: Design and Development of Web-Based E-Commerce Application for Coffee Startups in Davao City', 'coffee industry, e-commerce, Davao City, online store, local business', 'Serbo, Richelle Anne S.; Tubal, Angel Menrica B.', '2023', 'KAPETa is a web-based e-commerce system for the coffee industry in Davao City. It allows online sales, inventory management, and customer interaction for local coffee businesses.'),
('DC051', 'STOCKWISE: An Inventory Management and Demand Forecasting System for Food Retailers', 'inventory management, demand forecasting, food retail, SMA method, RAD model', 'Libron, Kassandra Mariz S.; Atanoso, Bazty Z.; Cosgape, Andrea S.', '2023', 'STOCKWISE is an inventory management and demand forecasting system for food retailers. It predicts stock needs to optimize inventory and reduce waste.'),
('DC052', 'PRIVACY QUEST: A Data Privacy Awareness Game for Teenagers', 'data privacy, serious games, game-based learning, youth education, cybersecurity', 'Bunsay, Vincent Karl Jofferson D.; Montebon, Clark Jasper B. II; Paid, Ron Angelo N.', '2023', 'PRIVACY QUEST is a data privacy awareness game that teaches users about personal data protection. It uses interactive gameplay to improve knowledge and compliance.'),
('DC053', 'Design and Development of Web-Based Data Privacy Assessment Tool for the University of Southeastern Philippines', 'data privacy, privacy impact assessment, risk analysis, web-based tool, university compliance', 'Gumbao, Edjery Gabriel C.; Sandoval, Reyjet R.', '2023', 'This web-based Data Privacy Assessment system helps organizations evaluate privacy risks and implement compliance measures effectively.'),
('DC054', 'BOXDOTS++: Quick Response Code Scanner with Malicious, Safe, and Dead URL Detection', 'QR code, URL detection, mobile security, Google Safe Browsing, VirusTotal', 'Dabuan, Jainah Marie C.; Pueblos, Cindy Mae.', '2023', 'BOXDOTS++ is a QR code scanner that detects malicious URLs. It enhances mobile security by warning users before they open unsafe links.'),
('DC055', 'PREDICTALYST: A Human Resource Management System for Predicting Employee Attrition Using Predictive Analytics', 'employee attrition, predictive analytics, random forest algorithm, HR system, machine learning', 'Mataflorida, Hector M.; Pelale, Johndell Laurence B.', '2023', 'PREDICTALYST is a human resource management system with predictive analytics for employee attrition. It provides insights to improve workforce retention.'),
('DC056', 'PARAQUEUE: A Real-Time Public Utility Vehicle Information Tracking System', 'PUV tracking, real-time monitoring, Davao City transport, seat vacancy, mobile tracking', 'Elacion, Elijah James E.; Maranan, Francis Dave Y.; Mesajon, Justin John O.', '2023', 'PARAQUEUE is a real-time public utility vehicle tracking system. It helps commuters monitor PUV locations and reduces waiting times.'),
('DC057', 'LAON: Leaf Color Chart (LCC) Application for N Fertilization Management in Rice', 'leaf color chart, rice farming, nitrogen fertilizer, agriculture app, KNN algorithm', 'Canete, Ezza Mae H.; Celerian, Shaira B.; Engalan, Joeben P.', '2023', 'LAON is a Leaf Color Chart application for nitrogen fertilizer management in rice farming. It helps farmers monitor crop health using digital tools.'),
('DC058', 'ELIAS: A Personal Aliasing Management System', 'aliasing, personal data security, credential protection, online security, browser extension', 'Alivio, Julius B.; Escoton, Francis Riedel T.; Misal, Donewill Christian D.; Lagmay, Marvin S.', '2023', 'ELIAS is a personal aliasing management system that protects user credentials and personal data online.'),
('DC059', 'E-PAGDIWANG: A Customizable Web-Based Referral Platform for Event Organizers of MSMEs', 'event planning, MSME, web referral platform, Davao City, client-merchant system', 'Calunsah, John Kelvin M.; Jacaban, Robie Bryan B.; Tolento, Ricci Dee R.', '2023', 'E-PAGDIWANG is a customizable web-based referral platform for event planning and MSME promotion. It streamlines referrals and participant management.'),
('DC060', 'RECONSTRUCT: A Web-Based Marketplace and Geo-Finder of Construction and Demolition Recyclable Materials', 'C&D waste, recycling, construction materials, web marketplace, geotagging', 'Cabsobao, Trishia Mae P.; Daguplo, Ivy Alexist P.; Torres, Kailah Shane S.', '2023', 'RECONSTRUCT is a web-based marketplace and geo-finder for C&D waste. It facilitates recycling and tracking of construction materials efficiently.'),
('DC061', 'AEGUIDE: An Augmented Reality and Simulation Based Wayfinding for Mild Intellectual Individuals', 'augmented reality, simulation, wayfinding, intellectual disability, navigation aid', 'Cubelo, Guia Anne G.; Gomez, Jonah Mae A.', '2023', 'AEGUIDE is an augmented reality and simulation-based wayfinding application. It guides users in complex environments and improves navigation using AR.'),
('DC062', 'BAGSAKAN: An Anti-E-Commerce Fraud Platform for Crop Bidding Transactions of Small-Scale Farmer and Vendor', 'e-commerce, bidding system, anti-fraud, agriculture platform, small-scale farmers', 'Booc, Kenneth Joseph V.; Go, Justine Alec A.; Siega, Allen Ray P.', '2023', 'BAGSAKAN is an anti-e-commerce fraud platform for agricultural products. It ensures secure bidding and transaction monitoring for online marketplaces.'),
('DC063', 'DAYR: A Mental Health Self-Monitoring Application', 'mental health, journaling, emotional wellbeing, mobile application, self-help', 'Caparas, Hersie Jean R.; Muana, Josephine P.; Abrigana, Hobert A.', '2023', 'DAYR is a mental health self-monitoring application. It provides journaling and emotional wellbeing tracking tools for users.'),
('DC064', 'Project Tapperware: A System for Detection of Unauthorized Electricity Connection Based on IoT-Enabled Electricity Meter', 'electricity theft, IoT, electricity monitoring, unauthorized usage detection, mobile app', 'Amar, Chris Earl S.; Go, Joel Miller M.; Salvador, Neuqian Rhys S.', '2023', 'Project Tapperware is a system for detecting unauthorized electricity usage using IoT. It helps prevent electricity theft through real-time monitoring.'),
('DC065', 'E-Crunch: A Mobile Application of Basketball Coach\'s Assistant Decision Support System', 'basketball, coaching assistant, decision support system, sports analytics', 'Abenoja, Donell D.; Mateo, Lorenzo Lolek R.', '2020', 'E-Crunch is a mobile basketball coaching application. It provides decision support, training analytics, and performance monitoring for athletes.'),
('DC066', 'KeyMouTion: A Windows-Based Programming Tool for Detecting Boredom and Frustration While Programming in Assessing Teacher-Student Relationship', 'keystroke analysis, mouse tracking, student engagement, frustration detection, programming education', 'Barez, Niebby Jen B.; Galleto, Mae Amor C.; Remolta, Kim Clarizze R.', '2020', 'KeyMouTion is a Windows-based programming tool that tracks keystrokes and mouse movement to study student engagement and interaction.'),
('DC067', 'On the Suitability of Cacao Under Future Climatic Condition in the Philippines: A Neural Network Modelling', 'cacao suitability, climate change, neural network, future prediction, agriculture', 'Getigan, Jonel C.; Ramos, Exceed Renz M.; Villanueva, Benser Jan P.', '2020', 'This study examines the suitability of cacao cultivation under future climatic conditions using neural networks for predictive analysis.'),
('DC068', 'SNAPDRIVE: An Alternative Security System for Motorcycle Theft Prevention via Face Recognition Using a Modified Local Binary Pattern Histogram Algorithm with Blink Detection on Raspberry Pi', 'motorcycle theft prevention, face recognition, blink detection, Raspberry Pi, LBP histogram', 'Anden, Joven Rey; Badalo, Ray Neal; Sy, Michael P.; Jandayan, Michael Anthony R.', '2021', 'SNAPDRIVE is an alternative security system for motorcycles, using face recognition and RFID to prevent theft.'),
('DC069', 'Semantic Search Engine of E-Commerce Using Natural Language Processing', 'semantic search, e-commerce, natural language processing, product search, Elasticsearch', 'Mangaron, Andrei P.; Mangasar, Nico M.; Valdez, Vanne Moelle V.', '2022', 'A semantic search engine for e-commerce using natural language processing to improve product discovery and recommendation accuracy.'),
('DC070', 'Detecting COVID-19 Fake News Infodemic Using Hybrid Algorithm', 'COVID-19, fake news detection, machine learning, hybrid algorithm, social media', 'Arandela, Yvonne Grace F.; Cossid, Raschelle L.; Pacilan, Graciella Marian M.', '2022', 'Detecting COVID-19 fake news infodemic using hybrid machine learning models to identify misinformation on social media.'),
('DC071', 'A Hybrid Machine Learning Model Using CompuBox Data for Predicting Boxing Fight Outcome and Winning Condition with Boxer Style Clustering', 'boxing analytics, machine learning, fight prediction, clustering, sports analytics', 'Abule, Earll J.; Rapal, Eugene Louis D.; Tayco, Christian Ken A.', '2022', 'A hybrid machine learning model using CompuBox data for boxing analytics and fight outcome prediction.'),
('DC072', 'A Predictive Model for Sea Level Rise in Philippine Urban Areas with an Interactive Map Visualization', 'sea level rise, prediction model, climate change, random forest, R Shiny', 'Coquilla, Marc Jules B.; Quinones, Joma Ray A.; Salibio, Haus Christian C.', '2023', 'A predictive model for sea level rise in the Philippines using climate data and machine learning algorithms.'),
('DC073', 'Detecting Potential Fishing Zones with Probable Total Catch Using Feature Exploration and Machine Learning', 'fishing zones, fish catch forecast, ARIMA, machine learning, marine resources', 'Delos Reyes, Bezalel O.; Francisco, Joseven R.; Managing, Meichell Jynein J.', '2023', 'Detecting potential fishing zones using probable topographic methods and ARIMA forecasting for enhanced fisheries management.'),
('DC074', 'Predicting Water Quality Using Machine Learning in an Aquacultured Environment', 'aquaculture, water quality prediction, machine learning, SVM, decision tree', 'Apique, Nickel Snow; Domingo, Samuel III; Uytico, Elijah James; Tequin, Vera Kim', '2023', 'Predicting water quality in aquaculture systems using machine learning to ensure sustainable fish farming.'),
('DC075', 'Automated Semantic Segmentation of Cancerous Cells in Mammogram Image Using Novel Hybrid Convolutional Neural Network Techniques', 'mammogram, breast cancer detection, image segmentation, convolutional neural network, hybrid model', 'Amping, Isidro P. III; Leung, Zuriel Jett M.', '2023', 'Automated semantic segmentation of cancerous cells in mammograms to aid breast cancer detection.'),
('DC076', 'Classifying Cavendish Banana Maturity Stage Using ResNet-18 Architecture and Transfer Learning', 'banana classification, maturity stage detection, ResNet-18, transfer learning, deep learning', 'Lor, Fritzie B.; Sanoy, Brylle James; Siva, Syramae F.; Dumdumaya, Christina E.', '2023', 'Classifying Cavendish banana maturity stage using RNN and computer vision for improved agricultural management.'),
('DC077', 'DeVICE: Prediction and Analysis on the Substance Abuse of Adolescents in Poblacion District, Davao City', 'neural networks, substance abuse, adolescent health, prediction, data visualization', 'Amarillo, Vann Rijn D.; Gapuz, John Emmanuel G.', '2023', 'DeVICE is a predictive analysis system on adolescent substance abuse using neural networks.'),
('DC078', 'DURIO: An API-Based Android Mobile Application for Detecting Infected Areas in Durio Zibethinus Pods', 'durian disease, image segmentation, android app, agriculture, UNet model', 'Rivas, Rovic Jade P.; Jusayan, Armand Louise S.; Silvosa, Matthew Gabriel B.', '2023', 'DURIO is an API-based Android mobile application for detecting durian diseases using image segmentation and machine learning.'),
('DC079', 'Automated Cryptocurrency Trading Bot Using Machine Learning Model Ensemble', 'cryptocurrency trading, ensemble learning, Bitcoin, Ethereum, Binance, trading bot', 'Balbin, Charles Andrew P.; Ungab, Joshua Jay G.; Unson, Justine Riva F.', '2023', 'Automated cryptocurrency trading bot using machine learning ensemble models to predict Bitcoin and cryptocurrency prices.'),
('DC080', 'Detection Potential Fishing Zones in Davao Gulf: An Application of Geospatial Modeling on Remotely Sensed Data', 'fishing zones, Davao Gulf, geospatial data, kriging, remote sensing, PFZ mapping', 'De Gracia, Denver Fred A.; Songahid, Andrew Kenan A.; Maniwang, Nikko L.', '2023', 'Detection of potential fishing zones in Davao Gulf using geospatial data and Kriging interpolation techniques.'),
('DC081', 'Identifying Library Service Design Models of Public Library for Youth Development', 'library services, youth development, public libraries, service design, literacy programs', 'Bergonio, Chinee Lois; Veroy, Dave M.; Ferrando, Gresiel', '2020', 'Identifying library service design models of public libraries serving youth development programs.'),
('DC082', 'The Changing Roles of Librarians Towards Patrons with Special Needs: The Case of Selected Libraries in Davao Region', 'inclusive services, library accessibility, patrons with special needs, librarian roles', 'Pacaldo, James Harley L.; Almojera, Edward Dave T.; Sanico, Francis Andrian S.', '2022', 'The changing roles of librarians toward patrons with disabilities, emphasizing inclusive services and accessibility.'),
('DC083', 'Digital Rights Management on the Online Database of the USeP Library: A Challenge for Librarians', 'digital rights management, ODILO, online access, library systems, copyright', 'Tabanao, Chrystel Kaye H.; Tambis, Jenicel E.; Nabong-Templa, Eula Mae', '2022', 'Digital rights management on online databases using ODILO platform to control access and copyright protection.'),
('DC084', 'InProperR: Intellectual Property Rights of Unpublished Materials', 'intellectual property, copyright, unpublished materials, fair use, library rights', 'Madanlo, Cristy Jane D.; Pasinabo, Carlo Rey G.; Delima, Annacel B.', '2022', 'InProperR examines intellectual property rights of unpublished works and enforcement challenges in the digital era.'),
('DC085', 'Acceptability Level of College of Information and Computing Students on Online Library Services at University of Southeastern Philippines in Times of COVID-19 Pandemic', 'online library services, COVID-19, academic productivity, library access, USeP', 'Omega, Lucky Mae M.; Suriaga, CJ Nicole; Moldes, Cindy', '2022', 'Acceptability level of online library services in the College of Information and Communications during COVID-19.'),
('DC087', 'An Exploratory Study Investigating Students Outlook in Pursuing Library and Information Science', 'student motivation, LIS career, perception, education pathway, exploratory research', 'Ajos, Ella Aira Gen A.; Amboc, Riodelmar G.; Alonde, Dennis C.', '2023', 'An exploratory study investigating students outlook on LIS careers, motivation, and educational perception.'),
('DC088', 'USeP Digital Library: An Analysis of User Acceptance and Competency Level', 'digital library, TAM model, user acceptance, competency analysis, library technology', 'Delos Cientos, Jamaeca I.; Pamaong, Melanie B.; Sepada, Janeth R.; Villocino, Mikaela Ellen Mae B.', '2023', 'USeP Digital Library: Analysis of user acceptance using the TAM model to evaluate competency and engagement.'),
('DC089', 'Data Librarianship: Determining the Knowledge, Skills, and Competencies of Librarians in Davao City', 'data librarianship, research data services, KSAs, librarian roles, Davao', 'Pangan, Therese Margot Corazon T.; Pingkian, Ricardo S.', '2023', 'Data librarianship: determining the knowledge, skills, and abilities of data librarians in research data services.'),
('DC090', 'Indexinator: Designing a Prototype Web-Based Indexing Tool for the University Learning Resource Center', 'web-based tool, indexing system, ULRC, prototype design, library systems', 'Bullian, Kyle Jobert Y.; Latonio, Gerald Kenn I.; Tac-an, Ardemer E.', '2023', 'Indexinator is a prototype web-based indexing tool for ULRC collections to improve cataloging efficiency.'),
('DC091', 'Managing the USeP Museum: A Skill Assessment for ULRC Personnel', 'museum management, skill assessment, ULRC, library personnel, competency evaluation', 'Andrade, Shane Kimberly Z.; Mapinguez, Alan Joseph O.; Masinading, Catherine Joy L.; Remulta, Regine C.', '2023', 'Managing the USeP Museum: Skill assessment for library and museum personnel to enhance management practices.'),
('DC092', 'Effectiveness of Marketing Strategies in Promoting Public School Library Services in Davao City', 'library marketing, public school libraries, strategy effectiveness, student services', 'Basalo, Gerald D.; Compacion, Charisse Angeli A.; Granaderos, Christianne Dave P.', '2023', 'Effectiveness of marketing strategies in promoting library services in public school libraries.'),
('DC093', 'The Lived Experienced of Health Sciences Librarians in Evidence-Based Medicine', 'evidence-based medicine, health sciences librarians, lived experiences, medical information', 'Adarlo, Aubrey C.; Mordeno, Aira M.', '2023', 'The lived experiences of health sciences librarians in supporting evidence-based medicine in academic settings.'),
('DC094', 'The Level of Utilization and Access of School Library: Basis for an Enhanced Reading Program', 'school library, utilization, access, reading comprehension, reading program', 'Arsolon, John Kenth P.; Israel, Kurt Michael G.; Cuizon, Aldrich Ley G.; Dupla, Garjev M.', '2023', 'The level of utilization and access of school library resources and reading comprehension tools among students.'),
('DC095', 'Data Visualization of Book Collection for the University of Southeastern Philippines', 'data visualization, book collection, library system, academic libraries, RAD model', 'Delima, Annacel B.; Nugas, Maychelle M.', '2020', 'Data visualization of book collection for the University library system to enhance information accessibility.'),
('DC096', 'From Memory to Web: An Institutional Digital Repository for the Preservation of Historical and Cultural Artifacts of the University of the Immaculate Conception', 'digital repository, cultural heritage, institutional archives, metadata, digital preservation', 'Cañete, Anthony P.', '2021', 'From Memory to Web: Development of an institutional digital repository for cultural heritage and academic preservation.'),
('DC097', 'Development of an Alternative and Interactive Learning System in Teaching Filipino Language to Foreign Students', 'Filipino language, foreign learners, interactive learning, educational software, Ren\'py', 'Ruiz, Khristine Elaiza D.; Dumdumaya, Cristina E.', '2022', 'Development of an alternative and interactive learning system for Filipino language learners using digital tools.'),
('DC098', 'Development of Online Library Book Fair System', 'library system, book fair, online platform, digital acquisition, system development', 'Matalum, Fretsy Glen P.', '2022', 'Development of online library book fair system to facilitate digital access and management of books.'),
('DC099', 'Development of Web-Based Support Service Ticketing System of Ateneo de Davao University Library Jacinto Campus', 'library services, support system, ticketing platform, web-based helpdesk, user support', 'Quinte, Rutchel T.', '2023', 'Development of web-based support service ticketing system for library services to improve response and efficiency.'),
('DC100', 'C-MAP Analytics: A Web-Based Application of Collection Mapping for University of Immaculate Conception - Learning Resource Center Graduate School Library', 'collection mapping, library analytics, conspectus method, data visualization, digital assessment', 'Alibango, Jayson R.', '2024', 'C-MAP Analytics is a web-based application for collection mapping and library analytics using conspectus methods.'),
('DC101', 'CRIMESEER: An Index Crime Forecasting System Using Aprioritid and Naïve Bayes Classifier', 'crime forecasting, predictive policing, Naive Bayes, Aprioritid, crime prevention', 'Mutia, Neil A.', '2020', 'CRIMESEER is an index crime forecasting system using Naive Bayes to predict and prevent criminal activities.');
INSERT INTO `documents` (`DocumentID`, `Title`, `Keywords`, `Authors`, `YearPublished`, `Abstract`) VALUES
('DC102', 'E-Balangay: A Financial Management Information System for Barangays with Artificial Intelligence', 'financial system, barangay finance, AI classification, local governance, e-governance', 'Albarico, Gian B.; Mercado, Tamara Cher R.', '2020', 'E-Balangay is a financial management information system for barangay finance using AI classification and automation.'),
('DC103', 'Philippine Land Registry on the Ethereum Blockchain: A Decentralized Application', 'land registry, blockchain, Ethereum, smart contracts, property ownership', 'Galendez, Ryan Arcel', '2021', 'Philippine Land Registry on the Ethereum blockchain is a system for secure land ownership records using smart contracts.'),
('DC104', 'POBRE: Poverty Based on Regression - A Household Poverty Status Classifier thru Logistic Regression Algorithm', 'poverty classification, logistic regression, machine learning, household assessment, poverty status', 'Villaluna, Peter Paul C.; Machica, Ivy Kim D.', '2022', 'POBRE is a household poverty classification tool using logistic regression and machine learning techniques.'),
('DC105', 'CryptoNova: An Advance Tool Leveraging Machine Learning Algorithms for Cryptocurrency Price Prediction', 'cryptocurrency, machine learning, price prediction, GRU, LSTM, Bi-LSTM, data visualization', 'Tan, Jonas Albert C.; Villamor, Maureen M.', '2023', 'CryptoNova is an advanced tool leveraging machine learning to predict cryptocurrency prices and market trends.'),
('DC106', 'TEST', 'TEST', 'TESTR', '0000', 'TEST');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `FacultyID` varchar(10) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `LoginDetails` varchar(100) NOT NULL,
  `Role` varchar(50) NOT NULL,
  `AdminID` varchar(10) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`FacultyID`, `FirstName`, `LastName`, `LoginDetails`, `Role`, `AdminID`, `Password`) VALUES
('FC001', 'Cristina', 'Dumdumaya', 'cedumdumaya@usep.edu.ph', 'Professor', 'AD001', 'FCdumdumaya'),
('FC002', 'Randy', 'Gamboa', 'rsgamboa@usep.edu.ph', 'Professor', 'AD001', 'FCgamboa'),
('FC003', 'Tamara Cher', 'Mercado', 'tammy@usep.edu.ph', 'Professor', 'AD001', 'FCmercado'),
('FC004', 'Maureen', 'Villamor', 'maui@usep.edu.ph', 'Professor', 'AD001', 'FCvillamor'),
('FC005', 'Ivy Kim ', 'Machica', 'ikmachica@usep.edu.ph', 'Associate Professor', 'AD002', 'FCivymachica'),
('FC006', 'Michael', 'Machica', 'michael.machica@usep.edu.ph', 'Associate Professor', 'AD002', 'FCmicmachica'),
('FC007', 'Ariel Roy', 'Reyes', 'ariel.reyes@usep.edu.ph', 'Associate Professor', 'AD002', 'FCreyes'),
('FC008', 'Jamal Kay', 'Rogers', 'jamalkay.rogers@usep.edu.ph', 'Associate Professor', 'AD002', 'FCrogers'),
('FC009', 'Gresiel', 'Ferrando', 'gresielferrando@usep.edu.ph', 'Assistant Professor', 'AD003', 'FCferrando'),
('FC010', 'Nancy', 'Mozo', 'nancy.mozo@usep.edu.ph', 'Assistant Professor', 'AD003', 'FCmozo'),
('FC011', 'Leah', 'Pelias', 'leah.pelias@usep.edu.ph', 'Assistant Professor', 'AD003', 'FCpelias'),
('FC012', 'Hobert', 'Abrigana', 'haabrigana@usep.edu.ph', 'Instructor', 'AD004', 'FCabrigana'),
('FC013', 'Cheryl', 'Amante', 'cramante@usep.edu.ph', 'Instructor', 'AD004', 'FCamante'),
('FC014', 'Annacel', 'Delima', 'annacel.delima@usep.edu.ph', 'Instructor', 'AD004', 'FCdelima'),
('FC015', 'Cindy', 'Moldes', 'cindy.moldes@usep.edu.ph', 'Instructor', 'AD004', 'FCmoldes'),
('FC016', 'Eula Mae', 'Templa', 'eula.nabong@usep.edu.ph', 'Instructor', 'AD004', 'FCtempla'),
('FC017', 'Francis Andrain', 'Sanico', 'francis.sanico@usep.edu.ph', 'Instructor', 'AD004', 'FCsanico'),
('FC018', 'Vera Kim', 'Tequin', 'vkstequin@usep.edu.ph', 'Instructor', 'AD004', 'FCtequin'),
('FC019', 'Hermoso', 'Tupas Jr.', 'hermoso.tupas@usep.edu.ph', 'Instructor', 'AD004', 'FChermoso'),
('FC020', 'Philip', 'Navarez', 'prnavarez@usep.edu.ph', 'Instructor', 'AD004', 'FCnavarez'),
('FC021', 'Josephine', 'Magada', 'josephine.magada@usep.edu.ph', 'Administrative Aide I', 'AD005', 'FCmagada'),
('FC022', 'Marjorie', 'Inocando', 'mginocando@usep.edu.ph', 'MCIIS Staff', 'AD005', 'FCinocando'),
('FC023', 'Lloyd', 'Merafuentes', 'lmerafuentes@usep.edu.ph', 'Laboratory Aide/Technician', 'AD005', 'FCmerafuentes'),
('FC024', 'Kiana', 'Macan', 'kgmacan@usep.edu.ph', 'Technical Staff', 'AD005', 'FCmacan');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_27_130314_add_role_to_users_table', 2),
(5, '2025_11_27_131133_create_personal_access_tokens_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` varchar(50) NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Student', '2023', 'auth_token', '404018fd2b784eac2a610980c22feeb8d8b582cef927d58e51070e9da94f521c', '[\"*\"]', NULL, NULL, '2025-11-30 09:16:45', '2025-11-30 09:16:45'),
(2, 'App\\Models\\Student', '0', 'auth_token', '437a0abecc6197c4c280135d488cefc1b29243ac6474f54539883fdd4635a3e5', '[\"*\"]', NULL, NULL, '2025-11-30 09:17:20', '2025-11-30 09:17:20'),
(3, 'App\\Models\\Faculty', '0', 'auth_token', '5deec94d4ba80513cae619c3d8a8a98ab7fd493176ad7bb9f84d5c603ae5fc75', '[\"*\"]', NULL, NULL, '2025-11-30 09:18:46', '2025-11-30 09:18:46'),
(4, 'App\\Models\\Student', '2023', 'auth_token', '793a9f45ff633670e0629fc5e7e5b452c70af3d63bd80dd13cc8e9eb1ee346c3', '[\"*\"]', NULL, NULL, '2025-11-30 09:20:04', '2025-11-30 09:20:04'),
(5, 'App\\Models\\Student', '2023', 'auth_token', '940f38e089edd6cf2a06bee7f80dee9faabbfab3d41c4298596776da47cf1645', '[\"*\"]', NULL, NULL, '2025-11-30 09:20:14', '2025-11-30 09:20:14'),
(6, 'App\\Models\\Faculty', '0', 'auth_token', '3d01a08d553c248fd4ce9037de230ab58325352e6afaa87d415c07ffbc37af5e', '[\"*\"]', NULL, NULL, '2025-11-30 09:20:17', '2025-11-30 09:20:17'),
(7, 'App\\Models\\Student', '2023', 'auth_token', '1904d5b9b6fbdceb10b8bb39413d4b9780a40050eab9676b2795ab5b62a8f7ad', '[\"*\"]', NULL, NULL, '2025-11-30 09:24:07', '2025-11-30 09:24:07'),
(8, 'App\\Models\\Faculty', '0', 'auth_token', 'a9fd1eb7e33b333bf19ab83cee84828d32beff3c0aa6b113ee5bf692f60c0e92', '[\"*\"]', NULL, NULL, '2025-11-30 09:38:18', '2025-11-30 09:38:18'),
(9, 'App\\Models\\Faculty', '0', 'auth_token', '6b2cf92461191bcdd0d360911bd8f788c572e6fa7ecd64e400c579cd61bc5c6e', '[\"*\"]', NULL, NULL, '2025-11-30 09:42:56', '2025-11-30 09:42:56'),
(10, 'App\\Models\\Faculty', '0', 'auth_token', '0d56b51c4106a0589350ee9ffb975821d7cf75991c131f2d210de158b3257411', '[\"*\"]', NULL, NULL, '2025-11-30 09:46:42', '2025-11-30 09:46:42'),
(11, 'App\\Models\\Student', '2023', 'auth_token', 'e954d1fd90453bc491f3e5b81e7c471bf6e55d0ecd46896a1e58ea819bb6913b', '[\"*\"]', NULL, NULL, '2025-11-30 09:47:11', '2025-11-30 09:47:11'),
(12, 'App\\Models\\Student', '0', 'auth_token', '14228bd7c42bc7051bc2b2694712fc9e282e2aab81dfa787f10a66164812592b', '[\"*\"]', NULL, NULL, '2025-11-30 09:50:17', '2025-11-30 09:50:17'),
(13, 'App\\Models\\Student', '2023', 'auth_token', 'a9214fca3dd27008e0686c283096f8d9d3e3c0f1cf3f798178289b5fd0e85ece', '[\"*\"]', NULL, NULL, '2025-11-30 10:05:55', '2025-11-30 10:05:55'),
(14, 'App\\Models\\Student', '2023', 'auth_token', 'e8e949d029df0798c7a4b8a38b03564ed13e8bb4218f94a07a9011138aea1291', '[\"*\"]', NULL, NULL, '2025-11-30 10:08:29', '2025-11-30 10:08:29'),
(15, 'App\\Models\\Student', '0', 'auth_token', 'fd7c4d8e6602258fd380134bcee63aa3ede75f811f2e7fd7fef3a98e20cc7138', '[\"*\"]', NULL, NULL, '2025-11-30 10:08:46', '2025-11-30 10:08:46'),
(16, 'App\\Models\\Faculty', '0', 'auth_token', 'bc90dd9335ef509c7fa780bff4f263461be416d60de120a0dea450eaa5c3e1d0', '[\"*\"]', NULL, NULL, '2025-11-30 10:09:27', '2025-11-30 10:09:27'),
(17, 'App\\Models\\Student', '2023', 'auth_token', '5506f90431d70360acbef4f08570c968464f2751292383a91afe81a74d329fab', '[\"*\"]', NULL, NULL, '2025-11-30 10:10:40', '2025-11-30 10:10:40'),
(18, 'App\\Models\\Student', '2023', 'auth_token', '58eaa27ce0298dbc239d4197f14bfb67f187b8054f36fc2811eb453a0776cd44', '[\"*\"]', NULL, NULL, '2025-11-30 10:17:49', '2025-11-30 10:17:49'),
(19, 'App\\Models\\Faculty', '0', 'auth_token', '2b12261fd6fb2505bc525f45878090020a8ce9494fd24238783b260f216f959a', '[\"*\"]', NULL, NULL, '2025-11-30 10:18:17', '2025-11-30 10:18:17'),
(20, 'App\\Models\\Faculty', '0', 'auth_token', '4fdbef78a9d212d00c0291f6429b13f20ea5fd943d911cd7d070b1a75f5a77bc', '[\"*\"]', NULL, NULL, '2025-11-30 10:18:41', '2025-11-30 10:18:41'),
(21, 'App\\Models\\Faculty', '0', 'auth_token', 'f1c7e5dcf02580303a91f37a2900907f4f65ee7a2e7792f13c7762bc8cdc33b4', '[\"*\"]', NULL, NULL, '2025-11-30 10:19:12', '2025-11-30 10:19:12'),
(22, 'App\\Models\\Faculty', '0', 'auth_token', '07d886dc91b3312f1a48cfd105e9ee0b003476480e3ea1bc17d2616efe2f1c72', '[\"*\"]', NULL, NULL, '2025-11-30 10:19:17', '2025-11-30 10:19:17'),
(23, 'App\\Models\\Student', '0', 'auth_token', 'f009d7b75295b1ae14b3958fcc0ea1b7945266f34d90cf3021ec1c6fd3d4d4be', '[\"*\"]', NULL, NULL, '2025-11-30 10:19:43', '2025-11-30 10:19:43'),
(24, 'App\\Models\\Student', '0', 'auth_token', 'b63343adf1fe0c1fbcb2984c47d324ee0198e1eebed2eea5012855471f82b178', '[\"*\"]', NULL, NULL, '2025-11-30 10:20:01', '2025-11-30 10:20:01'),
(25, 'App\\Models\\Student', '2023', 'auth_token', '4f91daace23eb78751994c458462c6018bef85a97f064fbb179465e7a2884abd', '[\"*\"]', NULL, NULL, '2025-11-30 20:38:14', '2025-11-30 20:38:14'),
(26, 'App\\Models\\Student', '2023', 'auth_token', '970a9f752ce9c4425bce2eb4a0a7dfeb0304ed84cfcb80d307a06ab3bfccf363', '[\"*\"]', NULL, NULL, '2025-11-30 20:38:17', '2025-11-30 20:38:17'),
(27, 'App\\Models\\Faculty', '0', 'auth_token', 'bf8f44f68b4c46479b55f50d153c163c8eb23888881f8bf8cccf8fcc173be80f', '[\"*\"]', NULL, NULL, '2025-12-01 02:48:57', '2025-12-01 02:48:57'),
(28, 'App\\Models\\Student', '2023', 'auth_token', '8ddead9b7cf800f79f94d34a5b2a16def6d3dea7183d40599153d3c331c38e39', '[\"*\"]', NULL, NULL, '2025-12-01 02:49:28', '2025-12-01 02:49:28'),
(29, 'App\\Models\\Student', '2023', 'auth_token', 'ea0302a6a27bb1941066a26485a927c193bc0cd2e298838c6ae53c7f3da261d5', '[\"*\"]', NULL, NULL, '2025-12-01 02:51:44', '2025-12-01 02:51:44'),
(30, 'App\\Models\\Student', '2023', 'auth_token', '9975d5ae4c80d704b647211b25386639190a99ada6f5f7ffcdbc439b6ec2fcf6', '[\"*\"]', NULL, NULL, '2025-12-01 03:21:34', '2025-12-01 03:21:34'),
(31, 'App\\Models\\Student', '2023', 'auth_token', '2a8077e848e3cf17f94d505724ebbdfbadfcde424b7aedaca8b015c4c9cc21ee', '[\"*\"]', NULL, NULL, '2025-12-01 03:21:40', '2025-12-01 03:21:40'),
(32, 'App\\Models\\Student', '2023', 'auth_token', 'af56fa188fa36ec0535771e5d1a9de21c62e1a8c4987da82b5c51cac33e079be', '[\"*\"]', NULL, NULL, '2025-12-01 03:24:00', '2025-12-01 03:24:00'),
(33, 'App\\Models\\Student', '2023', 'auth_token', '44c77bd4e7e3b029c98ae3b6c279ced715e960342a4d60f310638679c2995791', '[\"*\"]', NULL, NULL, '2025-12-01 03:24:29', '2025-12-01 03:24:29'),
(34, 'App\\Models\\Student', '2023', 'auth_token', 'f13ef69f1939cd735f6bb5764cb79aa90499a5fb0953c3e63d30a95240a330bb', '[\"*\"]', NULL, NULL, '2025-12-01 03:28:56', '2025-12-01 03:28:56'),
(35, 'App\\Models\\Student', '2023', 'auth_token', 'b22a7cc8841a846ebf0247ee79bd25cfcbb9d6e235822409a386bd0c1e9d4b76', '[\"*\"]', NULL, NULL, '2025-12-01 03:29:28', '2025-12-01 03:29:28'),
(36, 'App\\Models\\Faculty', '0', 'auth_token', '1a7a7754165897af4982ad0d0f4138485dc0232135a486d6554a5230c137b037', '[\"*\"]', NULL, NULL, '2025-12-01 03:31:39', '2025-12-01 03:31:39'),
(37, 'App\\Models\\Student', '2023', 'auth_token', '44e8a626a4ccc1f261685673f307671b259d21d112e84a41be802f8dab284d9d', '[\"*\"]', NULL, NULL, '2025-12-01 03:48:17', '2025-12-01 03:48:17'),
(38, 'App\\Models\\Student', '2023', 'auth_token', '5ec305c9749a6ed4f7d6c196b7780d8a30f5889fe14f3426fac2f2040e739421', '[\"*\"]', NULL, NULL, '2025-12-01 03:48:24', '2025-12-01 03:48:24'),
(39, 'App\\Models\\Student', '2023', 'auth_token', 'e2fcc082c5b2dd6b8049dec12088d01d035d4b4aff7b9bb7b2927c647a6972c6', '[\"*\"]', NULL, NULL, '2025-12-01 03:48:36', '2025-12-01 03:48:36'),
(40, 'App\\Models\\Student', '2023', 'auth_token', '39155aa782c6a996d13151b0b1c7747df4d3242813b7df3ee040a6ea6d1bbbb0', '[\"*\"]', NULL, NULL, '2025-12-01 03:59:28', '2025-12-01 03:59:28'),
(41, 'App\\Models\\Student', '2023', 'auth_token', '99eca2423c42141c8c77672398a131f5300c87b6127600e51d7c72ee8e4f3718', '[\"*\"]', NULL, NULL, '2025-12-01 03:59:32', '2025-12-01 03:59:32'),
(42, 'App\\Models\\Faculty', '0', 'auth_token', '3f4f85d0faa81de2ee69b2e0a896870fd585898d169f9cb15f1c5e500c4558e3', '[\"*\"]', NULL, NULL, '2025-12-01 03:59:52', '2025-12-01 03:59:52'),
(43, 'App\\Models\\Student', '2023', 'auth_token', 'b517ecf4650cbbe0a7835f5d437e48fdaaff7ea052762b8d4a8b45fb14be1247', '[\"*\"]', NULL, NULL, '2025-12-01 04:00:02', '2025-12-01 04:00:02'),
(44, 'App\\Models\\Student', '2023', 'auth_token', 'bc74ebde404a884edec39dcbdcf02bb34d170ed5cf6a9e227c5d08ce891e4b5a', '[\"*\"]', NULL, NULL, '2025-12-01 04:00:05', '2025-12-01 04:00:05'),
(45, 'App\\Models\\Student', '2023', 'auth_token', '259fa4df168acac35c32ebf4363ec49cc661b442908784c7225a45beac34e110', '[\"*\"]', NULL, NULL, '2025-12-01 04:00:06', '2025-12-01 04:00:06'),
(46, 'App\\Models\\Student', '2023', 'auth_token', '4e2cbe52d45d63408e497498a6612633154cd2184c8756fdcfc5ec1935d1237c', '[\"*\"]', NULL, NULL, '2025-12-01 04:04:47', '2025-12-01 04:04:47'),
(47, 'App\\Models\\Student', '2023', 'auth_token', '5c1d4cb8f80fd1b62e4b428266186573d5aac390de93e487e9e5ff9b035c52e3', '[\"*\"]', NULL, NULL, '2025-12-01 04:20:15', '2025-12-01 04:20:15'),
(48, 'App\\Models\\Faculty', '0', 'auth_token', '6ea5ab82775b9ee0ca718f2969c989fa5f1673ae55d357d36db6eed8eab87e00', '[\"*\"]', NULL, NULL, '2025-12-01 04:20:29', '2025-12-01 04:20:29'),
(49, 'App\\Models\\Student', '2023', 'auth_token', 'df4eefbfc8387c5d78119d7a2ee04d7efc01b13757e49dc8c2dbd7bc7f98a457', '[\"*\"]', NULL, NULL, '2025-12-01 04:21:00', '2025-12-01 04:21:00'),
(50, 'App\\Models\\Student', '2023', 'auth_token', '8290337dd9024a3c85f8a1816e494ed20ca11691796f46a4b37bc3ec1b92f31d', '[\"*\"]', NULL, NULL, '2025-12-01 04:21:06', '2025-12-01 04:21:06'),
(51, 'App\\Models\\Student', '2023', 'auth_token', 'd49ff075a5071a5b0c0b0a820a7a618a929e4c365fbb6062718701c15656ff8b', '[\"*\"]', NULL, NULL, '2025-12-01 04:21:26', '2025-12-01 04:21:26'),
(52, 'App\\Models\\Student', '2023', 'auth_token', 'ea84921c9b43536411da028d82e64bdc6badf38eacf611d2a1b4222970105c32', '[\"*\"]', NULL, NULL, '2025-12-01 04:21:27', '2025-12-01 04:21:27'),
(53, 'App\\Models\\Student', '2023', 'auth_token', '9933878e8085767d4c955f3523cfc5351a664cc327bb695ba51db4d084e926f9', '[\"*\"]', NULL, NULL, '2025-12-01 04:27:06', '2025-12-01 04:27:06'),
(54, 'App\\Models\\Student', '2023', 'auth_token', 'fea0e876f02dd26a39a62abb5ad61fde675c401be2b2ff2fd9f3647722b415c6', '[\"*\"]', NULL, NULL, '2025-12-01 04:27:12', '2025-12-01 04:27:12'),
(55, 'App\\Models\\Faculty', '0', 'auth_token', 'c9b548ffed0bb8da5c815f37a042325963399e8d7a7e48c6fb9d2f97998d0cdc', '[\"*\"]', NULL, NULL, '2025-12-01 04:28:36', '2025-12-01 04:28:36'),
(56, 'App\\Models\\Student', '2023', 'auth_token', 'abc63b677a53a09ebf050b5807f2e920650b031b6186f886de95c7bc92a32666', '[\"*\"]', NULL, NULL, '2025-12-01 04:30:12', '2025-12-01 04:30:12'),
(57, 'App\\Models\\Student', '2023', 'auth_token', 'eb2de025785baadc5be97cc8c6bb24ae8d60c5ead151a0a434ee5b1f32c078fc', '[\"*\"]', NULL, NULL, '2025-12-01 04:44:15', '2025-12-01 04:44:15'),
(58, 'App\\Models\\Student', '2023', 'auth_token', '947894e6506cb256170bc3eea012167f09fe2e56b60b3cc4024f5eb9b933ce1c', '[\"*\"]', NULL, NULL, '2025-12-01 05:03:19', '2025-12-01 05:03:19'),
(59, 'App\\Models\\Faculty', '0', 'auth_token', 'e846430a2c375a59a496d2a53fdc5cd073f2a37add999efd665b79bf43949ed3', '[\"*\"]', NULL, NULL, '2025-12-01 05:03:45', '2025-12-01 05:03:45'),
(60, 'App\\Models\\Student', '2023', 'auth_token', '7e48b828daf31f980d9d15345189422e777cbf22125acf4d3fb5efc07750e2cd', '[\"*\"]', NULL, NULL, '2025-12-01 06:30:36', '2025-12-01 06:30:36'),
(61, 'App\\Models\\Student', '2023', 'auth_token', 'ed0d8839fd68ad77829a4fddbb41b85b75e697059fea07d926a68e6fafe07a51', '[\"*\"]', NULL, NULL, '2025-12-01 06:30:40', '2025-12-01 06:30:40'),
(62, 'App\\Models\\Student', '2023', 'auth_token', '41168234482dbc2a8fbd86d0d7c4482240b55ee244174a013c00449814713e94', '[\"*\"]', NULL, NULL, '2025-12-01 06:34:54', '2025-12-01 06:34:54'),
(63, 'App\\Models\\Student', '2023', 'auth_token', '66653efb5f20c04cb2ae4b3b38deacb310fd35253a946b42f09963e857222780', '[\"*\"]', NULL, NULL, '2025-12-01 06:42:50', '2025-12-01 06:42:50'),
(64, 'App\\Models\\Faculty', '0', 'auth_token', '87c8d4e5d277dcc46d2cf6697834c2fc40b9878f4235752affc7506ab176b3d1', '[\"*\"]', NULL, NULL, '2025-12-01 06:43:26', '2025-12-01 06:43:26'),
(65, 'App\\Models\\Student', '2023', 'auth_token', '20dc2f8d995f1d1d762c9ba63f04c39aad070db4b0821c312a51f23107d78525', '[\"*\"]', NULL, NULL, '2025-12-01 06:43:37', '2025-12-01 06:43:37'),
(66, 'App\\Models\\Faculty', '0', 'auth_token', '706b3c94c3ed9f55270d0fa22c0af70426e6a3d1b8389f013c1e7946f89c6fc6', '[\"*\"]', NULL, NULL, '2025-12-01 06:43:47', '2025-12-01 06:43:47'),
(67, 'App\\Models\\Student', '2023', 'auth_token', 'd40cc2306267768b5a9acab0a08a2569fb00e1a41494fd18996e57ab29653a38', '[\"*\"]', NULL, NULL, '2025-12-01 21:58:00', '2025-12-01 21:58:00'),
(68, 'App\\Models\\Student', '2023', 'auth_token', '9a6cf351836468c27bc550e31e3c41d673e3f4c1c413faa73b99d5ffca8bd101', '[\"*\"]', NULL, NULL, '2025-12-01 22:17:06', '2025-12-01 22:17:06'),
(69, 'App\\Models\\Student', '2023', 'auth_token', 'cc85796b95e9bf1d0d23475665c98467239aabad5553f0b9e2c8a8114e666641', '[\"*\"]', NULL, NULL, '2025-12-01 22:20:09', '2025-12-01 22:20:09'),
(70, 'App\\Models\\Student', '2023', 'auth_token', '8df8ce1f909a25e4cd104ede3a356e54da5e3ceca70a432bbc92dd0142428db7', '[\"*\"]', NULL, NULL, '2025-12-01 22:20:16', '2025-12-01 22:20:16'),
(71, 'App\\Models\\Student', '2023', 'auth_token', 'a52dd044ba2a1d26c73452af6659958fa35e162b8edd20d4aa347b6cb41ede20', '[\"*\"]', NULL, NULL, '2025-12-01 22:30:38', '2025-12-01 22:30:38'),
(72, 'App\\Models\\Student', '2023', 'auth_token', '343b288e44ca6d63012778654cc7d8a0d66ad16595b2f909a799e3836fa9e889', '[\"*\"]', NULL, NULL, '2025-12-01 22:30:41', '2025-12-01 22:30:41'),
(73, 'App\\Models\\Student', '2023', 'auth_token', '33f4c69157bf05ba0789f1ca2458e9532413b337604971d410f9b527c343e6e0', '[\"*\"]', NULL, NULL, '2025-12-01 22:39:27', '2025-12-01 22:39:27'),
(74, 'App\\Models\\Student', '2023', 'auth_token', '394a7256f324ac173c0dec44b6ed8bd02e79ac42cc4c768aa4c63bc168659351', '[\"*\"]', NULL, NULL, '2025-12-01 22:42:04', '2025-12-01 22:42:04'),
(75, 'App\\Models\\Student', '2023', 'auth_token', '181e7d5a4de384a2e3867cbf42de785a3ea35ab9efe79d4dd533ea921c456cb8', '[\"*\"]', NULL, NULL, '2025-12-01 23:58:37', '2025-12-01 23:58:37'),
(76, 'App\\Models\\Student', '2023', 'auth_token', 'ad04bdf4ec9020f9a667efeb288f3890ff1314ee8dfcf08399c74dfccd8fe519', '[\"*\"]', '2025-12-02 00:01:50', NULL, '2025-12-02 00:01:25', '2025-12-02 00:01:50'),
(77, 'App\\Models\\Student', '2023', 'auth_token', '9912595b9d0d36a9fd68a35b5e835d38a8969185c00e44412d865013d886ee0b', '[\"*\"]', '2025-12-02 02:20:52', NULL, '2025-12-02 02:03:51', '2025-12-02 02:20:52'),
(78, 'App\\Models\\Student', '2023', 'auth_token', 'ac95697645bd0fd1b9ad729e7e137d805988e85ad56f5d69929655d65fa253f6', '[\"*\"]', '2025-12-02 02:31:46', NULL, '2025-12-02 02:26:11', '2025-12-02 02:31:46'),
(79, 'App\\Models\\Student', '2023', 'auth_token', 'fb2aed352b4f08818e11c3d85805e74218ababf24e375a55dc6716edcdcfe7f5', '[\"*\"]', '2025-12-02 02:35:55', NULL, '2025-12-02 02:35:25', '2025-12-02 02:35:55'),
(80, 'App\\Models\\Student', '2023', 'auth_token', '620ab55b081c322583bc3a4bca031c4e04aef1c9477b4f4d5adc81dec618889b', '[\"*\"]', '2025-12-02 02:55:01', NULL, '2025-12-02 02:54:51', '2025-12-02 02:55:01'),
(81, 'App\\Models\\Student', '2023', 'auth_token', '15bddbe2089207572348389342aca2b96e3d1d7580848fc017427924f49b65f3', '[\"*\"]', '2025-12-02 03:41:34', NULL, '2025-12-02 03:33:23', '2025-12-02 03:41:34'),
(82, 'App\\Models\\Student', '2023', 'auth_token', 'e16a76be652391d174e858276a5e23d6ad009617fc202a6d1f8d1b0f524d193f', '[\"*\"]', '2025-12-02 03:45:41', NULL, '2025-12-02 03:42:24', '2025-12-02 03:45:41'),
(83, 'App\\Models\\Student', '2023', 'auth_token', '35def438ddb1477e60c0ca332bbf0a28112b77a020d6a7553ae0aa5e2d953c3f', '[\"*\"]', '2025-12-02 04:30:13', NULL, '2025-12-02 03:50:01', '2025-12-02 04:30:13'),
(84, 'App\\Models\\Student', '2023', 'auth_token', 'c421d981a5fc54dd83d173354cb79704c8f49ea01454e9b96178ee2b881b20d2', '[\"*\"]', NULL, NULL, '2025-12-02 04:07:12', '2025-12-02 04:07:12'),
(85, 'App\\Models\\Student', '2023', 'auth_token', '8f07e0a119505a5ea4988b01560828ae2b8ab399371881998986f2d0c46b6ed0', '[\"*\"]', NULL, NULL, '2025-12-02 04:14:59', '2025-12-02 04:14:59'),
(86, 'App\\Models\\Student', '2023', 'auth_token', 'f42b391d7f27385a60218224fac5586d3c9bca5792311a11d9d1eca5ff4a0a85', '[\"*\"]', '2025-12-02 04:18:48', NULL, '2025-12-02 04:18:20', '2025-12-02 04:18:48'),
(87, 'App\\Models\\Student', '2023', 'auth_token', '8a76ab26901067dd08c8ebe4614241ed7c477ddca1e46f017ad20ecf976331a9', '[\"*\"]', NULL, NULL, '2025-12-02 05:38:47', '2025-12-02 05:38:47'),
(88, 'App\\Models\\Student', '2023', 'auth_token', 'bc04501eb74cea75e7a96636347f2ae408f54fcfb4d6ef1aeb84dae3580f3de0', '[\"*\"]', NULL, NULL, '2025-12-02 05:38:50', '2025-12-02 05:38:50'),
(89, 'App\\Models\\Student', '2023', 'auth_token', '03d1c09816f88f0da4a1d72dd5dccf8afc7ccba48b9422c6a3238dfdb690d95d', '[\"*\"]', NULL, NULL, '2025-12-02 05:38:59', '2025-12-02 05:38:59'),
(90, 'App\\Models\\Student', '2023', 'auth_token', 'c668b9cd97aadd6d8b3bc9504c1abcef3b6f7cd8239ebc2d5da0665bf89edba1', '[\"*\"]', NULL, NULL, '2025-12-02 05:39:00', '2025-12-02 05:39:00'),
(91, 'App\\Models\\Student', '2023', 'auth_token', '88813d78add2ab4a87207441785dda8f7d67c9e5edeb5b95852329f24b61836e', '[\"*\"]', NULL, NULL, '2025-12-02 05:39:01', '2025-12-02 05:39:01'),
(92, 'App\\Models\\Student', '2023', 'auth_token', 'a309f705150fcddb9afb1fb4e6b7ad1a283de791efc104f0c38fd60604ff1e63', '[\"*\"]', NULL, NULL, '2025-12-02 05:39:02', '2025-12-02 05:39:02'),
(93, 'App\\Models\\Student', '0', 'auth_token', 'c89d643f78e6d3a27718e3b188f85f5fa62042d5d85b5171e97150402a5b87a3', '[\"*\"]', '2025-12-02 05:45:43', NULL, '2025-12-02 05:45:31', '2025-12-02 05:45:43'),
(94, 'App\\Models\\Student', '0', 'auth_token', 'dec49a326448b9b153ef3604d24a70774daaf6955f541e68de832c22378827c8', '[\"*\"]', '2025-12-02 06:26:57', NULL, '2025-12-02 05:56:55', '2025-12-02 06:26:57'),
(95, 'App\\Models\\Faculty', '0', 'faculty_token', '722e3b99eecb1a51f01fe488ff0081679f0c23b1735b483383b88d9c95d086d4', '[\"*\"]', NULL, NULL, '2025-12-02 07:31:42', '2025-12-02 07:31:42'),
(96, 'App\\Models\\Faculty', '0', 'faculty_token', '36469611f6211994d4151ae22f5ae3057b84474d1f07b6a5d6f6995417f843c1', '[\"*\"]', NULL, NULL, '2025-12-02 07:33:07', '2025-12-02 07:33:07'),
(97, 'App\\Models\\Faculty', '0', 'faculty_token', 'e1c1030f4b50da014034df36004ef4b60eeb02ed163c12018e7d822d0403955f', '[\"*\"]', NULL, NULL, '2025-12-02 07:36:55', '2025-12-02 07:36:55'),
(98, 'App\\Models\\Faculty', '0', 'faculty_token', '056bbaf628f736ee948cc4c563a36a62027144442543750b4c60de6d46a3c40a', '[\"*\"]', NULL, NULL, '2025-12-02 07:38:31', '2025-12-02 07:38:31'),
(99, 'App\\Models\\Faculty', '0', 'faculty_token', 'bad43f05dfcaec7452b9a24bc94762a8bc11c10d32fb2bdcc4bd683f3a07a900', '[\"*\"]', NULL, NULL, '2025-12-02 07:47:46', '2025-12-02 07:47:46'),
(100, 'App\\Models\\Faculty', '0', 'faculty_token', 'c02cf8b570859c665ef4b36e89aa086e4db2f040ec7fd0fc334232219bad1a3e', '[\"*\"]', NULL, NULL, '2025-12-02 07:54:40', '2025-12-02 07:54:40'),
(101, 'App\\Models\\Faculty', '0', 'faculty_token', '2ef59de7c30867ae47a4800026e57915f9bfc2d9bacbc9749c931bfc6ec50b84', '[\"*\"]', NULL, NULL, '2025-12-02 07:58:44', '2025-12-02 07:58:44'),
(102, 'App\\Models\\Faculty', '0', 'faculty_token', '8592c765ac745b07cb52cc97aaf9ed5d34461b61a129003dddb3b306123b398f', '[\"*\"]', NULL, NULL, '2025-12-02 08:06:05', '2025-12-02 08:06:05'),
(103, 'App\\Models\\Faculty', '0', 'faculty_token', 'f42db73f0fb5ea2f7e79a307ece4f889d7669a0b8b7356f3ea7b5ea306c42b57', '[\"*\"]', NULL, NULL, '2025-12-02 08:06:25', '2025-12-02 08:06:25'),
(104, 'App\\Models\\Faculty', '0', 'faculty_token', '107e86f4df0d06bc400f13555d795c1e6699d85a6ac1b99487d4064883a34a4d', '[\"*\"]', NULL, NULL, '2025-12-02 08:18:16', '2025-12-02 08:18:16'),
(105, 'App\\Models\\Student', 'ST267', 'student_token', 'fd46880b778c7585b27e404a061e68471689df7b3a8d20ab07c1269e519059cf', '[\"*\"]', NULL, NULL, '2025-12-02 08:19:08', '2025-12-02 08:19:08'),
(106, 'App\\Models\\Student', 'ST267', 'student_token', 'e747cb0b4004339f3d55f8c23ab04cc599761a43bc84372969ce84686019370f', '[\"*\"]', NULL, NULL, '2025-12-02 08:19:11', '2025-12-02 08:19:11'),
(107, 'App\\Models\\Student', 'ST267', 'student_token', '628667ce6f9975090b3a0c28c42f2ea209d1a9a674c4475b49596000f6434d7b', '[\"*\"]', NULL, NULL, '2025-12-02 08:19:17', '2025-12-02 08:19:17'),
(108, 'App\\Models\\Student', 'ST267', 'student_token', '7d27cae644ee438256a4eb4d34b4dc10eff3b544ffb29e1a513d805bcb5399d9', '[\"*\"]', NULL, NULL, '2025-12-02 08:19:50', '2025-12-02 08:19:50'),
(109, 'App\\Models\\Student', 'ST267', 'student_token', '4b73f8aba0a7f76cf2747a5cdf1cb42310db6c738de664557173d8a9986f5725', '[\"*\"]', NULL, NULL, '2025-12-02 08:32:48', '2025-12-02 08:32:48'),
(110, 'App\\Models\\Student', 'ST267', 'student_token', '20bebdf1e6ef00c495648c56a0a6fde5ad9baeb7d592ec9795e2cee307d63c46', '[\"*\"]', NULL, NULL, '2025-12-02 08:33:17', '2025-12-02 08:33:17'),
(111, 'App\\Models\\Student', 'ST267', 'student_token', '8553201511e5fd470faaaa6a0bd371b0b06884d67ca37f1659daf2dd66bc3bd4', '[\"*\"]', NULL, NULL, '2025-12-02 08:33:36', '2025-12-02 08:33:36'),
(112, 'App\\Models\\Student', 'ST267', 'student_token', '65f196656b3122db250529f479cb96a3a9592b84571b3167376ac05a1b3063ce', '[\"*\"]', NULL, NULL, '2025-12-02 08:33:41', '2025-12-02 08:33:41'),
(113, 'App\\Models\\Student', 'ST267', 'student_token', '0fa1312ebae12000ff5bf6f2e3fe3d6341023cbfcbc7fd211ae154a46efc9205', '[\"*\"]', NULL, NULL, '2025-12-02 08:36:55', '2025-12-02 08:36:55'),
(114, 'App\\Models\\Student', 'ST267', 'student_token', '76e983711e6a4d9ff592b7c368e5f7f22dc0c18d8ab17b33b28f01683cce0860', '[\"*\"]', NULL, NULL, '2025-12-02 08:37:01', '2025-12-02 08:37:01'),
(115, 'App\\Models\\Student', 'ST267', 'student_token', 'e5d9a1fe6db0a9ee79c6d449a1be6e267a4b6972980adf7e3042f89261817337', '[\"*\"]', '2025-12-02 08:50:44', NULL, '2025-12-02 08:42:42', '2025-12-02 08:50:44'),
(116, 'App\\Models\\Student', 'ST267', 'student_token', '3f2d9a4cbbb507ddb050347cc153bf2b5c2f1ae36a067401feb880184ba43f26', '[\"*\"]', '2025-12-02 08:57:16', NULL, '2025-12-02 08:50:49', '2025-12-02 08:57:16'),
(117, 'App\\Models\\Student', 'ST267', 'student_token', 'c9a99d35bc44f5175ab907f000b4545cc257e42e85b76b694f71e0d2a12bae9a', '[\"*\"]', '2025-12-02 09:01:23', NULL, '2025-12-02 08:57:31', '2025-12-02 09:01:23'),
(118, 'App\\Models\\Student', 'ST267', 'student_token', '6ce3e6392c65dfd68e90f51a6c7a30a3772d999f223a44fc5a159c840d5807c1', '[\"*\"]', '2025-12-02 09:07:23', NULL, '2025-12-02 09:01:24', '2025-12-02 09:07:23'),
(119, 'App\\Models\\Student', 'ST267', 'student_token', '983e03df2ef78bd56dfb903653cd62fd355a2c1f158d9c5cc8734704748eef83', '[\"*\"]', '2025-12-02 09:10:39', NULL, '2025-12-02 09:09:05', '2025-12-02 09:10:39'),
(120, 'App\\Models\\Student', 'ST267', 'student_token', 'e66c9a2d598a073aceb85e3bdf0528e92ecea0ba46eeee0f17508d44a26bd086', '[\"*\"]', '2025-12-02 09:15:22', NULL, '2025-12-02 09:11:10', '2025-12-02 09:15:22'),
(121, 'App\\Models\\Student', 'ST267', 'student_token', '0fc345bdc9dc5eefa5d42fe7a51ec0a29d9240119264a5a779a10b3f77654b25', '[\"*\"]', '2025-12-02 09:30:14', NULL, '2025-12-02 09:16:12', '2025-12-02 09:30:14'),
(122, 'App\\Models\\Student', 'ST267', 'student_token', '65ec869ffa8e49ea4c87b75b9a974a7d6af7a67265c998c329e9aaf00fb00401', '[\"*\"]', '2025-12-02 09:27:09', NULL, '2025-12-02 09:27:02', '2025-12-02 09:27:09'),
(123, 'App\\Models\\Student', 'ST267', 'student_token', '0008fbf3ae11a31dcdef9ae6b23c2e98f6e02f260e117aa4f637561b548f7441', '[\"*\"]', '2025-12-02 09:30:54', NULL, '2025-12-02 09:30:36', '2025-12-02 09:30:54'),
(124, 'App\\Models\\Faculty', '0', 'faculty_token', '69091fc0e3b6a1514357157b1acd78f2f797eaf9b1f26f94741acf0564e7a90a', '[\"*\"]', NULL, NULL, '2025-12-02 09:31:10', '2025-12-02 09:31:10'),
(125, 'App\\Models\\Student', 'ST267', 'student_token', '0576769220669ad6b1e1fa5cd5146052e8b348e7b0489f41c5ac4556ac8d7dd2', '[\"*\"]', '2025-12-02 09:32:38', NULL, '2025-12-02 09:31:27', '2025-12-02 09:32:38'),
(126, 'App\\Models\\Student', 'ST267', 'student_token', '46a07f789e7b9ad72394dce4f4f43e07c5a569469adbf7d597e3c8d668e19a0c', '[\"*\"]', '2025-12-02 09:33:07', NULL, '2025-12-02 09:33:03', '2025-12-02 09:33:07'),
(127, 'App\\Models\\Faculty', '0', 'faculty_token', '3a029f3ad87ac432c692afe645a88f4443221378da6d26a0af0e13d663de866a', '[\"*\"]', NULL, NULL, '2025-12-02 09:33:29', '2025-12-02 09:33:29'),
(128, 'App\\Models\\Faculty', '0', 'faculty_token', '6ea430d7f59546baaea5cb69999b667eecbf92d757974a51d23a36d113c6d338', '[\"*\"]', NULL, NULL, '2025-12-02 09:42:03', '2025-12-02 09:42:03'),
(129, 'App\\Models\\Faculty', '0', 'faculty_token', '60ff0b208c69493d799854ab4b89d47bae54bfa9a9463ec2056b03fd0a5a443b', '[\"*\"]', NULL, NULL, '2025-12-02 10:30:49', '2025-12-02 10:30:49'),
(130, 'App\\Models\\Faculty', '0', 'faculty_token', 'd1e7c4fda86a86588a5ed3f28adb957010628b0cf768ff0bac62bca6fe44a1cc', '[\"*\"]', NULL, NULL, '2025-12-02 10:50:18', '2025-12-02 10:50:18'),
(131, 'App\\Models\\Student', 'ST267', 'student_token', '8d28672fc71d699d0f7b0fa57430a143786339aeb461824b80e8bad93d159887', '[\"*\"]', '2025-12-02 11:14:52', NULL, '2025-12-02 10:51:10', '2025-12-02 11:14:52'),
(132, 'App\\Models\\Faculty', '0', 'faculty_token', '4a4cdf81e05ee48d2f02713572b42247403c76f762d382c37e180c06c98cb18b', '[]', NULL, '2025-12-03 11:14:44', '2025-12-02 11:14:44', '2025-12-02 11:14:44'),
(133, 'App\\Models\\Faculty', '0', 'faculty_token', '4db65c463c6d3515a9160953614c1b9ee7ba1e8543c2b6fe2c9f00cd4505ed7a', '[]', NULL, '2025-12-03 11:15:05', '2025-12-02 11:15:05', '2025-12-02 11:15:05'),
(134, 'App\\Models\\Faculty', '0', 'faculty_token', 'cf39ad8fc52330658aad2cd960d16051f723cfb0d2e0e0e2b818965cbc6ed285', '[]', NULL, '2025-12-03 11:15:25', '2025-12-02 11:15:25', '2025-12-02 11:15:25'),
(135, 'App\\Models\\Faculty', '0', 'faculty_token', '68ca16c78eeedd28de95274c61d800d0336729c9d2088eb2b11509a76285132c', '[]', NULL, '2025-12-03 11:16:09', '2025-12-02 11:16:09', '2025-12-02 11:16:09'),
(136, 'App\\Models\\Faculty', '0', 'faculty_token', '9355d682e0176cf7162b1cb622a3d50328b9931613d6e9c498530c650edc6ca7', '[]', NULL, '2025-12-03 11:17:11', '2025-12-02 11:17:11', '2025-12-02 11:17:11'),
(137, 'App\\Models\\Student', 'ST267', 'student_token', 'ba1dd958e8dfbac9c2029694a0b7b510d3f493dd9fae7cd59b6ae664a6a92f56', '[\"*\"]', '2025-12-02 11:19:42', NULL, '2025-12-02 11:19:37', '2025-12-02 11:19:42'),
(138, 'App\\Models\\Faculty', '0', 'faculty_token', '62ba7885081158b112757997e7501ed3f363c7664c25512c470d44d1328eb78b', '[]', NULL, '2025-12-03 11:28:59', '2025-12-02 11:28:59', '2025-12-02 11:28:59');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0R9IFwHKOV33aNRwfAhwFxt3Pmvrp4ikBWSWzziI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEhrS2N0SlBUVk9VcW4zMDRZQjJLU1ZURmlsQW0wSUpZUkZaenhXRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764696809),
('56r4QbjDDZYPuLmA0mMrYyXeX3YQYenkCiaq3LDf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXZ6czVPbmxsWEFWdGVjUEJkcEZ2VUJBa3BKcjRkQmFLM2JsbGZ2QSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764696433),
('5R6ChQvT2cIN9jwvyuAu8ZWXxAzQ8xehNmB4KLOq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVk5Jdm1UZEVlMDVPdjlDMVJkcWRtMHZjZ0gxb2E3SEx1QUtTckhOTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZ3Vlc3QvZG9jdW1lbnQvREMwMDIiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1764694647),
('6OOldOLre8trKjayqX9ap4W91ewai3qtD41fimjY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGJVSWtib0VlTWNiMzJ4bmI1RHF1enlFSk8wZVhndFVWNUdSWlh0biI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764696410),
('7Ss7U13iORHGRyMu8WPSvQdY38JS3iE6BLeBHUNb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmdXTHM4clNMRjloZDNHS0p4QlgzdEdEU2dYZkxnUXZFZWRaTmlsWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764696421),
('8mgvMLPzwe92HL398Gx08RToh9I74Jc34BsKuDFe', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQkZqVlJYazZoRXNnNmhrSTRBZldlQkZDMmhtR2ZId2lpeTV5VUlTMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764696687),
('8Srx2CI8QDssYl1h15ls7vk21OI5LfACJ44LXExz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWhOa3RCeWkwT0VyNjY5NGhLWWxaUTVIZHZNNnJuejRIdlNMUDVrUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764701417),
('9RF5kIYoNMSx92qbgfwiYI2wVA0qlLIyLv4Rvjvc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY21iNVdVMnJnUE5rWHo4Rzc4VzhUNGY2ampCNmV4cXh1VUJ5Y1QyUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764701469),
('AbCJuD2KrddUeaTO91ravc2dNw3ihU7ZAzkHVkSK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNU1zbTBqdG9GV0pkdGc0VmxkNGtaaWxGajFYQnZNOGtmbFF6MnBVNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764694248),
('aYyFUhzze3Oa303684xbZDxrMMkRgj1Clxrl0lzl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGtKV2FzTXdFcmM2SEFhZUoyUFUyNFdndWRaVzQydWVMaFBqR0ZkUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZGFzaGJvYXJkL2d1ZXN0IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1764696581),
('B8ajb0NrOy8DGw41qzSPU5cqxEbTusPWnYtpHebq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRndQUk1xazhZSWpRVmk5YVBjejUySmRyTE4xWWJTME5HRUtJNzl6eiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764695470),
('bilZsy1zL0wJvuZwZKZl7JqkykKhXOIFpEchdf8y', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1JIZHBVbDRPWG1OWFdFWkUyaTlUYWZEaU0zMWJtOXhCRHU4c3oxNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764702968),
('BkEoQpFDDPhHAiHFS8n633KHklx8M2u44LcAi9oe', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZlJIM0N5QmNsdjBMQlU5ODBCZFg3OVBlblVGSWhTNzZCaWJrRHRoayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZ3Vlc3QvZG9jdW1lbnQvREMwMDIiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1764696583),
('cYrweddQ2tKZ5MgbcoCeAuorV8E3GlctlMI54F1w', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGhkQkxXYnRDU3BaeDVxYXY2dEVtNWhaYTZhT3dPNnVqNW9laUc1VyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764694884),
('dCgau5pBCzljev1lOcVHC8nSKXvewOOjH3HHYdpz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2F0Y2NreGdjclBhdlY2cWEzcUxYQThEQmlISDVTaWpKbTZNTWw0eiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764693220),
('DEJjErb9ZFTCaVK1DGr9bsr2ziBzZHOR55xgNW1b', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmZ4OEpGVWhHS2VndFRGMkZMTFFhNTBhbklZZHdrdmNjMU40STBKaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764696783),
('egBzyJ9yFghPsALdVNKBSwziTAWcseByNWDnRmSq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVlN6bTBmVXNOSnVldFcxT0luUFM1ZzN3dXZiem5pU3hDbzZJSXA5bSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764693415),
('faMh3nftb0dfr6XtU6McuqLxHhn0z16n8oblO0RS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHBaRWJyS2dPdUhNeHM0eG85S0dBWndxem5uV1F5b0M1cEw0OVFwMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZ3Vlc3QvZG9jdW1lbnQvREMwMjYiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1764696620),
('FAOA6GmquszxIXgQEViW1ivO9ssQuYEhpK8pwd4i', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid05nYnZiY1VBQTh6b0pPbFkxcHhiNVdLMUlXVmM3SEhNenhvYmpBTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764702883),
('FDMcE1CaHJotQvFNaT2woeWfxVt1eCFTxR4ek2ki', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXl1MzFYSzg3N2Z3d0JOVmZMQ0FYOHozcnhzQTVQazBMSE4yUzlCeCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764689441),
('FnyqNRCLh9Sld3rPKdZasbIOndIFYk4Lb1lYYpCv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkRwcEhGUGdJWFQ2Y2NZaTZxMnhaRGVYUHN3bEhjV3NXYzBDMTZweiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764694650),
('gt35LXAC9bUzXdZ2xyuVTeqY9UUdsqr1K1FLxXey', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicVlyeG80aEd0UjFMRHQxYnJzTjNGVTExTjMxOWpQNXoxN3Q5VzZsNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764696670),
('iG2exDZ43ZiNjoBFwb6gm5kBflbXPtxIB5hEJ8Ul', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0N0NkY3V1N0YVJIQlRmazc3Y2tPd2xYZXByYUNKQk40dnQ4d1JTbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZ3Vlc3QvZG9jdW1lbnQvdW5kZWZpbmVkIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1764695002),
('iizQxtrNo4EqZvb1feAdwXA60B4b3DzQAP1fYqbh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWllkRHhPUGNINFpRM1Z0OEE0cWVuWUNMOU0wV3B1YnNYNll6N2xmWSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764695771),
('imcluZCIGMgmmbj2yTux0hrB4y1auhVnZKv4qfKa', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibENXQUZKOElFNjVDSXJOb1dHQlFaYXVpR0hRb1ZSVm5rTjdMMTJaYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764693421),
('inzNazs5jiNO4nZtKvZpdPCtEcCf5Q2uYvqtFqkF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWlkyUXBIMFFlYjFyTU53dTZGUnZUSTliZzZvRGJoWnFLTHBjb28yMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764703030),
('ivda8rKhNrrFukQ8Z4X5EAJKLrLLbr9PicHyAvMH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYW50QnNDN2FNSW5VQW5xUmVZVTNiYXc5ZHpDY0J1Rkg0UlBaNlQ0WiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764695345),
('jI65iOIIAEiklunQX1iprQLMlcMLUBgi4q0LMfA5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGtSMTdSSzdNM3NQRUx1Zkl6d1k0TDBWalVMdmFhQWNrekpkUlZyayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZ3Vlc3QvZG9jdW1lbnQvREMwMDIiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1764694638),
('MalTv00TW1h8T1cxnayGj4smLs5VfBzZtSMM5RkI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUFnZlJHTmkxUzQxdzlwN2N6RVBheGVhQzE3V3puOXExeGtPbFY4UyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZ3Vlc3QvZG9jdW1lbnQvREMwMjYiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1764696620),
('MSlzsBHx3hcaiwMdgtwAMKhXI7LqhYQLVOCBpZS6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidDVkMkU0THc4OUFLTzJFYjFmSzkxQUZkUmIwUjlvaGd5WjlIMFNTZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764702905),
('nStV7sG0RxdhixCg7YFWkpRteJMWgMOlDodMyPG6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFpLSHpPcW1hY29YNGNVM0xEUU42UTR0cm5UQWlqb0hYZ05UVTJiUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764703739),
('nyfND9aljLYFllc5WNeqCKu1ZRkfEyShD0u0Wast', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUTlqTmh4NWFBU2JIS2RvNUhCU0dwVDRwQ0JzR2pIaWZlT0VzTmQ3byI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764693197),
('omL4TgZv7JCvy9UVukFdQLFcfmFPTEhA1lHN9M0Y', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV3N1T0gxc2FCd0dBeVE4cjlxRm1qN2dwU0dXQ1NLUTFzaVNwajhNQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZ3Vlc3QvZG9jdW1lbnQvREMwMDIiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1764696583),
('poe1ApSByVO2Dz0u4qbDDuzGuzvZ8DH0orAOJU5x', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3o3ekRaZjFXRnRJSnROVXFNbnY4VkxUbmR1T3B2TzIzdUtDT3pDcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZ3Vlc3QvZG9jdW1lbnQvREMwMDIiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1764694638),
('PP6IBK2RgXaLa2Dh0BaOx9XTRsvP1YLseMiLvgNF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUxIUjUwSlNTd1BSM3pkV1huNlA5VzZhMlhPdFJJREFXSkE3aGNEWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764689911),
('pPQ9TnFN6YMslv9GXx22wZKuIKp8KBfnkj0C9TIp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZDhqdWFJOG9uUFpvTGRIelE3MDR3Q05wNkVaNE5JYzBrendkcWxiVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764696635),
('Py9WSAoXBJ8nlVrYA9CvXQ9T8PW0lnHNBQUwyqQi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWhINkt3SHBhYm1oc2NnelFLNmltZHlReWNIRVJhMTB4dzFYbFVrbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764692350),
('Ryuk8SChzSXZpOuWRcylhJvJks4fCEkblTm9Z66Z', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXpPb3dneEcxZmUxUmNvUW5DeTRyZm1EbUF3WE5TQkU1UmE2UjdoUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764700247),
('s55yssKHxP4I0zSepMYQ31uvkbPvG9c1MVt2dK0p', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEpaZFRodE96U2dzS0RFczZwWDNOazVraHl5TVZ5M2VNUmhoN045bSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764693762),
('uezEzTsRMG1kUwauSbeK1A8d5kq9D71p5gB6wwsu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0ZEb2VZb1JMUFNnZER5Z012Z05nd28zSGlvQW1wb2ZuZVhzNHh2YyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764693168),
('VfFwalZdq5vP8XkqL51Y4c4Vfp0x5BlwqhFu6IRD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoickFxVDVDaU5JRHhRNkVXNUVmNk5HcXA2em5PaFo3WXNkRTlMTWFLcSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764702925),
('wDQFRjP9A0hFpwCXxRsn1MaF1otKudB1DinY00RD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicjd5c0ZhMmVZSVZwU0luaTV5NHJ6S2ZQa1I1R0NMbm1MQUxnWTF5ZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764689897),
('wsv5XebPgDwCoxpa7ygag26mH53AKl1Ur3SxgCOa', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieTJNbXc2RURFenJBOHJ5S0xoYml2a2RMbXB2ekMzdlA3bmhmQXVWNSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZ3Vlc3QvZG9jdW1lbnQvREMwMDIiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1764694647),
('wvtQcRI9fspjTrhvzAugF6Fti8DexPmjaKGIayqm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMU1veGlvQ2RKdzNkWmlhQ2RNcVFEM3FUQ0xaVlFUaWFpaEtQNXJ0RCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764692356),
('wzRLzBZIDJUga5R09Xx8YHJ4z45eKln1jefsY2Xa', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2VKdFNZR3dLUDROMGhlQTl1RXk5SDVIenlBNnFrT3lwOUQ0UzNlZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZGFzaGJvYXJkL2d1ZXN0IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1764696776),
('y0fO7LEoRzst6Dyq3Q2skz3KzYpdyz9FJqvFKWJt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSVBsWVhsNDNMVmZ1UGxFWnp2VGRsRHVZbTdKSTBQWHpBNWlGQUdQeCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764703177),
('Ynp8N22fnxzeglDWOmJ36EyWAy1NTk3qabIxUJMq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGZPTmpBNHh6cDdpdkdHOXlId2JDd2x0NnF3SnQzc204MXFiRzRMZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZ3Vlc3QvZG9jdW1lbnQvdW5kZWZpbmVkIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1764695002),
('Z5nuRRzShLZM0RRg92wcT2xZSeAYTJ62ZwdKWP81', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 OPR/124.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSk1jdXNLR2ZYQlRwMHFMRmRzOUI5Q2t5RVNSemNnU0JLYW04YkViTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjtzOjU6InJvdXRlIjtzOjE5OiJzYW5jdHVtLmNzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764693216),
('ZNISmBXExwK220978Wndwq0pen9r6ySv28KFn389', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2NRZmxkemVDR1AxNW9HVkNmWWF1bU9GRHhpMmtFWndTSkJPeTBkRSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZGFzaGJvYXJkL2d1ZXN0IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1764696430);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `StudentID` varchar(10) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `LoginDetails` varchar(100) DEFAULT NULL,
  `Program` varchar(50) NOT NULL,
  `ProgramType` varchar(50) NOT NULL,
  `DateCreated` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`StudentID`, `FirstName`, `LastName`, `Email`, `LoginDetails`, `Program`, `ProgramType`, `DateCreated`) VALUES
('ST001', 'Carl Stephen', 'Caya', 'ccaya@usep.edu.ph', 'STcaya', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST002', 'Merra Elaiza', 'Espinosa', 'mespinosa@usep.edu.ph', 'STespinosa', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST003', 'Mice Dianne', 'Moria', 'mmoria@usep.edu.ph', 'STmoria', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST004', 'Lovely Roze', 'Amandy', 'lamandy@usep.edu.ph', 'STamandy', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST005', 'Theona', 'Aton', 'taton@usep.edu.ph', 'STaton', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST006', 'Andrea Gail', 'Balcom', 'abalcom@usep.edu.ph', 'STbalcom', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST007', 'Martkneil Jan', 'Javier', 'mjavier@usep.edu.ph', 'STjavier', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST008', 'Christian', 'Lavilla', 'clavilla@usep.edu.ph', 'STlavilla', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST009', 'Matt Jacob', 'Rulona', 'mrulona@usep.edu.ph', 'STrulona', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST010', 'Reymart', 'Casas', 'rcasas@usep.edu.ph', 'STcasas', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST011', 'Paola', 'Concubierta', 'pconcubierta@usep.edu.ph', 'STconcubierta', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST012', 'Elvina', 'Garcia', 'egarcia@usep.edu.ph', 'STgarcia', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST013', 'Nica', 'Carcallas', 'ncarcallas@usep.edu.ph', 'STcarcallas', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST014', 'Sim Japhet', 'Delos Reyes', 'sdelosreyes@usep.edu.ph', 'STdelosreyes', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST015', 'Jan Enrico', 'Quinamot', 'jquinamot@usep.edu.ph', 'STquinamot', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST016', 'Jude Norbert', 'Barsal', 'jbarsal@usep.edu.ph', 'STbarsal', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST017', 'Ian James', 'Gaspar', 'igaspar@usep.edu.ph', 'STgaspar', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST018', 'Francis Lloyd', 'Ripalda', 'fripalda@usep.edu.ph', 'STripalda', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST019', 'Pauline Marie', 'Dumagan', 'pdumagan@usep.edu.ph', 'STdumagan', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST020', 'Kiarrah', 'Menil', 'kmenil@usep.edu.ph', 'STmenil', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST021', 'Ma. Mitchie', 'Sampani', 'msampani@usep.edu.ph', 'STsampani', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST022', 'Daryl Kate', 'Good', 'dgood@usep.edu.ph', 'STgood', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST023', 'Shenny Maree', 'Ormo', 'sormo@usep.edu.ph', 'STormo', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST024', 'Frances Mae', 'Dimaano', 'fdimaano@usep.edu.ph', 'STdimaano', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST025', 'Rio Jessa Mae', 'Florida', 'rflorida@usep.edu.ph', 'STflorida', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST026', 'Jonell', 'Jumang-it', 'jjumangit@usep.edu.ph', 'STjumangit', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST027', 'Aira Camille', 'Lamberte', 'alamberte@usep.edu.ph', 'STlamberte', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST028', 'Amanda Jane', 'Ruelo', 'aruelo@usep.edu.ph', 'STruelo', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST029', 'Jhon B.', 'Vincent', 'jbvincent@usep.edu.ph', 'STvincent', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST030', 'Ara Noreen', 'Manito', 'amanito@usep.edu.ph', 'STmanito', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST031', 'George Caturza', 'Jr.', 'gcaturza@usep.edu.ph', 'STcaturza', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST032', 'Noemi Andreyanne', 'Canlog', 'ncanlog@usep.edu.ph', 'STcanlog', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST033', 'Leonel', 'Torrefiel', 'ltorrefiel@usep.edu.ph', 'STtorrefiel', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST034', 'Cleo', 'Pantinople', 'cpantinople@usep.edu.ph', 'STpantinople', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST035', 'Hazel Joy', 'Arnado', 'harnado@usep.edu.ph', 'STarnado', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST036', 'Joshua James', 'Cabrera', 'jcabrera@usep.edu.ph', 'STcabrera', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST037', 'Abdur Rahim', 'Jumlani', 'ajumlani@usep.edu.ph', 'STjumlani', 'BSIT', 'Undergraduate', '2016-08-22'),
('ST038', 'Donell D.', 'Abenoja', 'dabenoja@usep.edu.ph', 'STabenoja', 'BSCS', 'Undergraduate', '2016-08-22'),
('ST039', 'Lorenzo Lolek R.', 'Mateo', 'lmateo@usep.edu.ph', 'STmateo', 'BSCS', 'Undergraduate', '2016-08-22'),
('ST040', 'Niebby Jen B.', 'Barez', 'nbarez@usep.edu.ph', 'STbarez', 'BSCS', 'Undergraduate', '2016-08-22'),
('ST041', 'Mae Amor C.', 'Galleto', 'mgalleto@usep.edu.ph', 'STgalleto', 'BSCS', 'Undergraduate', '2016-08-22'),
('ST042', 'Kim Clarizze R.', 'Remolta', 'kremolta@usep.edu.ph', 'STremolta', 'BSCS', 'Undergraduate', '2016-08-22'),
('ST043', 'Jonel C.', 'Getigan', 'jgetigan@usep.edu.ph', 'STgetigan', 'BSCS', 'Undergraduate', '2016-08-22'),
('ST044', 'Exceed Renz M.', 'Ramos', 'eramos@usep.edu.ph', 'STramos', 'BSCS', 'Undergraduate', '2016-08-22'),
('ST045', 'Benser Jan P.', 'Villanueva', 'bvillanueva@usep.edu.ph', 'STvillanueva', 'BSCS', 'Undergraduate', '2016-08-22'),
('ST046', 'Chinee Lois', 'Bergonio', 'cbergonio@usep.edu.ph', 'STbergonio', 'BLIS', 'Undergraduate', '2016-08-22'),
('ST047', 'Dave M.', 'Veroy', 'dveroy@usep.edu.ph', 'STveroy', 'BLIS', 'Undergraduate', '2016-08-22'),
('ST048', 'Maychelle M.', 'Nugas', 'mnugas@usep.edu.ph', 'STnugas', 'MLIS', 'Postgraduate', '2016-08-22'),
('ST049', 'Jehoney V.', 'Alboroto', 'jalboroto@usep.edu.ph', 'STalboroto', 'MLIS', 'Postgraduate', '2016-08-22'),
('ST050', 'Maureen M.', 'Villamor', 'mvillamor@usep.edu.ph', 'STvillamor', 'MLIS', 'Postgraduate', '2016-08-22'),
('ST051', 'Peter M.', 'Cainglet', 'pcainglet@usep.edu.ph', 'STcainglet', 'MLIS', 'Postgraduate', '2016-08-22'),
('ST052', 'Neil A.', 'Mutia', 'nmutia@usep.edu.ph', 'STmutia', 'MIT', 'Postgraduate', '2016-08-22'),
('ST053', 'Gian B.', 'Albarico', 'galbarico@usep.edu.ph', 'STalbarico', 'MIT', 'Postgraduate', '2016-08-22'),
('ST054', 'Angelica Mae', 'Betonio', 'abetonio@usep.edu.ph', 'STbetonio', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST055', 'Jomari', 'Ondap', 'jondap@usep.edu.ph', 'STondap', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST056', 'Carmilla', 'Benalet', 'cbenalet@usep.edu.ph', 'STbenalet', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST057', 'May Flor', 'Lape', 'mlape@usep.edu.ph', 'STlape', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST058', 'Reno Roy', 'Sorima', 'rsorima@usep.edu.ph', 'STsorima', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST059', 'Dionne Evony', 'Diola', 'ddiola@usep.edu.ph', 'STdiola', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST060', 'Bebe Mae', 'Roxas', 'broxas@usep.edu.ph', 'STroxas', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST061', 'Audrey Marie', 'Taghoy', 'ataghoy@usep.edu.ph', 'STtaghoy', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST062', 'Chuzelyn', 'Maxino', 'cmaxino@usep.edu.ph', 'STmaxino', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST063', 'Judelyn', 'Rubia', 'jrubia@usep.edu.ph', 'STrubia', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST064', 'Johanna Mae', 'Vidal', 'jvidal@usep.edu.ph', 'STvidal', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST065', 'Eugene', 'Cortes', 'ecortes@usep.edu.ph', 'STcortes', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST066', 'Shareld Rose', 'Baobao', 'sbaobao@usep.edu.ph', 'STbaobao', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST067', 'Dyesebel', 'Centillas', 'dcentillas@usep.edu.ph', 'STcentillas', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST068', 'Jay Mark', 'Taganahan', 'jtaganahan@usep.edu.ph', 'STtaganahan', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST069', 'Quenie Marie', 'Penanueva', 'qpenanueva@usep.edu.ph', 'STpenanueva', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST070', 'Mark', 'Lumen', 'mlumen@usep.edu.ph', 'STlumen', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST071', 'Jay Ar', 'Drilon', 'jdrilon@usep.edu.ph', 'STdrilon', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST072', 'Romel', 'Hermoso', 'rhermoso@usep.edu.ph', 'SThermoso', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST073', 'Ariel Roy', 'Reyes', 'areyes@usep.edu.ph', 'STreyes', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST074', 'Mary Rose', 'Adorable', 'madorable@usep.edu.ph', 'STadorable', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST075', 'Faye Hazel', 'Remis', 'fremis@usep.edu.ph', 'STremis', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST076', 'Aries Dominic', 'Mahinay', 'amahinay@usep.edu.ph', 'STmahinay', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST077', 'Raymund', 'Ontolan', 'rontolan@usep.edu.ph', 'STontolan', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST078', 'Jazzy Bert', 'Viernes', 'jviernes@usep.edu.ph', 'STviernes', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST079', 'Vil Marie', 'Agcol', 'vagcol@usep.edu.ph', 'STagcol', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST080', 'Ellen Mae', 'Calzada', 'ecalzada@usep.edu.ph', 'STcalzada', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST081', 'Junard John', 'Clenista', 'jclenista@usep.edu.ph', 'STclenista', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST082', 'Pauline Grace', 'Albutra', 'palbutra@usep.edu.ph', 'STalbutra', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST083', 'Rennjo', 'Buquia', 'rbuquia@usep.edu.ph', 'STbuquia', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST084', 'Darleen', 'Lungay', 'dlungay@usep.edu.ph', 'STlungay', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST085', 'Jumar', 'Dulay', 'jdulay@usep.edu.ph', 'STdulay', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST086', 'Jehoiakim Jade', 'Esgana', 'jesgana@usep.edu.ph', 'STesgana', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST087', 'John Jay', 'Rivera', 'jrivera@usep.edu.ph', 'STrivera', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST088', 'Harris', 'Carreon', 'hcarreon@usep.edu.ph', 'STcarreon', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST089', 'Kent Charles', 'Cutamora', 'kcutamora@usep.edu.ph', 'STcutamora', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST090', 'Hyacinth Faye', 'Tabasa', 'htabasa@usep.edu.ph', 'STtabasa', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST091', 'Allen Grace', 'Decierdo', 'adecierdo@usep.edu.ph', 'STdecierdo', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST092', 'Queenie', 'Dumangas', 'qdumangas@usep.edu.ph', 'STdumangas', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST093', 'Kristine Mae', 'Merecuelo', 'kmerecuelo@usep.edu.ph', 'STmerecuelo', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST094', 'Angelica', 'Coquilla', 'acoquilla@usep.edu.ph', 'STcoquilla', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST095', 'Jeelenee Jayson', 'De Claro', 'jdeclaro@usep.edu.ph', 'STdeclaro', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST096', 'Kyle Matthew', 'Martinez', 'kmartinez@usep.edu.ph', 'STmartinez', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST097', 'Jahmicah Nissi', 'Boo', 'jboo@usep.edu.ph', 'STboo', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST098', 'Mary Elisse', 'Gonzales', 'mgonzales@usep.edu.ph', 'STgonzales', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST099', 'Maruela Angela', 'Regalado', 'mregalado@usep.edu.ph', 'STregalado', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST100', 'Joshua Antonio', 'Castro', 'jcastro@usep.edu.ph', 'STcastro', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST101', 'Elnathan Timothy', 'Dela Cruz', 'edelacruz@usep.edu.ph', 'STdelacruz', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST102', 'Jawad', 'Agantal', 'jagantal@usep.edu.ph', 'STagantal', 'BSIT', 'Undergraduate', '2017-08-22'),
('ST103', 'Joven Rey', 'Anden', 'janden@usep.edu.ph', 'STanden', 'BSCS', 'Undergraduate', '2017-08-22'),
('ST104', 'Ray Neal', 'Badalo', 'rbadalo@usep.edu.ph', 'STbadalo', 'BSCS', 'Undergraduate', '2017-08-22'),
('ST105', 'Michael P.', 'Sy', 'msy@usep.edu.ph', 'STsy', 'BSCS', 'Undergraduate', '2017-08-22'),
('ST106', 'Etel Ella Mae H.', 'Cajilig', 'ecajilig@usep.edu.ph', 'STcajilig', 'MLIS', 'Postgraduate', '2017-08-22'),
('ST107', 'Anthony P.', 'Cañete', 'acañete@usep.edu.ph', 'STcañete', 'MLIS', 'Postgraduate', '2017-08-22'),
('ST108', 'Ryan Arcel', 'Galendez', 'rgalendez@usep.edu.ph', 'STgalendez', 'MIT', 'Postgraduate', '2017-08-22'),
('ST109', 'Ina', 'Alegrado', 'ialegrado@usep.edu.ph', 'STalegrado', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST110', 'Trisha Marie', 'Hagunob', 'thagunob@usep.edu.ph', 'SThagunob', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST111', 'Angelika Mari', 'Robles', 'arobles@usep.edu.ph', 'STrobles', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST112', 'Kenneth King Jones', 'Celocia', 'kcelocia@usep.edu.ph', 'STcelocia', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST113', 'Rona', 'Licera', 'rlicera@usep.edu.ph', 'STlicera', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST114', 'Roxan', 'Tiu', 'rtiu@usep.edu.ph', 'STtiu', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST115', 'Melisa', 'Calleado', 'mcalleado@usep.edu.ph', 'STcalleado', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST116', 'Emmabelle', 'Alcuizar', 'ealcuizar@usep.edu.ph', 'STalcuizar', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST117', 'Mark Ian', 'Pama', 'mpama@usep.edu.ph', 'STpama', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST118', 'Aimee Grace', 'Aguilar', 'aaguilar@usep.edu.ph', 'STaguilar', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST119', 'Akela Paulene', 'Antalan', 'aantalan@usep.edu.ph', 'STantalan', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST120', 'Shekinah Jane', 'Valenzona', 'svalenzona@usep.edu.ph', 'STvalenzona', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST121', 'Lean Gabriel', 'Alfafara', 'lalfafara@usep.edu.ph', 'STalfafara', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST122', 'Ivan Rhay Jeferson', 'Sapar', 'isapar@usep.edu.ph', 'STsapar', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST123', 'Kurt Russel', 'Arabejo', 'karabejo@usep.edu.ph', 'STarabejo', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST124', 'Marie Mae', 'Neñeria', 'mneñeria@usep.edu.ph', 'STneñeria', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST125', 'Melissa', 'Borlaza', 'mborlaza@usep.edu.ph', 'STborlaza', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST126', 'Aizle Bianca', 'Pausang', 'apausang@usep.edu.ph', 'STpausang', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST127', 'Leo', 'Llanto', 'lllanto@usep.edu.ph', 'STllanto', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST128', 'Jim Bryan', 'Agbay', 'jagbay@usep.edu.ph', 'STagbay', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST129', 'Cherry Rhodlyn', 'Lagra', 'clagra@usep.edu.ph', 'STlagra', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST130', 'Lawrence Christopher', 'Rosario', 'lrosario@usep.edu.ph', 'STrosario', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST131', 'John Eric Paolo', 'Gubaton', 'jgubaton@usep.edu.ph', 'STgubaton', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST132', 'Richard', 'Peligor', 'rpeligor@usep.edu.ph', 'STpeligor', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST133', 'Arvin Garret', 'Arbizo', 'aarbizo@usep.edu.ph', 'STarbizo', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST134', 'Marc Louie', 'Balansag', 'mbalansag@usep.edu.ph', 'STbalansag', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST135', 'Christy Hyacinth', 'Carpesano', 'ccarpesano@usep.edu.ph', 'STcarpesano', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST136', 'Bryle', 'Alfanta', 'balfanta@usep.edu.ph', 'STalfanta', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST137', 'Joshua Chris', 'Duran', 'jduran@usep.edu.ph', 'STduran', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST138', 'Brad Ford', 'Rosal', 'brosal@usep.edu.ph', 'STrosal', 'BSIT', 'Undergraduate', '2018-08-22'),
('ST139', 'Andrei P.', 'Mangaron', 'amangaron@usep.edu.ph', 'STmangaron', 'BSCS', 'Undergraduate', '2018-08-22'),
('ST140', 'Nico M.', 'Mangasar', 'nmangasar@usep.edu.ph', 'STmangasar', 'BSCS', 'Undergraduate', '2018-08-22'),
('ST141', 'Vanne Moelle V.', 'Valdez', 'vvaldez@usep.edu.ph', 'STvaldez', 'BSCS', 'Undergraduate', '2018-08-22'),
('ST142', 'Yvonne Grace F.', 'Arandela', 'yarandela@usep.edu.ph', 'STarandela', 'BSCS', 'Undergraduate', '2018-08-22'),
('ST143', 'Raschelle L.', 'Cossid', 'rcossid@usep.edu.ph', 'STcossid', 'BSCS', 'Undergraduate', '2018-08-22'),
('ST144', 'Graciella Marian M.', 'Pacilan', 'gpacilan@usep.edu.ph', 'STpacilan', 'BSCS', 'Undergraduate', '2018-08-22'),
('ST145', 'Earll J.', 'Abule', 'eabule@usep.edu.ph', 'STabule', 'BSCS', 'Undergraduate', '2018-08-22'),
('ST146', 'Eugene Louis D.', 'Rapal', 'erapal@usep.edu.ph', 'STrapal', 'BSCS', 'Undergraduate', '2018-08-22'),
('ST147', 'Christian Ken A.', 'Tayco', 'ctayco@usep.edu.ph', 'STtayco', 'BSCS', 'Undergraduate', '2018-08-22'),
('ST148', 'James Harley L.', 'Pacaldo', 'jpacaldo@usep.edu.ph', 'STpacaldo', 'BLIS', 'Undergraduate', '2018-08-22'),
('ST149', 'Edward Dave T.', 'Almojera', 'ealmojera@usep.edu.ph', 'STalmojera', 'BLIS', 'Undergraduate', '2018-08-22'),
('ST150', 'Chrystel Kaye H.', 'Tabanao', 'ctabanao@usep.edu.ph', 'STtabanao', 'BLIS', 'Undergraduate', '2018-08-22'),
('ST151', 'Jenicel E.', 'Tambis', 'jtambis@usep.edu.ph', 'STtambis', 'BLIS', 'Undergraduate', '2018-08-22'),
('ST152', 'Cristy Jane D.', 'Madanlo', 'cmadanlo@usep.edu.ph', 'STmadanlo', 'BLIS', 'Undergraduate', '2018-08-22'),
('ST153', 'Carlo Rey G.', 'Pasinabo', 'cpasinabo@usep.edu.ph', 'STpasinabo', 'BLIS', 'Undergraduate', '2018-08-22'),
('ST154', 'Lucky Mae M.', 'Omega', 'lomega@usep.edu.ph', 'STomega', 'BLIS', 'Undergraduate', '2018-08-22'),
('ST155', 'CJ Nicole', 'Suriaga', 'csuriaga@usep.edu.ph', 'STsuriaga', 'BLIS', 'Undergraduate', '2018-08-22'),
('ST156', 'Khristine Elaiza D.', 'Ruiz', 'kruiz@usep.edu.ph', 'STruiz', 'MLIS', 'Postgraduate', '2018-08-22'),
('ST157', 'Fretsy Glen P.', 'Matalum', 'fmatalum@usep.edu.ph', 'STmatalum', 'MLIS', 'Postgraduate', '2018-08-22'),
('ST158', 'Peter Paul C.', 'Villaluna', 'pvillaluna@usep.edu.ph', 'STvillaluna', 'MIT', 'Postgraduate', '2018-08-22'),
('ST159', 'Delight', 'Badanoy', 'dbadanoy@usep.edu.ph', 'STbadanoy', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST160', 'Aldren Joy', 'Jagunos', 'ajagunos@usep.edu.ph', 'STjagunos', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST161', 'Rafiaa', 'Talipan', 'rtalipan@usep.edu.ph', 'STtalipan', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST162', 'Daniel', 'Sabal', 'dsabal@usep.edu.ph', 'STsabal', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST163', 'Justin Jade', 'Saligumba', 'jsaligumba@usep.edu.ph', 'STsaligumba', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST164', 'Vera Kim', 'Tequin', 'vtequin@usep.edu.ph', 'STtequin', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST165', 'Lonivel John', 'Canizares', 'lcanizares@usep.edu.ph', 'STcanizares', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST166', 'Christian Jason', 'Dimpas', 'cdimpas@usep.edu.ph', 'STdimpas', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST167', 'Jason Ray', 'Uy', 'juy@usep.edu.ph', 'STuy', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST168', 'Jian Luigi', 'Bollanday', 'jbollanday@usep.edu.ph', 'STbollanday', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST169', 'Richie Floyd', 'Borleo', 'rborleo@usep.edu.ph', 'STborleo', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST170', 'John Loyd', 'Lao', 'jlao@usep.edu.ph', 'STlao', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST171', 'Katherine Joy', 'Cajetas', 'kcajetas@usep.edu.ph', 'STcajetas', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST172', 'Arman Rex', 'Lee', 'alee@usep.edu.ph', 'STlee', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST173', 'Richelle Anne S.', 'Serbo', 'rserbo@usep.edu.ph', 'STserbo', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST174', 'Angel Menrica B.', 'Tubal', 'atubal@usep.edu.ph', 'STtubal', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST175', 'Kassandra Mariz S.', 'Libron', 'klibron@usep.edu.ph', 'STlibron', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST176', 'Bazty Z.', 'Atanoso', 'batanoso@usep.edu.ph', 'STatanoso', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST177', 'Andrea S.', 'Cosgape', 'acosgape@usep.edu.ph', 'STcosgape', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST178', 'Vincent Karl Jofferson D.', 'Bunsay', 'vbunsay@usep.edu.ph', 'STbunsay', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST179', 'Clark Jasper B.', 'Montebon', 'cmontebon@usep.edu.ph', 'STmontebon', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST180', 'Ron Angelo N.', 'Paid', 'rpaid@usep.edu.ph', 'STpaid', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST181', 'Edjery Gabriel C.', 'Gumbao', 'egumbao@usep.edu.ph', 'STgumbao', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST182', 'Reyjet R.', 'Sandoval', 'rsandoval@usep.edu.ph', 'STsandoval', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST183', 'Jainah Marie C.', 'Dabuan', 'jdabuan@usep.edu.ph', 'STdabuan', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST184', 'Cindy Mae', 'Pueblos', 'cpueblos@usep.edu.ph', 'STpueblos', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST185', 'Hector M.', 'Mataflorida', 'hmataflorida@usep.edu.ph', 'STmataflorida', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST186', 'Johndell Laurence B.', 'Pelale', 'jpelale@usep.edu.ph', 'STpelale', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST187', 'Elijah James E.', 'Elacion', 'eelacion@usep.edu.ph', 'STelacion', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST188', 'Francis Dave Y.', 'Maranan', 'fmaranan@usep.edu.ph', 'STmaranan', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST189', 'Justin John O.', 'Mesajon', 'jmesajon@usep.edu.ph', 'STmesajon', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST190', 'Ezza Mae H.', 'Canete', 'ecanete@usep.edu.ph', 'STcanete', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST191', 'Shaira B.', 'Celerian', 'scelerian@usep.edu.ph', 'STcelerian', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST192', 'Joeben P.', 'Engalan', 'jengalan@usep.edu.ph', 'STengalan', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST193', 'Julius B.', 'Alivio', 'jalivio@usep.edu.ph', 'STalivio', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST194', 'Francis Riedel T.', 'Escoton', 'fescoton@usep.edu.ph', 'STescoton', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST195', 'Donewill Christian D.', 'Misal', 'dmisal@usep.edu.ph', 'STmisal', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST196', 'John Kelvin M.', 'Calunsah', 'jcalunsah@usep.edu.ph', 'STcalunsah', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST197', 'Robie Bryan B.', 'Jacaban', 'rjacaban@usep.edu.ph', 'STjacaban', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST198', 'Ricci Dee R.', 'Tolento', 'rtolento@usep.edu.ph', 'STtolento', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST199', 'Trishia Mae P.', 'Cabsobao', 'tcabsobao@usep.edu.ph', 'STcabsobao', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST200', 'Ivy Alexist P.', 'Daguplo', 'idaguplo@usep.edu.ph', 'STdaguplo', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST201', 'Kailah Shane S.', 'Torres', 'ktorres@usep.edu.ph', 'STtorres', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST202', 'Guia Anne G.', 'Cubelo', 'gcubelo@usep.edu.ph', 'STcubelo', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST203', 'Jonah Mae A.', 'Gomez', 'jgomez@usep.edu.ph', 'STgomez', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST204', 'Kenneth Joseph V.', 'Booc', 'kbooc@usep.edu.ph', 'STbooc', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST205', 'Justine Alec A.', 'Go', 'jgo@usep.edu.ph', 'STgo', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST206', 'Allen Ray P.', 'Siega', 'asiega@usep.edu.ph', 'STsiega', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST207', 'Chris Earl S.', 'Amar', 'camar@usep.edu.ph', 'STamar', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST208', 'Joel Miller M.', 'Go', 'jgo@usep.edu.ph', 'STgo', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST209', 'Neuqian Rhys S.', 'Salvador', 'nsalvador@usep.edu.ph', 'STsalvador', 'BSIT', 'Undergraduate', '2019-08-22'),
('ST210', 'Marc Jules B.', 'Coquilla', 'mcoquilla@usep.edu.ph', 'STcoquilla', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST211', 'Joma Ray A.', 'Quinones', 'jquinones@usep.edu.ph', 'STquinones', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST212', 'Haus Christian C.', 'Salibio', 'hsalibio@usep.edu.ph', 'STsalibio', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST213', 'Bezalel O.', 'Delos Reyes', 'bdelosreyes@usep.edu.ph', 'STdelosreyes', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST214', 'Joseven R.', 'Francisco', 'jfrancisco@usep.edu.ph', 'STfrancisco', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST215', 'Meichell Jynein J.', 'Managing', 'mmanaging@usep.edu.ph', 'STmanaging', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST216', 'Nickel Snow', 'Apique', 'napique@usep.edu.ph', 'STapique', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST217', 'Samuel III', 'Domingo', 'sdomingo@usep.edu.ph', 'STdomingo', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST218', 'Elijah James', 'Uytico', 'euytico@usep.edu.ph', 'STuytico', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST219', 'Isidro P.', 'Amping III', 'iamping@usep.edu.ph', 'STamping', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST220', 'Zuriel Jett M.', 'Leung', 'zleung@usep.edu.ph', 'STleung', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST221', 'Denver Fred A.', 'De Gracia', 'ddegracia@usep.edu.ph', 'STdegracia', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST222', 'Andrew Kenan A.', 'Songahid', 'asongahid@usep.edu.ph', 'STsongahid', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST223', 'Nikko L.', 'Maniwang', 'nmaniwang@usep.edu.ph', 'STmaniwang', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST224', 'Fritzie', 'Lor', 'flor@usep.edu.ph', 'STflor', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST225', 'Brylle James', 'Sanoy', 'bjsanoy@usep.edu.ph', 'STsanoy', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST226', 'Syramae F.', 'Siva', 'sfsiva@usep.edu.ph', 'STsiva', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST227', 'Vann Rijn', 'Amarillo', 'vramarillo@usep.edu.ph', 'STamarillo', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST228', 'John Emmanuel', 'Gapuz', 'jegapuz@usep.edu.ph', 'STgapuz', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST229', 'Rovic Jade', 'Rivas', 'rjrivas@usep.edu.ph', 'STrivas', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST230', 'Armand Louise', 'Jusayan', 'aljusayan@usep.edu.ph', 'STjusayan', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST231', 'Matthew Gabriel', 'Silvosa', 'mgsilvosa@usep.edu.ph', 'STsilvosa', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST232', 'Charles Andrew', 'Balbin', 'cabalbin@usep.edu.ph', 'STbalbin', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST233', 'Joshua Jay', 'Ungab', 'jjungab@usep.edu.ph', 'STungab', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST234', 'Justine Riva', 'Unson', 'jrunson@usep.edu.ph', 'STunson', 'BSCS', 'Undergraduate', '2019-08-22'),
('ST235', 'Ella Aira Gen A.', 'Ajos', 'eajos@usep.edu.ph', 'STajos', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST236', 'Riodelmar G.', 'Amboc', 'ramboc@usep.edu.ph', 'STamboc', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST237', 'Dennis C.', 'Alonde', 'dalonde@usep.edu.ph', 'STalonde', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST238', 'Jamaeca I.', 'Delos Cientos', 'jdeloscientos@usep.edu.ph', 'STdeloscientos', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST239', 'Melanie B.', 'Pamaong', 'mpamaong@usep.edu.ph', 'STpamaong', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST240', 'Janeth R.', 'Sepada', 'jsepada@usep.edu.ph', 'STsepada', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST241', 'Mikaela Ellen Mae B.', 'Villocino', 'mvillocino@usep.edu.ph', 'STvillocino', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST242', 'Therese Margot Corazon T.', 'Pangan', 'tpangan@usep.edu.ph', 'STpangan', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST243', 'Ricardo S.', 'Pingkian, Jr.', 'rpingkian@usep.edu.ph', 'STpingkian', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST244', 'Kyle Jobert Y.', 'Bullian', 'kbullian@usep.edu.ph', 'STbullian', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST245', 'Gerald Kenn I.', 'Latonio', 'glatonio@usep.edu.ph', 'STlatonio', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST246', 'Ardemer E.', 'Tac-an', 'atacan@usep.edu.ph', 'STtacan', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST247', 'Shane Kimberly Z.', 'Andrade', 'sandrade@usep.edu.ph', 'STandrade', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST248', 'Alan Joseph O.', 'Mapinguez', 'amapinguez@usep.edu.ph', 'STmapinguez', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST249', 'Catherine Joy L.', 'Masinading', 'cmasinading@usep.edu.ph', 'STmasinading', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST250', 'Regine C.', 'Remulta', 'rremulta@usep.edu.ph', 'STremulta', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST251', 'Gerald D.', 'Basalo', 'gbasalo@usep.edu.ph', 'STbasalo', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST252', 'Charisse Angeli A.', 'Compacion', 'ccompacion@usep.edu.ph', 'STcompacion', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST253', 'Christianne Dave P.', 'Granaderos', 'cgranaderos@usep.edu.ph', 'STgranaderos', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST254', 'Aubrey C.', 'Adarlo', 'aadarlo@usep.edu.ph', 'STadarlo', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST255', 'Aira M.', 'Mordeno', 'amordeno@usep.edu.ph', 'STmordeno', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST256', 'John Kenth P.', 'Arsolon', 'jarsolon@usep.edu.ph', 'STarsolon', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST257', 'Kurt Michael G.', 'Israel', 'kisrael@usep.edu.ph', 'STisrael', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST258', 'Aldrich Ley G.', 'Cuizon', 'acuizon@usep.edu.ph', 'STcuizon', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST259', 'Garjev M.', 'Dupla', 'gdupla@usep.edu.ph', 'STdupla', 'BLIS', 'Undergraduate', '2019-08-22'),
('ST260', 'Rutchel T.', 'Quinte', 'rquinte@usep.edu.ph', 'STquinte', 'MLIS', 'Postgraduate', '2019-08-22'),
('ST261', 'Jonas Albert C.', 'Tan', 'jtan@usep.edu.ph', 'STtan', 'MIT', 'Postgraduate', '2019-08-22'),
('ST262', 'Jayson R.', 'Alibango', 'jalibango@usep.edu.ph', 'STalibango', 'MLIS', 'Postgraduate', '2020-08-22'),
('ST263', 'Josephine P.', 'Muana', 'jpmuana@usep.edu.ph', 'STmuana', 'BSIT', 'Undergraduate', '2023-05-01'),
('ST264', 'Hersie Jean R.', 'Caparas', 'hjrcaparas@usep.edu.ph', 'STcaparas', 'BSIT', 'Undergraduate', '2023-05-01'),
('ST265', 'ha', 'ha', 'ha@usep.edu.ph', '', 'BSIT', 'Undergraduate', '2025-08-26'),
('ST266', 'Patrick', 'Hmpeso', 'ha@usep.edu.ph', '', 'BSIT', 'Undergraduate', '2025-08-27'),
('ST267', 'Patrick Elvin', 'Hempeso', 'pelhempeso01344@usep.edu.ph', 'treeckopat03', 'BSIT-IS', 'Undergraduate', '2027-08-25');

-- --------------------------------------------------------

--
-- Stand-in structure for view `studentlistview`
-- (See below for the actual view)
--
CREATE TABLE `studentlistview` (
`StudentID` varchar(10)
,`FullName` varchar(101)
,`Email` varchar(100)
,`LoginDetails` varchar(100)
,`Program` varchar(50)
,`ProgramType` varchar(50)
,`DateCreated` date
);

-- --------------------------------------------------------

--
-- Table structure for table `student_capstone`
--

CREATE TABLE `student_capstone` (
  `StudentID` varchar(10) NOT NULL,
  `capstoneID` varchar(10) NOT NULL,
  `GuestID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student_capstone`
--

INSERT INTO `student_capstone` (`StudentID`, `capstoneID`, `GuestID`) VALUES
('ST001', 'CP001', NULL),
('ST002', 'CP001', NULL),
('ST003', 'CP001', NULL),
('ST004', 'CP002', NULL),
('ST005', 'CP002', NULL),
('ST006', 'CP002', NULL),
('ST007', 'CP003', NULL),
('ST008', 'CP003', NULL),
('ST009', 'CP003', NULL),
('ST010', 'CP004', NULL),
('ST011', 'CP004', NULL),
('ST012', 'CP004', NULL),
('ST013', 'CP005', NULL),
('ST014', 'CP005', NULL),
('ST015', 'CP005', NULL),
('ST016', 'CP006', NULL),
('ST017', 'CP006', NULL),
('ST018', 'CP006', NULL),
('ST019', 'CP007', NULL),
('ST020', 'CP007', NULL),
('ST021', 'CP007', NULL),
('ST022', 'CP008', NULL),
('ST023', 'CP008', NULL),
('ST024', 'CP009', NULL),
('ST025', 'CP009', NULL),
('ST026', 'CP010', NULL),
('ST027', 'CP010', NULL),
('ST028', 'CP010', NULL),
('ST029', 'CP011', NULL),
('ST030', 'CP011', NULL),
('ST030', 'CP014', NULL),
('ST031', 'CP011', NULL),
('ST032', 'CP012', NULL),
('ST033', 'CP012', NULL),
('ST034', 'CP012', NULL),
('ST035', 'CP013', NULL),
('ST036', 'CP013', NULL),
('ST037', 'CP013', NULL),
('ST038', 'CP014', NULL),
('ST039', 'CP014', NULL),
('ST040', 'CP014', NULL),
('ST041', 'CP015', NULL),
('ST042', 'CP015', NULL),
('ST044', 'CP016', NULL),
('ST045', 'CP016', NULL),
('ST046', 'CP016', NULL),
('ST047', 'CP017', NULL),
('ST048', 'CP017', NULL),
('ST049', 'CP017', NULL),
('ST050', 'CP018', NULL),
('ST051', 'CP018', NULL),
('ST052', 'CP018', NULL),
('ST053', 'CP019', NULL),
('ST054', 'CP019', NULL),
('ST055', 'CP019', NULL),
('ST056', 'CP020', NULL),
('ST057', 'CP020', NULL),
('ST058', 'CP020', NULL),
('ST059', 'CP021', NULL),
('ST060', 'CP021', NULL),
('ST061', 'CP021', NULL),
('ST062', 'CP022', NULL),
('ST063', 'CP022', NULL),
('ST064', 'CP022', NULL),
('ST065', 'CP023', NULL),
('ST066', 'CP023', NULL),
('ST067', 'CP023', NULL),
('ST068', 'CP024', NULL),
('ST069', 'CP024', NULL),
('ST070', 'CP025', NULL),
('ST071', 'CP025', NULL),
('ST072', 'CP025', NULL),
('ST073', 'CP026', NULL),
('ST074', 'CP026', NULL),
('ST075', 'CP026', NULL),
('ST076', 'CP027', NULL),
('ST077', 'CP027', NULL),
('ST078', 'CP027', NULL),
('ST079', 'CP028', NULL),
('ST080', 'CP028', NULL),
('ST081', 'CP028', NULL),
('ST082', 'CP029', NULL),
('ST083', 'CP029', NULL),
('ST084', 'CP029', NULL),
('ST085', 'CP030', NULL),
('ST086', 'CP030', NULL),
('ST088', 'CP031', NULL),
('ST089', 'CP031', NULL),
('ST090', 'CP031', NULL),
('ST091', 'CP032', NULL),
('ST092', 'CP032', NULL),
('ST093', 'CP033', NULL),
('ST094', 'CP033', NULL),
('ST095', 'CP033', NULL),
('ST096', 'CP034', NULL),
('ST097', 'CP034', NULL),
('ST098', 'CP034', NULL),
('ST099', 'CP035', NULL),
('ST100', 'CP035', NULL),
('ST101', 'CP035', NULL),
('ST102', 'CP036', NULL),
('ST103', 'CP036', NULL),
('ST104', 'CP036', NULL),
('ST105', 'CP037', NULL),
('ST106', 'CP037', NULL),
('ST107', 'CP037', NULL),
('ST108', 'CP038', NULL),
('ST109', 'CP038', NULL),
('ST110', 'CP038', NULL),
('ST111', 'CP039', NULL),
('ST112', 'CP039', NULL),
('ST113', 'CP039', NULL),
('ST114', 'CP040', NULL),
('ST115', 'CP040', NULL),
('ST116', 'CP040', NULL),
('ST117', 'CP041', NULL),
('ST118', 'CP041', NULL),
('ST119', 'CP041', NULL),
('ST120', 'CP042', NULL),
('ST121', 'CP042', NULL),
('ST123', 'CP043', NULL),
('ST124', 'CP043', NULL),
('ST125', 'CP043', NULL),
('ST126', 'CP044', NULL),
('ST127', 'CP044', NULL),
('ST128', 'CP044', NULL),
('ST129', 'CP045', NULL),
('ST130', 'CP045', NULL),
('ST131', 'CP046', NULL),
('ST132', 'CP046', NULL),
('ST133', 'CP047', NULL),
('ST134', 'CP047', NULL),
('ST135', 'CP047', NULL),
('ST136', 'CP048', NULL),
('ST137', 'CP048', NULL),
('ST138', 'CP048', NULL),
('ST139', 'CP049', NULL),
('ST140', 'CP049', NULL),
('ST141', 'CP050', NULL),
('ST142', 'CP050', NULL),
('ST143', 'CP051', NULL),
('ST144', 'CP051', NULL),
('ST145', 'CP052', NULL),
('ST146', 'CP052', NULL),
('ST147', 'CP052', NULL),
('ST148', 'CP053', NULL),
('ST149', 'CP053', NULL),
('ST150', 'CP053', NULL),
('ST151', 'CP054', NULL),
('ST152', 'CP054', NULL),
('ST153', 'CP054', NULL),
('ST154', 'CP055', NULL),
('ST155', 'CP055', NULL),
('ST156', 'CP055', NULL),
('ST157', 'CP056', NULL),
('ST158', 'CP056', NULL),
('ST159', 'CP056', NULL),
('ST160', 'CP057', NULL),
('ST161', 'CP057', NULL),
('ST162', 'CP058', NULL),
('ST163', 'CP058', NULL),
('ST164', 'CP058', NULL),
('ST165', 'CP059', NULL),
('ST166', 'CP059', NULL),
('ST167', 'CP060', NULL),
('ST168', 'CP060', NULL),
('ST169', 'CP060', NULL),
('ST170', 'CP061', NULL),
('ST171', 'CP061', NULL),
('ST172', 'CP062', NULL),
('ST173', 'CP062', NULL),
('ST174', 'CP062', NULL),
('ST175', 'CP063', NULL),
('ST176', 'CP063', NULL),
('ST177', 'CP063', NULL),
('ST178', 'CP064', NULL),
('ST179', 'CP064', NULL),
('ST180', 'CP064', NULL),
('ST181', 'CP065', NULL),
('ST182', 'CP065', NULL),
('ST183', 'CP065', NULL),
('ST184', 'CP066', NULL),
('ST185', 'CP066', NULL),
('ST186', 'CP066', NULL),
('ST187', 'CP067', NULL),
('ST188', 'CP067', NULL),
('ST189', 'CP067', NULL),
('ST190', 'CP068', NULL),
('ST191', 'CP068', NULL),
('ST192', 'CP068', NULL),
('ST193', 'CP069', NULL),
('ST194', 'CP069', NULL),
('ST195', 'CP069', NULL),
('ST196', 'CP070', NULL),
('ST197', 'CP070', NULL),
('ST198', 'CP070', NULL),
('ST199', 'CP071', NULL),
('ST200', 'CP071', NULL),
('ST201', 'CP072', NULL),
('ST202', 'CP072', NULL),
('ST203', 'CP072', NULL),
('ST204', 'CP073', NULL),
('ST205', 'CP073', NULL),
('ST206', 'CP073', NULL),
('ST208', 'CP074', NULL),
('ST209', 'CP074', NULL),
('ST210', 'CP075', NULL),
('ST211', 'CP075', NULL),
('ST212', 'CP075', NULL),
('ST213', 'CP076', NULL),
('ST214', 'CP076', NULL),
('ST215', 'CP076', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_thesis`
--

CREATE TABLE `student_thesis` (
  `StudentID` varchar(10) NOT NULL,
  `ThesisID` varchar(10) NOT NULL,
  `GuestID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student_thesis`
--

INSERT INTO `student_thesis` (`StudentID`, `ThesisID`, `GuestID`) VALUES
('ST216', 'TH002', NULL),
('ST217', 'TH002', NULL),
('ST218', 'TH003', NULL),
('ST219', 'TH003', NULL),
('ST220', 'TH001', NULL),
('ST221', 'TH001', NULL),
('ST226', 'TH004', NULL),
('ST227', 'TH004', NULL),
('ST228', 'TH004', NULL),
('ST229', 'TH005', NULL),
('ST230', 'TH005', NULL),
('ST231', 'TH005', NULL),
('ST232', 'TH005', NULL),
('ST233', 'TH006', NULL),
('ST234', 'TH006', NULL),
('ST235', 'TH007', NULL),
('ST236', 'TH007', NULL),
('ST237', 'TH007', NULL),
('ST238', 'TH008', NULL),
('ST239', 'TH008', NULL),
('ST240', 'TH008', NULL),
('ST241', 'TH008', NULL),
('ST242', 'TH009', NULL),
('ST243', 'TH009', NULL),
('ST244', 'TH009', NULL),
('ST245', 'TH010', NULL),
('ST246', 'TH010', NULL),
('ST247', 'TH011', NULL),
('ST248', 'TH011', NULL),
('ST249', 'TH011', NULL),
('ST250', 'TH011', NULL),
('ST253', 'TH018', NULL),
('ST255', 'TH019', NULL),
('ST255', 'TH022', NULL),
('ST256', 'TH020', NULL),
('ST257', 'TH021', NULL),
('ST259', 'TH023', NULL),
('ST260', 'TH024', NULL),
('ST261', 'TH025', NULL),
('ST262', 'TH012', NULL),
('ST263', 'TH013', NULL),
('ST265', 'TH014', NULL),
('ST266', 'TH015', NULL),
('ST268', 'TH016', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `thesis`
--

CREATE TABLE `thesis` (
  `ThesisID` varchar(10) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Abstract` text NOT NULL,
  `Keywords` text NOT NULL,
  `Authors` text NOT NULL,
  `Adviser` varchar(100) NOT NULL,
  `YearPublished` year(4) DEFAULT NULL,
  `DateCreated` date DEFAULT NULL,
  `DocumentID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `thesis`
--

INSERT INTO `thesis` (`ThesisID`, `Title`, `Abstract`, `Keywords`, `Authors`, `Adviser`, `YearPublished`, `DateCreated`, `DocumentID`) VALUES
('TH001', 'DIGITAL RIGHTS MANAGEMENT ON THE ONLINE DATABASE OF THE\r\nUSEP LIBRARY: A CHALLENGE FOR LIBRARIANS.', 'Library online database is one of the essential tools for online library support for\r\npatrons\' educational and research needs. However, librarians and students are\r\nchallenged with the corresponding access limitations of online databases according\r\nto the Digital Rights Management (DRM) guidelines. This research identifies the\r\nrestrictions and limitations of ODILO. Specifically, it discusses the challenges of\r\nlibrarians in providing information needs and demands with the constraints imposed\r\nfollowing the DRM guidelines. The study employed a qualitative research method that\r\nwas conducted through Google Forms and adopted the connectivism theory by\r\nGeorge Siemens. The result shows that the ODILO database consists of four (4)\r\nsignificant restrictions and limitations in accessing library online collections.\r\nAdditionally, the study shows that using the ODILO system has both positive and\r\nnegative effects on librarians; the positive side of the response shows their personal\r\npreferences when accessing the system, while the opposing side represents how the\r\nlibrary follows the guidelines of DRM. Lastly, the study also indicates that the\r\nrestrictions and limitations of the ODILO database are ineffective in preventing the\r\nillegal reproduction of materials. To successfully integrate ODILO in the library,\r\nlibrarians should choose any implementation schemes in terms of functionality and\r\nthe level of effectiveness of the ODILO database.\r\n', 'Digital Rights Management, ODILO database, Library Online Access', 'Tabanao, Chrystel Kaye H.,\r\nTambis, Jenicel E.', 'Eula Mae Nabong-Templa \r\n', '2029', '2020-02-10', 'DC083'),
('TH002', 'IDENTIFYING LIBRARY SERVICE DESIGN MODELS OF PUBLIC LIBRARY\r\nFOR YOUTH DEVELOPMENT\r\n', 'This study deducted different public library resources, services, and programs which\r\nwas anchored on library service design model that is applied and practiced by a\r\npublic library. Library service design model is a setting or approaches specifically\r\ndevoted towards serving the masses. Limited studies have engrossed on library\r\nservice model, and discovering this facet of public libraries provided a thorough\r\nunderstanding on hoe certain public libraries contribute towards progressing youth\r\ndevelopment in the surface of their learning, academe, reducing juvenile offenders\r\nand out of campus youth or individuals which primarily the motivations for the\r\nresearchers\' subject matter. This paper also detailed different library resources\r\nincluding books, database, electronic and audiovisual materials and among other\r\nresources, service such as internet, information, lending, and reference service and\r\nthe programs including reading programs, trivia, podcast, online ready reference and\r\namong other programs anchored from the results gathered among the youth ages\r\nthirteen to nineteen, their preferences and the Tagum City Library and Learning\r\nCommons general data on these variables present on library space. This paper\r\nconcluded also that existing library service design model must continually be\r\nimproved and alleviated and must be enabled in serving different people in all walks\r\nof life, especially the youth in the community and it must be conforming to the\r\nchanging world and literacy.\r\n', 'resources, library, studies, researchers, materials\r\n', 'Bergonio, Chinee Lois,\r\nVeroy, Dave M.', 'Ferrando, Gresiel', '2020', '2020-02-10', 'DC081'),
('TH003', 'THE CHANGING ROLES OF LIBRARIANS TOWARDS PATRONS WITH\nSPECIAL NEEDS: THE CASE OF SELECTED LIBRARIES IN DAVAO REGION\n', 'As the purpose of libraries changed over the years due to tremendous changes in the\r\nfield, the capabilities of librarians have compounded to serve all patrons. including\r\nthose with special needs. This study sought to examine the librarians\' existing\r\nstrengths and indicate areas with challenges to provide an opportunity for success in\r\ndealing with patrons with special needs. This study utilized a quantitative-descriptive\r\ndesign and employed an adapted survey questionnaire. The researchers collected\r\ndata from the respondents of the selected libraries in the Davao region to determine\r\ntheir current roles, skills, knowledge, accommodations, modifications, and services,\r\nas well as their perceived proficiency in facilitating patrons with special needs. The\r\nresults of this study showed that the majority of the current roles of the respondents\r\nare librarian, which the majority consisted of both licensed librarians and only a\r\ndegree in library and information science. Most of the respondents indicated that they\r\noffer large print books in terms of library collection, wide aisles so that students with\r\nwheelchairs (and other ambulatory devices) could easily navigate the environment\r\nfor library space, and repetition of instruction for instructional delivery to patrons with\r\nspecial needs. All the respondents surveyed had perceived sufficient skills and\r\nknowledge in serving patrons with special needs. Lastly, the respondents believe that\r\ntheir duty to competently practice the best in providing patrons with special needs is\r\nsometimes this competent.\r\n', 'devices, library space, print, books, special needs ', 'Pacaldo, James Harley L.,\r\nAlmojera, Edward Dave T.', 'Sanico, Francis Andrian S.\r\n', '2020', '2020-02-10', 'DC082'),
('TH004', 'AN EXPLORATORY STUDY INVESTIGATING STUDENTS OUTLOOK IN PURSUING LIBRARY AND INFORMATION SCIENCE', 'This exploratory study conducted at the University of Southeastern Philippines investigated students\' motivations and perceptions in pursuing a Bachelor of Library and Information Science course. Using a mixed-methods survey, the study revealed that university contribution, course usefulness, vocational aspects, social considerations, and surrounding influence shaped student outlook. Challenges and perceived advantages in growth, skills development, and industry opportunities were highlighted. The findings aim to improve curriculum support and career guidance.', 'library and information science, student motivation, LIS career, curriculum, exploratory study', 'Ajos, Ella Aira Gen A.; Amboc, Riodelmar G.; Alonde, Dennis C.', 'Templa, Eula Mae N.', '2023', '2023-05-30', 'DC087'),
('TH005', 'USeP DIGITAL LIBRARY: AN ANALYSIS OF USER ACCEPTANCE AND COMPETENCY LEVEL', 'This study assessed user acceptance and competency of the USeP Digital Library System using the Technology Acceptance Model (TAM). Data from 171 students and faculty were analyzed using statistical methods. Results showed moderate acceptance and competency, with recommendations to improve system visibility and usage through a Digital Library Marketing and Utilization Plan.', 'Digital Library System, TAM, User Acceptance Level, Competency Level', 'Delos Cientos, Jamaeca I.; Pamaong, Melanie B.; Sepada, Janeth R.; Villocino, Mikaela Ellen Mae B.', 'Sanico, Francis Andrian S.', '2023', '2023-05-30', 'DC088'),
('TH006', 'DATA LIBRARIANSHIP: DETERMINING THE KNOWLEDGE, SKILLS, AND COMPETENCIES OF LIBRARIANS IN DAVAO CITY', 'This study identified essential knowledge, skills, and competencies of data librarians in Davao City. Using a mixed-methods approach, the study found that referencing, data citation, interpersonal skills, scholarly communication, and information literacy were critical for supporting research. Recommendations include further professional development and expanded data-service implementation.', 'Research Data Services, KSAS, Data Librarianship, competencies, academic libraries', 'Pangan, Therese Margot Corazon T.; Pingkian, Jr. Ricardo S.', 'Ferrando, Gresiel E.', '2023', '2023-05-30', 'DC089'),
('TH007', 'INDEXINATOR: DESIGNING A PROTOTYPE WEB-BASED INDEXING TOOL FOR THE UNIVERSITY LEARNING RESOURCE CENTER', 'This study designed a web-based indexing-tool prototype for ULRC journal and periodical collections. Using Figma and a Software Prototyping model, user surveys shaped the UI and confirmed satisfaction in navigation, color, and layout. The prototype is a proof-of-concept for a full indexing system.', 'Indexinator, design prototype, web-based indexing tool, ULRC, library indexing', 'Bullian, Kyle Jobert Y.; Latonio, Gerald Kenn I.; Tac-an, Ardemer E.', 'Ferrando, Gresiel E.', '2023', '2023-05-30', 'DC090'),
('TH008', 'MANAGING THE USEP MUSEUM: A SKILL ASSESSMENT FOR ULRC PERSONNEL', 'This research assessed USeP-LRC staff skills for managing a university museum. A descriptive-correlational design and survey showed personnel were “very competent” in core competencies and “skilled” in personal skill sets. Age was found to influence preservation and digital literacy. Recommendations included staff training and planning for museum establishment.', 'University museum, skill assessment, ULRC, professional core competency, personal skill set, museum management', 'Andrade, Shane Kimberly Z.; Mapinguez, Alan Joseph O.; Masinading, Catherine Joy L.; Remulta, Regine C.', 'Moldes, Cindy C.', '2023', '2023-05-30', 'DC091'),
('TH009', 'EFFECTIVENESS OF MARKETING STRATEGIES IN PROMOTING PUBLIC SCHOOL LIBRARY SERVICES IN DAVAO CITY', 'This descriptive study evaluated marketing strategies of three Davao City public-school libraries. Surveys from librarians and 1,150 students revealed social media as the most effective channel. Challenges included lack of funding and ICT skills. Recommendations urged improved training and targeted promotional efforts.', 'Marketing Strategies, Public School Libraries, Library Marketing, student awareness', 'Basalo, Gerald D.; Compacion, Charisse Angeli A.; Granaderos, Christianne Dave P.', 'Delima, Annacel B.', '2023', '2023-05-30', 'DC092'),
('TH010', 'THE LIVED EXPERIENCED OF HEALTH SCIENCES LIBRARIANS IN EVIDENCE-BASED MEDICINE', 'This phenomenological study explored the roles, challenges, and responsibilities of health-sciences librarians supporting evidence-based medicine (EBM). Interviews highlighted their contributions to managing resources, navigating healthcare queries, and assisting with clinical research. Recommendations include LIS curriculum integration of EBM skills and awareness campaigns for EBM librarians.', 'health-sciences librarians, evidence-based medicine, lived experiences, phenomenology, critical appraisal', 'Adarlo, Aubrey C.; Mordeno, Aira M.', 'Ferrando, Gresiel E.', '2023', '2023-05-30', 'DC093'),
('TH011', 'THE LEVEL OF UTILIZATION AND ACCESS OF SCHOOL LIBRARY: BASIS FOR AN ENHANCED READING PROGRAM', 'This quantitative-correlational study examined the relationship between school library utilization and reading comprehension among pupils. Although frequent use was linked to higher comprehension, statistical analysis showed a weak correlation. It recommends further exploration of influencing factors and enhancements to library programs.', 'school library, utilization, access, reading comprehension, reading program', 'Arsolon, John Kenth P.; Israel, Kurt Michael G.; Cuizon, Aldrich Ley G.; Dupla, Garjev M.', 'Ferrando, Gresiel E.', '2023', '2023-05-30', 'DC094'),
('TH012', 'CRIMESEER: AN INDEX CRIME FORECASTING SYSTEM USING APRIORITID AND NAÏVE BAYES CLASSIFIER', 'CRIMESEER is a predictive-policing application that forecasts high-risk crime locations in a province using the AprioriTid algorithm and displays them via Google heat maps and polygons. It also predicts specific crime occurrences in barangays with a Naïve Bayes classifier and visualizes results through Bootstrap graphs. Weather variables were included as predictors. Extensive test cases confirmed CRIMESEER’s forecasts matched manual calculations, showing its potential to guide police resource allocation.', 'crime forecasting, predictive policing, AprioriTid, Naïve Bayes, heat maps, weather predictors, RAD', 'Mutia, Neil A.', 'N/A', '2020', '2020-06-15', 'DC101'),
('TH013', 'E-BALANGAY: A FINANCIAL MANAGEMENT INFORMATION SYSTEM FOR BARANGAYS WITH ARTIFICIAL INTELLIGENCE', 'E-Balangay is an AI-assisted financial-management system that automates barangay transactions under MFMB rules. Using a modified waterfall model, it applies a Naïve Bayes classifier and heuristic AI to code expenses and generate statutory reports for barangays, city accountants, and COA auditors—improving transparency and efficiency.', 'financial management, barangay, artificial intelligence, Naïve Bayes, MFMB, e-government', 'Albarico, Gian B.', 'Mercado, Tamara Cher R.', '2020', '2020-06-30', 'DC102'),
('TH014', 'PHILIPPINE LAND REGISTRY ON THE ETHEREUM BLOCKCHAIN: A DECENTRALIZED APPLICATION', 'This prototype Ethereum DApp streamlines land-title conveyance and verification. Built with Truffle Suite, it enables peer-to-peer title transfers, stores verifiable ownership proofs, and cuts transaction time and cost compared with current registry processes. Simulations confirm efficient, secure operations.', 'blockchain, Ethereum, land registry, decentralized application, smart contract, title transfer', 'Galendez, Ryan Arcel', 'N/A', '2021', '2021-05-20', 'DC103'),
('TH015', 'POBRE: POVERTY BASED ON REGRESSION — A HOUSEHOLD POVERTY-STATUS CLASSIFIER THRU LOGISTIC REGRESSION ALGORITHM', 'POBRE is a web- and Android-based tool that classifies poor versus non-poor households in Davao City. Logistic Regression achieved 91.24 % accuracy, outperforming Random Forest and Naïve Bayes. The tool aids social-protection targeting and can be expanded nationally with additional algorithms.', 'poverty classification, logistic regression, machine learning, social protection, household data', 'Villaluna, Peter Paul C.', 'Machica, Ivy Kim D.', '2022', '2022-01-15', 'DC104'),
('TH016', 'CRYPTONOVA: AN ADVANCED TOOL LEVERAGING MACHINE-LEARNING ALGORITHMS FOR CRYPTOCURRENCY PRICE PREDICTION', 'CryptoNova is a mobile app that provides near-accurate cryptocurrency price predictions for ten coins using GRU, LSTM, and Bi-LSTM models. Highcharts visualizations present predicted versus actual prices, helping users identify buy/sell opportunities and make informed investment decisions.', 'cryptocurrency, price prediction, LSTM, GRU, Bi-LSTM, mobile app, data visualization', 'Tan, Jonas Albert C.', 'Villamor, Maureen M., Ph.D.', '2023', '2023-05-25', 'DC105'),
('TH017', 'DATA VISUALIZATION OF BOOK COLLECTION FOR THE UNIVERSITY OF SOUTHEASTERN PHILIPPINES', 'This study developed a web-based system to visualize the book collection at the University of Southeastern Philippines. It aids librarians, faculty, and stakeholders in assessing strengths and gaps per program using publication dates, usage reports, and graphical statistics. Built with Laravel, Bootstrap, Chart.js, and hosted on Heroku, the system provides exporting, analytics, and high user satisfaction. A functionality test showed the system was effective and user-friendly.', 'data visualization, book collection, library system, Laravel, library analytics', 'Delima, Annacel B.', 'Nugas, Maychelle M.', '2020', '2020-06-20', 'DC095'),
('TH018', 'DESIGNING COLINET WEB PORTAL: AN ONLINE SURVEY', 'This study aimed to propose and gather preferred design features for a COLINet web portal through an online survey of 36 librarians. Features across personal, information, and search services were analyzed using frequency and mean. The study recommends incorporating suggestions such as directories, notifications, and privacy settings to enhance communication, information dissemination, and user experience for COLINet members.', 'web portal, COLINet, online survey, library network, user interface design', 'Alboroto, Jehoney V.', 'Villamor, Maureen M.', '2020', '2020-12-15', NULL),
('TH019', 'MANDIA APP: AN ASSISTIVE TOOL FOR MANDAYA TO ENGLISH TRANSLATION', 'ManDia App is an offline assistive translation tool for the Mandaya dialect to English. Built using Java, PHP, and NetBeans, the prototype includes photos, audio recordings, and a searchable text corpus to aid Mother Tongue instruction. Developed with Iterative Development and Justinmind, the tool aims to support learners and expand the digitization of local dialects.', 'Mandaya translation, assistive tool, language learning, indigenous dialect, offline learning', 'Cainglet, Peter M.', 'N/A', '2020', '2020-12-30', NULL),
('TH020', 'PLAIBRARY: AN ONLINE RESOURCE SHARING OF PLAI-DRLC LIBRARY CONSORTIUM', 'This system enhances electronic resource sharing among member libraries of the PLAI-DRLC consortium. Built using a modified RAD model, the system supports union catalog creation, book reservations, and usage statistics. Three libraries piloted the system, which successfully facilitated inter-library interaction and collection access during limited pandemic access. The system enables data-driven library collaboration.', 'resource sharing, library consortium, PLAI-DRLC, union catalog, web-based platform', 'Cajilig, Etel Ella Mae H.', 'N/A', '2021', '2021-06-15', NULL),
('TH021', 'FROM MEMORY TO WEB: AN INSTITUTIONAL DIGITAL REPOSITORY FOR THE PRESERVATION OF HISTORICAL AND CULTURAL ARTIFACTS OF THE UNIVERSITY OF THE IMMACULATE CONCEPTION', 'This digital repository system preserves the University of the Immaculate Conception’s historical and cultural records. Developed using the Spiral SDLC model, it enables archive administrators to manage metadata, generate reports, and provide public access. The system offers role-based access, browsing, and downloading of digital content, supporting archiving best practices in a modern platform.', 'digital repository, institutional archive, cultural preservation, metadata management, Spiral SDLC', 'Cañete, Anthony P.', 'N/A', '2021', '2021-06-30', 'DC096'),
('TH022', 'DEVELOPMENT OF AN ALTERNATIVE AND INTERACTIVE LEARNING SYSTEM IN TEACHING FILIPINO LANGUAGE TO FOREIGN STUDENTS', 'This project developed an interactive Filipino language learning platform using Ren’py, based on “Tagalog for Beginners.” ADDIE model guided the selection and integration of content. With multimedia components (audio, images, story-based navigation), the system was validated through usability testing. Results showed it was user-friendly and suitable for foreign learners. Recommended for special library use.', 'interactive learning, Filipino language, foreign students, Ren’py, ADDIE model', 'Ruiz, Khristine Elaiza D.', 'Dumdumaya, Cristina E.', '2022', '2022-06-10', 'DC097'),
('TH023', 'DEVELOPMENT OF ONLINE LIBRARY BOOK FAIR SYSTEM', 'This study created an online system for organizing virtual book fairs. Using PHP, MySQL, and SketchUp, it allows encoding of book data, browsing, cart management, and reporting. It also includes 3D floor plans. The system underwent functionality testing by educators and book dealers, showing high usability. It reduces time spent attending in-person book fairs.', 'book fair, online system, PHP, virtual library event, book reservation', 'Matalum, Fretsy Glen P.', 'N/A', '2022', '2022-06-30', 'DC098'),
('TH024', 'DEVELOPMENT OF WEB-BASED SUPPORT SERVICE TICKETING SYSTEM OF ATENEO DE DAVAO UNIVERSITY LIBRARY JACINTO CAMPUS', 'This web-based help desk system for ADDU Library allows students and staff to submit and track requests. Built using UVDesk, ChatWhizz, and PHP, it features multi-channel ticketing, notifications, reports, and a knowledge base. SDLC-Waterfall model was followed. Acceptance testing confirmed its effectiveness in managing support services and improving library user experience.', 'ticketing system, library support, UVDesk, help desk, ADDU Library, SDLC Waterfall', 'Quinte, Rutchel T.', 'N/A', '2023', '2023-08-01', 'DC099'),
('TH025', 'C-MAP ANALYTICS: A WEB-BASED APPLICATION OF COLLECTION MAPPING FOR UNIVERSITY OF IMMACULATE CONCEPTION - LEARNING RESOURCE CENTER GRADUATE SCHOOL LIBRARY', 'C-MAP Analytics is a web-based system for automating collection mapping using IFLA Conspectus methods. Developed to support PAASCU accreditation and data-driven book acquisition, it generates analytics reports from library data. Recommendations include adding offline capability, integrating data mining, and enhancing features for broader use.', 'collection mapping, analytics, library system, IFLA conspectus, data visualization', 'Alibango, Jayson R.', 'N/A', '2024', '2024-01-20', 'DC100');

--
-- Triggers `thesis`
--
DELIMITER $$
CREATE TRIGGER `thesis_before_insert` BEFORE INSERT ON `thesis` FOR EACH ROW BEGIN
  DECLARE normalized_input TEXT;
  DECLARE cnt INT;

  SET normalized_input = normalize_title(NEW.Title);

  -- Check in thesis for duplicates
  SELECT COUNT(*) INTO cnt FROM thesis
  WHERE normalize_title(Title) = normalized_input;

  IF cnt > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate title found in thesis table.';
  END IF;

  -- Check in capstone for duplicates
  SELECT COUNT(*) INTO cnt FROM capstone
  WHERE normalize_title(Title) = normalized_input;

  IF cnt > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate title found in capstone table.';
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `thesis_before_insert_update` BEFORE INSERT ON `thesis` FOR EACH ROW BEGIN
  DECLARE normalized_input TEXT;
  DECLARE existing_count INT;

  SET normalized_input = normalize_title(NEW.Title);

  SELECT COUNT(*) INTO existing_count
  FROM thesis
  WHERE normalize_title(Title) = normalized_input;

  IF existing_count > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate title found in thesis table.';
  END IF;

  SELECT COUNT(*) INTO existing_count
  FROM capstone
  WHERE normalize_title(Title) = normalized_input;

  IF existing_count > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate title found in capstone table.';
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `thesis_before_update` BEFORE UPDATE ON `thesis` FOR EACH ROW BEGIN
  DECLARE normalized_input TEXT;
  DECLARE cnt INT;

  SET normalized_input = normalize_title(NEW.Title);

  SELECT COUNT(*) INTO cnt FROM thesis
  WHERE normalize_title(Title) = normalized_input
    AND ThesisID <> NEW.ThesisID;

  IF cnt > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate title found in thesis table.';
  END IF;

  SELECT COUNT(*) INTO cnt FROM capstone
  WHERE normalize_title(Title) = normalized_input;

  IF cnt > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate title found in capstone table.';
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `thesisauthorsview`
-- (See below for the actual view)
--
CREATE TABLE `thesisauthorsview` (
`ThesisID` varchar(10)
,`Title` varchar(255)
,`AuthorName` varchar(101)
,`Email` varchar(100)
,`Program` varchar(50)
,`ProgramType` varchar(50)
,`YearPublished` year(4)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'student'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure for view `capstoneauthorsview`
--
DROP TABLE IF EXISTS `capstoneauthorsview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `capstoneauthorsview`  AS SELECT `c`.`CapstoneID` AS `CapstoneID`, `c`.`Title` AS `Title`, concat(`s`.`FirstName`,' ',`s`.`LastName`) AS `AuthorName`, `s`.`Email` AS `Email`, `s`.`Program` AS `Program`, `s`.`ProgramType` AS `ProgramType`, `c`.`YearPublished` AS `YearPublished` FROM ((`student_capstone` `sc` join `student` `s` on(`sc`.`StudentID` = `s`.`StudentID`)) join `capstone` `c` on(`sc`.`capstoneID` = `c`.`CapstoneID`)) ORDER BY `c`.`CapstoneID` ASC, `s`.`LastName` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `studentlistview`
--
DROP TABLE IF EXISTS `studentlistview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `studentlistview`  AS SELECT `student`.`StudentID` AS `StudentID`, concat(`student`.`FirstName`,' ',`student`.`LastName`) AS `FullName`, `student`.`Email` AS `Email`, `student`.`LoginDetails` AS `LoginDetails`, `student`.`Program` AS `Program`, `student`.`ProgramType` AS `ProgramType`, `student`.`DateCreated` AS `DateCreated` FROM `student` ORDER BY `student`.`StudentID` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `thesisauthorsview`
--
DROP TABLE IF EXISTS `thesisauthorsview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `thesisauthorsview`  AS SELECT `t`.`ThesisID` AS `ThesisID`, `t`.`Title` AS `Title`, concat(`s`.`FirstName`,' ',`s`.`LastName`) AS `AuthorName`, `s`.`Email` AS `Email`, `s`.`Program` AS `Program`, `s`.`ProgramType` AS `ProgramType`, `t`.`YearPublished` AS `YearPublished` FROM ((`student_thesis` `st` join `student` `s` on(`st`.`StudentID` = `s`.`StudentID`)) join `thesis` `t` on(`st`.`ThesisID` = `t`.`ThesisID`)) ORDER BY `t`.`ThesisID` ASC, `s`.`LastName` ASC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `capstone`
--
ALTER TABLE `capstone`
  ADD PRIMARY KEY (`CapstoneID`),
  ADD KEY `capstone_ibfk_3` (`DocumentID`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`DocumentID`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`FacultyID`),
  ADD KEY `AdminID` (`AdminID`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`StudentID`);

--
-- Indexes for table `student_capstone`
--
ALTER TABLE `student_capstone`
  ADD PRIMARY KEY (`StudentID`,`capstoneID`),
  ADD KEY `student_capstone_ibfk_2` (`capstoneID`),
  ADD KEY `student_capstone_ibfk_3` (`GuestID`);

--
-- Indexes for table `student_thesis`
--
ALTER TABLE `student_thesis`
  ADD PRIMARY KEY (`StudentID`,`ThesisID`),
  ADD KEY `student_thesis_ibfk_2` (`ThesisID`),
  ADD KEY `student_thesis_ibfk_3` (`GuestID`);

--
-- Indexes for table `thesis`
--
ALTER TABLE `thesis`
  ADD PRIMARY KEY (`ThesisID`),
  ADD KEY `thesis_ibfk_3` (`DocumentID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `capstone`
--
ALTER TABLE `capstone`
  ADD CONSTRAINT `capstone_ibfk_3` FOREIGN KEY (`DocumentID`) REFERENCES `documents` (`DocumentID`) ON DELETE CASCADE ON UPDATE SET NULL;

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`AdminID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
