-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2023 at 12:15 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beauty`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_super` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `token`, `photo`, `role_id`, `is_super`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', 'admin@gmail.com', '$2y$10$Zecz3AEeDhygxw9G.vEhhuCCOSlQj6/tb6Kh0UWIgMDE4sxPuh3ie', '', 'user-1.png', 1, 0, NULL, '2023-04-03 02:35:01'),
(7, 'Super Admin', 'superfractalgeometryadmin@gmail.com', '$2y$10$tdD2lgv.sLfqURBBi5SlTuE7r.017qvfrx.kg7bs.i/Sx2N34WW52', '', 'user-1.png', 1, 1, NULL, '2023-04-02 21:54:09');

-- --------------------------------------------------------

--
-- Table structure for table `admin_monthly_pyments`
--

CREATE TABLE `admin_monthly_pyments` (
  `id` int(100) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `amount` varchar(250) NOT NULL,
  `payment_status` varchar(250) NOT NULL,
  `valid_till` varchar(250) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_monthly_pyments`
--

INSERT INTO `admin_monthly_pyments` (`id`, `transaction_id`, `amount`, `payment_status`, `valid_till`, `created_at`, `updated_at`) VALUES
(1, '6655656', '10', 'Captured', '2023-05-05', '2023-05-07 19:00:00', NULL),
(2, '44656565', '10', 'Captured', '2023-05-07', '2023-05-07 19:00:00', NULL),
(3, 'txn_3N5X9OG4c1NcZfIr1zQ1GCy9', '10', 'Captured', '2023-04-08', '2023-05-08 11:43:03', '2023-05-08 11:43:03'),
(4, 'txn_3N5XC9G4c1NcZfIr1dR465W5', '10', 'Captured', '2023-02-08', '2023-05-08 11:45:54', '2023-05-08 11:45:54'),
(5, 'txn_3N6AmfG4c1NcZfIr0sFORaM3', '12', 'Captured', '2023-04-10', '2023-05-10 06:02:15', '2023-05-10 06:02:15'),
(6, 'txn_3N6GvmBOkeBfCxJH2uNO2zAd', '1', 'Captured', '2023-06-10', '2023-05-10 12:36:05', '2023-05-10 12:36:05');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `blog_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_content_short` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `blog_title`, `blog_slug`, `blog_content`, `blog_content_short`, `blog_photo`, `seo_title`, `seo_meta_description`, `created_at`, `updated_at`) VALUES
(7, 3, 'Looking to the Future: What’s Next in Freight & LTL Shipping', 'Looking to the Future: What’s Next in Freight & LTL Shipping', '<p>Whether transporting food from farms to stores or shipping raw \r\nmaterials to manufacturers, our society wouldn’t survive without freight\r\n shipping. While the industry continues to motor forward, technological \r\nadvancements are changing the future of freight. Let’s take a look at \r\nsome of the innovations we may be seeing in the coming years.</p>\r\n<div class=\"kg-card-markdown\">\r\n<h3 id=\"technologyisshapinglogisticsandwarehousemanagementh2whenitcomestologisticstheinternetofthingsiottakescenterstageiotincreasesconnectivitybetweencomputersystemsinrealtimetosharelargeamountsofdatawarehousemanagementsoftwaredistributiontechnologiesandahrefhttpblogauptixcomltlvsftldefinedexplainedtarget_blankltlcarrieracomputersystemsarecontinuallyimprovingtheirabilitiestotrackshipmentroutestrucklocationsandproductdeliveriesbrbrwarehousemanagersandlogisticscompaniescanreapthebenefitsofiotduetobettertransportationtransparencywhenaproblemariseswithashipmentsuchasatruckbreakingdownoradamagedpalletofproductsbetterinformeddecisionscanbemadetoremedytheissuesoontransportationefficiencieswillbewithinreachofmoreltlcarriersastheyadoptnewtechnologiesandsoftwarebrbr\">Technology is shaping logistics and warehouse management</h3>\r\n<p>When it comes to logistics, the Internet of Things (IoT) takes center\r\n stage. IoT increases connectivity between computer systems in real-time\r\n to share large amounts of data. Warehouse management software, \r\ndistribution technologies, and <a href=\"https://www.flockfreight.com/ltl-freight-carriers/\" target=\"_blank\" rel=\"noopener noreferrer\">LTL carrier</a> computer systems are continually improving their abilities to track shipment routes, truck locations, and product deliveries.</p>\r\n<p>Warehouse managers and logistics companies can reap the benefits of \r\nIoT due to better transportation transparency. When a problem arises \r\nwith a shipment, such as a truck breaking down or a damaged pallet of \r\nproducts, better-informed decisions can be made to remedy the issue. \r\nSoon, transportation efficiencies will be within reach of more LTL \r\ncarriers as they adopt new technologies and software.</p>\r\n<h3 id=\"electronicloggingdeviceseldswillincreasesafetyh2eldsincreasetruckersafetybyremovinghumanerrorfromdriverlogreportinghowdotheyworkbrbreldsensorsattachtoatruckengineandautomaticallyrecorddrivingtimesoftwarethentransferstherecordeddatatohoursofservicerecordshosgivingltlfleetcompaniesinstantaccesstoaccuratedrivertransportationlogsthisenablesltlcarrierstomakebettershipmentschedulessodriversdontsufferfatiguewhichcancausedrivingaccidentsbrbr\">Electronic logging devices (ELDs) will increase safety</h3>\r\n<p>ELDs increase trucker safety by removing human error from driver log reporting. How do they work?</p>\r\n<p>ELD sensors attach to a truck engine and automatically record driving\r\n time. The software then transfers the recorded data to hours of service\r\n records (HOS), giving LTL fleet companies instant access to accurate \r\ndriver transportation logs. This enables LTL carriers to make better \r\nshipment schedules so drivers don’t suffer fatigue, which can cause \r\ndriving accidents.</p>\r\n<h3 id=\"selfdrivingtrucksmayfillemptytruckingpositionsh2findingqualifiedltldrivershasbeenagrowingissueforyearstodaycarriersareinvestigatingnewsolutionsselfdrivingtrucksarebeingtestedandmayeventuallybeaviableoptionforlongandshorthauljobsbrbrremovingahumandriverfromtheequationmayincreasesafetybyeliminatingfatigueriskitwillalsodramaticallyreducetransportationcostsandwillallowltlcarrierstoexpandroutestolocationsthatwerepreviouslynotfeasible\">Self-driving trucks may fill empty trucking positions</h3>\r\n<p>Finding qualified LTL drivers has been a growing issue for years. \r\nToday, carriers are investigating new solutions. Self-driving trucks are\r\n being tested, and may eventually be a viable option for long and \r\nshort-haul jobs.</p>\r\n<p>Removing a human driver from the equation may increase safety by \r\neliminating fatigue risk. It will also dramatically reduce \r\ntransportation costs, and will allow LTL carriers to expand routes to \r\nlocations that were previously not feasible.</p>\r\n<p>A wide range of innovations are taking shape in the \r\nfreight-transportation industry. From better logistics tools to \r\nself-driving trucks, these technologies will have a significant impact \r\non the future of freight shipping.</p>\r\n</div>', 'Lorem ipsum dolor sit amet, ea qui tation adversarium definitionem, eu labitur denique est. Ad duo quando recusabo petentium. Mea elit affert oportere ex. Ut error affert accusam pri. Sit no causae vidisse invenire, bonorum inermis nec ex.', 'blog-7.jpg', 'Libris impetus molestiae te eu ius ludus', 'Libris impetus molestiae te eu ius ludus', '2020-11-28 00:13:12', '2022-11-16 04:07:51'),
(8, 1, '2017 Supply Chain and Logistics Trends You Need to Know', '2017 Supply Chain and Logistics Trends You Need to Know', '<p>As the world advances and our transportation needs increase, so does \r\nthe need for innovative supply chain efficiencies. Keep reading to learn\r\n about some of the supply chain trends taking hold in 2017.</p>\r\n<h3 id=\"socialresponsibilityh2corporatelevelsocialresponsibilityisnowcommonplaceinthebusinessworldconsumerswanttoknowmoreaboutproductsupplychainlifecyclesastheybecomemoreselfawareoftheirimpactontheenvironmenttheywanttoknowwheretherawmaterialsaresourcedhowtheproductsaremadeandwhatmethodsareusedduringtransportationsuppliersalsowanttocreatemoresustainablesupplychainssotheyreabletobrandtheirproductsasecofriendlybrbrthankstocustomerandsupplierdemanddistributorsarebeginningtobuildmoretransparencyintotheirbusinessmodeldoingsoallowsthemtoworkwithforwardthinkingenvironmentallyfriendlysuppliersincreaseprofitsandbuildstrongerbrandprofilesbrbr\">Social Responsibility</h3>\r\n<p>Corporate-level social responsibility is now commonplace in the \r\nbusiness world. Consumers want to know more about product supply chain \r\nlifecycles as they become more self-aware of their impact on the \r\nenvironment. They want to know where the raw materials are sourced, how \r\nthe products are made, and what methods are used during transportation. \r\nSuppliers also want to create more sustainable supply chains, so they’re\r\n able to brand their products as eco-friendly.</p>\r\n<p>Thanks to customer and supplier demand, distributors are beginning to\r\n build more transparency into their business model. Doing so allows them\r\n to work with forward-thinking, environmentally-friendly suppliers, \r\nincrease profits, and build stronger brand profiles.</p>\r\n<h3 id=\"automationandroboticsh2roboticshavebeenprevalentintheautomotiveindustryforyearsnowdistributorsarelookingtoincorporateautonomousrobottechnologyintoassemblylinewarehouseenvironmentsbrbrmaterialshandlingequipmentmhecompaniesarebeginningtointroducetheseinnovationsintowarehousestodayyoullseethingslikeroboticforklifttrucksmovingproductsandautomatedmachinespackingitemsforshipmentbrbrroboticpickersarenextonthehorizoneventuallytechnologywillbesophisticatedenoughtoprogramrobotstofindspecificitemsandbringthemtothepackingflooratthatpointroboticworkerswillbeaboonfordistributioncentersworldwidebrbr\">Automation and Robotics</h3>\r\n<p>Robotics have been prevalent in the automotive industry for years. \r\nNow, distributors are looking to incorporate autonomous robot technology\r\n into assembly-line warehouse environments.</p>\r\n<p>Materials handling equipment (MHE) companies are beginning to \r\nintroduce these innovations into warehouses. Today, you’ll see things \r\nlike robotic forklift trucks moving products and automated machines \r\npacking items for shipment.</p>\r\n<p>Robotic pickers are next on the horizon. Eventually, technology will \r\nbe sophisticated enough to program robots to find specific items and \r\nbring them to the packing floor. At that point, robotic workers will be a\r\n boon for distribution centers worldwide.</p>\r\n<h3 id=\"driverlesstransportationh2therearesomanypilotprogramsfordriverlessvehiclesthatwearesuretoseesomemajorgainssoonwealreadyseecompaniessuchasanheuserbuschtestingoutlonghaulswithanalmostdriverlesstrucksoitstandstoreasonthatthesedevelopmentswillnottakeabackseatinourtechnologicalrevolutionanytimesoonbrbrcompaniesacrosstheworldareeagerforthistrendtomoveforwardastheyrecognizetheadvantagestheycouldgainadriverlesstruckcansavedistributorsmoneyonfuelandlaborwhilemakingtheroadssaferbrbr\">Driverless Transportation</h3>\r\n<p>There are so many pilot programs for driverless vehicles that we are \r\nsure to see some major gains soon. We already see companies, such as \r\nAnheuser Busch, testing out long hauls with an “almost” driverless \r\ntruck. So it stands to reason that these developments will not take a \r\nbackseat in our technological revolution anytime soon.</p>\r\n<p>Companies across the world are eager for this trend to move forward, \r\nas they recognize the advantages they could gain. A driverless truck can\r\n save distributors money on fuel and labor while making the roads safer.</p>\r\n<h3 id=\"moreintegratedmanagementh2theinternetofthingsiotstillhasaspotinsupplychaintrendswithcomputerconnectivitythroughcloudbasedsoftwaredistributioncompanieshavestreamlinedoperationsthroughouttheirwarehousesaccountingdepartmentsandsuppliersforamoreseamlesssupplychainprocessbrbrinadditionrealtimedataandvirtualtechnologiesaremakingtheirwayintodistributionenvironmentsintegratedcomputernetworksystemsinstantlyprovideinformationtoworkerswhichhelpsthemincreaseproductivitymeanwhilebusinessownersaremakingbetteroperationaldecisionsthatallowtheircompaniestogrow\">More Integrated Management</h3>\r\n<p>The Internet of Things (IoT) still has a spot in supply chain trends.\r\n With computer connectivity through cloud-based software, distribution \r\ncompanies have streamlined operations throughout their warehouses, \r\naccounting departments, and suppliers for a more seamless supply chain \r\nprocess.</p>\r\n<p>In addition, real-time data and virtual technologies are making their\r\n way into distribution environments. Integrated computer network systems\r\n instantly provide information to workers, which helps them increase \r\nproductivity. Meanwhile, business owners are making better operational \r\ndecisions that allow their companies to grow.</p>\r\nLogistics and supply chain trends are constantly evolving. The four \r\ninnovations discussed above are just a few that have taken hold in 2017.\r\n We eagerly anticipate what we’ll see in years to come', 'Lorem ipsum dolor sit amet, ea qui tation adversarium definitionem, eu labitur denique est. Ad duo quando recusabo petentium. Mea elit affert oportere ex. Ut error affert accusam pri. Sit no causae vidisse invenire, bonorum inermis nec ex.', 'blog-8.jpg', 'Eu paulo lucilius adipisci duo eam', 'Eu paulo lucilius adipisci duo eam', '2020-11-28 00:13:49', '2022-11-16 04:08:51'),
(9, 1, '3 Easy Ways to Streamline Your Supply Chain', '3 Easy Ways to Streamline Your Supply Chain', '<div class=\"kg-card-markdown\">\r\n<p>An <a href=\"https://www.flockfreight.com/2017/09/19/4-popular-warehouse-manager-questions-answered/\" target=\"_blank\" rel=\"noopener noreferrer\">efficient supply chain</a>\r\n can increase profits, reduce waste, improve customer relationships, and\r\n help you expand into new markets. Yet identifying inefficiencies can be\r\n a difficult task. Read on to learn three easy ways to streamline your \r\nsupply chain.</p>\r\n<h3 id=\"userealtimedatah2havingatransparentviewofsupplychainprocessesmakesiteasytoquicklyspotandremedyproblemsuseamanagementsystemtogatherrealtimedataoneachstepofyoursupplychainprocessthencomparethisdatatocompanyanddepartmentkeyperformanceindicatorskpistodetermineifyouremeetingestablishedgoalswhenyouidentifyareasthatarelackingbrainstormwaystostreamlineprocessesincreaseproductivityandreducewastetoimprovekpisbrbr\">1.) Use Real-Time Data</h3>\r\n<p>Having a transparent view of supply chain processes makes it easy to \r\nquickly spot and remedy problems. Use a management system to gather \r\nreal-time data on each step of your supply chain process. Then, compare \r\nthis data to company and department key performance indicators (KPIs) to\r\n determine if you’re meeting established goals. When you identify areas \r\nthat are lacking, brainstorm ways to streamline processes, increase \r\nproductivity, and reduce waste to improve KPIs.</p>\r\n<h3 id=\"improveoperationalconnectivityh2accesstoanalyticscloudservicesandmobilecomputingischanginghowlogisticscompaniesmanageoperationswithsomanytoolsatyourdisposalitsnosurprisethattheahrefhttpblogauptixcomlookingtothefuturewhatsnextinltltransportationtarget_blankinternetofthingsiotaisimprovingsupplychainsaroundtheworldbutareyoutakingfulladvantageifyourenotsureitmaybetimeforatechnologyauditbrbrmakeityourgoaltosetupasystemwhereallyourtoolstalktoeachotherwhenwarehousedistributionandaccountingmanagementsystemscaninstantlyshareandaccessinformationitimprovesproductivityacrossalldepartmentseveryoneinyourcompanycanobtainthedatatheyneedwhentheyneeditbrbr\">2.) Improve Operational Connectivity</h3>\r\n<p>Access to analytics, cloud services, and mobile computing is changing\r\n how logistics companies manage operations. With so many tools at your \r\ndisposal, it’s no surprise that the <a href=\"https://www.flockfreight.com/2017/09/18/looking-to-the-future-whats-next-in-ltl-transportation/\" target=\"_blank\" rel=\"noopener noreferrer\">Internet of Things (IoT)</a>\r\n is improving supply chains around the world. But are you taking full \r\nadvantage? If you’re not sure, it may be time for a technology audit.</p>\r\n<p>Make it your goal to set up a system where all your tools talk to \r\neach other. When warehouse, distribution, and accounting management \r\nsystems can instantly share and access information, it improves \r\nproductivity across all departments. Everyone in your company can obtain\r\n the data they need, when they need it.</p>\r\n<h3 id=\"reduceduplicatetasksanddatah2asyougrowitseasytofallintothetrapofhavingduplicateprocessesbutovercomplicatingdailytaskscanslowthingsdownandtakeuptoomuchofyourworkerstimetoavoidthisevaluateyouroperationsandlookforsimilarfunctionsthatcanbeconsolidatedoreliminatedbrbrinadditiontohavingefficientprocessesitsalsoimportanttoworkwithcleandataduplicatedatacanslowdownyournetworksandmakedatabaseadministrationmessierthanitneedstobefocusoncleaningupsystemstokeepthingsrunningassmoothlyaspossiblenotsurewheretostartbringonadatabaseadministratortofocusoncleaninguprecordsandsimplifyingroutinedataentryandmaintenance\">3.) Reduce Duplicate Tasks and Data</h3>\r\n<p>As you grow, it’s easy to fall into the trap of having duplicate \r\nprocesses. But overcomplicating daily tasks can slow things down and \r\ntake up too much of your workers’ time. To avoid this, evaluate your \r\noperations and look for similar functions that can be consolidated or \r\neliminated.</p>\r\n<p>In addition to having efficient processes, it’s also important to \r\nwork with clean data. Duplicate data can slow down your networks and \r\nmake database administration messier than it needs to be. Focus on \r\ncleaning up systems to keep things running as smoothly as possible. Not \r\nsure where to start? Bring on a database administrator to focus on \r\ncleaning up records and simplifying routine data entry and maintenance.</p>\r\n<p>Use these simple steps to identify redundant tasks, inefficient \r\nsystems, and complex processes. Then, make changes to your day-to-day \r\noperations that will help streamline your logistics supply chain.</p>\r\n</div>', 'Lorem ipsum dolor sit amet, ea qui tation adversarium definitionem, eu labitur denique est. Ad duo quando recusabo petentium. Mea elit affert oportere ex. Ut error affert accusam pri. Sit no causae vidisse invenire, bonorum inermis nec ex.', 'blog-9.jpg', '3 Easy Ways to Streamline Your Supply Chain', '3 Easy Ways to Streamline Your Supply Chain', '2020-11-28 00:14:30', '2022-11-16 04:10:14');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_slug`, `seo_title`, `seo_meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Commercial', 'commercial', 'Commercial', 'Commercial', '2020-11-19 10:00:01', '2020-11-28 00:07:18'),
(3, 'Residential', 'residential', 'Residential', 'Residential', '2020-11-19 21:54:59', '2020-11-28 00:07:14'),
(4, 'Economical', 'economical', 'Economical', 'Economical', '2020-11-28 00:07:59', '2020-11-28 00:07:59'),
(5, 'Business Idea', 'business-idea', 'Business Idea', 'Business Idea', '2020-11-28 00:08:08', '2020-11-28 00:08:08'),
(6, 'Popular Tools', 'popular-tools', 'Popular Tools', 'Popular Tools', '2020-11-28 00:08:16', '2020-11-28 00:08:16');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` int(11) NOT NULL,
  `person_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `person_email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `person_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `blog_id`, `person_name`, `person_email`, `person_message`, `comment_status`, `created_at`, `updated_at`) VALUES
(4, 3, 'Sabbir Ahmed', 'sabbirahmed@gmail.com', 'This is a very nice website. I love it so much. I want to make a website like this. When can you talk to me? Please give me a time.', 'Pending', '2020-11-28 06:46:13', '2020-11-28 06:46:13'),
(5, 3, 'Patrick Henderson', 'patrickhenderson@gmail.com', 'Hi admin, very nice post and very helpful.', 'Approved', '2020-11-28 06:48:02', '2020-11-28 06:48:02');

-- --------------------------------------------------------

--
-- Table structure for table `composed_documents`
--

CREATE TABLE `composed_documents` (
  `id` int(11) NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT 'Title goes here',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `composed_documents`
--

INSERT INTO `composed_documents` (`id`, `message`, `title`, `created_at`, `updated_at`) VALUES
(5, '<p>Save Document can be edited anytime.&nbsp;</p>', 'I am here to work', '2023-04-08 01:04:15', '2023-04-10 21:39:15'),
(6, '<p>hello giksjsjss</p>', 'No money left for me', '2023-04-08 19:46:53', '2023-04-10 21:39:15'),
(7, '<p>aSASasaSASsS</p>', 'Please help me', '2023-04-08 19:48:15', '2023-04-10 21:39:15');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_discount` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_maximum_use` smallint(6) NOT NULL,
  `coupon_existing_use` smallint(6) NOT NULL,
  `coupon_start_date` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_end_date` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_code`, `coupon_type`, `coupon_discount`, `coupon_maximum_use`, `coupon_existing_use`, `coupon_start_date`, `coupon_end_date`, `coupon_status`, `created_at`, `updated_at`) VALUES
(2, 'NICE', 'Percentage', '5', 20, 0, '2020-04-09', '2020-12-25', 'Show', '2020-12-03 02:43:49', '2020-12-03 02:43:49'),
(3, 'STRONG', 'Amount', '15', 14, 0, '2020-04-09', '2020-12-25', 'Show', '2020-12-03 02:44:18', '2020-12-03 02:44:18');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_name`, `customer_email`, `customer_phone`, `customer_country`, `customer_address`, `customer_state`, `customer_city`, `customer_zip`, `customer_password`, `customer_token`, `customer_status`, `created_at`, `updated_at`) VALUES
(4, 'Rizan', 'syedsultanrafiq6@gmail.com', '+18189415850', '', '', '', '', '', '$2y$10$gfNe7yTwqOAswIT0fa3isefaIGfALvt3cuE.0Ts8svZ4S2siNCiHS', 'aac7d5f250dd2153d0b3f64361f4c6ab4b0e375560fbb17826199fdf950c0539', 'Active', '2023-03-19 18:01:14', '2023-03-19 18:01:14'),
(8, 'user1', 'cikeci4280@dogemn.com', '+18189415850', '', '', '', '', '', '$2y$10$l.jz.Y07Ni5yYSWZtK9vK.wGyYmiVIPBwywLUEsrYB3r7QqX8Lx9C', 'ef2603bfc742fb898a2707fc4e3b23bad3bc3532bc26ea5b29b4de10c13da1e6', 'Active', '2023-03-30 17:07:46', '2023-03-30 17:07:46');

