DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `device_token` varchar(255) DEFAULT NULL,
    `rate_count` double DEFAULT 0,
    `rate_sum` double DEFAULT 0,
    `average_rate` double DEFAULT 0,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_token_expiration_date` datetime DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `surname` varchar(255) NOT NULL,
  `clinic_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_doctor_clinic` (`clinic_id`)
);

ALTER TABLE `user`
ADD COLUMN `registration_confirmed` varchar(255) NOT NULL,
ADD COLUMN `admin_registration_confirmed` bit(1) NOT NULL DEFAULT 0,
ADD COLUMN `registration_token` varchar(255),
ADD COLUMN `address` varchar(255) NOT NULL,
ADD COLUMN `city` varchar(255) NOT NULL,
ADD COLUMN `country` varchar(255) NOT NULL,
ADD COLUMN `phone_number` varchar(255) NOT NULL,
ADD COLUMN `jbo` varchar(255) NOT NULL,
ADD COLUMN `deleted` bit(1) NOT NULL;

INSERT INTO `user` (`id`, `email`, `password`, `admin_registration_confirmed`, `name`, `surname`, `registration_confirmed`, `role`, `deleted`, `date_created`, `date_deleted`, `date_updated`,
 `address`, `city`, `country`, `phone_number`, `jbo`, `clinic_id`) VALUES

('1', 'test1@gmail.com', '$2a$10$gDqfRHdeFeiopzJ3MSNiLOdYsTDU/RJWhTr5OJvGHE3355C5OLDDm', 1, 'Ana', 'Mandic', 1, 'PATIENT', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00',
'2011-11-11 00:00:00', 'Jurišića 3', 'Novi Sad', 'Serbia', '+381213292411', '85697423654', NULL),

('2', 'test2@gmail.com', '$2a$10$gDqfRHdeFeiopzJ3MSNiLOdYsTDU/RJWhTr5OJvGHE3355C5OLDDm', 1, 'Mika ', 'Mikic', 1, 'PATIENT', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00',
'2011-11-11 00:00:00', 'Fruškogorska 13a', 'Beograd', 'Serbia', '+3813333333333', '123456789', NULL),

('3', 'test3@gmail.com', '$2a$10$gDqfRHdeFeiopzJ3MSNiLOdYsTDU/RJWhTr5OJvGHE3355C5OLDDm', 1, 'Dragan', 'Budakov', 1, 'DOCTOR', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00',
'2011-11-11 00:00:00', 'Osmana Đikića 3', 'Beograd', 'Serbia', '+381113292411', '85239741236', '1'),

('4', 'test4@gmail.com', '$2a$10$gDqfRHdeFeiopzJ3MSNiLOdYsTDU/RJWhTr5OJvGHE3355C5OLDDm', 1, 'Sanja', 'Bulatović', 1, 'DOCTOR', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00',
'2011-11-11 00:00:00', 'Osmana Đikića 3', 'Beograd', 'Serbia', '+3813333333333', '9638596471296', '9'),

('5', 'aivanarabuzin.isa2019@gmail.com', '$2a$10$gDqfRHdeFeiopzJ3MSNiLOdYsTDU/RJWhTr5OJvGHE3355C5OLDDm', 1, 'Iva', 'Ivić', 1, 'ADMIN', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00',
'2011-11-11 00:00:00', 'Osmana Đikića 3', 'Beograd', 'Serbia', '+3813333333333', '8956321458', '1'),

('6', 'test5@gmail.com', '$2a$10$gDqfRHdeFeiopzJ3MSNiLOdYsTDU/RJWhTr5OJvGHE3355C5OLDDm', 1, 'Jelena', 'Jelić', 1, 'PATIENT', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00',
'2011-11-11 00:00:00', 'Borkovačka 78', 'Niš', 'Serbia', '+3811833333333', '123456789', NULL),

('7', 'test6@gmail.com', '$2a$10$gDqfRHdeFeiopzJ3MSNiLOdYsTDU/RJWhTr5OJvGHE3355C5OLDDm', 1, 'Vesna', 'Nikolić', 1, 'PATIENT', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00',
'2011-11-11 00:00:00', 'Danila Kiša 89', 'Kikinda', 'Serbia', '+3816333333333', '8879633214', NULL),

('8', 'test7@gmail.com', '$2a$10$gDqfRHdeFeiopzJ3MSNiLOdYsTDU/RJWhTr5OJvGHE3355C5OLDDm', 1, 'Andrea', 'Peter', 1, 'DOCTOR', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00',
'2011-11-11 00:00:00', 'Bulevar Zorana Đinđića 106a', 'Beograd', 'Serbia', '+381115633333', '998523456789', '2'),

('9', 'test8@gmail.com', '$2a$10$gDqfRHdeFeiopzJ3MSNiLOdYsTDU/RJWhTr5OJvGHE3355C5OLDDm', 1, 'Igor', 'Tomas', 1, 'DOCTOR', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00',
'2011-11-11 00:00:00', 'Bulevar Zorana Đinđića 14-24', 'Niš', 'Serbia', '+38118853777', '888521364793', '8'),

('10', 'test9@gmail.com', '$2a$10$gDqfRHdeFeiopzJ3MSNiLOdYsTDU/RJWhTr5OJvGHE3355C5OLDDm', 1, 'Dimitrije', 'Jeremić', 1, 'DOCTOR', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00',
'2011-11-11 00:00:00', 'Sabljarska 1', 'Kanjiža', 'Serbia', '+38124856933', '18523697445', '10'),

('11', 'test10@gmail.com', '$2a$10$gDqfRHdeFeiopzJ3MSNiLOdYsTDU/RJWhTr5OJvGHE3355C5OLDDm', 1, 'Mila', 'Marić', 1, 'PATIENT', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00',
'2011-11-11 00:00:00', 'Drum bb', 'Novi Sad', 'Serbia', '+381218292411', '9632577746', NULL),

('12', 'test11@gmail.com', '$2a$10$gDqfRHdeFeiopzJ3MSNiLOdYsTDU/RJWhTr5OJvGHE3355C5OLDDm', 1, 'Veljko', 'Petrović', 1, 'PATIENT', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00',
'2011-11-11 00:00:00', 'Pećka 22', 'Paraćin', 'Serbia', '+381353292411', '85697423654', NULL),

('13', 'test12@gmail.com', '$2a$10$gDqfRHdeFeiopzJ3MSNiLOdYsTDU/RJWhTr5OJvGHE3355C5OLDDm', 1, 'Saška', 'Sić', 1, 'PATIENT', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00',
'2011-11-11 00:00:00', 'Pavla Jurišića 19s', 'Novi Sad', 'Serbia', '+381213292411', '858852334', NULL),

('14', 'test13@gmail.com', '$2a$10$gDqfRHdeFeiopzJ3MSNiLOdYsTDU/RJWhTr5OJvGHE3355C5OLDDm', 1, 'Dragana', 'Jovanović', 1, 'DOCTOR', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00',
'2011-11-11 00:00:00', 'Bulevar Zorana Đinđića 106a', 'Beograd', 'Serbia', '+381115633333', '998523456789', '3'),

('15', 'test14@gmail.com', '$2a$10$gDqfRHdeFeiopzJ3MSNiLOdYsTDU/RJWhTr5OJvGHE3355C5OLDDm', 1, 'Mirjana', 'Stojković', 1, 'DOCTOR', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00',
'2011-11-11 00:00:00', 'Bulevar 106a', 'Beograd', 'Serbia', '+381115633333', '998523456789', '4'),

('16', 'test15@gmail.com', '$2a$10$gDqfRHdeFeiopzJ3MSNiLOdYsTDU/RJWhTr5OJvGHE3355C5OLDDm', 1, 'Rastko', 'Ilić', 1, 'DOCTOR', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00',
'2011-11-11 00:00:00', 'Zoran Đinđić 6', 'Beograd', 'Serbia', '+381115633333', '998523456789', '2'),

('17', 'test16@gmail.com', '$2a$10$gDqfRHdeFeiopzJ3MSNiLOdYsTDU/RJWhTr5OJvGHE3355C5OLDDm', 1, 'Saša', 'Cvetković', 1, 'DOCTOR', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00',
'2011-11-11 00:00:00', 'Alekse Šantića 22', 'Beograd', 'Serbia', '+381115633333', '998523456789', '5'),

('18', 'test17@gmail.com', '$2a$10$gDqfRHdeFeiopzJ3MSNiLOdYsTDU/RJWhTr5OJvGHE3355C5OLDDm', 1, 'Miroslav', 'Dinić', 1, 'DOCTOR', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00',
'2011-11-11 00:00:00', 'Tolstojeva 89', 'Beograd', 'Serbia', '+381115633333', '998523456789', '6'),

('19', 'test18@gmail.com', '$2a$10$gDqfRHdeFeiopzJ3MSNiLOdYsTDU/RJWhTr5OJvGHE3355C5OLDDm', 1, 'Goran', 'Cvijović', 1, 'DOCTOR', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00',
'2011-11-11 00:00:00', 'Miše Dimitrijevića 6', 'Beograd', 'Serbia', '+381115633333', '998523456789', '7'),

('20', 'test19@gmail.com', '$2a$10$gDqfRHdeFeiopzJ3MSNiLOdYsTDU/RJWhTr5OJvGHE3355C5OLDDm', 1, 'Anja', 'Andrić', 1, 'DOCTOR', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00',
'2011-11-11 00:00:00', 'Miše Dimitrijevića 6', 'Beograd', 'Serbia', '+381115633333', '998523456789', '5');

DROP TABLE IF EXISTS `clinic`;

CREATE TABLE `clinic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
    `rate_count` double DEFAULT 0,
    `rate_sum` double DEFAULT 0,
    `average_rate` double DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `clinic` (`id`, `name`, `address`, `description`, `city`, `phone_number`, `deleted`, `date_created`, `date_deleted`, `date_updated`) VALUES
