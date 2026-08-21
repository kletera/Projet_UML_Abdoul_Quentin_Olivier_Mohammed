CREATE DATABASE Eval_UML;
USE Eval_UML;

CREATE TABLE roles(
   Id_role INT PRIMARY KEY AUTO_INCREMENT,
   name_role VARCHAR(30) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- Insertion des rôles --
insert into roles (Id_role, name_role) values (1, 'Manager'); 
insert into roles (Id_role, name_role) values (2, 'Administrateur'); 
insert into roles (Id_role, name_role) values (3, 'Recruteur'); 

CREATE TABLE services(
   Id_service INT PRIMARY KEY AUTO_INCREMENT,
   name_service VARCHAR(30) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- Insertions des services --
insert into services (Id_service, name_service) values (2, 'Management');
insert into services (Id_service, name_service) values (3, 'Gestion');
insert into services (Id_service, name_service) values (1, 'RH');
 
CREATE TABLE jobs(
   Id_job INT PRIMARY KEY AUTO_INCREMENT,
   name_job VARCHAR(30) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- Insertions des jobs --
insert into jobs (Id_job, name_job) values (1, 'Compensation Analyst');
insert into jobs (Id_job, name_job) values (2, 'Nurse Practicioner');
insert into jobs (Id_job, name_job) values (3, 'Information Systems Manager');
insert into jobs (Id_job, name_job) values (4, 'Environmental Specialist');
insert into jobs (Id_job, name_job) values (5, 'Associate Professor');
insert into jobs (Id_job, name_job) values (6, 'Systems Administrator IV');
 
CREATE TABLE types(
   Id_type INT PRIMARY KEY AUTO_INCREMENT,
   name_type VARCHAR(30) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- Insertion des types d'offre --

insert into types (Id_type, name_type) values (1, 'Emploi');
insert into types (Id_type, name_type) values (2, 'Alternance');
insert into types (Id_type, name_type) values (3, 'Stage');

CREATE TABLE cities(
   Id_city INT PRIMARY KEY AUTO_INCREMENT,
   name_city VARCHAR(50) NOT NULL UNIQUE,
   postal_code_city DECIMAL(5,0) NOT NULL UNIQUE
) ENGINE=InnoDB;
 
-- Insertions des cities --
insert into cities (Id_city, name_city, postal_code_city) values (1, 'Dhangarhi', '37141');
insert into cities (Id_city, name_city, postal_code_city) values (2, 'Estela', '50780');
insert into cities (Id_city, name_city, postal_code_city) values (3, 'Stopnica', '57190');
insert into cities (Id_city, name_city, postal_code_city) values (4, 'Sulang Tengah', '74200');
insert into cities (Id_city, name_city, postal_code_city) values (5, 'Baruchowo', '28200');
insert into cities (Id_city, name_city, postal_code_city) values (6, 'Sumenep', '35745');
 
CREATE TABLE users(
   Id_user INT PRIMARY KEY AUTO_INCREMENT,
   name_user VARCHAR(30) NOT NULL,
   first_name_user VARCHAR(30) NOT NULL,
   login_user VARCHAR(100) NOT NULL UNIQUE,
   password_user VARCHAR(100) NOT NULL UNIQUE,
   number_user DECIMAL(10,0) NOT NULL UNIQUE,
   Id_role INT NOT NULL,
   Id_status INT NOT NULL,
   FOREIGN KEY(Id_status) REFERENCES status(Id_status),
   FOREIGN KEY(Id_role) REFERENCES roles(Id_role)
) ENGINE=InnoDB;

-- Insertions des users --
insert into users (Id_user, name_user, first_name_user, login_user, password_user, number_user, Id_role) values (1, 'Margaret', 'Intéressant', 'mkensit0', '$2a$04$TM.uOPDEJIQNmcEVd56QfeCF4VUXCp4bvZp/Zb0VIRVBM7S4fUsEm', '303 650 0855', 1);
insert into users (Id_user, name_user, first_name_user, login_user, password_user, number_user, Id_role) values (2, 'Tobie', 'Léandre', 'tcrimmins1', '$2a$04$.dt7LXxTIN.Ac9rQF9/6KegBrJhNiKBE6lgL8cXvw0zRapb2MDZc2', '551 137 3784', 1);
insert into users (Id_user, name_user, first_name_user, login_user, password_user, number_user, Id_role) values (3, 'Hedy', 'Lài', 'hmaggillandreis2', '$2a$04$.rdREgCmouMNe6pRyzG2xOYk9CcnrKaIPcZPBuZkAWIOOPa/tTp.W', '334 655 1783', 3);
insert into users (Id_user, name_user, first_name_user, login_user, password_user, number_user, Id_role) values (4, 'Paule', 'Maëline', 'psimion3', '$2a$04$2rzk//bC9qWpE6Suc9M1huahJh3dW0TfW06qiAyr6j7b/XpIjZOBW', '482 129 5873', 1);
insert into users (Id_user, name_user, first_name_user, login_user, password_user, number_user, Id_role) values (5, 'Bessie', 'Lyséa', 'bmcgowan4', '$2a$04$ATGaY2aJVGAOtvJWx.cxguT/8wqDr0/Fp1.MP6K3t2Dl3ZWTuZ48.', '293 396 8801', 1);
insert into users (Id_user, name_user, first_name_user, login_user, password_user, number_user, Id_role) values (6, 'Truman', 'Gösta', 'tcicetti5', '$2a$04$.XNw0MsxR9aI6BvJFYy1XeEJnMuSAu2pM.KI85S9nix3qoGAMzdUW', '134 551 2771', 3);

CREATE TABLE candidates(
   Id_candidate INT PRIMARY KEY AUTO_INCREMENT,
   name_candidate VARCHAR(30) NOT NULL,
   first_name_candidate VARCHAR(30) NOT NULL,
   email_candidate VARCHAR(100) NOT NULL UNIQUE,
   number_candidate DECIMAL(10,0) NOT NULL UNIQUE,
   adress_candidate VARCHAR(100) NOT NULL,
   Id_city INT NOT NULL,
   Id_status INT NOT NULL,
   FOREIGN KEY(Id_status) REFERENCES status(Id_status),
   FOREIGN KEY(Id_city) REFERENCES cities(Id_city)
) ENGINE=InnoDB;

-- Insertions des candidates --
insert into candidates (Id_candidate, name_candidate, first_name_candidate, email_candidate, number_candidate, adress_candidate, id_city) values (1, 'Covolini', 'Loïca', 'ccovolini0@kickstarter.com', '2648950281', '22', 6);
insert into candidates (Id_candidate, name_candidate, first_name_candidate, email_candidate, number_candidate, adress_candidate, id_city) values (2, 'Eliyahu', 'Séréna', 'heliyahu1@wikia.com', '7908361587', '3604', 1);
insert into candidates (Id_candidate, name_candidate, first_name_candidate, email_candidate, number_candidate, adress_candidate, id_city) values (3, 'Bowser', 'Inès', 'lbowser2@shareasale.com', '6997853219', '721', 3);
insert into candidates (Id_candidate, name_candidate, first_name_candidate, email_candidate, number_candidate, adress_candidate, id_city) values (4, 'Alforde', 'Dafnée', 'salforde3@weather.com', '6618954114', '6728', 4);
insert into candidates (Id_candidate, name_candidate, first_name_candidate, email_candidate, number_candidate, adress_candidate, id_city) values (5, 'Connaughton', 'Mahélie', 'tconnaughton4@feedburner.com', '2696213222', '37', 4);
insert into candidates (Id_candidate, name_candidate, first_name_candidate, email_candidate, number_candidate, adress_candidate, id_city) values (6, 'Crighton', 'Maëlyss', 'acrighton5@jiathis.com', '1815263139', '2', 4);


CREATE TABLE status(
    Id_status INT PRIMARY KEY auto_increment,
    name_status VARCHAR(30) NOT NULL UNIQUE
) ENGINE=InnoDB;
 
CREATE TABLE offers(
   Id_offer INT PRIMARY KEY AUTO_INCREMENT,
   date_offer DATE NOT NULL,
   end_date_offer DATE NOT NULL,
   title_offer VARCHAR(50) NOT NULL,
   text_offer TEXT NOT NULL,
   Id_user INT NOT NULL,
   Id_type INT NOT NULL,
   Id_job INT NOT NULL,
   Id_service INT NOT NULL,
   Id_status INT NOT NULL,
   FOREIGN KEY(Id_status) REFERENCES status(Id_status),
   FOREIGN KEY(Id_user) REFERENCES users(Id_user),
   FOREIGN KEY(Id_type) REFERENCES types(Id_type),
   FOREIGN KEY(Id_job) REFERENCES jobs(Id_job),
   FOREIGN KEY(Id_service) REFERENCES services(Id_service)
) ENGINE=InnoDB;

-- Insertions des offres --
insert into offers (id_offer, date_offer, end_date_offer, title_offer, text_offer, Id_user, id_type, id_job, id_services) values (1, '2026-04-15 06:35:37', '2025-11-17 11:05:33', 'Quality Control Specialist', 'Pellentesque at nulla.', 4, 2, 3, 3);
insert into offers (id_offer, date_offer, end_date_offer, title_offer, text_offer, Id_user, id_type, id_job, id_services) values (2, '2026-02-28 08:02:27', '2026-05-15 08:13:24', 'Research Assistant III', 'Integer ac leo. Pellentesque ultrices mattis odio.', 2, 1, 3, 1);
insert into offers (id_offer, date_offer, end_date_offer, title_offer, text_offer, Id_user, id_type, id_job, id_services) values (3, '2026-07-22 08:58:10', '2026-07-28 00:53:35', 'Programmer IV', 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', 5, 1, 2, 3);
insert into offers (id_offer, date_offer, end_date_offer, title_offer, text_offer, Id_user, id_type, id_job, id_services) values (4, '2026-01-06 04:56:01', '2025-10-18 02:07:58', 'Actuary', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 4, 2, 5, 2);
insert into offers (id_offer, date_offer, end_date_offer, title_offer, text_offer, Id_user, id_type, id_job, id_services) values (5, '2026-06-08 23:05:42', '2026-03-28 23:21:46', 'Engineer I', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.', 6, 2, 2, 3);
insert into offers (id_offer, date_offer, end_date_offer, title_offer, text_offer, Id_user, id_type, id_job, id_services) values (6, '2026-08-03 19:02:40', '2026-03-04 11:58:12', 'Nurse', 'Suspendisse potenti. In eleifend quam a odio.', 2, 3, 5, 3);

-- Requette de jointure candidates et offers --
SELECT
    c.name_candidate,
    c.first_name_candidate,
    o.title_offer
FROM candidates c
JOIN applications a
    ON c.Id_candidate = a.Id_candidate
JOIN offers o
    ON a.Id_offer = o.Id_offer;




CREATE TABLE reports(
   Id_report INT PRIMARY KEY AUTO_INCREMENT,
   date_report DATE NOT NULL,
   state_evaluation_report BOOLEAN NOT NULL,
   Id_user INT,
   FOREIGN KEY(Id_user) REFERENCES users(Id_user)
) ENGINE=InnoDB;
 
 -- Insertions des reports --
insert into reports (Id_report, date_report, state_evaluation_report, Id_user) values (1, '2025-09-03 03:57:57', true, 2);
insert into reports (Id_report, date_report, state_evaluation_report, Id_user) values (2, '2026-01-08 01:44:42', false, 2);
insert into reports (Id_report, date_report, state_evaluation_report, Id_user) values (3, '2026-01-21 01:41:03', true, 1);
insert into reports (Id_report, date_report, state_evaluation_report, Id_user) values (4, '2025-10-24 09:32:25', false, 3);
insert into reports (Id_report, date_report, state_evaluation_report, Id_user) values (5, '2026-01-21 15:47:28', false, 5);
insert into reports (Id_report, date_report, state_evaluation_report, Id_user) values (6, '2026-07-14 20:00:38', true, 3);
 
 
CREATE TABLE applications(
   Id_application INT PRIMARY KEY AUTO_INCREMENT,
   date_application DATE NOT NULL,
   suivi_aplication BOOLEAN NOT NULL,
   Id_offer INT NOT NULL,
   Id_candidate INT NOT NULL,
   FOREIGN KEY(Id_offer) REFERENCES offers(Id_offer),
   FOREIGN KEY(Id_candidate) REFERENCES candidates(Id_candidate)
) ENGINE=InnoDB;

-- Insertions des applications --
insert into applications (id_application, date_application, suivi_aplication, id_offer, id_candidate) values (1, '2026-04-21 22:47:16', true, 3, 4);
insert into applications (id_application, date_application, suivi_aplication, id_offer, id_candidate) values (2, '2025-11-27 09:33:28', false, 6, 1);
insert into applications (id_application, date_application, suivi_aplication, id_offer, id_candidate) values (3, '2025-12-07 16:48:36', true, 2, 6);
insert into applications (id_application, date_application, suivi_aplication, id_offer, id_candidate) values (4, '2026-04-17 07:51:27', true, 2, 1);
insert into applications (id_application, date_application, suivi_aplication, id_offer, id_candidate) values (5, '2026-07-23 06:48:21', false, 1, 2);
insert into applications (id_application, date_application, suivi_aplication, id_offer, id_candidate) values (6, '2026-03-20 02:57:35', true, 6, 1);
 
CREATE TABLE archives(
   Id_archive INT PRIMARY KEY AUTO_INCREMENT,
   state_candidate_archive BOOLEAN NOT NULL,
   time_archive DATE NOT NULL,
   Id_user INT,
   Id_candidate INT,
   FOREIGN KEY(Id_user) REFERENCES users(Id_user),
   FOREIGN KEY(Id_candidate) REFERENCES candidates(Id_candidate)
) ENGINE=InnoDB;

-- Insertions des archives --
insert into archives (id_archive, state_candidate_archive, time_archive, Id_user, id_candidate) values (1, true, 2015, 3, 4);
insert into archives (id_archive, state_candidate_archive, time_archive, Id_user, id_candidate) values (2, false, 2000, 6, 1);
insert into archives (id_archive, state_candidate_archive, time_archive, Id_user, id_candidate) values (3, false, 2014, 2, 1);
insert into archives (id_archive, state_candidate_archive, time_archive, Id_user, id_candidate) values (4, false, 2010, 6, 4);
insert into archives (id_archive, state_candidate_archive, time_archive, Id_user, id_candidate) values (5, false, 2013, 5, 3);
insert into archives (id_archive, state_candidate_archive, time_archive, Id_user, id_candidate) values (6, true, 2017, 6, 2);
 
CREATE TABLE interviews(
   Id_interview INT PRIMARY KEY AUTO_INCREMENT,
   date_interview DATETIME NOT NULL,
   progress_intervew BOOLEAN NOT NULL,
   Id_report INT NOT NULL,
   Id_application INT,
   Id_candidate INT,
   Id_status INT NOT NULL,
   FOREIGN KEY(Id_status) REFERENCES status(Id_status),
   FOREIGN KEY(Id_report) REFERENCES reports(Id_report),
   FOREIGN KEY(Id_candidate) REFERENCES candidates(Id_candidate),
   FOREIGN KEY(Id_application) REFERENCES applications(Id_application)
) ENGINE=InnoDB;
 
-- Insertions des interviews --
insert into interviews (Id_interview, date_interview, progress_intervew, id_report, id_application) values (1, '2026-06-27 16:54:34', true, 3, 4);
insert into interviews (Id_interview, date_interview, progress_intervew, id_report, id_application) values (2, '2026-05-07 22:41:08', true, 1, 4);
insert into interviews (Id_interview, date_interview, progress_intervew, id_report, id_application) values (3, '2026-06-19 00:41:09', true, 3, 3);
insert into interviews (Id_interview, date_interview, progress_intervew, id_report, id_application) values (4, '2026-05-31 21:21:12', false, 1, 3);
insert into interviews (Id_interview, date_interview, progress_intervew, id_report, id_application) values (5, '2026-03-12 22:39:14', true, 5, 3);
insert into interviews (Id_interview, date_interview, progress_intervew, id_report, id_application) values (6, '2026-05-31 08:28:44', false, 1, 3);
 

CREATE TABLE evaluations(
   Id_evaluation INT PRIMARY KEY AUTO_INCREMENT,
   note_evaluation DECIMAL(2,0) NOT NULL,
   opinion_evaluation TEXT,
   Id_interview INT NOT NULL,
   Id_status INT NOT NULL,
   FOREIGN KEY(Id_status) REFERENCES status(Id_status),
   FOREIGN KEY(Id_interview) REFERENCES interviews(Id_interview)
) ENGINE=InnoDB;

-- Insertions des évaluations --
insert into interviews (Id_evaluation, note_evaluation, opinion_evaluation, Id_interview) values (1, 5, 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 6);
insert into interviews (Id_evaluation, note_evaluation, opinion_evaluation, Id_interview) values (2, 5, 'In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 4);
insert into interviews (Id_evaluation, note_evaluation, opinion_evaluation, Id_interview) values (3, 4, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.', 6);
insert into interviews (Id_evaluation, note_evaluation, opinion_evaluation, Id_interview) values (4, 6, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 6);
insert into interviews (Id_evaluation, note_evaluation, opinion_evaluation, Id_interview) values (5, 6, 'Nulla tellus. In sagittis dui vel nisl.', 3);
insert into interviews (Id_evaluation, note_evaluation, opinion_evaluation, Id_interview) values (6, 7, 'Nunc rhoncus dui vel sem.', 2);
 
CREATE TABLE conducts(
   Id_user INT,
   Id_interview INT,
   PRIMARY KEY(Id_user, Id_interview),
   FOREIGN KEY(Id_user) REFERENCES users(Id_user),
   FOREIGN KEY(Id_interview) REFERENCES interviews(Id_interview)
) ENGINE=InnoDB;

-- Insertions des conducts --
insert into conducts (Id_user, Id_interview) values (3, 1);
insert into conducts (Id_user, Id_interview) values (1, 2);
insert into conducts (Id_user, Id_interview) values (3, 5);
insert into conducts (Id_user, Id_interview) values (6, 4);
insert into conducts (Id_user, Id_interview) values (3, 3);
insert into conducts (Id_user, Id_interview) values (5, 6);

 
CREATE TABLE Performs(
   Id_user INT,
   Id_evaluation INT,
   PRIMARY KEY(Id_user, Id_evaluation),
   FOREIGN KEY(Id_user) REFERENCES users(Id_user),
   FOREIGN KEY(Id_evaluation) REFERENCES evaluations(Id_evaluation)
) ENGINE=InnoDB;

-- Insertions des perform
insert into Performs (Id_user, Id_evaluation) values (5, 6);
insert into Performs (Id_user, Id_evaluation) values (2, 3);
insert into Performs (Id_user, Id_evaluation) values (1, 2);
insert into Performs (Id_user, Id_evaluation) values (2, 4);
insert into Performs (Id_user, Id_evaluation) values (4, 6);
insert into Performs (Id_user, Id_evaluation) values (5, 3);

-- ======
-- KPI --
-- ======

-- Nombre d’entretiens(interviews)
	SELECT COUNT(Id_interview) AS "Number of interviews"
	FROM interviews;
-- Nombre de candidats(candidates)
	SELECT COUNT(Id_candidate) AS "Number of candidates"
	FROM candidates;
-- Nombre d’offres(offers)
	SELECT COUNT(Id_offer) AS "Number of offers"
	FROM offers;
-- Nombre d’utilisateurs(users)
	SELECT COUNT(Id_user) AS "Number of users"
	FROM users;
-- Nombre d’évalutions (evaluations)
	SELECT COUNT(Id_evaluation)
	FROM evaluations;
	
--------------------------
-- Les statuts de suivi --
--------------------------

-- Nombre d’entretiens (interviews Pending, Completed, In progress) À faire, Términé, En cours
	SELECT COUNT(*) AS "Number of interviews completed"
	FROM interviews i
	WHERE status = "completed";
-- Nombre de candidats(candidates recruited, rejected, on hold, archived) recruté, rejeté, en attente, archiver
	SELECT COUNT(*) AS "Number of candidates recruited"
	FROM candidates
	WHERE status = "recruited";
-- Nombre de d’offres (job offers in progress, closed, pending) en cours, clôturé, à traiter
	SELECT COUNT(*) AS "Number of job offers pending"
	FROM candidates
	WHERE status = "pending";
-- Nombre de d’utilisateurs (users active/offline/archived) actif , hors ligne , archiver 
	SELECT COUNT(*) AS "Number of users active"
	FROM users
	WHERE status = "active";
-- Nombre de d’évaluations  (assessments in progress/closed/pending/archived) en cours, clôturé, à traiter, archiver 
	SELECT COUNT(*) AS "Number of users active"
	FROM users
	WHERE status = "active";
	