-- --------------------------------------------------------

--
-- Table structure for table `dynamic_pages`
--

CREATE TABLE `dynamic_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dynamic_page_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dynamic_page_slug` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dynamic_page_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dynamic_page_banner` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `et_subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `et_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `et_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `et_subject`, `et_content`, `et_name`, `created_at`, `updated_at`) VALUES
(1, 'Contact Form - your website', '<p>You have received a message from a visitor. Detailed information is here:</p><p>Visitor Name: [[visitor_name]]</p><p>Visitor Email: [[visitor_email]]</p><p>Visitor Phone: [[visitor_phone]]</p><p>Visitor Message:&nbsp;</p><p>[[visitor_message]]</p>', 'Contact Page Message', NULL, '2020-11-24 11:15:19'),
(2, 'New Comment Posted', '<p>You have received a new comment from a person. His detail is here:</p><p><strong>Person Name:</strong>&nbsp;[[person_name]]</p><p><strong>Person Email:&nbsp;</strong>[[person_email]]</p><p><strong>Person Message:</strong></p><p>[[person_message]]</p><p>Go to this link to see this comment<span style=\"font-weight: bolder;\">:&nbsp;</span><a href=\"[[comment_see_url]]\" target=\"_blank\">See Comment</a></p>', 'Comment Message to Admin', NULL, '2020-11-28 04:51:16'),
(3, 'Verify Subscription', '<p>Dear Sir,</p><p>You have requested to be a subscriber in our website. Please click on the following link to confirm the subscription:</p><p><a href=\"[[verification_link]]\" target=\"_blank\">Verification Link</a></p><p>Thank you so much!<br>Marketing Team</p>', 'Subscriber Message for Verification', NULL, '2020-12-09 18:51:13'),
(4, 'A News has been added', '<p>Dear Subscriber,</p><p>A news has been published. To see the news, please go to the following link:</p><p><a href=\"[[post_link]]\" target=\"_blank\">Click here to see the post</a></p><p>Thank you!</p>', 'News Post Message to Active Subscribers', NULL, '2020-12-09 22:26:04'),
(5, 'Reset Password', '<p>To reset your password, please click on the following link:</p><p><a href=\"[[reset_link]]\" target=\"_blank\">Reset Password</a><br></p>', 'Reset Password Message to Admin', NULL, '2020-11-27 19:20:59'),
(6, 'Confirm Registration', '<p>To activate your account and confirm the registration, please click on the verify link below:</p><p><a href=\"[[verification_link]]\" target=\"_blank\">Verification Link</a></p>', 'Registration Email to Customer', NULL, '2020-12-03 10:38:57'),
(7, 'Reset Password', '<p>To reset your password, please click on the following link:</p><p><a href=\"[[reset_link]]\" target=\"_blank\">Reset Password Link</a></p>', 'Reset Password Message to Customer', NULL, '2020-12-05 03:30:14'),
(8, 'Order Completed', '<p>Dear [[customer_name]],</p><p>Your order has been submitted successfully and we received the payment from you. After you process and ship the order, you will get all the products after a certain time period.&nbsp;</p><p><b>Payment Information:</b></p><p>Order Number: [[order_number]]</p><p>[[payment_method]]</p><p>Payment Date &amp; Time: [[payment_date_time]]</p><p>Transaction Id: [[transaction_id]]</p><p>Shipping Cost: [[shipping_cost]]</p><p>Coupon Code: [[coupon_code]]</p><p>Coupon Discount: [[coupon_discount]]</p><p>Paid Amount: [[paid_amount]]</p><p>Payment Status: [[payment_status]]</p><p>----------------------------------------</p><p><b>Your billing details:</b></p><p>Billing Name: [[billing_name]]</p><p>Billing Email: [[billing_email]]</p><p>Billing Phone: [[billing_phone]]</p><p>Billing Country: [[billing_country]]</p><p>Billing Address: [[billing_address]]</p><p>Billing State: [[billing_state]]</p><p>Billing City: [[billing_city]]</p><p>Billing Zip: [[billing_zip]]</p><p>----------------------------------------</p><p><b>Your shipping details:</b></p><p>Shipping Name: [[shipping_name]]</p><p>Shipping Email: [[shipping_email]]</p><p>Shipping Phone: [[shipping_phone]]</p><p>Shipping Country: [[shipping_country]]</p><p>Shipping Address: [[shipping_address]]</p><p>Shipping State: [[shipping_state]]</p><p>Shipping City: [[shipping_city]]</p><p>Shipping Zip: [[shipping_zip]]</p><p>----------------------------------------</p><p><b>Products You Purchased:&nbsp;</b></p><p>[[product_detail]]</p><p>Thank you! The ABC Team</p>', 'Order Completed Email to Customer', NULL, '2020-12-08 22:11:59');

-- --------------------------------------------------------

--
-- Table structure for table `excel_contacts`
--

CREATE TABLE `excel_contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `faq_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_order` smallint(6) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `faq_title`, `faq_content`, `faq_order`, `created_at`, `updated_at`) VALUES
(1, 'Lorem ipsum dolor sit amet, eu vim elitr clita?', '<p>Lorem ipsum dolor sit amet, eu vim elitr clita, quot putent feugait cu per. Tamquam voluptua persequeris ad cum, at his cibo scaevola. Cibo justo equidem cu nam. An meliore admodum vis, quot aliquip bonorum ei quo. Mea nemore feugiat verterem cu, modus vulputate mea id.<br></p>', 3, '2020-11-23 11:09:14', '2020-11-28 23:12:53'),
(2, 'Est facilis recteque et, etiam aliquip?', '<p>Lorem ipsum dolor sit amet, eu vim elitr clita, quot putent feugait cu per. Tamquam voluptua persequeris ad cum, at his cibo scaevola. Cibo justo equidem cu nam. An meliore admodum vis, quot aliquip bonorum ei quo. Mea nemore feugiat verterem cu, modus vulputate mea id.<br></p>', 2, '2020-11-23 11:09:31', '2020-11-23 11:09:31'),
(3, 'Cetero mnesarchum id vis, id sea?', '<p>Lorem ipsum dolor sit amet, eu vim elitr clita, quot putent feugait cu per. Tamquam voluptua persequeris ad cum, at his cibo scaevola. Cibo justo equidem cu nam. An meliore admodum vis, quot aliquip bonorum ei quo. Mea nemore feugiat verterem cu, modus vulputate mea id.<br></p>', 1, '2020-11-23 11:09:45', '2020-11-28 23:12:59');

-- --------------------------------------------------------

--
-- Table structure for table `file_manager`
--

CREATE TABLE `file_manager` (
  `id` int(11) NOT NULL,
  `filename` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hashname` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) DEFAULT 0 COMMENT 'in Kbs',
  `extension` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `file_manager`
--

INSERT INTO `file_manager` (`id`, `filename`, `hashname`, `size`, `extension`, `signature`, `created_at`, `updated_at`) VALUES
(1, '4 domains tasks and commments.xlsx', '4 domains tasks and commments_1680981453.xlsx', 82400, 'xlsx', NULL, '2023-04-08 19:17:33', '2023-04-10 21:39:15'),
(2, '7mb1.jpg', '7mb1_1680981453.jpg', 7582080, 'jpg', NULL, '2023-04-08 19:17:33', '2023-04-10 21:39:15'),
(3, 'doc_prescription.pdf', 'doc_prescription_1680981453.pdf', 794205, 'pdf', NULL, '2023-04-08 19:17:33', '2023-04-10 21:39:15'),
(4, 'draw_1680817491565.pdf', 'draw_1680817491565_1680981453.pdf', 4072673, 'pdf', '6431bf5c10603.png', '2023-04-08 19:17:33', '2023-04-10 21:39:15'),
(5, 'export.pdf', 'export_1680981660.pdf', 6207, 'pdf', '6431beb34e348.png', '2023-04-08 19:21:00', '2023-04-10 21:39:15');

-- --------------------------------------------------------

--
-- Table structure for table `footer_columns`
--

