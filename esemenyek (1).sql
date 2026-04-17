-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2026 at 02:15 PM
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
-- Database: `esemenyek`
--

-- --------------------------------------------------------

--
-- Table structure for table `esemeny_lista`
--

CREATE TABLE `esemeny_lista` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `rovid_leiras` varchar(255) NOT NULL,
  `tipus` enum('Sport','Színház','Mozi','Fesztivál','Koncert','Rendezvények','Egyéb') NOT NULL,
  `hely` varchar(100) NOT NULL,
  `idopont` datetime NOT NULL,
  `korhatar` enum('/e','+6','+12','+16','+18') NOT NULL,
  `jegy_forgalmazo` varchar(100) NOT NULL,
  `jegy_ara` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `esemeny_lista`
--

INSERT INTO `esemeny_lista` (`id`, `nev`, `rovid_leiras`, `tipus`, `hely`, `idopont`, `korhatar`, `jegy_forgalmazo`, `jegy_ara`) VALUES
(1, 'Fradi–Újpest bajnoki mérkőzés', 'NB I-es labdarúgó rangadó a Groupama Arénában.', 'Sport', 'Budapest, Groupama Aréna', '2025-03-15 19:30:00', '+12', 'Jegy.hu', 6500),
(2, 'Vízilabda OB I forduló', 'Bajnoki vízilabda-mérkőzés élvonalbeli csapatokkal.', 'Sport', 'Budapest, Császár-Komjádi uszoda', '2025-02-10 18:00:00', '/e', 'Jegy.hu', 3000),
(3, 'Városi futófesztivál', 'Több távon induló amatőr futóverseny családbarát programokkal.', 'Sport', 'Debrecen, Belváros', '2025-04-20 10:00:00', '/e', 'Felhasználó', 0),
(4, 'Kosárlabda-kupa döntő', 'Regionális kosárlabda-kupa döntője.', 'Sport', 'Szeged, Sportcsarnok', '2025-05-03 17:00:00', '+6', 'SportLife', 2500),
(5, 'Vígszínház – A Pál utcai fiúk', 'Zenés színházi előadás Molnár Ferenc regénye alapján.', 'Színház', 'Budapest, Vígszínház', '2025-01-25 19:00:00', '+12', 'Vígszínház', 8900),
(6, 'Erkel Színház – Bánk bán', 'Klasszikus magyar opera nagyzenekarral.', 'Színház', 'Budapest, Erkel Színház', '2025-02-14 19:00:00', '+16', 'Jegy.hu', 12000),
(7, 'Kamaraszínházi est', 'Kortárs dráma kamaraszínpadi előadásban.', 'Színház', 'Győr, Nemzeti Színház', '2025-03-08 19:30:00', '+16', 'Felhasználó', 4500),
(8, 'Gyerekelőadás – Mazsola és Tádé', 'Interaktív mesemusical a legkisebbeknek.', 'Színház', 'Pécs, Színház tér', '2025-04-12 11:00:00', '/e', 'Jegy.hu', 3200),
(9, 'Premier – Magyar akciófilm', 'Új magyar akciófilm premier előtti vetítése.', 'Mozi', 'Budapest, Cinema City Arena', '2025-01-10 20:00:00', '+16', 'Cinema City', 3800),
(10, 'Családi animációs film', 'Szinkronizált animációs kaland az egész családnak.', 'Mozi', 'Budapest, Cinema City Westend', '2025-02-01 15:00:00', '/e', 'Cinema City', 3100),
(11, 'Művészfilm vetítés', 'Díjnyertes európai művészfilm eredeti nyelven, felirattal.', 'Mozi', 'Budapest, Művész mozi', '2025-03-05 19:00:00', '+12', 'Művész Mozi', 2900),
(12, 'Horrormaraton éjszaka', 'Háromrészes horrorfilm-maraton, szünetekkel.', 'Mozi', 'Szeged, Belvárosi Mozi', '2025-10-31 22:00:00', '+18', 'Belvárosi Mozi', 4500),
(13, 'Sziget Fesztivál napijegy', 'Nemzetközi zenei fesztivál sok színpaddal.', 'Fesztivál', 'Budapest, Óbudai-sziget', '2025-08-07 14:00:00', '+16', 'Eventim', 29900),
(14, 'Balatoni bor- és gasztrofesztivál', 'Kézműves borok és helyi ételek a Balaton partján.', 'Fesztivál', 'Balatonfüred, Tagore sétány', '2025-07-12 12:00:00', '+12', 'Felhasználó', 2000),
(15, 'Campus Fesztivál bérlet', 'Hazai és külföldi zenekarok Debrecenben.', 'Fesztivál', 'Debrecen, Nagyerdő', '2025-07-17 16:00:00', '+16', 'TicketNinja', 34900),
(16, 'Adventi vásár és fesztivál', 'Karácsonyi vásár forralt borral, koncertekkel.', 'Fesztivál', 'Budapest, Vörösmarty tér', '2025-12-06 16:00:00', '/e', 'Felhasználó', 0),
(17, 'Aréna popkoncert', 'Nagy arénás popkoncert hazai sztárral.', 'Koncert', 'Budapest, Papp László Sportaréna', '2025-11-15 20:00:00', '+12', 'Eventim', 15900),
(18, 'Szimfonikus filmzene-est', 'Filmek ismert dallamai szimfonikus zenekarral.', 'Koncert', 'Budapest, Müpa', '2025-03-22 19:30:00', '/e', 'Jegy.hu', 13500),
(19, 'Jazzklub est', 'Improvizatív jazzkoncert klubhangulatban.', 'Koncert', 'Budapest, A38 Hajó', '2025-04-18 21:00:00', '+16', 'A38', 5900),
(20, 'Akusztikus est a tóparton', 'Csendes akusztikus koncert akusztikus gitárral.', 'Koncert', 'Szeged, Partfürdő', '2025-06-21 20:30:00', '+12', 'Felhasználó', 4500),
(21, 'Karriernap és állásbörze', 'Cégek és munkáltatók bemutatkozása hallgatóknak.', 'Rendezvények', 'Budapest, Egyetemi Campus', '2025-04-09 10:00:00', '+16', 'Felhasználó', 0),
(22, 'Programozó meetup', 'Fejlesztők találkozója rövid előadásokkal.', 'Rendezvények', 'Budapest, IT-központ', '2025-02-20 18:30:00', '+16', 'Felhasználó', 0),
(23, 'Könyvbemutató beszélgetéssel', 'Új regény bemutatója dedikálással.', 'Rendezvények', 'Budapest, Könyvesbolt', '2025-03-27 17:00:00', '+12', 'Felhasználó', 0),
(24, 'Gasztronómiai nap', 'Food truck-ok és kóstolók egész nap.', 'Rendezvények', 'Győr, Főtér', '2025-05-11 11:00:00', '/e', 'Felhasználó', 0),
(25, 'Társasjáték klub', 'Havi rendszerességű társasjáték délután.', 'Egyéb', 'Budapest, Közösségi ház', '2025-01-19 15:00:00', '+12', 'Felhasználó', 1000),
(26, 'Fotókiállítás megnyitó', 'Kortárs fotókiállítás ünnepélyes megnyitóval.', 'Egyéb', 'Pécs, Galéria', '2025-02-08 17:00:00', '+12', 'Felhasználó', 1500),
(27, 'Retro videojáték nap', 'Régi konzolok és arcade gépek kipróbálása.', 'Egyéb', 'Budapest, Gaming bár', '2025-03-16 14:00:00', '+12', 'Felhasználó', 2500),
(28, 'Jótékonysági bál', 'Jótékonysági est élő zenével és vacsorával.', 'Egyéb', 'Debrecen, Rendezvényközpont', '2025-11-29 19:00:00', '+18', 'Jegy.hu', 19000),
(29, 'Coding bootcamp – webfejlesztés', 'Intenzív webfejlesztő workshop kezdőknek.', 'Egyéb', 'Budapest, Képzési központ', '2025-06-02 09:00:00', '+16', 'Felhasználó', 49000),
(30, 'E-sport bajnokság', 'LAN e-sport torna több játékkal.', 'Sport', 'Budapest, E-sport aréna', '2025-09-13 10:00:00', '+12', 'Felhasználó', 3000),
(31, 'Open air mozieset', 'Szabadtéri filmvetítés nyári estén.', 'Mozi', 'Siófok, Víztorony tér', '2025-07-25 21:00:00', '/e', 'Felhasználó', 2000),
(32, 'Akusztikus street koncert', 'Utcamuzsikus akusztikus koncertje a belvárosban.', 'Koncert', 'Budapest, Belváros', '2025-05-30 19:00:00', '/e', 'Felhasználó', 0),
(33, 'Nyári színház a parkban', 'Szabadtéri színházi előadás vígjáték műfajban.', 'Színház', 'Veszprém, Várkert', '2025-08-01 20:00:00', '+12', 'Felhasználó', 3500),
(34, 'Kézilabda BL Döntő', 'Férfi kézilabda Bajnokok Ligája döntő mérkőzés.', 'Sport', 'Budapest, MVM Dome', '2027-06-13 18:00:00', '+12', 'Eventim', 25000),
(35, 'Forma-1 Magyar Nagydíj', 'A száguldó cirkusz futama a Hungaroringen.', 'Sport', 'Mogyoród, Hungaroring', '2027-07-25 15:00:00', '/e', 'GPTicket', 45000),
(36, 'Jégkorong Válogatott Mérkőzés', 'Magyarország nemzetközi felkészülési mérkőzése.', 'Sport', 'Budapest, Tüskecsarnok', '2027-11-10 19:00:00', '+6', 'Jegy.hu', 5500),
(37, 'Országos Úszóbajnokság', 'A hazai úszósport legjobbjainak versenye.', 'Sport', 'Budapest, Duna Aréna', '2027-04-15 09:00:00', '/e', 'Felhasználó', 2000),
(38, 'Macskák musical', 'Andrew Lloyd Webber legendás musicalje.', 'Színház', 'Budapest, Madách Színház', '2027-03-10 19:00:00', '+6', 'Madách Színház', 14500),
(39, 'Stand-up Comedy Est', 'Humoros est a legismertebb hazai humoristákkal.', 'Színház', 'Budapest, Dumaszínház', '2027-05-08 19:30:00', '+16', 'Jegy.hu', 7500),
(40, 'Rómeó és Júlia', 'Shakespeare klasszikus drámája modern köntösben.', 'Színház', 'Debrecen, Csokonai Színház', '2027-10-12 19:00:00', '+12', 'Felhasználó', 4800),
(41, 'Improvizációs Színházi Est', 'A közönség bevonásával zajló interaktív előadás.', 'Színház', 'Szeged, IH Rendezvényközpont', '2027-09-22 20:00:00', '+16', 'Felhasználó', 3500),
(42, 'Sci-Fi Szuperprodukció Premier', 'Az év legjobban várt sci-fi filmjének bemutatója.', 'Mozi', 'Budapest, Cinema City Allee', '2027-05-20 20:00:00', '+16', 'Cinema City', 4200),
(43, 'Dokumentumfilm Fesztivál', 'Környezetvédelmi témájú dokumentumfilmek vetítése.', 'Mozi', 'Budapest, Toldi Mozi', '2027-02-18 17:00:00', '+12', 'Toldi Mozi', 2500),
(44, 'Anime Éjszaka', 'Klasszikus és új anime filmek maratoni vetítése.', 'Mozi', 'Pécs, Apolló Mozi', '2027-08-14 22:00:00', '+16', 'Felhasználó', 3800),
(45, 'Autósmozi a csillagok alatt', 'Klasszikus amerikai autósmozi élmény a tóparton.', 'Mozi', 'Velence, Autósmozi', '2027-06-18 21:30:00', '/e', 'Felhasználó', 5000),
(46, 'Balaton Sound', 'Európa egyik legnagyobb vízparti elektronikus zenei fesztiválja.', 'Fesztivál', 'Zamárdi, Szabadstrand', '2027-07-07 14:00:00', '+18', 'Eventim', 45000),
(47, 'EFOTT Fesztivál', 'Az egyetemisták és főiskolások legnagyobb nyári bulija.', 'Fesztivál', 'Velence, Északi strand', '2027-07-14 15:00:00', '+16', 'TicketNinja', 28000),
(48, 'Budapesti Borfesztivál', 'Prémium borkóstolás a Budai Vár teraszain.', 'Fesztivál', 'Budapest, Budai Vár', '2027-09-09 12:00:00', '+18', 'Jegy.hu', 8500),
(49, 'Kézműves Sörfesztivál', 'Kisüzemi sörfőzdék bemutatkozása és koncertek.', 'Fesztivál', 'Szeged, Dóm tér', '2027-05-21 16:00:00', '+18', 'Felhasználó', 3500),
(50, 'Világsztár Rock Koncert', 'Legendás rockzenekar világkörüli turnéjának állomása.', 'Koncert', 'Budapest, Puskás Aréna', '2027-06-30 20:00:00', '+12', 'Live Nation', 35000),
(51, 'Klasszikus Zenei Gála', 'Mozart és Beethoven művek nagyzenekari kísérettel.', 'Koncert', 'Budapest, Zeneakadémia', '2027-11-20 19:30:00', '/e', 'Zeneakadémia', 12000),
(52, 'Underground Hip-Hop Buli', 'Feltörekvő hazai rapperek és DJ-k fellépése.', 'Koncert', 'Budapest, Akvárium Klub', '2027-04-02 22:00:00', '+18', 'Akvárium', 4500),
(53, 'Szabadtéri Népzenei Est', 'Hagyományőrző népzene és táncház.', 'Koncert', 'Szentendre, Skanzen', '2027-08-20 18:00:00', '/e', 'Felhasználó', 2000),
(54, 'Jövő Technológiái Konferencia', 'Mesterséges intelligencia és robotika expo.', 'Rendezvények', 'Budapest, Hungexpo', '2027-03-24 09:00:00', '+12', 'Felhasználó', 15000),
(55, 'Országos Esküvő Kiállítás', 'Minden, amire egy tökéletes esküvőhöz szükség van.', 'Rendezvények', 'Győr, Olimpiai Sportpark', '2027-01-30 10:00:00', '/e', 'Felhasználó', 3000),
(56, 'Képregény és Cosplay Fesztivál', 'Találkozó képregényrajongóknak és cosplayereknek.', 'Rendezvények', 'Budapest, Millenáris', '2027-05-15 10:00:00', '+6', 'Jegy.hu', 4000),
(57, 'Nemzetközi Autókiállítás', 'A legújabb elektromos és hibrid autók bemutatója.', 'Rendezvények', 'Budapest, Hungexpo', '2027-10-22 09:00:00', '/e', 'Felhasználó', 5500),
(58, 'Csillagászati Észlelőhétvége', 'Távcsöves bemutató és meteorraj-les.', 'Egyéb', 'Zselici Csillagpark', '2027-08-12 21:00:00', '+6', 'Felhasználó', 2500),
(59, 'Országos Kutyakiállítás', 'Fajtatiszta és keverék kutyák szépségversenye.', 'Egyéb', 'Komárom, Monostori Erőd', '2027-04-10 09:00:00', '/e', 'Felhasználó', 1500),
(60, 'Szabadulószoba Bajnokság', 'Országos bajnokság a legjobb logikai csapatoknak.', 'Egyéb', 'Budapest, Mystery Room', '2028-02-05 10:00:00', '+12', 'Felhasználó', 8000),
(61, 'Kézműves Kerámia Workshop', 'Agyagozás és kerámiafestés kezdőknek.', 'Egyéb', 'Kecskemét, Kerámia Stúdió', '2028-03-18 14:00:00', '+6', 'Felhasználó', 12000),
(62, 'Extrém Sportok Napja', 'BMX, gördeszka, parkour bemutatók és még sok más.', 'Sport', 'Győr, Extrém Park', '2028-05-27 11:00:00', '+12', 'Felhasználó', 0),
(63, 'Újévi Szimfonikus Koncert', 'Hagyományos újévköszöntő koncert Strauss művekkel.', 'Koncert', 'Budapest, Müpa', '2028-01-01 19:00:00', '/e', 'Müpa', 25000);