('1', 'Atlas', 'Osmana Đikića 3', 'Opšta bolnica', 'Beograd', '0113292411', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('2', 'Alfa medica', 'Bulevar Zorana Đinđića 106a', 'Poliklinika', 'Beograd', '0113118591', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('3', 'Euromedik poliklinka', 'Alekse Nenadovića 7, Slavija', 'Poliklinika', 'Beograd', '0118569377', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('4', 'Consilium', 'Vršačka 21', 'Poliklinika', 'Novi Sad', '021426488', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('5', 'Eliksir', 'Marodićeva 12', 'Specijalna oftalmološka bolnica', 'Novi Sad', '021444716', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('6', 'Healthmedic', 'Narodnog Fronta 73a', 'Poliklinika', 'Novi Sad', '0646453225', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('7', 'Novakov et al.', 'Svetosavska 7', 'Poliklinika', 'Novi Sad', '0213007659', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('8', 'Human', 'Bulevar Zorana Đinđića 14-24', 'Poliklinika', 'Niš', '018538889', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('9', 'Neuromedic plus', 'Jeronimova 19', 'Specijalistička neuropsihijatrijska ordinacija', 'Niš', '018249249', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('10', 'Karh poliklinika', 'Sabljarska 1', 'Poliklinika', 'Kanjiža', '024876454', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('11', 'Alba', 'Majora Marka 35', 'Poliklinika', 'Paraćin', '035570510', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00');

DROP TABLE IF EXISTS `hall`;

CREATE TABLE `hall` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_reserved` bit(1) DEFAULT 0,
  `clinic_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_hall_clinic` (`clinic_id`)
);

INSERT INTO `hall` (`id`, `name`, `is_reserved`, `deleted`, `date_created`, `date_deleted`, `date_updated`, `clinic_id`) VALUES
('1', 'Sala 1', 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 1),
('2', 'Sala 2', 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 1),
('3', 'Sala 3', 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 2),
('4', 'Sala 4', 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 2),
('5', 'Sala 5', 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 11),
('6', 'Sala 6', 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 3),
('7', 'Sala 7', 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 4),
('8', 'Sala 8', 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 5),
('9', 'Sala 9', 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 7),
('10', 'Sala 10', 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 8),
('11', 'Sala 11', 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 8),
('12', 'Sala 12', 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 6),
('13', 'Sala 13', 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 9),
('14', 'Sala 14', 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 10);

DROP TABLE IF EXISTS `price`;

CREATE TABLE `price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `clinic_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_price_clinic` (`clinic_id`)
);

INSERT INTO `price` (`id`, `description`, `price`, `deleted`, `date_created`, `date_deleted`, `date_updated`, `clinic_id`) VALUES
('1', 'Service 1', 150, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 1),
('2', 'Service 2', 157, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 1),
('3', 'Service 3', 200, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 1);

DROP TABLE IF EXISTS `record`;

CREATE TABLE `record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `description` varchar(255) NOT NULL,
  `patient_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_record_patient` (`patient_id`)
);

INSERT INTO `record` (`id`, `description`, `deleted`, `date_created`, `date_deleted`, `date_updated`, `patient_id`) VALUES
('1', 'Amebijaza kože', 0, '2020-01-11 00:00:00','2020-01-11 00:00:00', '2011-11-11 00:00:00', 1),
('2', 'Zapaljenje pluća', 0, '2020-01-15 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 2),
('3', 'Katarakta', 0, '2020-02-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 6),
('4', 'Šarlah', 0, '2020-01-25 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 7),
('5', 'Latentna frambezija', 0, '2020-01-19 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 11),
('6', 'Psorijaza', 0, '2020-01-07 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 12),
('7', 'Karcinom', 0, '2020-02-05 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 13),
('8', 'Bolest kože', 0, '2020-01-12 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 2),
('9', 'Velike boginje', 0, '2020-01-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 1);

DROP TABLE IF EXISTS `surgery`;

CREATE TABLE `surgery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `date` datetime DEFAULT NULL,
    `description` varchar(255) NOT NULL,
    `patient_id` bigint(20) DEFAULT NULL,
    `hall_id` bigint(20) NOT NULL,
    `doctor_id` bigint(20) NOT NULL,
    `clinic_id` bigint(20) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `FK_app_patient` (`patient_id`),
    KEY `FK_app_hall` (`hall_id`),
    KEY `FK_doctor_patient` (`doctor_id`),
    KEY `FK_clinic_patient` (`clinic_id`)
);

INSERT INTO `surgery` (`id`, `date`, `description`, `deleted`, `date_created`, `date_deleted`, `date_updated`, `clinic_id`, `patient_id`, `hall_id`, `doctor_id`) VALUES
('1', '2020-05-01 12:20:00', 'Žali se na bolove u grudima.', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 1, 2, 1, 3),
('2', '2020-05-01 13:40:00', 'Prelom noge.', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 9, 12, 10, 4),
('3', '2020-05-01 13:40:00', 'Prehlada.', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 2, 1, 3, 8),
('4', '2020-05-01 13:40:00', 'Gubi svest, ubrzano kucanje srca.', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 8, 11, 9, 9),
('5', '2020-05-01 13:40:00', 'Ujed od pćele.', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 10, 13, 11, 10),
('6', '2020-05-01 13:40:00', 'Povreda tokom udesa.', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 3, 2, 4, 14),
('7', '2020-05-01 13:40:00', 'Uganuće noge i bolovi u zglobovima.', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 4, 7, 6, 15),
('9', '2020-05-01 13:40:00', 'Povreda glave tokom fizičke aktivnosti.', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 5, 6, 5, 17),
('10', '2020-05-01 13:40:00', 'Prelom ruke.', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 6, 6, 7, 18),
('11', '2020-05-01 13:40:00', 'Virusna infekcija.', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 7, 13, 8, 19);

DROP TABLE IF EXISTS `appointment_type`;

CREATE TABLE `appointment_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
  );

INSERT INTO `appointment_type` (`id`, `name`, `deleted`, `date_created`, `date_deleted`, `date_updated`) values
('1', 'Opšti pregled', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('2', 'Kardiološki pregled', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('3', 'Ultrazvuk abdomena', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('4', 'Pulmološki pregled', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('5', 'Pedijatrijski pregled', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('6', 'Dermatološki pregled', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('7', 'Ultrazvuk zglobova', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('8', 'Hirurški pregled', 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00');

DROP TABLE IF EXISTS `appointment`;

CREATE TABLE `appointment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `date` datetime DEFAULT NULL,
    `price` double NOT NULL,
    `description` varchar(255) NOT NULL,
    `is_taken` bit(1) NOT NULL,
    `admin_accepted` bit(1) DEFAULT 1,
    `patient_accepted` bit(1) DEFAULT 1,
    `patient_id` bigint(20) DEFAULT NULL,
    `hall_id` bigint(20),
    `doctor_id` bigint(20) NOT NULL,
    `clinic_id` bigint(20) NOT NULL,
    `type_id` bigint(20) NOT NULL,
    `termin_id` bigint(20) DEFAULT NULL,
    `hall_termin_id` bigint(20) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `FK_app_patient` (`patient_id`),
    KEY `FK_app_type` (`type_id`),
    KEY `FK_app_hall` (`hall_id`),
    KEY `FK_doctor_patient` (`doctor_id`),
    KEY `FK_clinic_patient` (`clinic_id`),
    KEY `FK_termin_appointment` (`termin_id`),
    KEY `FK_hall_termin_appointment` (`hall_termin_id`)
);

INSERT INTO `appointment` (`id`, `date`, `type_id`, `description`, `price`, `is_taken`, `deleted`, `date_created`, `date_deleted`, `date_updated`, `clinic_id`, `patient_id`, `hall_id`, `doctor_id`) VALUES
('1', '2020-03-01 12:20:00', 1, 'Sepsa uzrokovana salmonelom', 150, 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 1, NULL, 1, 3),
('2', '2020-03-08 13:40:00', 2, 'Zapaljenje tankog creva', 157, 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 1, NULL, 2, 3),
('3', '2020-03-10 15:00:00', 3, 'Amebijaza kože', 200, 1, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 2, 1, 3, 8),
('4', '2020-03-10 11:15:00', 4, 'Zapaljenje pluća', 157, 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 3, 2, 4, 14),
('5', '2020-03-15 15:40:00', 5, 'Katarakta', 157, 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 5, 6, 5, 17),
('6', '2020-03-22 07:40:00', 6, 'Šarlah', 157, 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 4, 7, 6, 15),
('7', '2020-03-15 09:15:00', 7, 'Bolest kože', 157, 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 6, NULL, 7, 18),
('8', '2020-03-06 17:30:00', 8, 'Velike boginje', 157, 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 7, NULL, 8, 19),
('9', '2020-03-13 17:50:00', 8, 'Latentna frambezija', 157, 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 8, 11, 9, 9),
('10', '2020-03-13 10:40:00', 7, 'Psorijaza', 157, 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 9, 12, 10, 4),
('11', '2020-03-13 13:00:00', 7, 'Karcinom', 157, 0, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00', 10, 13, 11, 10);

DROP TABLE IF EXISTS `doctor_termin`;

CREATE TABLE `doctor_termin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `deleted` bit(1) NOT NULL,
  `date` datetime DEFAULT NULL,
  `free` bit(1) NOT NULL,
  `doctor_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_termin_type` (`type_id`),
  KEY `FK_doctor_type` (`doctor_id`)
  );

INSERT INTO `doctor_termin` (`id`, `date`, `time`,  `free`, `doctor_id`, `type_id`, `deleted`, `price`, `date_created`, `date_deleted`, `date_updated`) values
('1', '2020-03-01 07:00:00', '07:00', 1, 3, 1, 0, 105,'2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('2', '2020-03-03 08:00:00', '08:00', 1, 4, 2, 0, 95, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('3', '2020-03-07 09:00:00', '09:00', 1, 8, 3, 0, 298, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('4', '2020-03-05 19:00:00', '19:00', 1, 9, 4, 0, 90, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('5', '2020-03-11 18:00:00', '18:00', 1, 10, 5, 0, 1009, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('6', '2020-03-13 17:00:00', '17:00', 1, 14, 6, 0, 485, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('7', '2020-03-03 09:30:00', '09:30', 1, 15, 7, 0, 850, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('8', '2020-03-03 16:00:00', '16:00', 1, 16, 8, 0, 698, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('9', '2020-03-16 11:50:00', '11:50', 1, 17, 1, 0, 2500, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('10', '2020-03-18 09:40:00', '09:40', 1, 18, 2, 0, 1250, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('11', '2020-03-10 10:00:00', '10:00', 1, 19, 3, 0, 450, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('12', '2020-03-03 09:30:00', '09:30', 1, 4, 2, 0, 95, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('13', '2020-03-03 12:00:00', '12:00', 1, 4, 2, 0, 95, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'),
('14', '2020-03-16 18:00:00', '18:00', 1, 20, 1, 0, 125, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00');

DROP TABLE IF EXISTS `hall_termin`;

CREATE TABLE `hall_termin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `date` datetime DEFAULT NULL,
  `free` bit(1) NOT NULL,
  `hall_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_termin_hall` (`hall_id`)
);

INSERT INTO `hall_termin` (`id`, `date`, `time`,  `free`, `hall_id`, `deleted`, `date_created`, `date_deleted`, `date_updated`) values
('1', '2020-03-01 07:00:00', '07:00', 1, 1, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 1
('2', '2020-03-03 18:00:00', '18:00', 1, 1, 0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 1
('3', '2020-03-03 19:00:00', '08:00',1, 2,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 1
('4', '2020-03-03 19:00:00', '19:00',1, 2,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 1
('5', '2020-03-07 09:00:00', '09:00',1, 3,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 2
('6', '2020-03-03 16:00:00', '16:00',1, 3,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 2
('7', '2020-03-03 19:00:00', '19:00',1, 4,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 2
('8', '2020-03-03 19:00:00', '11:00',1, 4,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 2
('9', '2020-03-03 19:00:00', '18:00',1, 5,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 11
('10', '2020-03-03 19:00:00', '12:00',1, 5,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 11
('11', '2020-03-13 17:00:00', '17:00',1, 6,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 3
('12', '2020-03-03 19:00:00', '10:30',1, 6,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 3
('13', '2020-03-03 09:30:00', '09:30',1, 7,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 4
('14', '2020-03-03 19:00:00', '11:00',1, 7,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 4
('15', '2020-03-16 11:50:00', '11:50',1, 8,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 5
('16', '2020-03-03 19:00:00', '08:00',1, 8,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 5
('17', '2020-03-10 10:00:00', '10:00',1, 9,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 7
('18', '2020-03-03 19:00:00', '14:00',1, 9,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 7
('19', '2020-03-03 19:00:00', '19:00',1, 10,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 8
('20', '2020-03-03 19:00:00', '12:00',1, 10,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 8
('21', '2020-03-03 10:00:00', '10:00',1, 11,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 8
('22', '2020-03-03 19:00:00', '19:00',1, 11,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 8
('23', '2020-03-18 09:40:00', '09:40',1, 12,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 6
('24', '2020-03-03 19:00:00', '13:30',1, 12,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 6
('25', '2020-03-03 08:00:00', '08:00',1, 13,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 9
('26', '2020-03-03 19:00:00', '11:00',1, 13,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 9
('27', '2020-03-11 18:00:00', '18:00',1, 14,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 10
('28', '2020-03-03 19:00:00', '19:00',1, 14,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 10
('29', '2020-03-16 18:00:00', '18:00',1, 8,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'), -- clinicID= 5
('30', '2020-03-16 19:00:00', '19:00',1, 8,  0, '2011-11-11 00:00:00','2011-11-11 00:00:00', '2011-11-11 00:00:00'); -- clinicID= 5