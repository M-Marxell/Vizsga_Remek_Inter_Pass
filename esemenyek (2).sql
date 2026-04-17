-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Ápr 01. 07:47
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `esemenyek`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `esemeny_lista`
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
-- A tábla adatainak kiíratása `esemeny_lista`
--

INSERT INTO `esemeny_lista` (`id`, `nev`, `rovid_leiras`, `tipus`, `hely`, `idopont`, `korhatar`, `jegy_forgalmazo`, `jegy_ara`) VALUES
(1, 'Fradi–Újpest bajnoki mérkőzés', 'NB I-es labdarúgó rangadó a Groupama Arénában.', 'Sport', 'Budapest, Groupama Aréna', '2026-03-15 19:30:00', '+12', 'Jegy.hu', 6500),
(2, 'Vízilabda OB I forduló', 'Bajnoki vízilabda-mérkőzés élvonalbeli csapatokkal.', 'Sport', 'Budapest, Császár-Komjádi uszoda', '2026-02-10 18:00:00', '/e', 'Jegy.hu', 3000),
(3, 'Városi futófesztivál', 'Több távon induló amatőr futóverseny családbarát programokkal.', 'Sport', 'Debrecen, Belváros', '2026-04-20 10:00:00', '/e', 'Felhasználó', 0),
(4, 'Kosárlabda-kupa döntő', 'Regionális kosárlabda-kupa döntője.', 'Sport', 'Szeged, Sportcsarnok', '2026-05-03 17:00:00', '+6', 'SportLife', 2500),
(5, 'Vígszínház – A Pál utcai fiúk', 'Zenés színházi előadás Molnár Ferenc regénye alapján.', 'Színház', 'Budapest, Vígszínház', '2026-01-25 19:00:00', '+12', 'Vígszínház', 8900),
(6, 'Erkel Színház – Bánk bán', 'Klasszikus magyar opera nagyzenekarral.', 'Színház', 'Budapest, Erkel Színház', '2026-02-14 19:00:00', '+16', 'Jegy.hu', 12000),
(7, 'Kamaraszínházi est', 'Kortárs dráma kamaraszínpadi előadásban.', 'Színház', 'Győr, Nemzeti Színház', '2026-03-08 19:30:00', '+16', 'Felhasználó', 4500),
(8, 'Gyerekelőadás – Mazsola és Tádé', 'Interaktív mesemusical a legkisebbeknek.', 'Színház', 'Pécs, Színház tér', '2026-04-12 11:00:00', '/e', 'Jegy.hu', 3200),
(9, 'Premier – Magyar akciófilm', 'Új magyar akciófilm premier előtti vetítése.', 'Mozi', 'Budapest, Cinema City Arena', '2026-01-10 20:00:00', '+16', 'Cinema City', 3800),
(10, 'Családi animációs film', 'Szinkronizált animációs kaland az egész családnak.', 'Mozi', 'Budapest, Cinema City Westend', '2026-02-01 15:00:00', '/e', 'Cinema City', 3100),
(11, 'Művészfilm vetítés', 'Díjnyertes európai művészfilm eredeti nyelven, felirattal.', 'Mozi', 'Budapest, Művész mozi', '2026-03-05 19:00:00', '+12', 'Művész Mozi', 2900),
(12, 'Horrormaraton éjszaka', 'Háromrészes horrorfilm-maraton, szünetekkel.', 'Mozi', 'Szeged, Belvárosi Mozi', '2026-10-31 22:00:00', '+18', 'Belvárosi Mozi', 4500),
(13, 'Sziget Fesztivál napijegy', 'Nemzetközi zenei fesztivál sok színpaddal.', 'Fesztivál', 'Budapest, Óbudai-sziget', '2026-08-07 14:00:00', '+16', 'Eventim', 29900),
(14, 'Balatoni bor- és gasztrofesztivál', 'Kézműves borok és helyi ételek a Balaton partján.', 'Fesztivál', 'Balatonfüred, Tagore sétány', '2026-07-12 12:00:00', '+12', 'Felhasználó', 2000),
(15, 'Campus Fesztivál bérlet', 'Hazai és külföldi zenekarok Debrecenben.', 'Fesztivál', 'Debrecen, Nagyerdő', '2026-07-17 16:00:00', '+16', 'TicketNinja', 34900),
(16, 'Adventi vásár és fesztivál', 'Karácsonyi vásár forralt borral, koncertekkel.', 'Fesztivál', 'Budapest, Vörösmarty tér', '2026-12-06 16:00:00', '/e', 'Felhasználó', 0),
(17, 'Aréna popkoncert', 'Nagy arénás popkoncert hazai sztárral.', 'Koncert', 'Budapest, Papp László Sportaréna', '2026-11-15 20:00:00', '+12', 'Eventim', 15900),
(18, 'Szimfonikus filmzene-est', 'Filmek ismert dallamai szimfonikus zenekarral.', 'Koncert', 'Budapest, Müpa', '2026-03-22 19:30:00', '/e', 'Jegy.hu', 13500),
(19, 'Jazzklub est', 'Improvizatív jazzkoncert klubhangulatban.', 'Koncert', 'Budapest, A38 Hajó', '2026-04-18 21:00:00', '+16', 'A38', 5900),
(20, 'Akusztikus est a tóparton', 'Csendes akusztikus koncert akusztikus gitárral.', 'Koncert', 'Szeged, Partfürdő', '2026-06-21 20:30:00', '+12', 'Felhasználó', 4500),
(21, 'Karriernap és állásbörze', 'Cégek és munkáltatók bemutatkozása hallgatóknak.', 'Rendezvények', 'Budapest, Egyetemi Campus', '2026-04-09 10:00:00', '+16', 'Felhasználó', 0),
(22, 'Programozó meetup', 'Fejlesztők találkozója rövid előadásokkal.', 'Rendezvények', 'Budapest, IT-központ', '2026-02-20 18:30:00', '+16', 'Felhasználó', 0),
(23, 'Könyvbemutató beszélgetéssel', 'Új regény bemutatója dedikálással.', 'Rendezvények', 'Budapest, Könyvesbolt', '2026-03-27 17:00:00', '+12', 'Felhasználó', 0),
(24, 'Gasztronómiai nap', 'Food truck-ok és kóstolók egész nap.', 'Rendezvények', 'Győr, Főtér', '2026-05-11 11:00:00', '/e', 'Felhasználó', 0),
(25, 'Társasjáték klub', 'Havi rendszerességű társasjáték délután.', 'Egyéb', 'Budapest, Közösségi ház', '2026-01-19 15:00:00', '+12', 'Felhasználó', 1000),
(26, 'Fotókiállítás megnyitó', 'Kortárs fotókiállítás ünnepélyes megnyitóval.', 'Egyéb', 'Pécs, Galéria', '2026-02-08 17:00:00', '+12', 'Felhasználó', 1500),
(27, 'Retro videojáték nap', 'Régi konzolok és arcade gépek kipróbálása.', 'Egyéb', 'Budapest, Gaming bár', '2026-03-16 14:00:00', '+12', 'Felhasználó', 2500),
(28, 'Jótékonysági bál', 'Jótékonysági est élő zenével és vacsorával.', 'Egyéb', 'Debrecen, Rendezvényközpont', '2026-11-29 19:00:00', '+18', 'Jegy.hu', 19000),
(29, 'Coding bootcamp – webfejlesztés', 'Intenzív webfejlesztő workshop kezdőknek.', 'Egyéb', 'Budapest, Képzési központ', '2026-06-02 09:00:00', '+16', 'Felhasználó', 49000),
(30, 'E-sport bajnokság', 'LAN e-sport torna több játékkal.', 'Sport', 'Budapest, E-sport aréna', '2026-09-13 10:00:00', '+12', 'Felhasználó', 3000),
(31, 'Open air mozieset', 'Szabadtéri filmvetítés nyári estén.', 'Mozi', 'Siófok, Víztorony tér', '2026-07-25 21:00:00', '/e', 'Felhasználó', 2000),
(32, 'Akusztikus street koncert', 'Utcamuzsikus akusztikus koncertje a belvárosban.', 'Koncert', 'Budapest, Belváros', '2026-05-30 19:00:00', '/e', 'Felhasználó', 0),
(33, 'Nyári színház a parkban', 'Szabadtéri színházi előadás vígjáték műfajban.', 'Színház', 'Veszprém, Várkert', '2026-08-01 20:00:00', '+12', 'Felhasználó', 3500),
(34, 'Forma 1 Magyar Nagydíj', 'A száguldó cirkusz magyarországi futama.', 'Sport', 'Mogyoród, Hungaroring', '2026-07-26 15:00:00', '/e', 'F1 Tickets', 45000),
(35, 'Dumaszínház – Stand-up est', 'Népszerű humoristák fellépése.', 'Színház', 'Budapest, Corvin Dumaszínház', '2026-04-10 19:00:00', '+16', 'Dumaszínház', 6900),
(36, 'Kézműves Sörfesztivál', 'Különleges sörök kóstolója hazai főzdékből.', 'Fesztivál', 'Budapest, Szabadság tér', '2026-05-15 14:00:00', '+18', 'Felhasználó', 3500),
(37, 'Gamer Expo 2026', 'Új videojátékok, VR eszközök és technológiai bemutatók.', 'Rendezvények', 'Budapest, Hungexpo', '2026-09-05 09:00:00', '+12', 'Felhasználó', 5500),
(38, 'Sci-fi mozi premier', 'A legjobban várt sci-fi film IMAX 3D vetítése.', 'Mozi', 'Budapest, Cinema City Arena', '2026-05-20 20:00:00', '+12', 'Cinema City', 3900),
(39, 'Szabadtéri rockkoncert', 'Népszerű hazai rockzenekar nyárindító bulija.', 'Koncert', 'Budapest, Budapest Park', '2026-06-18 19:30:00', '+16', 'Eventim', 11500),
(40, 'Kutyabarát Piknik', 'Közös piknik kutyásoknak ügyességi versenyekkel.', 'Egyéb', 'Budapest, Hajógyári-sziget', '2026-05-02 10:00:00', '/e', 'Felhasználó', 0),
(41, 'Kortárs Táncfesztivál', 'Külföldi és hazai tánctársulatok előadásai.', 'Fesztivál', 'Győr, Nemzeti Színház', '2026-10-10 18:00:00', '+12', 'Jegy.hu', 4500),
(42, 'BL Csoportkör labdarúgás', 'Bajnokok Ligája csoportmérkőzés sztárcsapatokkal.', 'Sport', 'Budapest, Puskás Aréna', '2026-11-03 21:00:00', '+12', 'MeccsJegy', 18500),
(43, 'Klasszikus balett – Diótörő', 'Karácsonyi klasszikus balettelőadás.', 'Színház', 'Budapest, Operaház', '2026-12-20 18:00:00', '/e', 'Operaház', 15000),
(44, 'Marketing és AI Konferencia', 'Szakmai konferencia a mesterséges intelligencia jövőjéről.', 'Rendezvények', 'Budapest, Várkert Bazár', '2026-04-25 09:00:00', '+16', 'TicketNinja', 25000),
(45, 'Éjszakai Fürdőzés és DJ Set', 'Éjszakai zenés fürdőzés koktélokkal.', 'Egyéb', 'Budapest, Széchenyi Fürdő', '2026-07-11 22:00:00', '+18', 'Jegy.hu', 12000);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jegyek`
--

CREATE TABLE `jegyek` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `esemeny_nev` varchar(255) NOT NULL,
  `ar` int(11) NOT NULL,
  `vasarlas_datuma` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `jegyek`
--

INSERT INTO `jegyek` (`id`, `user_id`, `esemeny_nev`, `ar`, `vasarlas_datuma`) VALUES
(1, 2, 'Koncert - Rock Night', 5500, '2024-03-20 10:30:00'),
(2, 2, 'Mozi - Sci-Fi Maratón', 2800, '2024-03-25 14:15:00'),
(3, 3, 'Színház - Rómeó és Júlia', 8500, '2024-03-22 09:00:00'),
(4, 4, 'Sziget Fesztivál Napijegy', 25000, '2024-03-28 18:45:00'),
(5, 4, 'Múzeum Belépő', 3500, '2024-03-29 11:20:00'),
(6, 5, 'Labdarúgó Mérkőzés', 6000, '2024-03-30 13:00:00');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `jelszo_hash` varchar(255) NOT NULL,
  `aktiv` tinyint(1) NOT NULL DEFAULT 1,
  `tipus` enum('user','admin') NOT NULL,
  `Letrehozva` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `jelszo_hash`, `aktiv`, `tipus`, `Letrehozva`) VALUES
(2, 'demo1', 'demo1@email.com', '$2y$10$nP2eIxoYig4.lH794Ycpp.rTrI2xyyAnHdz5d1QCFaUYx38dDtRUq', 1, 'user', '0000-00-00'),
(3, 'demo2', 'demo2@email.com', '$2y$10$a5BMjP4.2SMqMo5EalmX9esD5ANY9xuedfyeyBmSstaR/K71iazSK', 1, 'user', '0000-00-00'),
(4, 'demo3', 'demo3@email.com', '$2y$10$52b5PZtYXPeGmb.klWF.xeeVLyRY6ueNnub5pHZmnO7p7sVUDz7JS', 1, 'user', '0000-00-00'),
(5, 'demo4', 'demo4@email.com', '$2y$10$Qk4nPctN/v8sl7gEO75cBeNJo4K9T6R9l9EvfV.PXJTflh2iNqfcm', 1, 'user', '0000-00-00'),
(6, 'admin', 'admin@email.com', '$2y$10$okwWMEoEPiL9U4gGMT4PpO20K46YubbnlitC8LmXd.YLGNWMqk6Dm', 1, 'admin', '0000-00-00');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `esemeny_lista`
--
ALTER TABLE `esemeny_lista`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `jegyek`
--
ALTER TABLE `jegyek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_jegy` (`user_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `esemeny_lista`
--
ALTER TABLE `esemeny_lista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT a táblához `jegyek`
--
ALTER TABLE `jegyek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `jegyek`
--
ALTER TABLE `jegyek`
  ADD CONSTRAINT `fk_user_jegy` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