CREATE TABLE `footer_columns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `column_item_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_item_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_item_order` int(11) NOT NULL DEFAULT 0,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo_width` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '520',
  `logo_height` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '145',
  `favicon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_bg` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `top_bar_email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `top_bar_phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `top_bar_social_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `top_bar_login_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `top_bar_registration_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `top_bar_cart_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_total_recent_post` tinyint(4) NOT NULL,
  `theme_color` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `navbar_color` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'EBEEF5',
  `footer_column1_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_column2_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_column3_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_column4_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_phone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_copyright` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `preloader_photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `preloader_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky_header_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_analytic_tracking_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_analytic_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tawk_live_chat_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tawk_live_chat_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie_consent_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_recaptcha_site_key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_recaptcha_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_about` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_service` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_service_detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_blog` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_blog_detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_category` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_project` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_project_detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_team_member` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_team_member_detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_photo_gallery` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_video_gallery` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_faq` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_product` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_product_detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_contact` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_search` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_cart` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_checkout` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_login` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_registration` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_forget_password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_customer_panel` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_career` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_job` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_job_application` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_term` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_privacy` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `items_color` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000000',
  `items_hover_color` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000000',
  `lpc_logo` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lpc_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lpc_title` varchar(110) COLLATE utf8mb4_unicode_ci DEFAULT 'Title goes here',
  `lpc_background` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#000000',
  `lpc_btn_color` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT '#000000',
  `lpc_form_bg_color` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT '#000000',
  `lpc_nav_color` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '#000000',
  `lpc_overlay` double DEFAULT 0.5,
  `lpc_title_color` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#ded7c3',
  `lpc_title_font_size` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '50px',
  `lpc_title_font_family` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Arial, sans-serif',
  `lpc_title_text_color` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#ded7c3',
  `lpc_title_text_font_size` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '50px',
  `lpc_title_text_font_family` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Arial, sans-serif',
  `lpc_form_text_color` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#5c5749',
  `lpc_form_text_font_size` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '16px',
  `lpc_form_text_font_family` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Arial, sans-serif',
  `lpc_submit_text_color` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#0d0d0d',
  `lpc_submit_text_font_size` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '15px',
  `lpc_submit_text_font_family` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Arial, sans-serif',
  `lpc_centered` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'off',
  `lpc_left_bg` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_logo` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_logo_width` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '200',
  `admin_logo_height` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '80',
  `bercotool_1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bercotool_2` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bercotool_3` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bercotool_4` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bercotool_5` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bercotool_6` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bercotool_7` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bercotool_8` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bercotool_9` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bercotool_10` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bercotool_11` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monthly_fee` int(100) DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `logo`, `logo_width`, `logo_height`, `favicon`, `login_bg`, `top_bar_email`, `top_bar_phone`, `top_bar_social_status`, `top_bar_login_status`, `top_bar_registration_status`, `top_bar_cart_status`, `sidebar_total_recent_post`, `theme_color`, `navbar_color`, `footer_column1_heading`, `footer_column2_heading`, `footer_column3_heading`, `footer_column4_heading`, `footer_address`, `footer_email`, `footer_phone`, `footer_copyright`, `preloader_photo`, `preloader_status`, `sticky_header_status`, `google_analytic_tracking_id`, `google_analytic_status`, `tawk_live_chat_code`, `tawk_live_chat_status`, `cookie_consent_status`, `google_recaptcha_site_key`, `google_recaptcha_status`, `banner_about`, `banner_service`, `banner_service_detail`, `banner_blog`, `banner_blog_detail`, `banner_category`, `banner_project`, `banner_project_detail`, `banner_team_member`, `banner_team_member_detail`, `banner_photo_gallery`, `banner_video_gallery`, `banner_faq`, `banner_product`, `banner_product_detail`, `banner_contact`, `banner_search`, `banner_cart`, `banner_checkout`, `banner_login`, `banner_registration`, `banner_forget_password`, `banner_customer_panel`, `banner_career`, `banner_job`, `banner_job_application`, `banner_term`, `banner_privacy`, `created_at`, `updated_at`, `items_color`, `items_hover_color`, `lpc_logo`, `lpc_text`, `lpc_title`, `lpc_background`, `lpc_btn_color`, `lpc_form_bg_color`, `lpc_nav_color`, `lpc_overlay`, `lpc_title_color`, `lpc_title_font_size`, `lpc_title_font_family`, `lpc_title_text_color`, `lpc_title_text_font_size`, `lpc_title_text_font_family`, `lpc_form_text_color`, `lpc_form_text_font_size`, `lpc_form_text_font_family`, `lpc_submit_text_color`, `lpc_submit_text_font_size`, `lpc_submit_text_font_family`, `lpc_centered`, `lpc_left_bg`, `admin_logo`, `admin_logo_width`, `admin_logo_height`, `bercotool_1`, `bercotool_2`, `bercotool_3`, `bercotool_4`, `bercotool_5`, `bercotool_6`, `bercotool_7`, `bercotool_8`, `bercotool_9`, `bercotool_10`, `bercotool_11`, `monthly_fee`) VALUES