-- --------------------------------------------------------

--
-- Table structure for table `jegy_vasarlasok`
--

CREATE TABLE `jegy_vasarlasok` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `esemeny_id` int(11) NOT NULL,
  `darabszam` int(11) NOT NULL DEFAULT 1,
  `vasarlas_ideje` datetime NOT NULL DEFAULT current_timestamp(),
  `statusz` enum('Fizetve','Foglalt','Törölve') NOT NULL DEFAULT 'Fizetve'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `jegy_vasarlasok`
--

INSERT INTO `jegy_vasarlasok` (`id`, `user_id`, `esemeny_id`, `darabszam`, `vasarlas_ideje`, `statusz`) VALUES
(1, 13, 1, 2, '2026-03-30 14:15:00', 'Fizetve'),
(2, 28, 5, 1, '2026-03-30 14:20:00', 'Fizetve'),
(3, 15, 13, 4, '2026-03-30 14:25:00', 'Foglalt');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `jelszo_hash` varchar(255) NOT NULL,
  `tipus` enum('user','admin') NOT NULL DEFAULT 'user',
  `aktiv` tinyint(1) NOT NULL DEFAULT 1,
  `letrehozva` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `jelszo_hash`, `tipus`, `aktiv`, `letrehozva`) VALUES
(11, 'bsbshez', 'marcellmoravetz@gmail.com', '$2y$10$WMdEMxJIU4WnbZhX51x0qOizE/Cgh05AjKZNB1l96qNLYf/c.55ma', 'user', 0, '2025-11-27 11:16:18'),
(12, 'Dzsindzsa huszár', 'zmet1@freesourcecodes.com', '$2y$10$zi0TI5MJsOvdK2asFzqTtOB7EOkHvgjiA35xoLx.F0B9616QQyUou', 'user', 0, '2025-11-28 08:50:49'),
(13, 'Jancsi Papa', 'bomba@gmail.vom', '$2y$10$IWDVJHafJtH39gcX/gCnWOpe2z8eCsfJ0OKM/lzXqLfXYV7/stfzK', 'user', 1, '2025-11-28 08:52:32'),
(14, 'Tormás Lazac', '12345@gmail.com', '$2y$10$lgixFwfxln5DXCPIjzt.uOnrRqVhma3uVGOLX9PfroIdAcTdZQuoG', 'user', 1, '2025-12-15 12:52:38'),
(15, 'KAlapocska', 'Tancimanci@gmail.com', '$2y$10$RdVl.XcAZYr0PTozrKQxzOmvtrHfdvoniL0l9kBeKYpmsiJ2Qlczu', 'user', 1, '2026-01-08 09:31:27'),
(16, 'konkok', 'Koko@gmail.com', '$2y$10$iCop7EMgWHYWGIquJwM8BORgR0fszdM4LYVvI89JtoB.oGgFJY25y', 'user', 1, '2026-02-11 21:10:02'),
(22, 'asdf', 'dsff@df', '$2y$10$PAwXZv2VLEBnHVHboaB0juxYjHFB8R6Ek5eOlpm9PBEIs65aADYWm', 'user', 1, '2026-03-14 14:44:49'),
(24, 'teszt1', 'narcellnoravetz@gmail.com', '$2y$10$/sU0l1gLH9Ge.RiwW7fnL.rgJT6JqQhUaabtfoIFPC/gZQHQM7Gn.', 'admin', 1, '2026-03-14 14:53:44'),
(26, 'rememberteszt2', 'rememberteszt2@gmail.com', '$2y$10$peZ3dIIy/ecQ27JvHXjTwuQzg7KN48DW8k.FT1ISBTJB.GPFXbadO', 'user', 1, '2026-03-19 13:32:48'),
(27, 'adminteszt', 'adminteszt@gmail.com', '$2y$10$.YDchJRlTunE3KpCrX.YI.V7WGBoS97DWOhokf97BaM.OGyuQiV5u', 'admin', 1, '2026-03-25 23:44:33'),
(28, 'fulltest01', 'fulltest01@gmail.com', '$2y$10$Xa1hboi9rYDe7JQJAn6GbeV5/Z.pv88W/PxIekvgxSZAJCMB2pfwy', 'user', 1, '2026-03-30 13:06:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `esemeny_lista`
--
ALTER TABLE `esemeny_lista`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jegy_vasarlasok`
--
ALTER TABLE `jegy_vasarlasok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `esemeny_id` (`esemeny_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `esemeny_lista`
--
ALTER TABLE `esemeny_lista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `jegy_vasarlasok`
--
ALTER TABLE `jegy_vasarlasok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jegy_vasarlasok`
--
ALTER TABLE `jegy_vasarlasok`
  ADD CONSTRAINT `fk_vasarlas_esemeny` FOREIGN KEY (`esemeny_id`) REFERENCES `esemeny_lista` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vasarlas_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