(1, '1680656256.png', '300', '100', '1680488615.png', '1680488702.jpg', 'info@aabsolutebarbersvipnsalons.com', 'Office (818) 348-1234       Owner (818) 916-7725', 'Show', 'Show', 'Show', 'Show', 5, '4D0101', '000000', 'Important Links', 'Useful Links', 'Contact Information', 'Social Media', '7046 Owensmouth Av.\r\nCanoga Park CA 91303', 'info@aabsolutebarbersvipnsalons.site/', 'Office (818) 348-1234\r\nOwner (818) 916-7725', 'Copyright 2020 ABSOLUTE BARBERS VIP & SALON | All Rights Reserved.', 'preloader.gif', 'Hide', 'Show', 'UA-84213520-6', 'Show', '<script type=\"text/javascript\">\r\n    var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n    (function(){\r\n        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n        s1.async=true;\r\n        s1.src=\'https://embed.tawk.to/5a7c31ded7591465c7077c48/default\';\r\n        s1.charset=\'UTF-8\';\r\n        s1.setAttribute(\'crossorigin\',\'*\');\r\n        s0.parentNode.insertBefore(s1,s0);\r\n    })();\r\n</script>', 'Hide', 'Show', '6LfzGuEZAAAAADZrHN3QDdPLYfS3I6BaKmjWjryh', 'Hide', '1679411046.png', '1679411129.png', 'banner_service_detail.jpeg', 'banner_blog.jpeg', 'banner_blog_detail.jpeg', 'banner_category.jpeg', 'banner_project.jpeg', 'banner_project_detail.jpeg', 'banner_team_member.jpeg', 'banner_team_member_detail.jpeg', '1679411210.jpg', 'banner_video_gallery.jpeg', 'banner_faq.jpeg', 'banner_product.jpeg', 'banner_product_detail.jpeg', '1679411770.jpg', 'banner_search.jpeg', 'banner_cart.jpeg', 'banner_checkout.jpeg', '1679412219.jpg', '1679412271.jpg', 'banner_forget_password.jpeg', 'banner_customer_panel.jpeg', 'banner_career.jpeg', 'banner_job.jpeg', 'banner_job_application.jpeg', 'banner_term.jpeg', 'banner_privacy.jpeg', NULL, '2023-05-11 10:29:07', '6DECFF', '8C5B65', '1681152242.png', 'Please fill the register form complete.', 'Register for Promotions', '1681766811.png', '#eb0a1e', '#f2f2ed', '#f4f3f0', 0.1, '#cf4d07', '50px', 'Georgia, serif', '#e5bdbd', '15px', 'Comic Sans MS, cursive, sans-serif', '#d5102e', '16px', 'Courier, monospace', '#ffffff', '15px', 'Tahoma, sans-serif', '0', '1681766745.png', '1683636691.png', '200', '100', '1683708686.png', '1683708758.png', '168371235468677.png', '168371235490923.png', '168371235443176.png', '168371235497987.png', '168371235473524.png', '168371235451549.png', '168371235440758.png', '168371235450326.png', '168381894717145.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_slug` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_description_short` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_responsibility` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_education` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_experience` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_additional_requirement` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_benefit` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_deadline` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_vacancy` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_company_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_type` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_salary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_order` int(11) NOT NULL DEFAULT 0,
  `seo_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `job_title`, `job_slug`, `job_description_short`, `job_responsibility`, `job_education`, `job_experience`, `job_additional_requirement`, `job_benefit`, `job_deadline`, `job_vacancy`, `job_company_name`, `job_location`, `job_type`, `job_salary`, `job_order`, `seo_title`, `seo_meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Software Engineer (SQL & BI Reporting)', 'software-engineer-sql-bi-reporting', 'We are looking for a Software Engineer (SQL & BI Reporting) in our company.', '<ul><li>Perform database programming for new and existing systems.</li><li>Write scripts, stored procedures, and functions for database systems with SQL Server 2008 and above.</li><li>Build and maintain reports with Crystal Reports/ Windward.</li><li>Troubleshoot database problems, queries, and errors in an accurate and timely manner</li><li>Maintain accurate and complete database programming documentation</li></ul>', '<ul><li>Bachelor in Engineering (BEngg)</li><li>B.Sc in Computer Science/ Engineering from any Reputed University.</li><li>Skills Required: MS SQL Server ,Oracle Database,Oracle PLSQL,TSQL</li></ul>', '<ul><li>At least 1 year(s)</li><li>Freshers are also encouraged to apply.</li></ul>', '<ul><li>Age 25 to 45 years</li><li>Female candidates are encouraged to apply</li><li>Self-starter who is able to take the initiative with minimal supervision</li><li>Ability to work under pressure and meet the deadline</li><li>Strong problem-solving skills</li><li>Strong communication skills - technical and non-technical</li><li>C#, ASP.Net MVC/Web API development knowledge will be a plus point.</li></ul>', '<ul><li>Medical allowance, Performance bonus, Provident fund, Gratuity, Weekly 2 holidays</li><li>Lunch Facilities: Full Subsidize</li><li>Salary Review: Yearly</li><li>Festival Bonus: 2</li></ul>', '2020/11/30', '02', 'ABC Software Limited', 'New York, USA', 'Full Time', 'Negotiable', 1, 'Software Engineer (SQL & BI Reporting)', 'Software Engineer (SQL & BI Reporting)', '2020-11-29 08:36:19', '2020-11-29 09:01:15'),
(2, 'PHP/Web Developer', 'phpweb-developer', 'This role will be focused on an integration project involving Marekto and Salesforce with additional work on our eCommerce platform.', '<ul><li>Perform database programming for new and existing systems.</li><li>Write scripts, stored procedures and functions for database system with SQL Server 2008 and above.</li><li>Build and maintain reports with Crystal Reports/ Windward.</li><li>Troubleshoot database problems, queries and errors in accurate and timely manner</li><li>Maintain accurate and complete database programming documentation</li></ul>', '<ul><li>Bachelor in Engineering (BEngg)</li><li>B.Sc in Computer Science/ Engineering from any Reputed University.</li><li>Skills Required: MS SQL Server ,Oracle Database,Oracle PLSQL,TSQL</li></ul>', '<ul><li>At least 1 year(s)</li><li>Freshers are also encouraged to apply.</li></ul>', '<ul><li>Age 25 to 45 years</li><li>Female candidates are encouraged to apply</li><li>Self-starter who is able to take the initiative with minimal supervision</li><li>Ability to work under pressure and meet the deadline</li><li>Strong problem solving skills</li><li>Strong communication skills - technical and non-technical</li><li>C#, ASP.Net MVC/Web Api development knowledge will be a plus point.</li></ul>', '<ul><li>Medical allowance, Performance bonus, Provident fund, Gratuity, Weekly 2 holidays</li><li>Lunch Facilities: Full Subsidize</li><li>Salary Review: Yearly</li><li>Festival Bonus: 2</li></ul>', '2020-07-23', '01', 'XYZ Software Limited', 'New York, USA', 'Full Time', 'Negotiable', 2, 'PHP/Web Developer', 'PHP/Web Developer', '2020-11-29 09:03:51', '2020-11-29 09:03:51'),
(3, 'Senior PHP Developer', 'senior-php-developer', 'Resume-Library is the fastest-growing job board in the U.S. market. We help thousands of expanding companies source the best candidates available. Our established tech team has worked hard to achieve a reputation for innovation, flexibility and usability, but we want more.', '<ul><li>Perform database programming for new and existing systems.</li><li>Write scripts, stored procedures and functions for database system with SQL Server 2008 and above.</li><li>Build and maintain reports with Crystal Reports/ Windward.</li><li>Troubleshoot database problems, queries and errors in accurate and timely manner</li><li>Maintain accurate and complete database programming documentation</li></ul>', '<ul><li>Bachelor in Engineering (BEngg)</li><li>B.Sc in Computer Science/ Engineering from any Reputed University.</li><li>Skills Required: MS SQL Server ,Oracle Database,Oracle PLSQL,TSQL</li></ul>', '<ul><li>At least 1 year(s)</li><li>Freshers are also encouraged to apply.</li></ul>', '<ul><li>Age 25 to 45 years</li><li>Female candidates are encouraged to apply</li><li>Self-starter who is able to take the initiative with minimal supervision</li><li>Ability to work under pressure and meet the deadline</li><li>Strong problem solving skills</li><li>Strong communication skills - technical and non-technical</li><li>C#, ASP.Net MVC/Web Api development knowledge will be a plus point.</li></ul>', '<ul><li>Medical allowance, Performance bonus, Provident fund, Gratuity, Weekly 2 holidays</li><li>Lunch Facilities: Full Subsidize</li><li>Salary Review: Yearly</li><li>Festival Bonus: 2</li></ul>', '2028-07-19', '01', 'MM Software Limited', 'New York, USA', 'Full Time', 'Negotiable', 3, 'Senior PHP Developer', 'Senior PHP Developer', '2020-11-29 09:06:01', '2020-11-29 09:06:01');

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` int(11) NOT NULL,
  `applicant_first_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `applicant_last_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `applicant_email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `applicant_phone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `applicant_country` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `applicant_state` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `applicant_street` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `applicant_city` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `applicant_zip_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `applicant_expected_salary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `applicant_cover_letter` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `applicant_cv` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `landing_page_contacts`
--

CREATE TABLE `landing_page_contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `landing_page_images`
--

CREATE TABLE `landing_page_images` (
  `id` int(11) NOT NULL,
  `file` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_left` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `landing_page_images`
--

INSERT INTO `landing_page_images` (`id`, `file`, `created_at`, `updated_at`, `is_left`) VALUES
(3, '1681076403.jpg', '2023-04-09 21:40:03', '2023-04-09 21:40:03', 0);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `route` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_key`, `menu_name`, `menu_status`, `created_at`, `updated_at`, `parent_id`, `route`) VALUES
(1, 'Home', 'Home', 'Show', NULL, NULL, NULL, 'homepage'),
(2, 'About', 'About', 'Show', NULL, NULL, NULL, 'front.about'),
(3, 'Services', 'Services', 'Show', NULL, NULL, NULL, 'front.services'),
(4, 'Shop', 'Shop', 'Show', NULL, NULL, NULL, 'front.shop'),
(5, 'Blog', 'Blog', 'Hide', NULL, NULL, NULL, 'front.blogs'),
(6, 'Project', 'Project', 'Hide', NULL, NULL, NULL, 'front.projects'),
(7, 'FAQ', 'FAQ', 'Hide', NULL, NULL, NULL, 'front.faq'),
(8, 'Team Members', 'Team Members', 'Hide', NULL, NULL, NULL, 'front.team_members'),
(10, 'Career', 'Career', 'Hide', NULL, NULL, NULL, 'front.career'),
(11, 'Photo Gallery', 'Photo Gallery', 'Show', NULL, NULL, NULL, 'front.photo_gallery'),
(12, 'Video Gallery', 'Video Gallery', 'Hide', NULL, NULL, NULL, 'front.video_gallery'),
(13, 'Terms and Conditions', 'Terms and Conditions', 'Hide', NULL, NULL, NULL, 'front.term'),
(14, 'Privacy Policy', 'Privacy Policy', 'Hide', NULL, NULL, NULL, 'front.privacy');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organization` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `organization`, `info`, `phone`, `option`, `created_at`, `updated_at`) VALUES
(1, 'Curran Ellison', 'Melton Conley LLC', 'Est dolor nisi neque', '+1 (995) 198-6865', 'temp customer', '2022-11-20 17:10:32', '2023-04-10 21:39:15'),
(2, 'Cooper Cameron', 'Garza and Graves Co', 'Dolore quia quos eos', '+1 (277) 288-2012', 'temp customer', '2022-11-20 17:12:29', '2023-04-10 21:39:15'),
(3, 'juan manuel', 'cheloni', 'wswwqwedwdwddwdddw', '8189415850', 'carrier', '2022-11-20 22:57:17', '2023-04-10 21:39:15'),
(4, 'hgh', 'yjyjy', 'ghghghgfhfghgfhghgfhghfgh', '818945623', 'carrier', '2022-11-21 16:52:26', '2023-04-10 21:39:15'),
(5, 'Catherinaml', 'Catherinaml', 'Нello аll, guyѕǃ Ι know, my mеsѕage maу bе tоo ѕресіfіc,\r\nВut my ѕіѕter found nісe mаn hеre and they mаrried, ѕо how abоut mе?! :)\r\nΙ am 23 уears old, Cаtherinа, from Romаniа, I know Εnglіѕh аnd Gеrman languagеѕ аlѕo\r\nАnd... I hаvе ѕресifiс dіѕeаse, namеd nymрhomаniа. Who know what iѕ this, cаn undеrstаnd me (bettеr to say it іmmеdіаtely)\r\nAh уеs, Ι cоok very taѕtу! аnd I lovе nоt оnly сооk ;))\r\nΙm rеal gіrl, not proѕtіtute, аnd lookіng for seriouѕ and hot relatіonѕhip...\r\nAnywaу, you cаn fіnd mу рrofіlе hеre: http://plicasuntrinunaf.ga/page/2283/', '87125578641', 'Carrier', '2022-11-26 23:57:30', '2023-04-10 21:39:15'),
(6, 'Bryanflone', 'Bryanflone', 'Ndjsjdshushfsjcihdhvd jsidjdihefuskfbsdha hduwahafhisudsjdafhiu hwhfoiejfuhfajf hiojsdcahfshdjasf saofhcsdivksahfsdhfuhf prismafreight.com', '85339315838', 'Carrier', '2023-01-12 09:38:10', '2023-04-10 21:39:15'),
(7, 'Susana', 'no tengo', 'Hola por favor quiero una cita para mis extensiones.', '8189415850', 'Customer-Appointment', '2023-03-25 00:23:42', '2023-04-10 21:39:15');

-- --------------------------------------------------------

--
-- Table structure for table `message_limits`
--

CREATE TABLE `message_limits` (
  `id` int(11) NOT NULL,
  `sms` int(11) DEFAULT 100,
  `whatsapp` int(11) DEFAULT 100,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `message_limits`
--

INSERT INTO `message_limits` (`id`, `sms`, `whatsapp`, `created_at`, `updated_at`) VALUES
(1, 100, 20, '2023-04-02 21:03:33', '2023-04-10 21:39:16');

-- --------------------------------------------------------

--
-- Table structure for table `message_options`
--

CREATE TABLE `message_options` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `message_options`
--

INSERT INTO `message_options` (`id`, `name`, `created_at`, `updated_at`) VALUES
(12, 'Customer-Appointment', '2023-03-25 00:22:55', '2023-04-10 21:39:16'),
(14, 'Hiring Job', '2023-04-03 02:09:36', '2023-04-10 21:39:16');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_10_05_052517_create_admins_table', 1),
(5, '2020_11_18_041627_create_categories_table', 1),
(6, '2020_11_18_041747_create_blogs_table', 1),
(7, '2020_11_20_040327_create_sliders_table', 2),
(8, '2020_11_20_052802_create_general_settings_table', 3),
(11, '2020_11_20_161634_create_page_about_items_table', 4),
(12, '2020_11_21_020753_create_page_service_items_table', 4),
(13, '2020_11_21_045826_create_page_shop_items_table', 5),
(14, '2020_11_21_052123_create_page_blog_items_table', 5),
(15, '2020_11_21_052218_create_page_project_items_table', 5),
(16, '2020_11_21_052236_create_page_photo_gallery_items_table', 5),
(17, '2020_11_21_052252_create_page_video_gallery_items_table', 5),
(18, '2020_11_21_052416_create_page_faq_items_table', 5),
(19, '2020_11_21_052431_create_page_team_items_table', 5),
(20, '2020_11_21_052449_create_page_contact_items_table', 5),
(21, '2020_11_21_052506_create_page_career_items_table', 5),
(22, '2020_11_21_052522_create_page_term_items_table', 5),
(23, '2020_11_21_052537_create_page_privacy_items_table', 5),
(24, '2020_11_21_121719_create_page_home_items_table', 6),
(25, '2020_11_22_034318_create_page_other_items_table', 7),
(27, '2020_11_22_051017_create_dynamic_pages_table', 8),
(28, '2020_11_22_155040_create_projects_table', 9),
(29, '2020_11_22_155955_create_project_photos_table', 10),
(30, '2020_11_23_020609_create_photos_table', 11),
(31, '2020_11_23_023020_create_videos_table', 12),
(32, '2020_11_23_033108_create_why_choose_items_table', 13),
(34, '2020_11_23_052309_create_services_table', 14),
(35, '2020_11_23_065919_create_testimonials_table', 15),
(36, '2020_11_23_145620_create_team_members_table', 16),
(37, '2020_11_23_170012_create_faqs_table', 17),
(38, '2020_11_24_155819_create_email_templates_table', 18),
(39, '2020_11_25_003858_create_social_media_items_table', 19),
(40, '2020_11_25_014512_create_subscribers_table', 20),
(41, '2020_11_28_085244_create_comments_table', 21),
(42, '2020_11_29_130743_create_jobs_table', 22),
(43, '2020_11_29_131227_create_job_applications_table', 23),
(44, '2020_11_30_012218_create_coupons_table', 24),
(45, '2020_11_30_022238_create_shippings_table', 25),
(46, '2020_11_30_033142_create_products_table', 26),
(48, '2020_12_03_124013_create_customers_table', 27),
(49, '2020_12_06_054145_create_orders_table', 28),
(50, '2020_12_06_055114_create_order_details_table', 29),
(51, '2020_12_11_042247_create_footer_columns_table', 30),
(54, '2020_12_12_070218_create_menus_table', 32),
(56, '2021_02_19_023102_create_roles_table', 33),
(57, '2021_02_19_024253_create_role_permissions_table', 34),
(58, '2021_02_19_024527_create_role_pages_table', 34);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_phone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_country` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_state` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_city` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_zip` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_phone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_country` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_state` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_city` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_zip` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txnid` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_cost` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_discount` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fee_amount` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `net_amount` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_last4` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_exp_month` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_exp_year` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_no` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `customer_name`, `customer_email`, `customer_type`, `billing_name`, `billing_email`, `billing_phone`, `billing_country`, `billing_address`, `billing_state`, `billing_city`, `billing_zip`, `shipping_name`, `shipping_email`, `shipping_phone`, `shipping_country`, `shipping_address`, `shipping_state`, `shipping_city`, `shipping_zip`, `order_note`, `txnid`, `shipping_cost`, `coupon_code`, `coupon_discount`, `paid_amount`, `fee_amount`, `net_amount`, `card_last4`, `card_exp_month`, `card_exp_year`, `payment_method`, `payment_status`, `order_no`, `created_at`, `updated_at`) VALUES
(1, 1, 'Patrick Henderson', 'demosly99@gmail.com', 'Returning Customer', 'Patrick Henderson', 'demosly99@gmail.com', '111-222-3333', 'Bangladesh', 'Aronghata', 'N/A', 'Khulna', '9100', 'Patrick Henderson', 'demosly99@gmail.com', '111-222-3333', 'Bangladesh', 'Aronghata', 'N/A', 'Khulna', '9100', NULL, 'txn_1HwIv6BoKopKik6A9XlVaFtu', '10', 'STRONG', '15', '54', '1.87', '52.13', '4242', '10', '2023', 'Stripe', 'Completed', '5fd03ddfe6a6e', '2020-12-08 21:00:47', NULL),
(10, 0, 'Baxter Kline', 'pyvuwycy@mailinator.com', 'Guest', 'Baxter Kline', 'pyvuwycy@mailinator.com', '+1 (921) 321-2363', 'In officiis illo dic', 'Est soluta voluptate', 'Necessitatibus et ab', 'Labore maxime asperi', '41157', 'Baxter Kline', 'pyvuwycy@mailinator.com', '+1 (921) 321-2363', 'In officiis illo dic', 'Est soluta voluptate', 'Necessitatibus et ab', 'Labore maxime asperi', '41157', 'Iure adipisci soluta', 'txn_3N58v7G4c1NcZfIr0yvLSLVL', '0', '', '0', '16', '0.76', '15.24', '4242', '12', '2027', 'Stripe', 'Completed', '6457bac4ebcee', '2023-05-07 09:50:44', NULL),
(11, 0, 'Jakeem Noble', 'voluwywyq@mailinator.com', 'Guest', 'Jakeem Noble', 'voluwywyq@mailinator.com', '+1 (973) 336-7649', 'Maiores similique et', 'Aut quis error dicta', 'Quam illo blanditiis', 'Eius est et magna mo', '93124', 'Allistair Sharpe', 'hyhajy@mailinator.com', '+1 (797) 607-5734', 'Sequi eu voluptatem', 'Cupidatat obcaecati', 'Ullamco non qui inci', 'Consequat Consectet', '54785', 'Reiciendis quod id', 'txn_3N58x6G4c1NcZfIr01aFt7rK', '0', '', '0', '16', '0.76', '15.24', '4242', '12', '2027', 'Stripe', 'Completed', '6457bb3de66b0', '2023-05-07 09:52:45', NULL),
(12, 0, 'Jakeem Noble', 'voluwywyq@mailinator.com', 'Guest', 'Jakeem Noble', 'voluwywyq@mailinator.com', '+1 (973) 336-7649', 'Maiores similique et', 'Aut quis error dicta', 'Quam illo blanditiis', 'Eius est et magna mo', '93124', 'Allistair Sharpe', 'hyhajy@mailinator.com', '+1 (797) 607-5734', 'Sequi eu voluptatem', 'Cupidatat obcaecati', 'Ullamco non qui inci', 'Consequat Consectet', '54785', 'Reiciendis quod id', 'txn_3N58zgG4c1NcZfIr1kU9Vfaf', '0', '', '0', '16', '0.76', '15.24', '4242', '12', '2027', 'Stripe', 'Completed', '6457bbde48e00', '2023-05-07 09:55:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_qty` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_no` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `product_name`, `product_price`, `product_qty`, `payment_status`, `order_no`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'Product Item Name 3', '5', '3', 'Completed', '5fd03ddfe6a6e', '2020-12-08 21:00:48', NULL),
(2, 1, 5, 'Product Item Name 4', '22', '2', 'Completed', '5fd03ddfe6a6e', '2020-12-08 21:00:48', NULL),
(14, 10, 3, 'Hair Gel', '16', '1', 'Completed', '6457bac4ebcee', '2023-05-07 09:50:44', NULL),
(15, 11, 3, 'Hair Gel', '16', '1', 'Completed', '6457bb3de66b0', '2023-05-07 09:52:45', NULL),
(16, 12, 3, 'Hair Gel', '16', '1', 'Completed', '6457bbde48e00', '2023-05-07 09:55:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_shippings`
--

CREATE TABLE `order_shippings` (
  `id` int(11) NOT NULL,
  `code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipper` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `pdf` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_shippings`
--

INSERT INTO `order_shippings` (`id`, `code`, `shipper`, `carrier`, `order_date`, `shipping_date`, `delivery_date`, `pdf`, `created_at`, `updated_at`) VALUES
(4, '18-Jun-2001', '27-Oct-2015', '15-Sep-1998', '2009-02-20', '2004-08-12', '2018-03-07', '1668980230.pdf', '2022-11-21 05:37:10', '2023-04-10 21:39:16'),
(5, '19-Jan-2017', '03-Apr-1996', '29-Mar-2002', '2003-03-16', '1979-02-14', '1979-05-16', NULL, '2022-11-21 05:37:35', '2023-04-10 21:39:16'),
(6, '7878787888', 'dfgfgfg', 'imc', '2022-11-22', '2022-11-23', '2022-11-23', NULL, '2022-11-21 16:50:22', '2023-04-10 21:39:16');

-- --------------------------------------------------------

--
-- Table structure for table `page_about_items`
--

CREATE TABLE `page_about_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_about_items`
--

INSERT INTO `page_about_items` (`id`, `name`, `detail`, `status`, `seo_title`, `seo_meta_description`, `created_at`, `updated_at`) VALUES
(1, 'About Us', '<p><!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:EnableOpenTypeKerning/>\r\n   <w:DontFlipMirrorIndents/>\r\n   <w:OverrideTableStyleHps/>\r\n  </w:Compatibility>\r\n  <w:DoNotOptimizeForBrowser/>\r\n  <m:mathPr>\r\n   <m:mathFont m:val=\"Cambria Math\"/>\r\n   <m:brkBin m:val=\"before\"/>\r\n   <m:brkBinSub m:val=\"&#45;-\"/>\r\n   <m:smallFrac m:val=\"off\"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val=\"0\"/>\r\n   <m:rMargin m:val=\"0\"/>\r\n   <m:defJc m:val=\"centerGroup\"/>\r\n   <m:wrapIndent m:val=\"1440\"/>\r\n   <m:intLim m:val=\"subSup\"/>\r\n   <m:naryLim m:val=\"undOvr\"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState=\"false\" DefUnhideWhenUsed=\"false\"\r\n  DefSemiHidden=\"false\" DefQFormat=\"false\" DefPriority=\"99\"\r\n  LatentStyleCount=\"376\">\r\n  <w:LsdException Locked=\"false\" Priority=\"0\" QFormat=\"true\" Name=\"Normal\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 9\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 9\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 9\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footnote text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"header\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footer\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index heading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"35\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"caption\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"table of figures\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"envelope address\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"envelope return\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footnote reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"line number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"page number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"endnote reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"endnote text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"table of authorities\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"macro\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"toa heading\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"10\" QFormat=\"true\" Name=\"Title\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Closing\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Signature\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"Default Paragraph Font\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"Body Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Message Header\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"11\" QFormat=\"true\" Name=\"Subtitle\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Salutation\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Date\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text First Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text First Indent 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Note Heading\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Block Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Hyperlink\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"FollowedHyperlink\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"22\" QFormat=\"true\" Name=\"Strong\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"20\" QFormat=\"true\" Name=\"Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Document Map\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Plain Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"E-mail Signature\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Top of Form\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Bottom of Form\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal (Web)\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Acronym\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Address\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Cite\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Code\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Definition\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Keyboard\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Preformatted\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Sample\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Typewriter\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Variable\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal Table\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation subject\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"No List\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Contemporary\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Elegant\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Professional\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Subtle 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Subtle 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Balloon Text\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"Table Grid\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Theme\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Placeholder Text\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" QFormat=\"true\" Name=\"No Spacing\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Revision\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"34\" QFormat=\"true\"\r\n   Name=\"List Paragraph\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"29\" QFormat=\"true\" Name=\"Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"30\" QFormat=\"true\"\r\n   Name=\"Intense Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"19\" QFormat=\"true\"\r\n   Name=\"Subtle Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"21\" QFormat=\"true\"\r\n   Name=\"Intense Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"31\" QFormat=\"true\"\r\n   Name=\"Subtle Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"32\" QFormat=\"true\"\r\n   Name=\"Intense Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"33\" QFormat=\"true\" Name=\"Book Title\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"37\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"Bibliography\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"TOC Heading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"41\" Name=\"Plain Table 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"42\" Name=\"Plain Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"43\" Name=\"Plain Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"44\" Name=\"Plain Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"45\" Name=\"Plain Table 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"40\" Name=\"Grid Table Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"Grid Table 1 Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"Grid Table 6 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"Grid Table 7 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"List Table 1 Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"List Table 6 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"List Table 7 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Mention\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Smart Hyperlink\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Hashtag\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Unresolved Mention\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Smart Link\"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:\"Table Normal\";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-parent:\"\";\r\n	mso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n	mso-para-margin:0in;\r\n	mso-pagination:none;\r\n	text-autospace:none;\r\n	font-size:11.0pt;\r\n	font-family:\"Calibri\",sans-serif;\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;\r\n	mso-bidi-font-family:\"Times New Roman\";\r\n	mso-bidi-theme-font:minor-bidi;}\r\n</style>\r\n<![endif]--></p><p><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:\"Table Normal\";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-parent:\"\";\r\n	mso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n	mso-para-margin:0in;\r\n	mso-pagination:none;\r\n	text-autospace:none;\r\n	font-size:11.0pt;\r\n	font-family:\"Calibri\",sans-serif;\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;\r\n	mso-bidi-font-family:\"Times New Roman\";\r\n	mso-bidi-theme-font:minor-bidi;}\r\n</style>\r\n<![endif]--></p><p><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:\"Table Normal\";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-parent:\"\";\r\n	mso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n	mso-para-margin:0in;\r\n	mso-pagination:none;\r\n	text-autospace:none;\r\n	font-size:11.0pt;\r\n	font-family:\"Calibri\",sans-serif;\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;\r\n	mso-bidi-font-family:\"Times New Roman\";\r\n	mso-bidi-theme-font:minor-bidi;}\r\n</style>\r\n<![endif]--></p><p><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:\"Table Normal\";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-parent:\"\";\r\n	mso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n	mso-para-margin:0in;\r\n	mso-pagination:none;\r\n	text-autospace:none;\r\n	font-size:11.0pt;\r\n	font-family:\"Calibri\",sans-serif;\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;\r\n	mso-bidi-font-family:\"Times New Roman\";\r\n	mso-bidi-theme-font:minor-bidi;}\r\n</style>\r\n<![endif]--></p><p><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:\"Table Normal\";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-parent:\"\";\r\n	mso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n	mso-para-margin:0in;\r\n	mso-pagination:none;\r\n	text-autospace:none;\r\n	font-size:11.0pt;\r\n	font-family:\"Calibri\",sans-serif;\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;\r\n	mso-bidi-font-family:\"Times New Roman\";\r\n	mso-bidi-theme-font:minor-bidi;}\r\n</style>\r\n<![endif]--></p><p><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:\"Table Normal\";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-parent:\"\";\r\n	mso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n	mso-para-margin:0in;\r\n	mso-pagination:none;\r\n	text-autospace:none;\r\n	font-size:11.0pt;\r\n	font-family:\"Calibri\",sans-serif;\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;\r\n	mso-bidi-font-family:\"Times New Roman\";\r\n	mso-bidi-theme-font:minor-bidi;}\r\n</style>\r\n<![endif]--><span style=\"mso-font-width:115%\"><b><font color=\"#000000\">ABOUT US</font></b></span></p><p class=\"MsoNormal\"><font color=\"#731842\">I\' am the Original RICKY RICARDO this is my nickname, my real name is Luis German. At the young age of 10 I started cleaning barber shops with my sister MARY my partner. We served coffee to customers in the barber shop in Mexico City. We worked for DON ANTONIO, one of the Master Barbers and highly regarded as one of the BEST in the city. His gift to cut hair got me excited and I started cutting hair at the age of 13. Now, at my 40\'s , I thank God, my family, friends &amp; my clients for the support. We have become one of the BEST Barber Shop in the west side of the San Fernando Valley. Since 1980, I have become an expert at Razor over Comb and mastered my craft . Thank you for visiting our site and for being a loyal customer even if your new.</font><br></p><p></p>', 'Show', 'About Us', 'About Us Meta Description', NULL, '2023-04-03 02:21:56');

-- --------------------------------------------------------

--
-- Table structure for table `page_blog_items`
--

CREATE TABLE `page_blog_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_blog_items`
--

INSERT INTO `page_blog_items` (`id`, `name`, `detail`, `status`, `seo_title`, `seo_meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Blog', NULL, 'Show', 'Blog', 'Blog', NULL, '2022-11-21 17:30:01');

-- --------------------------------------------------------

--
-- Table structure for table `page_career_items`
--

CREATE TABLE `page_career_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_career_items`
--

INSERT INTO `page_career_items` (`id`, `name`, `detail`, `status`, `seo_title`, `seo_meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Career', NULL, 'Show', 'Career', 'Career', NULL, '2020-11-21 05:18:51');

-- --------------------------------------------------------

--
-- Table structure for table `page_contact_items`
--

CREATE TABLE `page_contact_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_contact_items`
--

INSERT INTO `page_contact_items` (`id`, `name`, `detail`, `status`, `contact_address`, `contact_email`, `contact_phone`, `seo_title`, `seo_meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Contact Us', '<p><br></p>', 'Show', '7046 Owensmouth Av.\r\nCanoga Park CA 91303', 'info@aabsolutebarbersvipnsalons.site', 'Office (818) 348-1234\r\nOwner (818) 916-7725', 'Contact Us', 'Contact Us', NULL, '2023-04-03 02:08:52');

-- --------------------------------------------------------

--
-- Table structure for table `page_faq_items`
--

CREATE TABLE `page_faq_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_faq_items`
--

INSERT INTO `page_faq_items` (`id`, `name`, `detail`, `status`, `seo_title`, `seo_meta_description`, `created_at`, `updated_at`) VALUES
(1, 'FAQ', NULL, 'Show', 'FAQ', 'FAQ', NULL, '2020-11-21 05:17:22');

-- --------------------------------------------------------

--
-- Table structure for table `page_home_items`
--

CREATE TABLE `page_home_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `why_choose_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `why_choose_subtitle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `why_choose_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `special_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `special_subtitle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `special_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `special_btn_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `special_btn_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `special_yt_video` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `special_bg` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `special_video_bg` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `special_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_subtitle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonial_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonial_subtitle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonial_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonial_bg` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_subtitle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_member_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_member_subtitle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_member_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `appointment_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `appointment_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `appointment_btn_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `appointment_btn_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `appointment_bg` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `appointment_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `latest_blog_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `latest_blog_subtitle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `latest_blog_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `newsletter_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `newsletter_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `newsletter_bg` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `newsletter_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_home_items`
--

INSERT INTO `page_home_items` (`id`, `seo_title`, `seo_meta_description`, `why_choose_title`, `why_choose_subtitle`, `why_choose_status`, `special_title`, `special_subtitle`, `special_content`, `special_btn_text`, `special_btn_url`, `special_yt_video`, `special_bg`, `special_video_bg`, `special_status`, `service_title`, `service_subtitle`, `service_status`, `testimonial_title`, `testimonial_subtitle`, `testimonial_status`, `testimonial_bg`, `project_title`, `project_subtitle`, `project_status`, `team_member_title`, `team_member_subtitle`, `team_member_status`, `appointment_title`, `appointment_text`, `appointment_btn_text`, `appointment_btn_url`, `appointment_bg`, `appointment_status`, `latest_blog_title`, `latest_blog_subtitle`, `latest_blog_status`, `newsletter_title`, `newsletter_text`, `newsletter_bg`, `newsletter_status`, `created_at`, `updated_at`) VALUES
(1, 'ABSOLUTE BARBERS VIP & SALON', 'We take care of your extensions and we also teach you how to do it at home with our line of specific products.', 'Why Choose Us', 'You should choose our services for the following reasons', 'Show', 'Welcome to our website', 'How we run our business', 'I\' am the Original RICKY RICARDO this is my nickname, my real name is Luis German. At the young age of 10 I started cleaning barber shops with my sister MARY my partner. We served coffee to customers in the barber shop in Mexico City. We worked for DON ANTONIO, one of the Master Barbers and highly regarded as one of the BEST in the city. His gift to cut hair got me excited and I started cutting hair at the age of 13. Now, at my 40\'s , I thank God, my family, friends & my clients for the support. We have become one of the BEST Barber Shop in the west side of the San Fernando Valley. Since 1980, I have become an expert at Razor over Comb and mastered my craft . Thank you for visiting our site and for being a loyal customer even if your new.', 'Make an Appointment', '#', 'NMwc2e9-QNs', '1680625433.jpg', '1680625412.png', 'Show', 'Our Services', 'Transform your hair instantly! Have the long hair you always dreamed of, or add fullness to your natural hair. Our 100% human hair extensions can be bonded or taped to your own hair and last 3-5 months.', 'Show', 'Testimonial', 'What our clients tell about us', 'Hide', '1670875480.jpg', 'Our Projects', 'See all our completed successful projects here', 'Hide', 'Team Members', 'See all our expert team members who are ready to help you always', 'Show', 'Want to hire us for your business?', 'If you want to take our service to build your business, our expert team members are always here to help you to make you successful.', 'Contact Us', 'https://sunbeyondbeauty.site/contact', '1670879963.png', 'Hide', 'Latest Blog', 'See all the latest blog about our activity from here', 'Hide', 'Our Newsletter', 'Subscrib for Our Newsletter', '1680486342.png', 'Show', NULL, '2023-04-04 16:23:53');

-- --------------------------------------------------------

--
-- Table structure for table `page_other_items`
--

CREATE TABLE `page_other_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_other_items`
--

INSERT INTO `page_other_items` (`id`, `seo_title`, `seo_meta_description`, `page_name`, `created_at`, `updated_at`) VALUES
(1, 'Search', 'Search Page Description', 'Search Page', NULL, '2020-11-21 22:03:51'),
(2, 'Cart', 'Cart Page Description', 'Cart Page', NULL, '2020-11-21 22:03:55'),
(3, 'Checkout', 'Checkout Page Description', 'Checkout Page', NULL, '2020-11-21 22:04:00'),
(4, 'Login', 'Login Page Description', 'Login Page', NULL, '2020-12-22 20:19:05'),
(5, 'Registration', 'Registration Page Description', 'Registration Page', NULL, '2020-11-21 22:04:09'),
(6, 'Forget Password', 'Forget Password Page Description', 'Forget Password Page', NULL, '2020-12-22 20:19:07'),
(7, 'Customer Panel', 'Customer Page Description', 'Customer Panel Pages', NULL, '2020-11-21 22:04:19'),
(8, 'Payment', 'Payment Page Description', 'Payment Page', NULL, '2020-12-22 20:19:11');

-- --------------------------------------------------------

--
-- Table structure for table `page_photo_gallery_items`
--

CREATE TABLE `page_photo_gallery_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_photo_gallery_items`
--

INSERT INTO `page_photo_gallery_items` (`id`, `name`, `detail`, `status`, `seo_title`, `seo_meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Photo Gallery', NULL, 'Show', 'Photo Gallery', 'Photo Gallery', NULL, '2020-12-12 10:52:23');

-- --------------------------------------------------------

--
-- Table structure for table `page_privacy_items`
--

CREATE TABLE `page_privacy_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_privacy_items`
--

INSERT INTO `page_privacy_items` (`id`, `name`, `detail`, `status`, `seo_title`, `seo_meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Privacy Policy', '<p>Lorem ipsum dolor sit amet, id saperet suavitate signiferumque sea. Eu tantas invenire signiferumque per, at affert eloquentiam eos, duo no sale utroque. His ad homero verterem, ut paulo neglegentur contentiones per. Ex cum unum vocent commodo. Ut ridens principes rationibus ius, ex mea saepe docendi, cu eum unum assum accumsan.</p><p>Ne quo possim consectetuer, splendide voluptatibus ut mea. Summo mucius regione qui et, sea soleat everti indoctum no. Brute postea ut vel, oblique propriae pertinacia et sed. No nominati adipiscing nam, accusata interpretaris no est, no tota conceptam nam. Id posidonium dissentiunt mea, an nibh menandri eum. Meis nominati cum cu.</p><p>Eum ad delicatissimi signiferumque, mea causae delenit perfecto et. Sit primis nostrum id, an postea numquam per, id quo diceret deleniti consectetuer. Eum eu salutatus mediocritatem. Blandit ocurreret dissentiet ne quo, ex mazim numquam delenit his.</p><p>Ea mel elit placerat. Ius nobis delicata gloriatur at. Nam fabulas salutandi at, in per officiis omittantur contentiones, omnes insolens suscipiantur sed cu. Ei modus persequeris vix. Persius legimus has an, mea dicit maiestatis adipiscing eu.</p>', 'Show', 'Privacy Policy', 'Privacy Policy', NULL, '2020-11-21 05:18:05');

-- --------------------------------------------------------

--
-- Table structure for table `page_project_items`
--

CREATE TABLE `page_project_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_project_items`
--

INSERT INTO `page_project_items` (`id`, `name`, `detail`, `status`, `seo_title`, `seo_meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Projects', NULL, 'Show', 'Projects', 'Project Page Meta Description', NULL, '2020-11-21 05:17:13');

-- --------------------------------------------------------

--
-- Table structure for table `page_service_items`
--

CREATE TABLE `page_service_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_service_items`
--

INSERT INTO `page_service_items` (`id`, `name`, `detail`, `status`, `seo_title`, `seo_meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Services', NULL, 'Show', 'Services', 'Services Meta Description', NULL, '2020-11-20 21:17:17');

-- --------------------------------------------------------

--
-- Table structure for table `page_shop_items`
--

CREATE TABLE `page_shop_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_shop_items`
--

INSERT INTO `page_shop_items` (`id`, `name`, `detail`, `status`, `seo_title`, `seo_meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Shop', NULL, 'Show', 'Shop', 'Shop Page Meta Description', NULL, '2022-11-16 04:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `page_team_items`
--

CREATE TABLE `page_team_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_team_items`
--

INSERT INTO `page_team_items` (`id`, `name`, `detail`, `status`, `seo_title`, `seo_meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Team Member', NULL, 'Hide', 'Team Member', 'Team Member', NULL, '2022-11-21 15:38:12');

-- --------------------------------------------------------

--
-- Table structure for table `page_term_items`
--

CREATE TABLE `page_term_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_term_items`
--

INSERT INTO `page_term_items` (`id`, `name`, `detail`, `status`, `seo_title`, `seo_meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Terms and Conditions', '<p>Lorem ipsum dolor sit amet, id saperet suavitate signiferumque sea. Eu tantas invenire signiferumque per, at affert eloquentiam eos, duo no sale utroque. His ad homero verterem, ut paulo neglegentur contentiones per. Ex cum unum vocent commodo. Ut ridens principes rationibus ius, ex mea saepe docendi, cu eum unum assum accumsan.</p><p>Ne quo possim consectetuer, splendide voluptatibus ut mea. Summo mucius regione qui et, sea soleat everti indoctum no. Brute postea ut vel, oblique propriae pertinacia et sed. No nominati adipiscing nam, accusata interpretaris no est, no tota conceptam nam. Id posidonium dissentiunt mea, an nibh menandri eum. Meis nominati cum cu.</p><p>Eum ad delicatissimi signiferumque, mea causae delenit perfecto et. Sit primis nostrum id, an postea numquam per, id quo diceret deleniti consectetuer. Eum eu salutatus mediocritatem. Blandit ocurreret dissentiet ne quo, ex mazim numquam delenit his.</p><p>Ea mel elit placerat. Ius nobis delicata gloriatur at. Nam fabulas salutandi at, in per officiis omittantur contentiones, omnes insolens suscipiantur sed cu. Ei modus persequeris vix. Persius legimus has an, mea dicit maiestatis adipiscing eu.</p>', 'Show', 'Terms and Conditions', 'Terms and Conditions', NULL, '2020-11-21 05:18:22');

-- --------------------------------------------------------

--
-- Table structure for table `page_video_gallery_items`
--

CREATE TABLE `page_video_gallery_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_video_gallery_items`
--

INSERT INTO `page_video_gallery_items` (`id`, `name`, `detail`, `status`, `seo_title`, `seo_meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Video Gallery', NULL, 'Show', 'Video Gallery', 'Video Gallery', NULL, '2020-12-12 10:52:31');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('arefin2k@gmail.com', '$2y$10$n.b82lZQRLiL4WIgRsgpeu8UpfQMmx9M1FdiQQ18rjK38i9yGD6kG', '2020-11-23 19:46:00');

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_caption` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_order` smallint(6) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `photo_name`, `photo_caption`, `photo_order`, `created_at`, `updated_at`) VALUES
(3, '1680561807.jpg', 'Item 1', 1, '2020-11-22 20:27:59', '2023-04-03 22:43:27'),
(4, '1680561835.jpg', 'Item 2', 2, '2020-11-22 20:28:26', '2023-04-03 22:43:55'),
(5, '1680561860.jpg', 'Item 3', 3, '2020-11-22 20:28:34', '2023-04-03 22:44:20'),
(6, '1680562183.jpg', 'Item 4', 4, '2020-11-22 20:28:42', '2023-04-03 22:49:43'),
(7, '1680562201.jpg', 'Item 5', 5, '2020-11-22 20:28:59', '2023-04-03 22:50:01'),
(8, '1680562215.jpg', 'Item 6', 6, '2020-11-22 20:29:07', '2023-04-03 22:50:15'),
(11, '1680561823.jpg', NULL, 0, '2023-03-20 17:53:43', '2023-04-03 22:43:43'),
(12, '1680561792.jpg', NULL, 1, '2023-04-03 22:43:12', '2023-04-03 22:43:12'),
(13, '1680562227.jpg', NULL, 0, '2023-04-03 22:50:27', '2023-04-03 22:50:27'),
(14, '1680562242.jpg', NULL, 0, '2023-04-03 22:50:42', '2023-04-03 22:50:42'),
(15, '1680562282.jpg', NULL, 0, '2023-04-03 22:51:22', '2023-04-03 22:51:22'),
(16, '1680562297.jpg', NULL, 0, '2023-04-03 22:51:37', '2023-04-03 22:51:37'),
(17, '1680562356.jpg', NULL, 0, '2023-04-03 22:52:36', '2023-04-03 22:52:36');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_slug` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_old_price` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_current_price` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_stock` smallint(6) NOT NULL,
  `product_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_content_short` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_return_policy` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_featured_photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_order` smallint(6) NOT NULL DEFAULT 0,
  `product_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_slug`, `product_old_price`, `product_current_price`, `product_stock`, `product_content`, `product_content_short`, `product_return_policy`, `product_featured_photo`, `product_order`, `product_status`, `seo_title`, `seo_meta_description`, `created_at`, `updated_at`, `product_category_id`) VALUES
(1, 'Hair Cream', 'product-item-name-1', '20', '14', 7, '<p>Lorem ipsum dolor sit amet, erat dicat percipitur vix in, habeo expetendis nam et, his homero verterem molestiae ea. Tantas legere blandit duo ei, ei malis maluisset voluptatum mei. Ne mel alia consul equidem, at mea timeam indoctum explicari. Ut detracto gubergren dissentiet sea, harum dolores deserunt ut sed. Mel ne animal invidunt petentium, te mei exerci voluptaria. Quo id populo fabulas voluptatum, ius ei legere deterruisset, et nec ridens liberavisse. Nusquam partiendo scribentur quo an.</p><p>Et duo inermis tacimates, sed id posse intellegebat, ut sed agam aperiri. Nam ex dolorem vivendum, te omnis eleifend est, atqui tempor fabellas ne qui. Cotidieque reprehendunt eam no. Sed at alii sanctus, ius dictas mediocritatem in. Qui stet principes ut, ad pro dicat oporteat. Doctus senserit sea ut, eum an iisque neglegentur. Fugit putant consequuntur id sit.</p><p>In vidisse referrentur consectetuer duo. Dolor vocibus consulatu an pro, ei sed graece tritani perpetua. Mel et dolorem percipit, per nemore commune gloriatur no. Ex sed minim utamur intellegebat.&nbsp;</p>', 'Lorem ipsum dolor sit amet, erat dicat percipitur vix in, habeo expetendis nam et, his homero verterem molestiae ea.', '<p>Eu eos malis dicat facilisis, aliquip alterum assentior at vix. Inimicus interpretaris ei vim, graece singulis atomorum ad per, ea sed admodum apeirian indoctum. Cu pro tantas reprehendunt. Usu menandri pertinacia et, vis ne scaevola dissentias. In ornatus eligendi persequeris his, ea usu causae labitur. At porro delectus sed. Quot minim ei has, has id dolore maiorum interesset.</p><p>Justo incorrupte ea quo, adhuc eligendi reprimique pro et. Eos nobis aeterno conclusionemque ei, no eam dolor delectus. Error altera argumentum quo ea, eam ne antiopam assentior. Ea mea ullum dicant timeam, sea affert reformidans ad. Ei dicam appetere sea, id phaedrum moderatius sed.</p><p>Ad mel velit quidam honestatis. Has no mediocrem repudiandae, mel in ceteros perfecto gubergren, has ne dignissim consequat theophrastus. Duo et assum harum iriure, solum ubique philosophia per an, mea clita nominati reprehendunt ei. Zril melius dignissim qui ad. Debitis fierent quo in, no usu affert aeterno.</p>', '1680622439.jpg', 1, 'Show', 'Product Item Name', 'Product Item Name', '2020-11-30 03:40:11', '2023-04-04 15:34:35', 1),
(3, 'Hair Gel', 'product-item-name-2', '25', '16', 21, '<p>Lorem ipsum dolor sit amet, erat dicat percipitur vix in, habeo expetendis nam et, his homero verterem molestiae ea. Tantas legere blandit duo ei, ei malis maluisset voluptatum mei. Ne mel alia consul equidem, at mea timeam indoctum explicari. Ut detracto gubergren dissentiet sea, harum dolores deserunt ut sed. Mel ne animal invidunt petentium, te mei exerci voluptaria. Quo id populo fabulas voluptatum, ius ei legere deterruisset, et nec ridens liberavisse. Nusquam partiendo scribentur quo an.</p><p>Et duo inermis tacimates, sed id posse intellegebat, ut sed agam aperiri. Nam ex dolorem vivendum, te omnis eleifend est, atqui tempor fabellas ne qui. Cotidieque reprehendunt eam no. Sed at alii sanctus, ius dictas mediocritatem in. Qui stet principes ut, ad pro dicat oporteat. Doctus senserit sea ut, eum an iisque neglegentur. Fugit putant consequuntur id sit.</p><p>In vidisse referrentur consectetuer duo. Dolor vocibus consulatu an pro, ei sed graece tritani perpetua. Mel et dolorem percipit, per nemore commune gloriatur no. Ex sed minim utamur intellegebat.</p>', 'Lorem ipsum dolor sit amet, erat dicat percipitur vix in, habeo expetendis nam et, his homero verterem molestiae ea.', '<p>Eu eos malis dicat facilisis, aliquip alterum assentior at vix. Inimicus interpretaris ei vim, graece singulis atomorum ad per, ea sed admodum apeirian indoctum. Cu pro tantas reprehendunt. Usu menandri pertinacia et, vis ne scaevola dissentias. In ornatus eligendi persequeris his, ea usu causae labitur. At porro delectus sed. Quot minim ei has, has id dolore maiorum interesset.</p><p>Justo incorrupte ea quo, adhuc eligendi reprimique pro et. Eos nobis aeterno conclusionemque ei, no eam dolor delectus. Error altera argumentum quo ea, eam ne antiopam assentior. Ea mea ullum dicant timeam, sea affert reformidans ad. Ei dicam appetere sea, id phaedrum moderatius sed.</p><p>Ad mel velit quidam honestatis. Has no mediocrem repudiandae, mel in ceteros perfecto gubergren, has ne dignissim consequat theophrastus. Duo et assum harum iriure, solum ubique philosophia per an, mea clita nominati reprehendunt ei. Zril melius dignissim qui ad. Debitis fierent quo in, no usu affert aeterno.</p>', '1680622648.jpg', 2, 'Show', 'Product Item Name', 'Product Item Name', '2020-11-30 09:36:05', '2023-04-04 15:37:59', 1),
(4, 'slik Therapy', 'product-item-name-3', '17', '14', 8, '<p>Lorem ipsum dolor sit amet, erat dicat percipitur vix in, habeo expetendis nam et, his homero verterem molestiae ea. Tantas legere blandit duo ei, ei malis maluisset voluptatum mei. Ne mel alia consul equidem, at mea timeam indoctum explicari. Ut detracto gubergren dissentiet sea, harum dolores deserunt ut sed. Mel ne animal invidunt petentium, te mei exerci voluptaria. Quo id populo fabulas voluptatum, ius ei legere deterruisset, et nec ridens liberavisse. Nusquam partiendo scribentur quo an.</p><p>Et duo inermis tacimates, sed id posse intellegebat, ut sed agam aperiri. Nam ex dolorem vivendum, te omnis eleifend est, atqui tempor fabellas ne qui. Cotidieque reprehendunt eam no. Sed at alii sanctus, ius dictas mediocritatem in. Qui stet principes ut, ad pro dicat oporteat. Doctus senserit sea ut, eum an iisque neglegentur. Fugit putant consequuntur id sit.</p><p>In vidisse referrentur consectetuer duo. Dolor vocibus consulatu an pro, ei sed graece tritani perpetua. Mel et dolorem percipit, per nemore commune gloriatur no. Ex sed minim utamur intellegebat.</p>', 'Lorem ipsum dolor sit amet, erat dicat percipitur vix in, habeo expetendis nam et, his homero verterem molestiae ea.', '<p>Eu eos malis dicat facilisis, aliquip alterum assentior at vix. Inimicus interpretaris ei vim, graece singulis atomorum ad per, ea sed admodum apeirian indoctum. Cu pro tantas reprehendunt. Usu menandri pertinacia et, vis ne scaevola dissentias. In ornatus eligendi persequeris his, ea usu causae labitur. At porro delectus sed. Quot minim ei has, has id dolore maiorum interesset.</p><p>Justo incorrupte ea quo, adhuc eligendi reprimique pro et. Eos nobis aeterno conclusionemque ei, no eam dolor delectus. Error altera argumentum quo ea, eam ne antiopam assentior. Ea mea ullum dicant timeam, sea affert reformidans ad. Ei dicam appetere sea, id phaedrum moderatius sed.</p><p>Ad mel velit quidam honestatis. Has no mediocrem repudiandae, mel in ceteros perfecto gubergren, has ne dignissim consequat theophrastus. Duo et assum harum iriure, solum ubique philosophia per an, mea clita nominati reprehendunt ei. Zril melius dignissim qui ad. Debitis fierent quo in, no usu affert aeterno.</p>', '1680623226.jpg', 3, 'Show', 'Product Item Name', 'Product Item Name', '2020-11-30 09:37:39', '2023-04-04 15:47:06', 1),
(5, 'Anti - Hair Loss Shampoo', 'product-item-name-4', '20', '16', 42, '<p>Lorem ipsum dolor sit amet, te constituto intellegam eloquentiam sed, putent accusamus temporibus his ut. Prima impetus virtute usu ex, et vim numquam efficiantur, cu vis option civibus. Ad tale quas corpora has, melius nostrud ius ad, sonet consectetuer signiferumque cu usu. Sed te adhuc atomorum, ad quo erant alterum reprimique. Virtute equidem deseruisse vim ei.</p><p>Eu vim atqui ludus petentium, suas idque est id. Ne veniam oblique propriae vim, dicant forensibus definitionem vix eu. Pri eu probatus abhorreant, nonumy aliquid perpetua ut usu. Etiam iudicabit vituperata ne est, id sed everti utroque, vis ea oblique pertinax concludaturque.</p><p>Te cum abhorreant temporibus, eam mazim platonem ea. Dolor abhorreant sea et, usu cu debet bonorum, aliquando instructior necessitatibus vix te. Ea ubique percipit recusabo cum, regione consulatu interpretaris vim no, mel altera fabulas probatus ad. Ignota tritani ad nam, eu per delectus perfecto conceptam.</p><p>An sanctus pertinax cotidieque sed, quo te habemus molestiae consetetur, at salutandi periculis expetendis vim. Quando nusquam eum ut, ius an quem alii. Sit ad ullum consequuntur. Ei sea iudico sententiae honestatis, mel dolorem pertinax senserit ei, cu causae timeam eripuit sit. Sed ex habeo blandit oporteat, ex usu autem iisque. Vel minim dicam soleat te, denique liberavisse ex usu, cibo omnes te eam. Pri esse nobis no, no quo volutpat vulputate.</p>', 'Lorem ipsum dolor sit amet, te constituto intellegam eloquentiam sed, putent accusamus temporibus his ut.', '<p>Eu eos malis dicat facilisis, aliquip alterum assentior at vix. Inimicus interpretaris ei vim, graece singulis atomorum ad per, ea sed admodum apeirian indoctum. Cu pro tantas reprehendunt. Usu menandri pertinacia et, vis ne scaevola dissentias. In ornatus eligendi persequeris his, ea usu causae labitur. At porro delectus sed. Quot minim ei has, has id dolore maiorum interesset.</p><p>Justo incorrupte ea quo, adhuc eligendi reprimique pro et. Eos nobis aeterno conclusionemque ei, no eam dolor delectus. Error altera argumentum quo ea, eam ne antiopam assentior. Ea mea ullum dicant timeam, sea affert reformidans ad. Ei dicam appetere sea, id phaedrum moderatius sed.</p><p>Ad mel velit quidam honestatis. Has no mediocrem repudiandae, mel in ceteros perfecto gubergren, has ne dignissim consequat theophrastus. Duo et assum harum iriure, solum ubique philosophia per an, mea clita nominati reprehendunt ei. Zril melius dignissim qui ad. Debitis fierent quo in, no usu affert aeterno.</p>', '1680623407.jpg', 4, 'Show', 'Product Item Name', 'Product Item Name', '2020-11-30 09:38:45', '2023-04-04 15:50:07', 2),
(6, 'Hair Treatment Set', 'product-item-name-5', '370', '299', 34, '<p>Lorem ipsum dolor sit amet, te constituto intellegam eloquentiam sed, putent accusamus temporibus his ut. Prima impetus virtute usu ex, et vim numquam efficiantur, cu vis option civibus. Ad tale quas corpora has, melius nostrud ius ad, sonet consectetuer signiferumque cu usu. Sed te adhuc atomorum, ad quo erant alterum reprimique. Virtute equidem deseruisse vim ei.</p><p>Eu vim atqui ludus petentium, suas idque est id. Ne veniam oblique propriae vim, dicant forensibus definitionem vix eu. Pri eu probatus abhorreant, nonumy aliquid perpetua ut usu. Etiam iudicabit vituperata ne est, id sed everti utroque, vis ea oblique pertinax concludaturque.</p><p>Te cum abhorreant temporibus, eam mazim platonem ea. Dolor abhorreant sea et, usu cu debet bonorum, aliquando instructior necessitatibus vix te. Ea ubique percipit recusabo cum, regione consulatu interpretaris vim no, mel altera fabulas probatus ad. Ignota tritani ad nam, eu per delectus perfecto conceptam.</p><p>An sanctus pertinax cotidieque sed, quo te habemus molestiae consetetur, at salutandi periculis expetendis vim. Quando nusquam eum ut, ius an quem alii. Sit ad ullum consequuntur. Ei sea iudico sententiae honestatis, mel dolorem pertinax senserit ei, cu causae timeam eripuit sit. Sed ex habeo blandit oporteat, ex usu autem iisque. Vel minim dicam soleat te, denique liberavisse ex usu, cibo omnes te eam. Pri esse nobis no, no quo volutpat vulputate.</p>', 'Lorem ipsum dolor sit amet, te constituto intellegam eloquentiam sed, putent accusamus temporibus his ut.', '<p>Eu eos malis dicat facilisis, aliquip alterum assentior at vix. Inimicus interpretaris ei vim, graece singulis atomorum ad per, ea sed admodum apeirian indoctum. Cu pro tantas reprehendunt. Usu menandri pertinacia et, vis ne scaevola dissentias. In ornatus eligendi persequeris his, ea usu causae labitur. At porro delectus sed. Quot minim ei has, has id dolore maiorum interesset.</p><p>Justo incorrupte ea quo, adhuc eligendi reprimique pro et. Eos nobis aeterno conclusionemque ei, no eam dolor delectus. Error altera argumentum quo ea, eam ne antiopam assentior. Ea mea ullum dicant timeam, sea affert reformidans ad. Ei dicam appetere sea, id phaedrum moderatius sed.</p><p>Ad mel velit quidam honestatis. Has no mediocrem repudiandae, mel in ceteros perfecto gubergren, has ne dignissim consequat theophrastus. Duo et assum harum iriure, solum ubique philosophia per an, mea clita nominati reprehendunt ei. Zril melius dignissim qui ad. Debitis fierent quo in, no usu affert aeterno.</p>', '1680623532.jpg', 5, 'Show', 'Product Item Name', 'Product Item Name', '2020-11-30 09:39:42', '2023-04-04 15:52:12', 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Categoria Men', 'Description 1 updated', '2022-12-04 08:20:47', '2023-04-10 21:39:16', NULL),
(2, 'Product Category Women', 'Product Category 2 Description', '2022-12-04 08:49:16', '2023-04-10 21:39:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_slug` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_content_short` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_start_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_end_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_client_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_client_company` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_client_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_video` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_featured_photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `project_name`, `project_slug`, `project_content`, `project_content_short`, `project_start_date`, `project_end_date`, `project_client_name`, `project_client_company`, `project_client_comment`, `project_video`, `project_featured_photo`, `seo_title`, `seo_meta_description`, `created_at`, `updated_at`) VALUES
(3, 'Libris impetus molestiae te eu ius ludus', 'libris-impetus-molestiae-te-eu-ius-ludus', '<p>Lorem ipsum dolor sit amet, eu vim elitr clita, quot putent feugait cu per. Tamquam voluptua persequeris ad cum, at his cibo scaevola. Cibo justo equidem cu nam. An meliore admodum vis, quot aliquip bonorum ei quo. Mea nemore feugiat verterem cu, modus vulputate mea id.</p><p>Est facilis recteque et, etiam aliquip fastidii usu ea, eos id diam aeterno definiebas. Ad pro tantas numquam alienum, an quidam dolorem voluptatum his, ut natum explicari consequat quo. Minim audiam te vel, in est decore legimus. Semper accusamus posidonium ea duo, usu tale fabellas cu, elitr semper tincidunt ius in. Cum possim labitur eripuit at, vix ut quas commodo neglegentur.</p><p>Cetero mnesarchum id vis, id sea magna interpretaris. In perpetua posidonium complectitur duo. Te duo harum veniam altera, pri veritus nusquam offendit ex. Sed no ferri soleat quaerendum, quo ad vitae utroque expetendis, ex lorem soleat vis.</p>', 'Lorem ipsum dolor sit amet, eu vim elitr clita, quot putent feugait cu per. Tamquam voluptua persequeris ad cum, at his cibo scaevola. Cibo justo equidem cu nam.', '2020-01-01', '2020-02-21', 'Client Name Here', 'Company Name Here', 'Qui commune laboramus definitionem et, ut regione persius vel, facete verterem has eu. Scripta iracundia mel in, vim omittam perpetua ut. Magna affert graece at pri, et est blandit laboramus. Duo feugiat periculis eu, ne illum melius molestie has.', 'wwOY6RgrDKQ', 'project-featured-photo-3.png', 'Libris impetus molestiae te eu ius ludus', 'Libris impetus molestiae te eu ius ludus', '2020-11-22 18:39:57', '2020-11-22 18:39:57'),
(8, 'Eu paulo lucilius adipisci duo eam', 'eu-paulo-lucilius-adipisci-duo-eam', '<p>Lorem ipsum dolor sit amet, eu vim elitr clita, quot putent feugait cu per. Tamquam voluptua persequeris ad cum, at his cibo scaevola. Cibo justo equidem cu nam. An meliore admodum vis, quot aliquip bonorum ei quo. Mea nemore feugiat verterem cu, modus vulputate mea id.<br></p><p>Est facilis recteque et, etiam aliquip fastidii usu ea, eos id diam aeterno definiebas. Ad pro tantas numquam alienum, an quidam dolorem voluptatum his, ut natum explicari consequat quo. Minim audiam te vel, in est decore legimus. Semper accusamus posidonium ea duo, usu tale fabellas cu, elitr semper tincidunt ius in. Cum possim labitur eripuit at, vix ut quas commodo neglegentur.</p><p>Cetero mnesarchum id vis, id sea magna interpretaris. In perpetua posidonium complectitur duo. Te duo harum veniam altera, pri veritus nusquam offendit ex. Sed no ferri soleat quaerendum, quo ad vitae utroque expetendis, ex lorem soleat vis.</p>', 'Lorem ipsum dolor sit amet, eu vim elitr clita, quot putent feugait cu per. Tamquam voluptua persequeris ad cum, at his cibo scaevola. Cibo justo equidem cu nam.', '2020-03-03', '2020-04-23', 'Client Name Here', 'Company Name Here', 'Qui commune laboramus definitionem et, ut regione persius vel, facete verterem has eu. Scripta iracundia mel in, vim omittam perpetua ut. Magna affert graece at pri, et est blandit laboramus. Duo feugiat periculis eu, ne illum melius molestie has.', 'hfDUf8g94nA', 'project-featured-photo-8.png', 'Eu paulo lucilius adipisci duo eam', 'Eu paulo lucilius adipisci duo eam', '2020-12-13 03:20:04', '2020-12-13 03:20:04'),
(9, 'Debitis consequuntur sea eu ex agam', 'debitis-consequuntur-sea-eu-ex-agam', '<p>Lorem ipsum dolor sit amet, eu vim elitr clita, quot putent feugait cu per. Tamquam voluptua persequeris ad cum, at his cibo scaevola. Cibo justo equidem cu nam. An meliore admodum vis, quot aliquip bonorum ei quo. Mea nemore feugiat verterem cu, modus vulputate mea id.<br></p><p>Est facilis recteque et, etiam aliquip fastidii usu ea, eos id diam aeterno definiebas. Ad pro tantas numquam alienum, an quidam dolorem voluptatum his, ut natum explicari consequat quo. Minim audiam te vel, in est decore legimus. Semper accusamus posidonium ea duo, usu tale fabellas cu, elitr semper tincidunt ius in. Cum possim labitur eripuit at, vix ut quas commodo neglegentur.</p><p>Cetero mnesarchum id vis, id sea magna interpretaris. In perpetua posidonium complectitur duo. Te duo harum veniam altera, pri veritus nusquam offendit ex. Sed no ferri soleat quaerendum, quo ad vitae utroque expetendis, ex lorem soleat vis.</p>', 'Lorem ipsum dolor sit amet, eu vim elitr clita, quot putent feugait cu per. Tamquam voluptua persequeris ad cum, at his cibo scaevola. Cibo justo equidem cu nam.', '2020-03-25', '2020-05-05', 'Client Name Here', 'Company Name Here', 'Qui commune laboramus definitionem et, ut regione persius vel, facete verterem has eu. Scripta iracundia mel in, vim omittam perpetua ut. Magna affert graece at pri, et est blandit laboramus. Duo feugiat periculis eu, ne illum melius molestie has.', 'eT68ne9TwsA', 'project-featured-photo-9.png', 'Debitis consequuntur sea eu ex agam', 'Debitis consequuntur sea eu ex agam', '2020-12-13 03:22:01', '2020-12-13 03:22:01');

-- --------------------------------------------------------

--
-- Table structure for table `project_photos`
--

CREATE TABLE `project_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` int(11) NOT NULL,
  `project_photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_photo_caption` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_photos`
--

INSERT INTO `project_photos` (`id`, `project_id`, `project_photo`, `project_photo_caption`, `created_at`, `updated_at`) VALUES
(6, 3, 'project-photo-6.png', NULL, '2020-11-22 19:23:45', '2020-11-22 19:23:45'),
(7, 3, 'project-photo-7.png', NULL, '2020-11-22 19:23:52', '2020-11-22 19:23:52'),
(18, 3, 'project-photo-18.png', 'Project Photo', '2020-12-13 03:23:33', '2020-12-13 03:23:33'),
(19, 8, 'project-photo-19.png', 'Project Photo', '2020-12-13 03:24:34', '2020-12-13 03:24:34'),
(20, 8, 'project-photo-20.png', 'Project Photo', '2020-12-13 03:24:53', '2020-12-13 03:24:53'),
(21, 8, 'project-photo-21.png', 'Project Photo', '2020-12-13 03:25:09', '2020-12-13 03:25:09'),
(22, 9, 'project-photo-22.png', 'Project Photo', '2020-12-13 03:25:46', '2020-12-13 03:25:46'),
(23, 9, 'project-photo-23.png', 'Project Photo', '2020-12-13 03:26:07', '2020-12-13 03:26:07');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, NULL),
(4, 'Manager', '2021-03-05 18:43:49', '2021-03-05 19:41:00'),
(5, 'Editor', '2021-03-05 18:44:05', '2021-03-05 18:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `role_pages`
--

CREATE TABLE `role_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_pages`
--

INSERT INTO `role_pages` (`id`, `page_title`, `created_at`, `updated_at`) VALUES
(1, 'General Settings', NULL, NULL),
(2, 'Page Settings', NULL, NULL),
(3, 'Footer Columns', NULL, NULL),
(4, 'Sliders', NULL, NULL),
(5, 'Blog Section', NULL, NULL),
(6, 'Dynamic Pages', NULL, NULL),
(7, 'Admin User Section', NULL, NULL),
(8, 'Menu Manage', NULL, NULL),
(9, 'Project', NULL, NULL),
(10, 'Career Section', NULL, NULL),
(11, 'Photo Gallery', NULL, NULL),
(12, 'Video Gallery', NULL, NULL),
(13, 'Product Section', NULL, NULL),
(14, 'Order Section', NULL, NULL),
(15, 'Customer Section', NULL, NULL),
(16, 'Why Choose Us', NULL, NULL),
(17, 'Service', NULL, NULL),
(18, 'Testimonial', NULL, NULL),
(19, 'Team Member', NULL, NULL),
(20, 'FAQ', NULL, NULL),
(21, 'Email Template', NULL, NULL),
(22, 'Subscriber Section', NULL, NULL),
(23, 'Social Media', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `role_page_id` int(11) NOT NULL,
  `access_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `role_id`, `role_page_id`, `access_status`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 1, NULL, NULL),
(2, 4, 2, 1, NULL, NULL),
(3, 4, 3, 1, NULL, NULL),
(4, 4, 4, 1, NULL, NULL),
(5, 4, 5, 1, NULL, NULL),
(6, 4, 6, 1, NULL, NULL),
(7, 4, 7, 0, NULL, NULL),
(8, 4, 8, 1, NULL, NULL),
(9, 4, 9, 1, NULL, NULL),
(10, 4, 10, 1, NULL, NULL),
(11, 4, 11, 1, NULL, NULL),
(12, 4, 12, 1, NULL, NULL),
(13, 4, 13, 1, NULL, NULL),
(14, 4, 14, 1, NULL, NULL),
(15, 4, 15, 1, NULL, NULL),
(16, 4, 16, 1, NULL, NULL),
(17, 4, 17, 1, NULL, NULL),
(18, 4, 18, 1, NULL, NULL),
(19, 4, 19, 1, NULL, NULL),
(20, 4, 20, 1, NULL, NULL),
(21, 4, 21, 1, NULL, NULL),
(22, 4, 22, 1, NULL, NULL),
(23, 4, 23, 1, NULL, NULL),
(24, 5, 1, 0, NULL, NULL),
(25, 5, 2, 0, NULL, NULL),
(26, 5, 3, 0, NULL, NULL),
(27, 5, 4, 0, NULL, NULL),
(28, 5, 5, 1, NULL, NULL),
(29, 5, 6, 0, NULL, NULL),
(30, 5, 7, 0, NULL, NULL),
(31, 5, 8, 0, NULL, NULL),
(32, 5, 9, 0, NULL, NULL),
(33, 5, 10, 0, NULL, NULL),
(34, 5, 11, 0, NULL, NULL),
(35, 5, 12, 0, NULL, NULL),
(36, 5, 13, 0, NULL, NULL),
(37, 5, 14, 0, NULL, NULL),
(38, 5, 15, 0, NULL, NULL),
(39, 5, 16, 0, NULL, NULL),
(40, 5, 17, 0, NULL, NULL),
(41, 5, 18, 0, NULL, NULL),
(42, 5, 19, 0, NULL, NULL),
(43, 5, 20, 0, NULL, NULL),
(44, 5, 21, 0, NULL, NULL),
(45, 5, 22, 0, NULL, NULL),
(46, 5, 23, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sent_messages`
--

CREATE TABLE `sent_messages` (
  `id` int(11) NOT NULL,
  `sms` int(11) DEFAULT 0,
  `whatsapp` int(11) DEFAULT 0,
  `month` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sent_messages`
--

INSERT INTO `sent_messages` (`id`, `sms`, `whatsapp`, `month`, `created_at`, `updated_at`) VALUES
(1, 11, 13, 4, '2023-04-02 21:06:31', '2023-04-10 21:39:16');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `slug`, `description`, `short_description`, `photo`, `seo_title`, `seo_meta_description`, `created_at`, `updated_at`) VALUES
(1, 'BARBER SHOP SERVICES', 'BARBER SHOP SERVICES', '<ul class=\"list-group\" style=\"margin-right: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 14px;\"><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-color: rgb(237, 237, 237); text-align: center;\">House Calls During Regular Hours –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$250.00</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Group Discount Available &nbsp;</li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">The Regular –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$37.00</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">The Regular ( Kids ) –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$35.00</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">The Regular ( Seniors ) –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$33.00</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Beard Basics –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$25.00 p</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Platinum Beard –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$47.00</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Golden Beard –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$37.00</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Skin Fade –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$40.00</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Long Or Layers –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$42.00</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Full Cut &amp; Blow Out –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$42.00</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Mustache –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$15.00</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">shear Cut –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$39.00</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Woman’s Full Service Shear Cut –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$45.00</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Color / Dye –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$85.00 &amp; Up</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Styles from the 60’s, 70’s, 80’s, 90’s &amp; Today’s</li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Flat Tops Men &amp; Women: High &amp; Tight/ Mid &amp; Tight/ Low &amp; Tight</li></ul>', 'House Calls During Regular Hours – $250.00\r\nGroup Discount Available', '1680624252.png', 'BARBER SHOP SERVICES', 'BARBER SHOP SERVICES', '2020-11-22 23:35:59', '2023-04-04 16:04:12'),
(2, 'BEAUTY SALON SERVICES', 'BEAUTY SALON SERVICES', '<ul class=\"list-group\" style=\"margin-right: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 14px;\"><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-color: rgb(237, 237, 237); text-align: center;\">Regular Hair Cut (Man &amp; Woman)</li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Up-Dos:&nbsp;Quinceañeras / Sweet 16 /&nbsp;Special Occasions</li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Highlights</li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Color</li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Perm</li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Blow Dry &amp; Styles –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$25 &amp; Up</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Hair Treatment –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$25 &amp; Up</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Layers Blend with Dry Cut</li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Brazilian Blow Out</li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\"><strong>WAX SERVICES</strong></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Brazilian Wax –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$35-45 &amp; Up</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Full Face Threading –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$25 &amp; Up</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Full Arms –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$35</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Full Legs –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$45</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Chest –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$25-35</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Back –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$25-35</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Full Face –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$25</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Under Arms –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$12</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Eyebrows –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$10</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Chin –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$7</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Up Lip –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$6</em></strong></span></li><li class=\"list-group-item normal-row\" style=\"padding: 15px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; border-top-width: 1px; border-color: rgb(237, 237, 237); text-align: center;\">Sides –&nbsp;<span style=\"color: rgb(209, 161, 75);\"><strong><em>$5</em></strong></span></li></ul>', 'Regular Hair Cut (Man & Woman)\r\nUp-Dos: Quinceañeras / Sweet 16 / Special Occasions\r\nHighlights', '1680624904.png', 'BEAUTY SALON SERVICES', 'BEAUTY SALON SERVICES', '2020-11-22 23:36:45', '2023-04-04 16:15:04'),
(13, 'BEAUTY SALON', 'BEAUTY SALON', '<p>cccccccccccccccccccccccc</p>', NULL, '1680624919.png', NULL, NULL, '2023-04-04 16:12:53', '2023-04-04 16:15:19');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shipping_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_cost` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_order` smallint(6) NOT NULL DEFAULT 0,
  `shipping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `shipping_name`, `shipping_text`, `shipping_cost`, `shipping_order`, `shipping_status`, `created_at`, `updated_at`) VALUES
(1, 'Free Shipping', 'Shipment will be within 10-15 Days', '0', 1, 'Show', '2020-11-29 21:08:10', '2020-11-29 21:11:47'),
(2, 'Standard Shipping', 'Shipment will be within 5-10 Day.', '5', 2, 'Show', '2020-11-29 21:14:01', '2020-11-29 21:14:01'),
(3, '2-Day Shipping', 'Shipment will be within 2 Days.', '10', 3, 'Show', '2020-11-29 21:14:21', '2020-11-29 21:14:21'),
(4, 'Same day delivery', 'Shipment will be within 1 Day.', '20', 4, 'Show', '2020-11-29 21:14:46', '2020-11-29 21:14:46');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slider_heading` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_button_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slider_button_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slider_type` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_video` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_color` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `centered` tinyint(1) NOT NULL DEFAULT 1,
  `slider_mp4` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `overlay` double DEFAULT 0.7
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `slider_heading`, `slider_text`, `slider_button_text`, `slider_button_url`, `slider_type`, `slider_photo`, `slider_video`, `slider_color`, `created_at`, `updated_at`, `centered`, `slider_mp4`, `overlay`) VALUES
(37, 'WE WILL NOT CUT OFF MORE THAN YOU ASK FOR', 'The Best Barber Shop in San Fernando Valley', 'CONTACT US', 'https://aabsolutebarbersvipnsalons.site/contact', 'photo', '1680484601png', NULL, 'FFFFFF', '2022-12-16 19:20:00', '2023-04-03 21:42:57', 1, NULL, 0.1),
(39, 'WE WILL NOT CUT OFF MORE THAN YOU ASK FOR', 'The Best barber Shop in San Fernando Valley', 'CONTACT US', 'https://aabsolutebarbersvipnsalons.site/contact', 'photo', '1680484870png', NULL, 'FFFFFF', '2023-03-20 17:07:02', '2023-04-03 21:43:13', 1, NULL, 0.1),
(43, 'Similique aut non qu', 'Exercitation rerum q', 'Aspernatur asperiore', 'Dolores illum inven', 'video', NULL, 'https://www.youtube.com/embed/sJRgFvPfyms', 'FFFFFF', '2023-04-23 04:40:36', '2023-04-23 04:40:36', 0, NULL, 0.4);

-- --------------------------------------------------------

--
-- Table structure for table `social_media_items`
--

CREATE TABLE `social_media_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `social_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_icon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_order` smallint(6) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_media_items`
--

INSERT INTO `social_media_items` (`id`, `social_url`, `social_icon`, `social_order`, `created_at`, `updated_at`) VALUES
(4, 'https://www.facebook.com/profile.php?id=100090478457366', 'fab fa-facebook-f', 1, '2020-11-24 18:56:23', '2023-03-20 17:45:10'),
(8, 'https://www.instagram.com/absolutebarbershopnsalons/', 'fab fa fa-instagram', 0, '2023-04-03 02:15:59', '2023-04-03 02:16:40');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subs_email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subs_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subs_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `subs_email`, `subs_token`, `subs_active`, `created_at`, `updated_at`) VALUES
(7, 'syedfaizan966@gmail.com', '1e4ad2f885f532b0b6d4d6e8bc10952e0ada01cca25372ea36f363e7cfa2e7b3', 1, NULL, NULL),
(11, 'bercodetech@gmail.com', '7b4da62da64093b23b2c1d4b2c6546dc82513f3d2ee8c821abe7bd4a4f4e7da6', 1, NULL, NULL),
(12, 'bsw-usa@hotmail.com', 'cdc20fd20ed1e695fe2dce396fd1150b2024ccefd026ef5e982b4bc9e35cc212', 1, NULL, NULL),
(14, 'rizanww@gmail.com', 'ecc335b8a31358c296c65d22fb101615d169d0c1b532be145e00d74e7598db36', 0, NULL, NULL),
(16, 'jberrios@elitemanagesolutions.com', '580bc514366b8f73c7e56246768c6056dbc82ee7a7bf8f769e84e151134eca98', 1, NULL, NULL),
(17, 'superadmin@example.com', 'e29c9576ab28cd0a344e4056ed7ffc42866ef4906a7d990b10c53be8186b56c9', 1, NULL, NULL),
(18, 'omar@gmail.com', 'acab874c0b24410c998705c26bfefe1cce9e5ece87aa15dfcb40a8456afc67d4', 1, NULL, NULL),
(19, 'angelsenorsolar@gmail.com', '13a7ef75895c6aa7b18b4c83d9ae98ba6b130cdd5b0aa03359d9b6a8e0c77ab1', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `degree` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_youtube` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team_members`
--

INSERT INTO `team_members` (`id`, `name`, `slug`, `designation`, `degree`, `detail`, `facebook`, `twitter`, `linkedin`, `youtube`, `instagram`, `email`, `phone`, `website`, `address`, `video_youtube`, `photo`, `seo_title`, `seo_meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Brent Grundy', 'brent-grundy', 'Founder', '<p>Lorem ipsum dolor sit amet, ea qui tation adversarium definitionem, eu labitur denique est. Ad duo quando recusabo petentium. Mea elit affert oportere ex. Ut error affert accusam pri. Sit no causae vidisse invenire, bonorum inermis nec ex.</p><p>Eam sint reformidans ex, ex doming iracundia his. Sint modus pro ne, vix ut omnis scripta corpora. Sea graecis suavitate te. Eum tantas possim torquatos ei. An qui falli sadipscing suscipiantur. At congue forensibus constituto his, erat vidit veniam vis eu, dico soleat possim nec ei.</p><p>Cu modo adipisci sea. At clita doctus sit. Pri ex solet deterruisset, falli harum fuisset qui ei, an commune delicata patrioque sit. Fabulas adversarium no sea, at quis disputando pri, meis epicurei eloquentiam vix ad. An consulatu sententiae posidonium his, te elaboraret cotidieque eos, sed an illud recteque.</p><p>Eu per altera aliquam consulatu, ea pro nulla doctus. Sea porro everti an, nostrud ceteros nam no. Ei quando qualisque his, alterum ocurreret nec eu, dolorum deseruisse ad mel. Nam vidit omnis ad, pro eu veniam efficiendi, sea an iriure vivendo appetere. Usu ad latine vocibus voluptatum.</p><p>Et bonorum consetetur mediocritatem qui, cu est omnis persequeris, mea te doctus incorrupte. Vix et tale justo. Vel te lorem sapientem interesset. Ne ius tantas saperet officiis, volutpat adolescens ut sea, an animal consectetuer vis. Nonumy ornatus constituam vis ne, cum ne vidisse patrioque.</p>', '<p>Fugit contentiones id nam, noster percipit ne mei. Duo no modo tempor, per ea quaeque commune complectitur, sed ex alia utamur apeirian. Est id solum dicant ceteros. Quem omnium dignissim in vim, sea nihil expetenda id, molestiae definitionem ad pri.</p><p>Id per esse iudicabit expetendis, ne qui legimus accusata corrumpit. Ei has duis corrumpit, facilisis accommodare te nec. Ne usu molestiae voluptatum mediocritatem, tota percipitur ut qui. Ne modo idque feugait vel. Postea epicuri mei te. Ad tollit qualisque dignissim per, eu purto virtute fabulas his.</p><p>Viris ignota vim et. Ea idque etiam liberavisse has. Ex mel lorem voluptatibus, sed vero accusata no. Ad pri utinam praesent, usu iuvaret adipisci contentiones an. Eum falli fabellas ut, usu te putent posidonium.</p><p>Ei cum elit fuisset, ad tota assueverit scriptorem qui, pro ex utamur recteque incorrupte. Has iisque consectetuer eu. Malis doming eirmod id his, te mea novum offendit. Ea minim doming evertitur eum, latine neglegentur no nec. Ea pro putant perpetua interpretaris. Mea ne noster aliquando constituam, iudico discere neglegentur vel cu, mandamus corrumpit duo ne.</p>', 'http://www.facebook.com', 'http://www.twitter.com', 'http://www.linkedin.com', 'http://www.youtube.com', 'http://www.instagram.com', 'info@yourwebsite1.com', '111-222-3333', 'http://www.yourwebsite1.com', '4008 Ocala Street\r\nOrlando, FL 32809', '12oynGTjYKs', '1680625576.jpg', 'Brent Grundy', 'Brent Grundy', '2020-11-23 10:53:34', '2023-04-04 16:26:16'),
(2, 'Robin Cook', 'robin-cook', 'Chairman', '<p>Lorem ipsum dolor sit amet, ea qui tation adversarium definitionem, eu labitur denique est. Ad duo quando recusabo petentium. Mea elit affert oportere ex. Ut error affert accusam pri. Sit no causae vidisse invenire, bonorum inermis nec ex.<br></p><p>Eam sint reformidans ex, ex doming iracundia his. Sint modus pro ne, vix ut omnis scripta corpora. Sea graecis suavitate te. Eum tantas possim torquatos ei. An qui falli sadipscing suscipiantur. At congue forensibus constituto his, erat vidit veniam vis eu, dico soleat possim nec ei.</p><p>Cu modo adipisci sea. At clita doctus sit. Pri ex solet deterruisset, falli harum fuisset qui ei, an commune delicata patrioque sit. Fabulas adversarium no sea, at quis disputando pri, meis epicurei eloquentiam vix ad. An consulatu sententiae posidonium his, te elaboraret cotidieque eos, sed an illud recteque.</p><p>Eu per altera aliquam consulatu, ea pro nulla doctus. Sea porro everti an, nostrud ceteros nam no. Ei quando qualisque his, alterum ocurreret nec eu, dolorum deseruisse ad mel. Nam vidit omnis ad, pro eu veniam efficiendi, sea an iriure vivendo appetere. Usu ad latine vocibus voluptatum.</p><p>Et bonorum consetetur mediocritatem qui, cu est omnis persequeris, mea te doctus incorrupte. Vix et tale justo. Vel te lorem sapientem interesset. Ne ius tantas saperet officiis, volutpat adolescens ut sea, an animal consectetuer vis. Nonumy ornatus constituam vis ne, cum ne vidisse patrioque.</p>', '<p>Fugit contentiones id nam, noster percipit ne mei. Duo no modo tempor, per ea quaeque commune complectitur, sed ex alia utamur apeirian. Est id solum dicant ceteros. Quem omnium dignissim in vim, sea nihil expetenda id, molestiae definitionem ad pri.<br></p><p>Id per esse iudicabit expetendis, ne qui legimus accusata corrumpit. Ei has duis corrumpit, facilisis accommodare te nec. Ne usu molestiae voluptatum mediocritatem, tota percipitur ut qui. Ne modo idque feugait vel. Postea epicuri mei te. Ad tollit qualisque dignissim per, eu purto virtute fabulas his.<br></p><p>Viris ignota vim et. Ea idque etiam liberavisse has. Ex mel lorem voluptatibus, sed vero accusata no. Ad pri utinam praesent, usu iuvaret adipisci contentiones an. Eum falli fabellas ut, usu te putent posidonium.</p><p>Ei cum elit fuisset, ad tota assueverit scriptorem qui, pro ex utamur recteque incorrupte. Has iisque consectetuer eu. Malis doming eirmod id his, te mea novum offendit. Ea minim doming evertitur eum, latine neglegentur no nec. Ea pro putant perpetua interpretaris. Mea ne noster aliquando constituam, iudico discere neglegentur vel cu, mandamus corrumpit duo ne.</p>', 'http://www.facebook.com', 'http://www.twitter.com', 'http://www.linkedin.com', NULL, NULL, 'robincook@gmail.com', '111-222-3334', 'http://www.website2.com', '4008 Ocala Street\r\nOrlando, FL 32809', 'ez-M8wHX4Wk', '1680625503.jpg', 'Robin Cook', 'Robin Cook', '2020-12-13 03:28:29', '2023-04-04 16:25:03'),
(3, 'Bob Smith', 'bob-smith', 'Executive Office', '<p>Lorem ipsum dolor sit amet, ea qui tation adversarium definitionem, eu labitur denique est. Ad duo quando recusabo petentium. Mea elit affert oportere ex. Ut error affert accusam pri. Sit no causae vidisse invenire, bonorum inermis nec ex.<br></p><p>Eam sint reformidans ex, ex doming iracundia his. Sint modus pro ne, vix ut omnis scripta corpora. Sea graecis suavitate te. Eum tantas possim torquatos ei. An qui falli sadipscing suscipiantur. At congue forensibus constituto his, erat vidit veniam vis eu, dico soleat possim nec ei.</p><p>Cu modo adipisci sea. At clita doctus sit. Pri ex solet deterruisset, falli harum fuisset qui ei, an commune delicata patrioque sit. Fabulas adversarium no sea, at quis disputando pri, meis epicurei eloquentiam vix ad. An consulatu sententiae posidonium his, te elaboraret cotidieque eos, sed an illud recteque.</p><p>Eu per altera aliquam consulatu, ea pro nulla doctus. Sea porro everti an, nostrud ceteros nam no. Ei quando qualisque his, alterum ocurreret nec eu, dolorum deseruisse ad mel. Nam vidit omnis ad, pro eu veniam efficiendi, sea an iriure vivendo appetere. Usu ad latine vocibus voluptatum.</p><p>Et bonorum consetetur mediocritatem qui, cu est omnis persequeris, mea te doctus incorrupte. Vix et tale justo. Vel te lorem sapientem interesset. Ne ius tantas saperet officiis, volutpat adolescens ut sea, an animal consectetuer vis. Nonumy ornatus constituam vis ne, cum ne vidisse patrioque.</p>', '<p>Fugit contentiones id nam, noster percipit ne mei. Duo no modo tempor, per ea quaeque commune complectitur, sed ex alia utamur apeirian. Est id solum dicant ceteros. Quem omnium dignissim in vim, sea nihil expetenda id, molestiae definitionem ad pri.<br></p><p>Id per esse iudicabit expetendis, ne qui legimus accusata corrumpit. Ei has duis corrumpit, facilisis accommodare te nec. Ne usu molestiae voluptatum mediocritatem, tota percipitur ut qui. Ne modo idque feugait vel. Postea epicuri mei te. Ad tollit qualisque dignissim per, eu purto virtute fabulas his.</p><p>Viris ignota vim et. Ea idque etiam liberavisse has. Ex mel lorem voluptatibus, sed vero accusata no. Ad pri utinam praesent, usu iuvaret adipisci contentiones an. Eum falli fabellas ut, usu te putent posidonium.</p><p>Ei cum elit fuisset, ad tota assueverit scriptorem qui, pro ex utamur recteque incorrupte. Has iisque consectetuer eu. Malis doming eirmod id his, te mea novum offendit. Ea minim doming evertitur eum, latine neglegentur no nec. Ea pro putant perpetua interpretaris. Mea ne noster aliquando constituam, iudico discere neglegentur vel cu, mandamus corrumpit duo ne.</p>', 'http://www.facebook.com', 'http://www.twitter.com', 'http://www.linkedin.com', NULL, NULL, 'bobsmith@gmail.com', '111-222-3338', 'http://www.website3.com', '4008 Ocala Street\r\nOrlando, FL 32809', 'KZxskJojRLY', '1680625651.jpg', 'Bob Smith', 'Bob Smith', '2020-12-13 04:24:07', '2023-04-04 16:27:31'),
(5, 'Julio PEena', 'julio pena', 'derfff', '<p>cccccccccccccc</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1680630862.jpg', NULL, NULL, '2023-04-04 17:54:22', '2023-04-04 17:54:22');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `designation`, `photo`, `comment`, `created_at`, `updated_at`) VALUES
(2, 'Rebeca Valerio', 'Navs Pack & Ship', '1671516659.png', '“Prisma Freight is a reliable and flexible broker that will be able to meet your transportation needs. Dry van, temp protect, haz-mat, expedited freight. They know their customers (and their vendors), and take communication seriously, which is a plus in the logistics world. I would recommend this company to anyone looking to fill a gap in their transportation needs. Our representatives do a great job in getting the job done, and getting it done right”', '2020-11-23 01:12:35', '2022-12-20 06:14:53'),
(3, 'Gustavo De La Cruz', 'De La Cruz Brothers', '1671517085.jpg', '“Have been working with our dedicated representative for quite some time now. I don’t always have trucks in her area, but when I do, he does everything he can to get them back to Texas. He also checks in with us on a regular basis to see if we need any help. On top of getting loads for our drivers, he is fantastic to talk to. Always happy and upbeat.”', '2020-11-23 01:12:54', '2022-12-20 06:18:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `video_youtube` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_caption` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_order` smallint(6) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `video_youtube`, `video_caption`, `video_order`, `created_at`, `updated_at`) VALUES
(2, 'e4Xi2_HY5mI', 'Caption 1', 1, '2020-11-22 21:08:36', '2023-03-25 00:15:38'),
(3, '7-nEi87HbOg', 'Caption 3', 3, '2020-11-22 21:13:58', '2023-03-25 00:16:47'),
(4, 'O7QtDOZuwfc', 'Caption 4', 4, '2020-11-22 21:14:42', '2020-11-22 21:14:42'),
(5, '5Lc91smOaoY', 'Caption 5', 5, '2020-11-22 21:15:02', '2020-11-22 21:15:02'),
(6, 'UDqR6gnuemw', 'Caption 6', 6, '2020-11-22 21:15:23', '2020-11-22 21:15:23');

-- --------------------------------------------------------

--
-- Table structure for table `why_choose_items`
--

CREATE TABLE `why_choose_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `why_choose_items`
--

INSERT INTO `why_choose_items` (`id`, `name`, `description`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'We understand your Desires', 'We understand how important it is to look and feel your best and a beautiful hair plays a big role in confidence.', '1679103495.png', '2020-11-22 23:10:36', '2023-03-18 22:56:09'),
(2, 'Listen your Desires', 'Our stylists are always trained and educated on the newest and most trendy styles.  Our stylists alway listen and clarify to make sure that you will be completely satisfied with your hair before leaving.', '1679103524.png', '2020-11-22 23:12:59', '2023-03-18 22:57:45'),
(5, 'A Perfect Atmosphere', 'you ll have a relax time with me.', '1679103652.png', '2020-11-22 23:13:47', '2023-03-18 23:00:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_monthly_pyments`
--
ALTER TABLE `admin_monthly_pyments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `composed_documents`
--
ALTER TABLE `composed_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dynamic_pages`
--
ALTER TABLE `dynamic_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `excel_contacts`
--
ALTER TABLE `excel_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file_manager`
--
ALTER TABLE `file_manager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer_columns`
--
ALTER TABLE `footer_columns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `landing_page_contacts`
--
ALTER TABLE `landing_page_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `landing_page_images`
--
ALTER TABLE `landing_page_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_limits`
--
ALTER TABLE `message_limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_options`
--
ALTER TABLE `message_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_shippings`
--
ALTER TABLE `order_shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_about_items`
--
ALTER TABLE `page_about_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_blog_items`
--
ALTER TABLE `page_blog_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_career_items`
--
ALTER TABLE `page_career_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_contact_items`
--
ALTER TABLE `page_contact_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_faq_items`
--
ALTER TABLE `page_faq_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_home_items`
--
ALTER TABLE `page_home_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_other_items`
--
ALTER TABLE `page_other_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_photo_gallery_items`
--
ALTER TABLE `page_photo_gallery_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_privacy_items`
--
ALTER TABLE `page_privacy_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_project_items`
--
ALTER TABLE `page_project_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_service_items`
--
ALTER TABLE `page_service_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_shop_items`
--
ALTER TABLE `page_shop_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_team_items`
--
ALTER TABLE `page_team_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_term_items`
--
ALTER TABLE `page_term_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_video_gallery_items`
--
ALTER TABLE `page_video_gallery_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`(191));

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_photos`
--
ALTER TABLE `project_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_pages`
--
ALTER TABLE `role_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_messages`
--
ALTER TABLE `sent_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_media_items`
--
ALTER TABLE `social_media_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `why_choose_items`
--
ALTER TABLE `why_choose_items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `admin_monthly_pyments`
--
ALTER TABLE `admin_monthly_pyments`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `composed_documents`
--
ALTER TABLE `composed_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `dynamic_pages`
--
ALTER TABLE `dynamic_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `excel_contacts`
--
ALTER TABLE `excel_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `file_manager`
--
ALTER TABLE `file_manager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `footer_columns`
--
ALTER TABLE `footer_columns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `landing_page_contacts`
--
ALTER TABLE `landing_page_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `landing_page_images`
--
ALTER TABLE `landing_page_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `message_limits`
--
ALTER TABLE `message_limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `message_options`
--
ALTER TABLE `message_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_shippings`
--
ALTER TABLE `order_shippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `page_about_items`
--
ALTER TABLE `page_about_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_blog_items`
--
ALTER TABLE `page_blog_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_career_items`
--
ALTER TABLE `page_career_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_contact_items`
--
ALTER TABLE `page_contact_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_faq_items`
--
ALTER TABLE `page_faq_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_home_items`
--
ALTER TABLE `page_home_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_other_items`
--
ALTER TABLE `page_other_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `page_photo_gallery_items`
--
ALTER TABLE `page_photo_gallery_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_privacy_items`
--
ALTER TABLE `page_privacy_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_project_items`
--
ALTER TABLE `page_project_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_service_items`
--
ALTER TABLE `page_service_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_shop_items`
--
ALTER TABLE `page_shop_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_team_items`
--
ALTER TABLE `page_team_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_term_items`
--
ALTER TABLE `page_term_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_video_gallery_items`
--
ALTER TABLE `page_video_gallery_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `project_photos`
--
ALTER TABLE `project_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `role_pages`
--
ALTER TABLE `role_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `sent_messages`
--
ALTER TABLE `sent_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `social_media_items`
--
ALTER TABLE `social_media_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `why_choose_items`
--
ALTER TABLE `why_choose_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
