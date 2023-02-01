

CREATE TABLE `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_balance` double DEFAULT NULL,
  `total_balance` double NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO accounts VALUES("1","11111","حساب فروش","1000","1000","ییسسیسییسیس","0","0","2018-12-18 06:28:02","2021-07-04 03:38:07");
INSERT INTO accounts VALUES("3","58946311219091","مهران جافری","90000000","90000000","","1","1","2018-12-18 06:28:56","2021-11-10 01:07:47");
INSERT INTO accounts VALUES("4","343343434","ssss","34434343","34434343","34","0","1","2021-07-07 15:27:03","2021-11-10 01:07:47");
INSERT INTO accounts VALUES("5","5059603265451252","محمد سعید","50000000","50000000","","","1","2021-07-14 02:53:51","2021-07-14 02:53:51");



CREATE TABLE `adjustments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` double NOT NULL,
  `item` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO adjustments VALUES("2","adr-20210629-025525","1","","6","1","","2021-06-29 14:55:25","2021-06-29 14:55:25");
INSERT INTO adjustments VALUES("3","adr-20210701-115533","1","","1","1","","2021-07-01 11:55:33","2021-07-01 11:55:33");
INSERT INTO adjustments VALUES("4","adr-20210701-055932","1","","1","1","ss","2021-07-01 17:59:32","2021-07-01 17:59:32");



CREATE TABLE `attendances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `employee_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checkin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO attendances VALUES("7","1400-07-07","1","1","10:15am","6:15pm","0","سسسسس","2021-07-01 15:00:49","2021-07-01 15:00:49");



CREATE TABLE `billers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO billers VALUES("1","مهران","aks.jpg","ایدو","31123","jaferi.mehran@yahoo.com","09222872486","تهران","تهران","","","ایران","1","2018-05-13 02:19:30","2021-07-01 12:09:00");
INSERT INTO billers VALUES("2","تورج","","سپهند رایانه","","tariq@bigtree.com","321312","تبریز","جلفا","","","","1","2018-05-13 02:27:54","2021-07-14 03:03:37");
INSERT INTO billers VALUES("3","test","","test","","test@test.com","3211","erewrwqre","afsf","","","","0","2018-05-30 07:08:58","2018-05-30 07:09:57");
INSERT INTO billers VALUES("5","سالار","mogaTel.jpg","هما رسانه","","modon@gmail.com","32321","شیراز","آباده","","","ایران","1","2018-09-01 08:29:54","2021-07-14 03:04:12");
INSERT INTO billers VALUES("6","a","","a","","a@a.com","q","q","q","","","","0","2018-10-07 06:03:39","2018-10-07 06:04:18");
INSERT INTO billers VALUES("7","a","","a","","a@a.com","a","a","a","","","","0","2018-10-07 06:04:36","2018-10-07 06:06:07");
INSERT INTO billers VALUES("8","x","x.png","x","","x@x.com","x","x","x","","","","0","2019-03-18 14:32:42","2021-07-14 03:04:19");



CREATE TABLE `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO brands VALUES("3","HP","HP.jpg","1","2018-05-12 13:36:14","2019-03-02 09:02:21");
INSERT INTO brands VALUES("4","سامسونگ","samsung.jpg","1","2018-05-12 13:38:41","2021-04-04 10:04:58");
INSERT INTO brands VALUES("5","اپل","Apple.jpg","0","2018-09-01 04:04:49","2021-07-01 17:14:02");
INSERT INTO brands VALUES("6","jjjj","20201019093419.jpg","0","2020-10-19 19:03:52","2020-10-19 19:05:58");
INSERT INTO brands VALUES("7","Lotto","","0","2020-11-16 07:43:41","2021-07-01 17:36:04");



CREATE TABLE `cash_registers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cash_in_hand` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO cash_registers VALUES("1","100","9","1","0","2020-10-13 11:02:54","2020-10-24 03:57:42");
INSERT INTO cash_registers VALUES("2","50","9","1","1","2020-10-13 18:55:26","2020-10-13 18:55:26");
INSERT INTO cash_registers VALUES("3","200","1","1","1","2020-10-22 11:23:07","2020-10-24 04:03:32");
INSERT INTO cash_registers VALUES("4","100","1","2","0","2020-10-24 04:34:39","2021-07-14 04:11:56");
INSERT INTO cash_registers VALUES("5","500","1","2","1","2021-07-14 04:19:38","2021-07-14 04:19:38");



CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO categories VALUES("1","میوها","","9","1","2018-05-12 07:57:25","2021-04-04 12:28:15");
INSERT INTO categories VALUES("2","الکترونیک","","","1","2018-05-12 08:05:57","2021-04-04 12:30:18");
INSERT INTO categories VALUES("3","کامپیوتر","20200701093146.jpg","2","1","2018-05-12 08:06:08","2021-04-04 12:30:40");
INSERT INTO categories VALUES("4","کالای دیجیتال","","","1","2018-05-24 03:27:48","2021-04-04 15:51:39");
INSERT INTO categories VALUES("7","jacket","","","0","2018-05-28 03:09:51","2018-05-28 03:10:48");
INSERT INTO categories VALUES("9","مواد غذایی","","","1","2018-06-25 05:51:40","2021-04-04 12:27:52");
INSERT INTO categories VALUES("10","anda","","","0","2018-08-29 04:06:31","2018-08-29 04:07:34");
INSERT INTO categories VALUES("11","anda","","","0","2018-08-29 04:18:06","2018-08-29 04:23:22");
INSERT INTO categories VALUES("12","مد و پوشاک","","","1","2018-12-05 02:58:53","2021-04-04 15:52:07");
INSERT INTO categories VALUES("14","nn","","","0","2019-04-10 08:52:30","2019-04-10 10:08:47");
INSERT INTO categories VALUES("15","nm","","","0","2019-04-10 08:52:36","2019-04-10 10:11:43");
INSERT INTO categories VALUES("16","رومیزی","","3","1","2020-03-11 14:12:33","2021-04-04 12:27:40");
INSERT INTO categories VALUES("17","tostos","20200701080042.png","","0","2020-07-01 18:30:42","2020-07-01 20:05:34");
INSERT INTO categories VALUES("18","کابل و اتصالات","","2","1","2021-11-10 00:45:28","2021-11-10 00:45:28");



CREATE TABLE `coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `minimum_amount` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `used` int(11) NOT NULL,
  `expired_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO coupons VALUES("1","G264ctZ7EO","percentage","20","0","100","4","1400-04-09","1","1","2018-10-26 02:08:50","2021-07-01 12:50:13");
INSERT INTO coupons VALUES("2","i love bangladesh","fixed","200","1000","50","1","2018-12-31","1","0","2018-10-27 06:29:26","2021-07-01 12:50:20");
INSERT INTO coupons VALUES("3","OS8Qxjp58z","percentage","22","","22","0","1400-04-01","1","1","2021-07-01 12:52:49","2021-07-01 12:52:49");
INSERT INTO coupons VALUES("4","ngH5Jx9k2h","percentage","2000000","","20","0","1400-04-11","1","1","2021-07-14 02:19:45","2021-07-14 02:19:45");
INSERT INTO coupons VALUES("5","F59R3vKcWr","percentage","7000000","0","20000","0","1400-04-25","1","1","2021-07-14 02:21:08","2021-07-14 02:27:15");
INSERT INTO coupons VALUES("6","j4PEd3652g","percentage","500000","0","2","0","1400-04-25","1","1","2021-07-14 02:25:32","2021-07-14 02:25:50");
INSERT INTO coupons VALUES("7","4bD39DGOBP","fixed","20","5000","200","0","1400-04-25","1","1","2021-07-14 02:29:22","2021-07-14 02:29:22");



CREATE TABLE `currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO currencies VALUES("3","تومان","تومان","1","2021-04-03 11:00:44","2021-07-01 17:13:21");
INSERT INTO currencies VALUES("4","ریال","ریال","1","2021-07-02 19:03:06","2021-07-14 03:12:33");



CREATE TABLE `customer_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO customer_groups VALUES("1","عمومی","0","1","2018-05-12 12:39:36","2021-04-04 10:06:10");
INSERT INTO customer_groups VALUES("2","پخش کننده","-10","1","2018-05-12 12:42:14","2021-04-04 10:06:21");
INSERT INTO customer_groups VALUES("3","فروشنده","5","1","2018-05-12 12:42:26","2021-04-04 10:06:32");
INSERT INTO customer_groups VALUES("4","test","12","0","2018-05-30 05:47:16","2018-05-30 05:47:57");
INSERT INTO customer_groups VALUES("5","test","0","0","2018-08-03 13:40:27","2018-08-03 13:40:34");



CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit` double DEFAULT NULL,
  `expense` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO customers VALUES("1","1","22","dhiman","lioncoders","dhiman@gmail.com","+8801111111101","","kajir deuri","chittagong","","","bd","190","20","1","2018-05-12 14:30:48","2020-11-15 09:44:58");
INSERT INTO customers VALUES("2","2","","info@edocloud.ir","lioncoders","","+8801200000001","","jamalkhan","شیراز","","","ایران","100","20","1","2018-05-12 14:34:51","2021-07-01 20:26:45");
INSERT INTO customers VALUES("3","3","","tariq","big tree","","3424","","khulshi","chittagong","","","bd","333","","1","2018-05-12 14:37:52","2021-07-01 15:41:48");
INSERT INTO customers VALUES("4","1","","test","","","4234","","frwerw","qwerwqr","","","","","","0","2018-05-30 06:05:28","2018-05-30 06:07:38");
INSERT INTO customers VALUES("8","1","","anwar","smart it","anwar@smartit.com","32321","","nasirabad","chittagong","","","bd","","","0","2018-09-01 07:56:13","2018-09-01 07:59:55");
INSERT INTO customers VALUES("11","1","","walk-in-customer","","ashfaqdev.php@gmail.com","01923000001","11111","mohammadpur","dhaka","","","","","385","1","2018-09-02 06:00:54","2021-07-14 03:55:14");
INSERT INTO customers VALUES("15","1","","s","","","2","","s","3e","","","","","","0","2018-11-05 07:30:39","2018-11-08 07:07:08");
INSERT INTO customers VALUES("16","1","","asas","","","2121","","dasd","asdd","","","","","","0","2018-12-01 03:37:53","2018-12-04 01:25:46");
INSERT INTO customers VALUES("17","1","","sadman","","","312312","","khulshi","ctg","","","","","","0","2020-06-22 14:15:35","2020-06-22 14:15:51");
INSERT INTO customers VALUES("19","1","19","shakalaka","Digital image","shakalaka@gmail.com","1212","999","Andorkillah","Chittagong","Chittagong","1234","Bangladesh","","","1","2020-11-09 03:37:16","2020-11-09 03:37:16");
INSERT INTO customers VALUES("21","1","21","Modon Miya","modon company","modon@gmail.com","2222","","kuril road","Dhaka","","","","","","1","2020-11-13 10:42:11","2020-11-13 10:42:11");
INSERT INTO customers VALUES("22","1","23","نوین پرداز","نونی پرداز","novin@yahoo.com","09033602978","","مازندران","مازندران","","","","","","1","2021-07-01 16:55:46","2021-07-01 16:55:46");



CREATE TABLE `deliveries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivered_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recieved_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO deliveries VALUES("3","dr-20181106-111321","79","1","تهران کوی فلسطین","شهاب","موسوی","","سسس","3","2018-11-06 08:43:25","2021-07-01 12:55:21");
INSERT INTO deliveries VALUES("4","dr-20210703-035333","270","1","jamalkhan شیراز ایران","مهران","سعید","","","1","2021-07-03 15:53:48","2021-07-03 15:53:48");



CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO departments VALUES("1","خرید","1","2018-12-27 08:46:47","2021-07-14 02:56:16");
INSERT INTO departments VALUES("2","دیجیتال","1","2018-12-27 13:58:47","2021-07-01 14:51:35");
INSERT INTO departments VALUES("3","فناوری","1","2021-07-14 02:55:21","2021-07-14 02:55:21");



CREATE TABLE `deposits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO deposits VALUES("1","90","1","1","first deposit","2018-08-26 03:18:23","2018-08-26 05:48:55");
INSERT INTO deposits VALUES("3","100","2","1","","2018-08-26 05:23:16","2018-08-27 02:12:39");
INSERT INTO deposits VALUES("4","50","1","1","","2018-09-05 03:26:19","2018-09-05 03:26:19");
INSERT INTO deposits VALUES("5","50","1","1","","2018-09-10 04:38:40","2018-09-10 04:38:40");
INSERT INTO deposits VALUES("6","333","3","1","33","2021-07-01 15:41:48","2021-07-01 15:41:48");



CREATE TABLE `employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO employees VALUES("1","مهدی","mehdi@yahoo.com","10001","2","12","johngmailcom.jpg","تهران ونک","تهران","ایران","1","2018-12-30 04:18:37","2021-07-01 14:52:51");
INSERT INTO employees VALUES("3","tests","test@test.com","111","1","","","","","","1","2018-12-31 01:50:51","2019-01-03 03:33:54");
INSERT INTO employees VALUES("4","امیر","hamed@digit.com","۰۸۹۷۶","1","","hameddigitcom.jpg","","","","1","2021-11-10 01:10:22","2021-11-10 01:10:22");



CREATE TABLE `expense_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO expense_categories VALUES("1","16718342","نظافت","1","2018-08-16 05:02:48","2021-04-04 18:04:32");
INSERT INTO expense_categories VALUES("2","60128975","اداره بر ق","1","2018-08-16 05:09:18","2021-04-04 18:04:44");
INSERT INTO expense_categories VALUES("3","83954970","test","0","2018-08-16 05:20:28","2018-08-16 05:21:40");
INSERT INTO expense_categories VALUES("4","1234","تنقلات، خوراک مختصر","1","2018-09-01 07:10:04","2021-04-04 18:04:58");
INSERT INTO expense_categories VALUES("5","50895671","[hkfd","0","2021-04-03 12:02:50","2021-04-03 12:03:17");



CREATE TABLE `expenses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO expenses VALUES("3","er-20180817-014241","1","1","1","1","","125","second expense...","2018-08-17 12:12:41","2018-08-17 12:13:50");
INSERT INTO expenses VALUES("37","er-20210404-083854","4","1","3","1","3","50000","3232","2021-04-04 20:38:54","2021-04-04 20:39:55");
INSERT INTO expenses VALUES("38","er-20210713-091915","1","1","3","1","3","4000","4000","2021-07-13 09:19:15","2021-07-13 09:19:15");
INSERT INTO expenses VALUES("39","er-20210713-092237","1","1","3","1","3","333","weee","2021-07-13 09:22:37","2021-07-13 09:22:37");



CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `general_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_access` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `developed_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO general_settings VALUES("1","سامانه مدیریت مــالی ایــدو","edo-11614758854.png","3","all","Y/m/d","کارگروه فناوری اطلاعات ایدو","standard","1","default.css","2018-07-06 10:43:11","2021-07-02 19:03:43","suffix");



CREATE TABLE `gift_card_recharges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gift_card_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gift_card_recharges VALUES("1","2","100","1","2018-08-25 03:38:29","2018-08-25 03:38:29");
INSERT INTO gift_card_recharges VALUES("2","1","200","1","2018-08-25 03:38:50","2018-08-25 03:38:50");
INSERT INTO gift_card_recharges VALUES("3","1","100","1","2018-09-05 04:20:41","2018-09-05 04:20:41");
INSERT INTO gift_card_recharges VALUES("4","1","50","1","2018-09-05 04:21:38","2018-09-05 04:21:38");
INSERT INTO gift_card_recharges VALUES("5","1","50","1","2018-09-05 04:23:36","2018-09-05 04:23:36");
INSERT INTO gift_card_recharges VALUES("6","2","50","1","2018-09-05 04:24:34","2018-09-05 04:24:34");
INSERT INTO gift_card_recharges VALUES("7","5","10","1","2018-09-30 03:49:48","2018-09-30 03:49:48");
INSERT INTO gift_card_recharges VALUES("8","5","10","1","2018-09-30 03:50:04","2018-09-30 03:50:04");
INSERT INTO gift_card_recharges VALUES("9","2","100","1","2018-10-07 06:43:05","2018-10-07 06:43:05");
INSERT INTO gift_card_recharges VALUES("10","1","200","1","2018-10-07 06:43:39","2018-10-07 06:43:39");
INSERT INTO gift_card_recharges VALUES("11","1","300","1","2018-10-23 03:52:49","2018-10-23 03:52:49");
INSERT INTO gift_card_recharges VALUES("12","8","3.333333333333333e15","1","2021-07-01 15:59:43","2021-07-01 15:59:43");
INSERT INTO gift_card_recharges VALUES("13","8","300000","1","2021-07-02 19:16:41","2021-07-02 19:16:41");
INSERT INTO gift_card_recharges VALUES("14","1","6500000","1","2021-07-02 19:16:53","2021-07-02 19:16:53");



CREATE TABLE `gift_cards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `card_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `expense` double NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gift_cards VALUES("1","3571097513020486","6501400","450","1","","1400-04-09","1","1","2018-08-18 06:27:40","2021-07-02 19:16:53");
INSERT INTO gift_cards VALUES("2","1688075312053349","500000000","100","3","","1400-04-08","1","1","2018-08-18 07:16:43","2021-07-01 12:36:35");
INSERT INTO gift_cards VALUES("3","123","13123","0","1","","2018-08-19","1","0","2018-08-19 03:08:21","2018-08-19 03:08:28");
INSERT INTO gift_cards VALUES("4","1862381252690499","100","0","","1","2018-10-04","1","0","2018-09-30 03:46:28","2018-09-30 03:47:21");
INSERT INTO gift_cards VALUES("5","2300813717254199","143","0","","1","2018-10-04","1","0","2018-09-30 03:48:49","2018-09-30 03:50:20");
INSERT INTO gift_cards VALUES("6","8327019475026421","1","0","1","","2018-10-07","1","0","2018-10-07 06:42:41","2018-10-07 06:42:55");
INSERT INTO gift_cards VALUES("7","2063379780590151","1","0","1","","2018-10-23","1","0","2018-10-23 03:53:22","2018-10-23 03:53:39");
INSERT INTO gift_cards VALUES("8","6097455019301224","800000","0","2","","1400-04-06","1","1","2021-07-01 12:34:10","2021-07-02 19:16:41");



CREATE TABLE `holidays` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO holidays VALUES("1","1","1400-04-10","1400-04-19","ییی","1","2021-07-01 15:19:36","2021-07-01 15:20:45");
INSERT INTO holidays VALUES("2","1","1400-04-05","1400-04-28","سس","1","2021-07-01 15:20:57","2021-07-01 15:20:57");
INSERT INTO holidays VALUES("3","1","1400-04-05","1400-04-29","سس","1","2021-07-14 03:02:35","2021-07-14 03:02:35");



CREATE TABLE `hrm_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `checkin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO hrm_settings VALUES("1","10:00am","6:00pm","2019-01-02 05:50:08","2019-01-02 07:50:53");



CREATE TABLE `languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO languages VALUES("1","en","2018-07-08 03:29:17","2019-12-24 21:04:20");



CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES("1","2014_10_12_000000_create_users_table","1");
INSERT INTO migrations VALUES("2","2014_10_12_100000_create_password_resets_table","1");
INSERT INTO migrations VALUES("3","2018_02_17_060412_create_categories_table","1");
INSERT INTO migrations VALUES("4","2018_02_20_035727_create_brands_table","1");
INSERT INTO migrations VALUES("5","2018_02_25_100635_create_suppliers_table","1");
INSERT INTO migrations VALUES("6","2018_02_27_101619_create_warehouse_table","1");
INSERT INTO migrations VALUES("7","2018_03_03_040448_create_units_table","1");
INSERT INTO migrations VALUES("8","2018_03_04_041317_create_taxes_table","1");
INSERT INTO migrations VALUES("9","2018_03_10_061915_create_customer_groups_table","1");
INSERT INTO migrations VALUES("10","2018_03_10_090534_create_customers_table","1");
INSERT INTO migrations VALUES("11","2018_03_11_095547_create_billers_table","1");
INSERT INTO migrations VALUES("12","2018_04_05_054401_create_products_table","1");
INSERT INTO migrations VALUES("13","2018_04_06_133606_create_purchases_table","1");
INSERT INTO migrations VALUES("14","2018_04_06_154600_create_product_purchases_table","1");
INSERT INTO migrations VALUES("15","2018_04_06_154915_create_product_warhouse_table","1");
INSERT INTO migrations VALUES("16","2018_04_10_085927_create_sales_table","1");
INSERT INTO migrations VALUES("17","2018_04_10_090133_create_product_sales_table","1");
INSERT INTO migrations VALUES("18","2018_04_10_090254_create_payments_table","1");
INSERT INTO migrations VALUES("19","2018_04_10_090341_create_payment_with_cheque_table","1");
INSERT INTO migrations VALUES("20","2018_04_10_090509_create_payment_with_credit_card_table","1");
INSERT INTO migrations VALUES("21","2018_04_13_121436_create_quotation_table","1");
INSERT INTO migrations VALUES("22","2018_04_13_122324_create_product_quotation_table","1");
INSERT INTO migrations VALUES("23","2018_04_14_121802_create_transfers_table","1");
INSERT INTO migrations VALUES("24","2018_04_14_121913_create_product_transfer_table","1");
INSERT INTO migrations VALUES("25","2018_05_13_082847_add_payment_id_and_change_sale_id_to_payments_table","2");
INSERT INTO migrations VALUES("26","2018_05_13_090906_change_customer_id_to_payment_with_credit_card_table","3");
INSERT INTO migrations VALUES("27","2018_05_20_054532_create_adjustments_table","4");
INSERT INTO migrations VALUES("28","2018_05_20_054859_create_product_adjustments_table","4");
INSERT INTO migrations VALUES("29","2018_05_21_163419_create_returns_table","5");
INSERT INTO migrations VALUES("30","2018_05_21_163443_create_product_returns_table","5");
INSERT INTO migrations VALUES("31","2018_06_02_050905_create_roles_table","6");
INSERT INTO migrations VALUES("32","2018_06_02_073430_add_columns_to_users_table","7");
INSERT INTO migrations VALUES("33","2018_06_03_053738_create_permission_tables","8");
INSERT INTO migrations VALUES("36","2018_06_21_063736_create_pos_setting_table","9");
INSERT INTO migrations VALUES("37","2018_06_21_094155_add_user_id_to_sales_table","10");
INSERT INTO migrations VALUES("38","2018_06_21_101529_add_user_id_to_purchases_table","11");
INSERT INTO migrations VALUES("39","2018_06_21_103512_add_user_id_to_transfers_table","12");
INSERT INTO migrations VALUES("40","2018_06_23_061058_add_user_id_to_quotations_table","13");
INSERT INTO migrations VALUES("41","2018_06_23_082427_add_is_deleted_to_users_table","14");
INSERT INTO migrations VALUES("42","2018_06_25_043308_change_email_to_users_table","15");
INSERT INTO migrations VALUES("43","2018_07_06_115449_create_general_settings_table","16");
INSERT INTO migrations VALUES("44","2018_07_08_043944_create_languages_table","17");
INSERT INTO migrations VALUES("45","2018_07_11_102144_add_user_id_to_returns_table","18");
INSERT INTO migrations VALUES("46","2018_07_11_102334_add_user_id_to_payments_table","18");
INSERT INTO migrations VALUES("47","2018_07_22_130541_add_digital_to_products_table","19");
INSERT INTO migrations VALUES("49","2018_07_24_154250_create_deliveries_table","20");
INSERT INTO migrations VALUES("50","2018_08_16_053336_create_expense_categories_table","21");
INSERT INTO migrations VALUES("51","2018_08_17_115415_create_expenses_table","22");
INSERT INTO migrations VALUES("55","2018_08_18_050418_create_gift_cards_table","23");
INSERT INTO migrations VALUES("56","2018_08_19_063119_create_payment_with_gift_card_table","24");
INSERT INTO migrations VALUES("57","2018_08_25_042333_create_gift_card_recharges_table","25");
INSERT INTO migrations VALUES("58","2018_08_25_101354_add_deposit_expense_to_customers_table","26");
INSERT INTO migrations VALUES("59","2018_08_26_043801_create_deposits_table","27");
INSERT INTO migrations VALUES("60","2018_09_02_044042_add_keybord_active_to_pos_setting_table","28");
INSERT INTO migrations VALUES("61","2018_09_09_092713_create_payment_with_paypal_table","29");
INSERT INTO migrations VALUES("62","2018_09_10_051254_add_currency_to_general_settings_table","30");
INSERT INTO migrations VALUES("63","2018_10_22_084118_add_biller_and_store_id_to_users_table","31");
INSERT INTO migrations VALUES("65","2018_10_26_034927_create_coupons_table","32");
INSERT INTO migrations VALUES("66","2018_10_27_090857_add_coupon_to_sales_table","33");
INSERT INTO migrations VALUES("67","2018_11_07_070155_add_currency_position_to_general_settings_table","34");
INSERT INTO migrations VALUES("68","2018_11_19_094650_add_combo_to_products_table","35");
INSERT INTO migrations VALUES("69","2018_12_09_043712_create_accounts_table","36");
INSERT INTO migrations VALUES("70","2018_12_17_112253_add_is_default_to_accounts_table","37");
INSERT INTO migrations VALUES("71","2018_12_19_103941_add_account_id_to_payments_table","38");
INSERT INTO migrations VALUES("72","2018_12_20_065900_add_account_id_to_expenses_table","39");
INSERT INTO migrations VALUES("73","2018_12_20_082753_add_account_id_to_returns_table","40");
INSERT INTO migrations VALUES("74","2018_12_26_064330_create_return_purchases_table","41");
INSERT INTO migrations VALUES("75","2018_12_26_144210_create_purchase_product_return_table","42");
INSERT INTO migrations VALUES("76","2018_12_26_144708_create_purchase_product_return_table","43");
INSERT INTO migrations VALUES("77","2018_12_27_110018_create_departments_table","44");
INSERT INTO migrations VALUES("78","2018_12_30_054844_create_employees_table","45");
INSERT INTO migrations VALUES("79","2018_12_31_125210_create_payrolls_table","46");
INSERT INTO migrations VALUES("80","2018_12_31_150446_add_department_id_to_employees_table","47");
INSERT INTO migrations VALUES("81","2019_01_01_062708_add_user_id_to_expenses_table","48");
INSERT INTO migrations VALUES("82","2019_01_02_075644_create_hrm_settings_table","49");
INSERT INTO migrations VALUES("83","2019_01_02_090334_create_attendances_table","50");
INSERT INTO migrations VALUES("84","2019_01_27_160956_add_three_columns_to_general_settings_table","51");
INSERT INTO migrations VALUES("85","2019_02_15_183303_create_stock_counts_table","52");
INSERT INTO migrations VALUES("86","2019_02_17_101604_add_is_adjusted_to_stock_counts_table","53");
INSERT INTO migrations VALUES("87","2019_04_13_101707_add_tax_no_to_customers_table","54");
INSERT INTO migrations VALUES("89","2019_10_14_111455_create_holidays_table","55");
INSERT INTO migrations VALUES("90","2019_11_13_145619_add_is_variant_to_products_table","56");
INSERT INTO migrations VALUES("91","2019_11_13_150206_create_product_variants_table","57");
INSERT INTO migrations VALUES("92","2019_11_13_153828_create_variants_table","57");
INSERT INTO migrations VALUES("93","2019_11_25_134041_add_qty_to_product_variants_table","58");
INSERT INTO migrations VALUES("94","2019_11_25_134922_add_variant_id_to_product_purchases_table","58");
INSERT INTO migrations VALUES("95","2019_11_25_145341_add_variant_id_to_product_warehouse_table","58");
INSERT INTO migrations VALUES("96","2019_11_29_182201_add_variant_id_to_product_sales_table","59");
INSERT INTO migrations VALUES("97","2019_12_04_121311_add_variant_id_to_product_quotation_table","60");
INSERT INTO migrations VALUES("98","2019_12_05_123802_add_variant_id_to_product_transfer_table","61");
INSERT INTO migrations VALUES("100","2019_12_08_114954_add_variant_id_to_product_returns_table","62");
INSERT INTO migrations VALUES("101","2019_12_08_203146_add_variant_id_to_purchase_product_return_table","63");
INSERT INTO migrations VALUES("102","2020_02_28_103340_create_money_transfers_table","64");
INSERT INTO migrations VALUES("103","2020_07_01_193151_add_image_to_categories_table","65");
INSERT INTO migrations VALUES("105","2020_09_26_130426_add_user_id_to_deliveries_table","66");
INSERT INTO migrations VALUES("107","2020_10_11_125457_create_cash_registers_table","67");
INSERT INTO migrations VALUES("108","2020_10_13_155019_add_cash_register_id_to_sales_table","68");
INSERT INTO migrations VALUES("109","2020_10_13_172624_add_cash_register_id_to_returns_table","69");
INSERT INTO migrations VALUES("110","2020_10_17_212338_add_cash_register_id_to_payments_table","70");
INSERT INTO migrations VALUES("111","2020_10_18_124200_add_cash_register_id_to_expenses_table","71");
INSERT INTO migrations VALUES("112","2020_10_21_121632_add_developed_by_to_general_settings_table","72");
INSERT INTO migrations VALUES("113","2019_08_19_000000_create_failed_jobs_table","73");
INSERT INTO migrations VALUES("114","2020_10_30_135557_create_notifications_table","73");
INSERT INTO migrations VALUES("115","2020_11_01_044954_create_currencies_table","74");
INSERT INTO migrations VALUES("116","2020_11_01_140736_add_price_to_product_warehouse_table","75");
INSERT INTO migrations VALUES("117","2020_11_02_050633_add_is_diff_price_to_products_table","76");
INSERT INTO migrations VALUES("118","2020_11_09_055222_add_user_id_to_customers_table","77");
INSERT INTO migrations VALUES("119","2020_11_17_054806_add_invoice_format_to_general_settings_table","78");



CREATE TABLE `money_transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_account_id` int(11) NOT NULL,
  `to_account_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO money_transfers VALUES("2","mtr-20200228-071852","1","1","5000000","2020-02-28 16:48:52","2021-07-01 14:33:37");
INSERT INTO money_transfers VALUES("3","mtr-20210404-121711","1","1","50000","2021-04-04 12:17:11","2021-04-04 12:17:11");
INSERT INTO money_transfers VALUES("4","mtr-20210714-025219","3","4","22","2021-07-14 02:52:19","2021-07-14 02:52:19");
INSERT INTO money_transfers VALUES("5","mtr-20211110-123021","3","4","7890000","2021-11-10 00:30:21","2021-11-10 00:30:21");



CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO notifications VALUES("249beded-5431-40a3-ba1e-d255ffb047a3","App\Notifications\SendNotification","App\User","9","{"message":"Please delete all pending purchase."}","2020-11-01 05:03:32","2020-11-01 05:03:07","2020-11-01 05:03:32");



CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payment_with_cheque` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `cheque_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payment_with_cheque VALUES("1","19","23425235235","2018-07-01 07:39:48","2018-07-01 07:39:48");
INSERT INTO payment_with_cheque VALUES("2","24","3123123123","2018-07-10 05:51:32","2018-07-10 05:51:32");
INSERT INTO payment_with_cheque VALUES("3","31","767867678","2018-08-08 15:06:22","2018-08-08 15:06:22");
INSERT INTO payment_with_cheque VALUES("4","34","3123412","2018-08-09 04:25:54","2018-08-09 04:25:54");
INSERT INTO payment_with_cheque VALUES("5","35","7765","2018-08-09 05:02:14","2018-08-09 05:02:14");
INSERT INTO payment_with_cheque VALUES("6","44","3124142412","2018-08-30 07:37:18","2018-08-30 07:37:18");
INSERT INTO payment_with_cheque VALUES("7","51","6576764646","2018-09-03 08:38:21","2018-09-03 08:38:21");
INSERT INTO payment_with_cheque VALUES("8","53","111111111","2018-09-03 08:45:24","2018-09-03 08:45:24");
INSERT INTO payment_with_cheque VALUES("9","79","1111","2018-10-06 04:21:55","2018-10-06 04:21:55");
INSERT INTO payment_with_cheque VALUES("10","147","221133","2018-12-04 04:28:35","2018-12-04 04:28:35");
INSERT INTO payment_with_cheque VALUES("11","175","1111","2019-02-07 10:08:23","2019-02-07 10:08:23");
INSERT INTO payment_with_cheque VALUES("12","176","1111","2019-02-07 10:24:59","2019-02-07 10:24:59");
INSERT INTO payment_with_cheque VALUES("13","178","420","2019-02-07 10:37:04","2019-02-07 10:37:04");
INSERT INTO payment_with_cheque VALUES("15","295","111122222","2020-10-18 08:47:24","2020-10-18 08:47:24");
INSERT INTO payment_with_cheque VALUES("16","332","333333","2021-07-02 18:49:13","2021-07-02 18:49:13");
INSERT INTO payment_with_cheque VALUES("17","339","222","2021-07-14 03:37:13","2021-07-14 03:37:13");
INSERT INTO payment_with_cheque VALUES("18","340","222","2021-07-14 03:39:48","2021-07-14 03:39:48");
INSERT INTO payment_with_cheque VALUES("19","346","222","2021-07-14 03:46:52","2021-07-14 03:46:52");
INSERT INTO payment_with_cheque VALUES("20","353","2222","2021-07-14 03:57:08","2021-07-14 03:57:08");



CREATE TABLE `payment_with_credit_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payment_with_credit_card VALUES("4","294","1","cus_IDw8z9yJZn4qH3","ch_1HdUGJKwOmA8HLXePiqphlky","2020-10-18 08:46:55","2020-10-18 08:46:55");



CREATE TABLE `payment_with_gift_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `gift_card_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payment_with_gift_card VALUES("1","36","2","2018-08-25 02:18:36","2018-08-25 05:27:35");
INSERT INTO payment_with_gift_card VALUES("4","39","1","2018-08-25 07:06:34","2018-08-25 07:06:34");
INSERT INTO payment_with_gift_card VALUES("6","50","1","2018-09-03 03:31:38","2018-09-03 03:31:38");
INSERT INTO payment_with_gift_card VALUES("8","293","1","2020-10-18 08:44:26","2020-10-18 08:44:26");



CREATE TABLE `payment_with_paypal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `change` double NOT NULL,
  `paying_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=372 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payments VALUES("33","spr-20180809-055453","1","","2","","1","1000","0","Cash","","2018-08-09 04:24:53","2018-08-09 04:24:53");
INSERT INTO payments VALUES("34","spr-20180809-055553","1","","2","","1","1200","0","Cheque","","2018-08-09 04:25:53","2018-08-09 04:26:36");
INSERT INTO payments VALUES("35","spr-20180809-063214","1","","3","","1","897","0","Cheque","","2018-08-09 05:02:14","2018-08-09 05:02:14");
INSERT INTO payments VALUES("36","spr-20180825-034836","1","","4","","1","100","0","Gift Card","100 bucks paid...","2018-08-25 02:18:36","2018-08-25 05:27:35");
INSERT INTO payments VALUES("39","spr-20180825-083634","1","","4","","1","200","0","Gift Card","","2018-08-25 07:06:34","2018-08-25 07:06:34");
INSERT INTO payments VALUES("41","spr-20180826-094836","1","","6","","1","20","0","Deposit","20 bucks paid","2018-08-26 08:18:36","2018-08-27 02:12:13");
INSERT INTO payments VALUES("42","spr-20180827-073545","1","","7","","1","880","0","Cash","","2018-08-27 06:05:45","2018-08-27 06:05:45");
INSERT INTO payments VALUES("43","ppr-20180830-071637","1","13","","","1","100","0","Cash","100 bucks paid...","2018-08-30 05:46:37","2018-08-30 05:46:37");
INSERT INTO payments VALUES("44","ppr-20180830-090718","1","13","","","1","200","0","Cheque","","2018-08-30 07:37:18","2018-08-30 07:37:18");
INSERT INTO payments VALUES("46","spr-20180902-053954","1","","8","","1","3529.8","0","Cash","fully paid","2018-09-02 04:09:54","2018-09-02 04:09:54");
INSERT INTO payments VALUES("49","spr-20180903-033314","1","","9","","1","20","0","Deposit","fully paid","2018-09-03 02:03:14","2018-09-03 02:03:14");
INSERT INTO payments VALUES("50","spr-20180903-050138","1","","10","","1","200","0","Gift Card","50 bucks due...","2018-09-03 03:31:38","2018-09-10 02:10:28");
INSERT INTO payments VALUES("51","spr-20180903-100821","1","","11","","1","5500","0","Cheque","","2018-09-03 08:38:21","2018-09-03 08:38:21");
INSERT INTO payments VALUES("53","ppr-20180903-101524","1","16","","","1","1750","0","Cheque","","2018-09-03 08:45:24","2018-10-06 04:39:20");
INSERT INTO payments VALUES("78","spr-20180926-092105","1","","31","","1","560","0","Cash","","2018-09-26 06:51:05","2018-09-26 06:51:05");
INSERT INTO payments VALUES("79","spr-20181006-065017","1","","30","","1","100","0","Cheque","","2018-10-06 04:20:17","2018-10-06 04:21:55");
INSERT INTO payments VALUES("80","spr-20181006-065222","1","","30","","1","20","0","Cash","","2018-10-06 04:22:22","2018-10-06 04:22:22");
INSERT INTO payments VALUES("82","ppr-20181006-070935","1","16","","","1","1600","0","Cash","","2018-10-06 04:39:35","2018-10-06 04:39:35");
INSERT INTO payments VALUES("83","spr-20181010-041636","1","","41","","1","461","0","Cash","","2018-10-10 01:46:36","2018-10-10 01:46:36");
INSERT INTO payments VALUES("84","spr-20181010-053456","1","","42","","1","440","0","Cash","","2018-10-10 03:04:56","2018-10-10 03:04:56");
INSERT INTO payments VALUES("91","spr-20181021-065338","1","","55","","1","250","0","Cash","","2018-10-21 04:23:38","2018-10-21 04:23:38");
INSERT INTO payments VALUES("92","spr-20181021-082618","1","","57","","1","575.2","0","Cash","","2018-10-21 05:56:18","2018-10-21 05:56:18");
INSERT INTO payments VALUES("93","spr-20181022-032730","1","","58","","1","1220","0","Cash","","2018-10-22 12:57:30","2018-10-22 12:57:30");
INSERT INTO payments VALUES("104","spr-20181023-071548","11","","73","","1","5500","0","Cash","","2018-10-23 04:45:48","2018-10-23 04:45:48");
INSERT INTO payments VALUES("105","spr-20181023-071648","1","","74","","1","2320","0","Cash","","2018-10-23 04:46:48","2018-10-23 04:46:48");
INSERT INTO payments VALUES("126","spr-20181101-050033","1","","75","","1","7678","0","Cash","","2018-11-01 02:30:33","2018-11-01 02:30:33");
INSERT INTO payments VALUES("127","spr-20181101-050130","1","","76","","1","1424","0","Cash","","2018-11-01 02:31:30","2018-11-08 07:14:51");
INSERT INTO payments VALUES("129","spr-20181105-091523","1","","79","","1","14454","0","Cash","","2018-11-05 06:45:23","2018-11-05 06:45:23");
INSERT INTO payments VALUES("130","spr-20181105-092002","1","","80","","1","2500","0","Cash","","2018-11-05 06:50:02","2018-11-05 06:50:02");
INSERT INTO payments VALUES("131","ppr-20181105-092128","1","24","","","1","15950","0","Cash","","2018-11-05 06:51:28","2018-11-05 06:51:28");
INSERT INTO payments VALUES("137","spr-20181105-095952","1","","86","","1","1100","0","Cash","","2018-11-05 07:29:52","2018-11-05 07:29:52");
INSERT INTO payments VALUES("138","spr-20181105-100310","1","","88","","1","1100","0","Cash","","2018-11-05 07:33:10","2018-11-05 07:33:10");
INSERT INTO payments VALUES("139","spr-20181126-020534","1","","94","","1","120","0","Cash","","2018-11-26 11:35:34","2018-11-26 11:35:34");
INSERT INTO payments VALUES("140","spr-20181128-071515","1","","96","","1","132","0","Cash","","2018-11-28 04:45:15","2018-11-28 04:45:15");
INSERT INTO payments VALUES("141","spr-20181201-060524","1","","97","","1","200","300","Cash","","2018-12-01 03:35:24","2018-12-04 03:51:05");
INSERT INTO payments VALUES("148","ppr-20181204-065932","1","23","","","1","500","500","Cash","","2018-12-04 04:29:32","2018-12-04 04:29:44");
INSERT INTO payments VALUES("149","ppr-20181205-053443","1","25","","","1","4450","550","Cash","","2018-12-05 03:04:43","2018-12-05 03:04:43");
INSERT INTO payments VALUES("150","spr-20181205-053608","1","","98","","1","800","200","Cash","","2018-12-05 03:06:08","2018-12-05 03:06:08");
INSERT INTO payments VALUES("151","spr-20181205-053724","1","","99","","1","800","0","Cash","","2018-12-05 03:07:24","2018-12-05 03:07:24");
INSERT INTO payments VALUES("152","spr-20181208-062032","1","","101","","1","100","400","Cash","","2018-12-08 03:50:32","2018-12-11 06:49:39");
INSERT INTO payments VALUES("157","ppr-20181220-063439","1","27","","","1","10","0","Cash","","2018-12-20 04:04:39","2018-12-20 04:05:01");
INSERT INTO payments VALUES("159","spr-20181224-045832","1","","103","","1","120","0","Cash","","2018-12-24 02:28:32","2018-12-24 02:28:32");
INSERT INTO payments VALUES("160","spr-20190101-054544","1","","105","","1","21","0","Cash","","2019-01-01 03:15:44","2019-01-01 03:15:44");
INSERT INTO payments VALUES("161","spr-20190101-091040","1","","106","","1","860","0","Cash","","2019-01-01 06:40:40","2019-01-01 06:40:40");
INSERT INTO payments VALUES("162","spr-20190103-065627","1","","107","","1","5040","960","Cash","","2019-01-03 04:26:27","2019-01-03 04:26:27");
INSERT INTO payments VALUES("163","spr-20190120-035824","1","","108","","1","120","0","Cash","","2019-01-20 13:28:24","2019-01-20 13:28:24");
INSERT INTO payments VALUES("164","ppr-20190129-100302","9","36","","","1","650","350","Cash","","2019-01-29 07:33:02","2019-01-29 07:33:02");
INSERT INTO payments VALUES("165","ppr-20190129-100324","9","34","","","1","2860","140","Cash","","2019-01-29 07:33:24","2019-01-29 07:33:24");
INSERT INTO payments VALUES("166","spr-20190129-101451","9","","109","","1","540","460","Cash","","2019-01-29 07:44:51","2019-01-29 07:44:51");
INSERT INTO payments VALUES("167","spr-20190129-115048","9","","110","","1","1700","300","Cash","","2019-01-29 09:20:48","2019-01-29 09:20:48");
INSERT INTO payments VALUES("168","spr-20190131-110839","9","","111","","1","271","0","Cash","","2019-01-31 08:38:39","2019-01-31 08:38:39");
INSERT INTO payments VALUES("169","spr-20190202-104045","1","","112","","1","440","0","Cash","","2019-02-02 08:10:45","2019-02-02 08:10:45");
INSERT INTO payments VALUES("170","spr-20190202-114117","1","","113","","1","350","0","Cash","","2019-02-02 09:11:17","2019-02-02 09:11:17");
INSERT INTO payments VALUES("171","spr-20190205-030454","1","","114","","1","440","0","Cash","","2019-02-05 12:34:54","2019-02-05 12:34:54");
INSERT INTO payments VALUES("176","ppr-20190207-125418","1","35","","","1","50","50","Cash","","2019-02-07 10:24:18","2019-02-07 10:35:23");
INSERT INTO payments VALUES("178","ppr-20190207-010640","1","35","","","1","50","50","Cheque","","2019-02-07 10:36:40","2019-02-07 10:37:04");
INSERT INTO payments VALUES("179","spr-20190207-010915","1","","120","","1","50","50","Cash","","2019-02-07 10:39:15","2019-02-07 10:39:15");
INSERT INTO payments VALUES("180","spr-20190209-104816","1","","121","","1","1272","728","Cash","","2019-02-09 08:18:16","2019-02-09 08:18:16");
INSERT INTO payments VALUES("181","ppr-20190209-104940","1","38","","","1","1660","5398340","Cash","","2019-02-09 08:19:40","2021-07-01 16:42:16");
INSERT INTO payments VALUES("183","spr-20190219-023214","1","","123","","1","440","0","Cash","","2019-02-19 12:02:14","2019-02-19 12:02:14");
INSERT INTO payments VALUES("189","spr-20190303-104010","1","","127","","1","2500","0","Cash","","2019-03-03 08:10:10","2019-03-03 08:10:10");
INSERT INTO payments VALUES("191","ppr-20190303-104222","1","37","","","1","4000","0","Cash","","2019-03-03 08:12:22","2019-03-03 08:12:22");
INSERT INTO payments VALUES("193","spr-20190404-095555","1","","128","","1","560","0","Cash","","2019-04-04 08:25:55","2019-04-04 08:25:55");
INSERT INTO payments VALUES("195","spr-20190404-095937","1","","129","","1","120","0","Cash","","2019-04-04 08:29:37","2019-04-04 08:29:37");
INSERT INTO payments VALUES("196","spr-20190421-122124","1","","130","","1","586","0","Cash","","2019-04-21 10:51:24","2019-04-21 10:51:24");
INSERT INTO payments VALUES("197","spr-20190528-103229","1","","131","","1","2890","0","Cash","","2019-05-28 09:02:29","2019-05-28 09:02:29");
INSERT INTO payments VALUES("198","ppr-20190613-101351","1","37","","","1","2390","0","Cash","","2019-06-13 08:43:51","2019-06-13 08:43:51");
INSERT INTO payments VALUES("199","spr-20190613-101637","1","","132","","1","840","0","Cash","","2019-06-13 08:46:37","2019-06-13 08:46:37");
INSERT INTO payments VALUES("201","spr-20190613-101752","1","","133","","1","2700","0","Cash","","2019-06-13 08:47:52","2019-06-13 08:47:52");
INSERT INTO payments VALUES("203","spr-20191019-033028","1","","134","","1","2940","60","Cash","","2019-10-19 13:00:28","2019-10-19 13:00:28");
INSERT INTO payments VALUES("205","spr-20191103-114044","1","","139","","1","488","12","Cash","","2019-11-03 09:10:44","2019-11-03 09:10:44");
INSERT INTO payments VALUES("211","spr-20191109-074131","1","","144","","1","1220","0","Cash","","2019-11-09 17:11:31","2019-11-09 17:11:31");
INSERT INTO payments VALUES("217","spr-20191111-104008","1","","147","","1","2220","780","Cash","","2019-11-11 08:10:08","2019-11-11 08:10:08");
INSERT INTO payments VALUES("222","spr-20191203-115128","1","","163","","1","3","0","Cash","","2019-12-03 09:21:28","2019-12-03 09:21:28");
INSERT INTO payments VALUES("228","spr-20191205-092712","1","","173","","1","621","0","Cash","","2019-12-05 06:57:12","2019-12-05 06:57:12");
INSERT INTO payments VALUES("239","spr-20191222-104058","1","","187","","1","288","212","Cash","","2019-12-22 08:10:58","2019-12-22 08:10:58");
INSERT INTO payments VALUES("241","spr-20191223-125946","1","","190","","1","1100","400","Cash","","2019-12-23 10:29:46","2019-12-23 10:29:46");
INSERT INTO payments VALUES("246","spr-20200101-022028","1","","193","","1","1100","400","Cash","","2020-01-01 11:50:28","2020-01-01 11:50:28");
INSERT INTO payments VALUES("252","spr-20200102-043947","1","","194","","1","892","108","Cash","","2020-01-02 14:09:47","2020-01-02 14:09:47");
INSERT INTO payments VALUES("258","spr-20200203-035256","1","","201","","1","120","880","Cash","","2020-02-03 13:22:56","2020-02-03 13:22:56");
INSERT INTO payments VALUES("259","spr-20200204-105853","1","","202","","1","1400","100","Cash","","2020-02-04 20:28:53","2020-02-04 20:28:53");
INSERT INTO payments VALUES("261","spr-20200302-115414","1","","203","","1","350","150","Cash","","2020-03-02 09:24:14","2020-03-02 09:24:14");
INSERT INTO payments VALUES("262","spr-20200302-115741","1","","204","","1","40","10","Cash","","2020-03-02 09:27:41","2020-03-02 09:27:41");
INSERT INTO payments VALUES("265","spr-20200311-044642","1","","205","","1","352","148","Cash","","2020-03-11 14:16:42","2020-03-11 14:16:42");
INSERT INTO payments VALUES("267","spr-20200406-074024","1","","207","","1","500","500","Cash","","2020-04-06 18:10:24","2020-04-06 18:10:24");
INSERT INTO payments VALUES("268","spr-20200406-074201","1","","207","","1","144","56","Cash","","2020-04-06 18:12:01","2020-04-06 18:12:01");
INSERT INTO payments VALUES("269","spr-20200506-105950","1","","208","","1","1540","460","Cash","","2020-05-06 21:29:50","2020-05-06 21:29:50");
INSERT INTO payments VALUES("270","spr-20200609-124248","1","","209","","1","1220","780","Cash","","2020-06-09 11:12:48","2020-06-09 11:12:48");
INSERT INTO payments VALUES("273","spr-20200703-063914","1","","212","","1","2585","415","Cash","","2020-07-03 17:09:14","2020-07-03 17:09:14");
INSERT INTO payments VALUES("274","spr-20200712-095153","1","","213","","1","13","37","Cash","","2020-07-12 20:21:53","2020-07-12 20:21:53");
INSERT INTO payments VALUES("276","spr-20200727-083808","1","","217","","1","385","0","Cash","","2020-07-27 19:08:08","2020-07-27 19:08:08");
INSERT INTO payments VALUES("277","spr-20200727-084024","1","","218","","1","385","0","Cash","","2020-07-27 19:10:24","2020-07-27 19:10:24");
INSERT INTO payments VALUES("278","spr-20200727-084645","1","","219","","1","385","0","Cash","","2020-07-27 19:16:45","2020-07-27 19:16:45");
INSERT INTO payments VALUES("279","spr-20200812-062806","1","","220","","1","760","240","Cash","","2020-08-12 16:58:06","2020-08-12 16:58:06");
INSERT INTO payments VALUES("281","spr-20200812-063035","1","","221","","1","1100","0","Cash","","2020-08-12 17:00:35","2020-08-12 17:00:35");
INSERT INTO payments VALUES("282","spr-20200816-100426","1","","222","","1","23000","2000","Cash","","2020-08-16 20:34:26","2020-08-16 20:34:26");
INSERT INTO payments VALUES("283","spr-20200816-100523","1","","223","","1","300","200","Cash","","2020-08-16 20:35:23","2020-08-16 20:35:23");
INSERT INTO payments VALUES("284","spr-20200816-100632","1","","223","","1","100","0","Cash","","2020-08-16 20:36:32","2020-08-16 20:36:32");
INSERT INTO payments VALUES("285","spr-20200816-100735","1","","223","","1","40","0","Cash","","2020-08-16 20:37:35","2020-08-16 20:37:35");
INSERT INTO payments VALUES("290","spr-20201017-092854","9","","230","2","1","200","0","Cash","","2020-10-17 18:58:54","2020-10-18 08:18:54");
INSERT INTO payments VALUES("291","spr-20201018-105138","9","","230","2","1","50","0","Cash","","2020-10-18 08:21:38","2020-10-18 08:21:38");
INSERT INTO payments VALUES("292","spr-20201018-111333","9","","231","2","1","100","0","Cash","","2020-10-18 08:43:33","2020-10-18 08:43:33");
INSERT INTO payments VALUES("293","spr-20201018-111426","9","","231","2","1","50","0","Gift Card","","2020-10-18 08:44:26","2020-10-18 08:44:26");
INSERT INTO payments VALUES("294","spr-20201018-111651","9","","231","2","1","50","0","Credit Card","","2020-10-18 08:46:51","2020-10-18 08:46:51");
INSERT INTO payments VALUES("295","spr-20201018-111724","9","","231","2","1","50","0","Cheque","","2020-10-18 08:47:24","2020-10-18 08:47:24");
INSERT INTO payments VALUES("296","spr-20201022-013018","9","","232","2","1","100","0","Cash","","2020-10-22 11:00:18","2020-10-22 11:00:18");
INSERT INTO payments VALUES("297","spr-20201022-015606","1","","233","3","1","250","0","Cash","","2020-10-22 11:26:06","2020-10-22 11:26:06");
INSERT INTO payments VALUES("298","spr-20201024-070508","1","","234","4","1","11500","0","Cash","","2020-10-24 04:35:08","2020-10-24 04:35:08");
INSERT INTO payments VALUES("299","spr-20201024-070753","1","","235","4","1","250","0","Cash","","2020-10-24 04:37:53","2020-10-24 04:37:53");
INSERT INTO payments VALUES("300","spr-20201024-034619","1","","237","4","1","61900","0","Cash","","2020-10-24 13:16:19","2020-10-24 13:16:19");
INSERT INTO payments VALUES("302","spr-20201027-054004","1","","239","3","1","2","0","Cash","","2020-10-27 03:10:04","2020-10-27 03:10:04");
INSERT INTO payments VALUES("303","spr-20201027-054207","1","","240","3","1","6","0","Cash","","2020-10-27 03:12:07","2020-10-27 03:12:07");
INSERT INTO payments VALUES("304","spr-20201027-063202","1","","241","4","1","250","0","Cash","","2020-10-27 04:02:02","2020-10-27 04:02:02");
INSERT INTO payments VALUES("305","spr-20201029-073033","1","","242","4","1","250","0","Cash","","2020-10-29 05:00:33","2020-10-29 05:00:33");
INSERT INTO payments VALUES("306","spr-20201101-072115","1","","243","4","1","250","0","Cash","","2020-11-01 04:51:15","2020-11-01 04:51:15");
INSERT INTO payments VALUES("307","spr-20201101-074225","1","","245","3","1","1130","0","Cash","","2020-11-01 05:12:25","2020-11-01 05:12:25");
INSERT INTO payments VALUES("308","spr-20201101-075019","1","","246","4","1","440","0","Cash","","2020-11-01 05:20:19","2020-11-01 05:20:19");
INSERT INTO payments VALUES("310","spr-20201106-013042","1","","250","4","1","378.4","0","Cash","","2020-11-06 11:00:42","2020-11-06 11:00:42");
INSERT INTO payments VALUES("311","spr-20201109-011527","1","","251","4","1","500","0","Cash","","2020-11-09 10:45:27","2020-11-09 10:45:27");
INSERT INTO payments VALUES("312","spr-20201111-055902","1","","252","3","1","229.5","0","Cash","","2020-11-11 03:29:02","2020-11-11 03:29:02");
INSERT INTO payments VALUES("313","spr-20201114-064739","1","","253","4","1","10242.5","0","Cash","","2020-11-14 04:17:39","2020-11-14 04:17:39");
INSERT INTO payments VALUES("316","spr-20201117-064751","1","","256","4","1","715","0","Cash","","2020-11-17 04:17:51","2020-11-17 04:17:51");
INSERT INTO payments VALUES("317","spr-20201117-070920","1","","257","4","1","250","0","Cash","","2020-11-17 04:39:20","2020-11-17 04:39:20");
INSERT INTO payments VALUES("321","spr-20201118-065242","1","","258","4","1","27200","0","Cash","","2020-11-18 04:22:42","2020-11-18 04:22:42");
INSERT INTO payments VALUES("322","spr-20210404-093712","1","","260","4","1","794","0","Paypal","","2021-04-04 09:37:12","2021-04-04 09:37:12");
INSERT INTO payments VALUES("323","spr-20210404-093712","1","","259","4","1","794","-794","Cash","","2021-04-04 09:37:12","2021-04-04 09:37:12");
INSERT INTO payments VALUES("324","spr-20210428-110410","1","","261","3","1","602.8","0","Cash","aaaaaaaaaaaaa","2021-04-28 23:04:10","2021-04-28 23:04:10");
INSERT INTO payments VALUES("325","ppr-20210629-031457","1","39","","","1","500365.2","0","Cash","sss","2021-06-29 15:14:57","2021-06-29 15:14:57");
INSERT INTO payments VALUES("326","spr-20210630-075424","1","","262","4","3","3028","0","Cash","","2021-06-30 19:54:24","2021-06-30 19:54:24");
INSERT INTO payments VALUES("327","spr-20210701-115643","1","","263","4","3","440","610","Cash","","2021-07-01 11:56:43","2021-07-01 11:56:43");
INSERT INTO payments VALUES("328","spr-20210701-115726","1","","263","4","3","0","0","Cash","","2021-07-01 11:57:26","2021-07-01 11:57:26");
INSERT INTO payments VALUES("329","spr-20210701-050433","1","","266","4","3","439","0","Paypal","","2021-07-01 17:04:33","2021-07-01 17:04:33");
INSERT INTO payments VALUES("330","spr-20210701-074046","1","","267","4","3","1200","0","Cash","","2021-07-01 19:40:46","2021-07-01 19:40:46");
INSERT INTO payments VALUES("331","spr-20210702-040253","1","","268","3","3","3320","0","Cash","","2021-07-02 16:02:53","2021-07-02 16:02:53");
INSERT INTO payments VALUES("332","ppr-20210702-042819","1","41","","","3","23575","0","Cheque","","2021-07-02 16:28:19","2021-07-02 18:49:13");
INSERT INTO payments VALUES("333","ppr-20210702-060149","1","41","","","3","0","0","Cash","","2021-07-02 18:01:49","2021-07-02 18:01:49");
INSERT INTO payments VALUES("334","spr-20210702-070625","1","","269","4","3","6712","0","Credit Card","","2021-07-02 19:06:25","2021-07-02 19:06:25");
INSERT INTO payments VALUES("335","spr-20210702-070936","1","","270","3","3","2013029","0","Cash","","2021-07-02 19:09:36","2021-07-02 19:09:36");
INSERT INTO payments VALUES("336","spr-20210703-043118","1","","265","3","3","1962","0","Cash","","2021-07-03 16:31:18","2021-07-03 16:31:18");
INSERT INTO payments VALUES("337","spr-20210714-014652","1","","271","4","3","22","0","Cash","","2021-07-14 01:46:52","2021-07-14 01:46:52");
INSERT INTO payments VALUES("338","spr-20210714-033644","1","","272","4","3","529","0","Paypal","","2021-07-14 03:36:44","2021-07-14 03:36:44");
INSERT INTO payments VALUES("339","spr-20210714-033713","1","","273","4","3","961","0","Cheque","22","2021-07-14 03:37:13","2021-07-14 03:37:13");
INSERT INTO payments VALUES("340","spr-20210714-033948","1","","274","4","3","1299","0","Cheque","22","2021-07-14 03:39:48","2021-07-14 03:39:48");
INSERT INTO payments VALUES("341","spr-20210714-034014","1","","275","4","3","385","0","Gift Card","","2021-07-14 03:40:14","2021-07-14 03:40:14");
INSERT INTO payments VALUES("342","spr-20210714-034157","1","","276","4","3","1485","0","Paypal","","2021-07-14 03:41:57","2021-07-14 03:41:57");
INSERT INTO payments VALUES("343","spr-20210714-034217","1","","277","4","3","385","0","Paypal","ss","2021-07-14 03:42:17","2021-07-14 03:42:17");
INSERT INTO payments VALUES("344","spr-20210714-034242","1","","278","4","3","770","330","Cash","ss","2021-07-14 03:42:42","2021-07-14 03:42:42");
INSERT INTO payments VALUES("345","spr-20210714-034630","1","","279","4","3","385","0","Paypal","","2021-07-14 03:46:30","2021-07-14 03:46:30");
INSERT INTO payments VALUES("346","spr-20210714-034652","1","","280","4","3","385","0","Cheque","","2021-07-14 03:46:52","2021-07-14 03:46:52");
INSERT INTO payments VALUES("347","spr-20210714-034924","1","","281","4","3","385","0","Paypal","","2021-07-14 03:49:24","2021-07-14 03:49:24");
INSERT INTO payments VALUES("348","spr-20210714-035205","1","","282","4","3","385","0","Cash","","2021-07-14 03:52:05","2021-07-14 03:52:05");
INSERT INTO payments VALUES("349","spr-20210714-035237","1","","284","4","3","385","0","Cheque","","2021-07-14 03:52:37","2021-07-14 03:52:37");
INSERT INTO payments VALUES("350","spr-20210714-035319","1","","285","4","3","385","0","Cheque","","2021-07-14 03:53:19","2021-07-14 03:53:19");
INSERT INTO payments VALUES("351","spr-20210714-035514","1","","286","4","3","385","0","Deposit","","2021-07-14 03:55:14","2021-07-14 03:55:14");
INSERT INTO payments VALUES("352","spr-20210714-035627","1","","287","4","3","385","0","Cheque","","2021-07-14 03:56:27","2021-07-14 03:56:27");
INSERT INTO payments VALUES("353","spr-20210714-035708","1","","288","4","3","385","0","Cheque","","2021-07-14 03:57:08","2021-07-14 03:57:08");
INSERT INTO payments VALUES("354","spr-20210714-040241","1","","289","4","3","6545","0","Cash","","2021-07-14 04:02:41","2021-07-14 04:02:41");
INSERT INTO payments VALUES("355","spr-20210714-042619","1","","290","5","3","3184","0","Cash","","2021-07-14 04:26:19","2021-07-14 04:26:19");
INSERT INTO payments VALUES("356","spr-20210714-043403","1","","291","5","3","2501","0","Paypal","","2021-07-14 04:34:03","2021-07-14 04:34:03");
INSERT INTO payments VALUES("357","spr-20210714-043419","1","","292","5","3","385","0","Paypal","","2021-07-14 04:34:19","2021-07-14 04:34:19");
INSERT INTO payments VALUES("358","spr-20210714-043437","1","","293","5","3","385","0","Paypal","dd","2021-07-14 04:34:37","2021-07-14 04:34:37");
INSERT INTO payments VALUES("359","spr-20210714-043453","1","","294","5","3","385","0","Credit Card","dd","2021-07-14 04:34:53","2021-07-14 04:34:53");
INSERT INTO payments VALUES("360","spr-20210714-043508","1","","295","5","3","385","0","Credit Card","dd","2021-07-14 04:35:08","2021-07-14 04:35:08");
INSERT INTO payments VALUES("361","spr-20210714-043643","1","","296","5","3","529","0","Cash","dd","2021-07-14 04:36:43","2021-07-14 04:36:43");
INSERT INTO payments VALUES("362","spr-20210714-043709","1","","297","5","3","914","0","Cheque","dd","2021-07-14 04:37:09","2021-07-14 04:37:09");
INSERT INTO payments VALUES("363","spr-20210714-043802","1","","298","5","3","385","0","Cheque","","2021-07-14 04:38:02","2021-07-14 04:38:02");
INSERT INTO payments VALUES("364","spr-20210714-043825","1","","299","5","3","385","0","Credit Card","","2021-07-14 04:38:25","2021-07-14 04:38:25");
INSERT INTO payments VALUES("365","spr-20210714-050228","1","","301","5","3","385","0","Cash","","2021-07-14 05:02:28","2021-07-14 05:02:28");
INSERT INTO payments VALUES("366","spr-20210714-050246","1","","302","5","3","385","0","Paypal","","2021-07-14 05:02:46","2021-07-14 05:02:46");
INSERT INTO payments VALUES("367","spr-20210714-050705","1","","304","3","3","385","0","Cash","","2021-07-14 05:07:05","2021-07-14 05:07:05");
INSERT INTO payments VALUES("368","spr-20210714-050727","1","","305","3","3","385","0","Cash","","2021-07-14 05:07:27","2021-07-14 05:07:27");
INSERT INTO payments VALUES("369","spr-20210714-050758","1","","306","3","3","385","0","Credit Card","","2021-07-14 05:07:58","2021-07-14 05:07:58");
INSERT INTO payments VALUES("370","spr-20211109-051229","1","","307","3","3","59713","0","Credit Card","پرداخت شد","2021-11-09 17:12:29","2021-11-09 17:12:29");
INSERT INTO payments VALUES("371","spr-20211110-010203","1","","308","3","3","497","0","Cheque","","2021-11-10 01:02:03","2021-11-10 01:02:03");



CREATE TABLE `payrolls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `paying_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payrolls VALUES("8","payroll-20190101-055231","1","1","1","100","0","","2019-01-01 03:22:31","2019-01-01 03:22:31");
INSERT INTO payrolls VALUES("9","payroll-20191204-113802","1","1","1","10000","2","","2019-12-04 21:08:02","2021-07-01 15:07:00");
INSERT INTO payrolls VALUES("10","payroll-20211110-011311","1","3","1","3400000","0","","2021-11-10 01:13:11","2021-11-10 01:13:11");



CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO permissions VALUES("4","products-edit","web","2018-06-03 05:30:09","2018-06-03 05:30:09");
INSERT INTO permissions VALUES("5","products-delete","web","2018-06-04 03:24:22","2018-06-04 03:24:22");
INSERT INTO permissions VALUES("6","products-add","web","2018-06-04 05:04:14","2018-06-04 05:04:14");
INSERT INTO permissions VALUES("7","products-index","web","2018-06-04 08:04:27","2018-06-04 08:04:27");
INSERT INTO permissions VALUES("8","purchases-index","web","2018-06-04 12:33:19","2018-06-04 12:33:19");
INSERT INTO permissions VALUES("9","purchases-add","web","2018-06-04 12:42:25","2018-06-04 12:42:25");
INSERT INTO permissions VALUES("10","purchases-edit","web","2018-06-04 14:17:36","2018-06-04 14:17:36");
INSERT INTO permissions VALUES("11","purchases-delete","web","2018-06-04 14:17:36","2018-06-04 14:17:36");
INSERT INTO permissions VALUES("12","sales-index","web","2018-06-04 15:19:08","2018-06-04 15:19:08");
INSERT INTO permissions VALUES("13","sales-add","web","2018-06-04 15:19:52","2018-06-04 15:19:52");
INSERT INTO permissions VALUES("14","sales-edit","web","2018-06-04 15:19:52","2018-06-04 15:19:52");
INSERT INTO permissions VALUES("15","sales-delete","web","2018-06-04 15:19:53","2018-06-04 15:19:53");
INSERT INTO permissions VALUES("16","quotes-index","web","2018-06-05 02:35:10","2018-06-05 02:35:10");
INSERT INTO permissions VALUES("17","quotes-add","web","2018-06-05 02:35:10","2018-06-05 02:35:10");
INSERT INTO permissions VALUES("18","quotes-edit","web","2018-06-05 02:35:10","2018-06-05 02:35:10");
INSERT INTO permissions VALUES("19","quotes-delete","web","2018-06-05 02:35:10","2018-06-05 02:35:10");
INSERT INTO permissions VALUES("20","transfers-index","web","2018-06-05 03:00:03","2018-06-05 03:00:03");
INSERT INTO permissions VALUES("21","transfers-add","web","2018-06-05 03:00:03","2018-06-05 03:00:03");
INSERT INTO permissions VALUES("22","transfers-edit","web","2018-06-05 03:00:03","2018-06-05 03:00:03");
INSERT INTO permissions VALUES("23","transfers-delete","web","2018-06-05 03:00:03","2018-06-05 03:00:03");
INSERT INTO permissions VALUES("24","returns-index","web","2018-06-05 03:20:24","2018-06-05 03:20:24");
INSERT INTO permissions VALUES("25","returns-add","web","2018-06-05 03:20:24","2018-06-05 03:20:24");
INSERT INTO permissions VALUES("26","returns-edit","web","2018-06-05 03:20:25","2018-06-05 03:20:25");
INSERT INTO permissions VALUES("27","returns-delete","web","2018-06-05 03:20:25","2018-06-05 03:20:25");
INSERT INTO permissions VALUES("28","customers-index","web","2018-06-05 03:45:54","2018-06-05 03:45:54");
INSERT INTO permissions VALUES("29","customers-add","web","2018-06-05 03:45:55","2018-06-05 03:45:55");
INSERT INTO permissions VALUES("30","customers-edit","web","2018-06-05 03:45:55","2018-06-05 03:45:55");
INSERT INTO permissions VALUES("31","customers-delete","web","2018-06-05 03:45:55","2018-06-05 03:45:55");
INSERT INTO permissions VALUES("32","suppliers-index","web","2018-06-05 04:10:12","2018-06-05 04:10:12");
INSERT INTO permissions VALUES("33","suppliers-add","web","2018-06-05 04:10:12","2018-06-05 04:10:12");
INSERT INTO permissions VALUES("34","suppliers-edit","web","2018-06-05 04:10:12","2018-06-05 04:10:12");
INSERT INTO permissions VALUES("35","suppliers-delete","web","2018-06-05 04:10:12","2018-06-05 04:10:12");
INSERT INTO permissions VALUES("36","product-report","web","2018-06-25 03:35:33","2018-06-25 03:35:33");
INSERT INTO permissions VALUES("37","purchase-report","web","2018-06-25 03:54:56","2018-06-25 03:54:56");
INSERT INTO permissions VALUES("38","sale-report","web","2018-06-25 04:03:13","2018-06-25 04:03:13");
INSERT INTO permissions VALUES("39","customer-report","web","2018-06-25 04:06:51","2018-06-25 04:06:51");
INSERT INTO permissions VALUES("40","due-report","web","2018-06-25 04:09:52","2018-06-25 04:09:52");
INSERT INTO permissions VALUES("41","users-index","web","2018-06-25 04:30:10","2018-06-25 04:30:10");
INSERT INTO permissions VALUES("42","users-add","web","2018-06-25 04:30:10","2018-06-25 04:30:10");
INSERT INTO permissions VALUES("43","users-edit","web","2018-06-25 04:31:30","2018-06-25 04:31:30");
INSERT INTO permissions VALUES("44","users-delete","web","2018-06-25 04:31:30","2018-06-25 04:31:30");
INSERT INTO permissions VALUES("45","profit-loss","web","2018-07-15 02:20:05","2018-07-15 02:20:05");
INSERT INTO permissions VALUES("46","best-seller","web","2018-07-15 02:31:38","2018-07-15 02:31:38");
INSERT INTO permissions VALUES("47","daily-sale","web","2018-07-15 02:54:21","2018-07-15 02:54:21");
INSERT INTO permissions VALUES("48","monthly-sale","web","2018-07-15 03:00:41","2018-07-15 03:00:41");
INSERT INTO permissions VALUES("49","daily-purchase","web","2018-07-15 03:06:46","2018-07-15 03:06:46");
INSERT INTO permissions VALUES("50","monthly-purchase","web","2018-07-15 03:18:17","2018-07-15 03:18:17");
INSERT INTO permissions VALUES("51","payment-report","web","2018-07-15 03:40:41","2018-07-15 03:40:41");
INSERT INTO permissions VALUES("52","warehouse-stock-report","web","2018-07-15 03:46:55","2018-07-15 03:46:55");
INSERT INTO permissions VALUES("53","product-qty-alert","web","2018-07-15 04:03:21","2018-07-15 04:03:21");
INSERT INTO permissions VALUES("54","supplier-report","web","2018-07-30 07:30:01","2018-07-30 07:30:01");
INSERT INTO permissions VALUES("55","expenses-index","web","2018-09-05 05:37:10","2018-09-05 05:37:10");
INSERT INTO permissions VALUES("56","expenses-add","web","2018-09-05 05:37:10","2018-09-05 05:37:10");
INSERT INTO permissions VALUES("57","expenses-edit","web","2018-09-05 05:37:10","2018-09-05 05:37:10");
INSERT INTO permissions VALUES("58","expenses-delete","web","2018-09-05 05:37:11","2018-09-05 05:37:11");
INSERT INTO permissions VALUES("59","general_setting","web","2018-10-20 02:40:04","2018-10-20 02:40:04");
INSERT INTO permissions VALUES("60","mail_setting","web","2018-10-20 02:40:04","2018-10-20 02:40:04");
INSERT INTO permissions VALUES("61","pos_setting","web","2018-10-20 02:40:04","2018-10-20 02:40:04");
INSERT INTO permissions VALUES("62","hrm_setting","web","2019-01-02 14:00:23","2019-01-02 14:00:23");
INSERT INTO permissions VALUES("63","purchase-return-index","web","2019-01-03 01:15:14","2019-01-03 01:15:14");
INSERT INTO permissions VALUES("64","purchase-return-add","web","2019-01-03 01:15:14","2019-01-03 01:15:14");
INSERT INTO permissions VALUES("65","purchase-return-edit","web","2019-01-03 01:15:14","2019-01-03 01:15:14");
INSERT INTO permissions VALUES("66","purchase-return-delete","web","2019-01-03 01:15:14","2019-01-03 01:15:14");
INSERT INTO permissions VALUES("67","account-index","web","2019-01-03 01:36:13","2019-01-03 01:36:13");
INSERT INTO permissions VALUES("68","balance-sheet","web","2019-01-03 01:36:14","2019-01-03 01:36:14");
INSERT INTO permissions VALUES("69","account-statement","web","2019-01-03 01:36:14","2019-01-03 01:36:14");
INSERT INTO permissions VALUES("70","department","web","2019-01-03 02:00:01","2019-01-03 02:00:01");
INSERT INTO permissions VALUES("71","attendance","web","2019-01-03 02:00:01","2019-01-03 02:00:01");
INSERT INTO permissions VALUES("72","payroll","web","2019-01-03 02:00:01","2019-01-03 02:00:01");
INSERT INTO permissions VALUES("73","employees-index","web","2019-01-03 02:22:19","2019-01-03 02:22:19");
INSERT INTO permissions VALUES("74","employees-add","web","2019-01-03 02:22:19","2019-01-03 02:22:19");
INSERT INTO permissions VALUES("75","employees-edit","web","2019-01-03 02:22:19","2019-01-03 02:22:19");
INSERT INTO permissions VALUES("76","employees-delete","web","2019-01-03 02:22:19","2019-01-03 02:22:19");
INSERT INTO permissions VALUES("77","user-report","web","2019-01-16 10:18:18","2019-01-16 10:18:18");
INSERT INTO permissions VALUES("78","stock_count","web","2019-02-17 14:02:01","2019-02-17 14:02:01");
INSERT INTO permissions VALUES("79","adjustment","web","2019-02-17 14:02:02","2019-02-17 14:02:02");
INSERT INTO permissions VALUES("80","sms_setting","web","2019-02-22 08:48:03","2019-02-22 08:48:03");
INSERT INTO permissions VALUES("81","create_sms","web","2019-02-22 08:48:03","2019-02-22 08:48:03");
INSERT INTO permissions VALUES("82","print_barcode","web","2019-03-07 08:32:19","2019-03-07 08:32:19");
INSERT INTO permissions VALUES("83","empty_database","web","2019-03-07 08:32:19","2019-03-07 08:32:19");
INSERT INTO permissions VALUES("84","customer_group","web","2019-03-07 09:07:15","2019-03-07 09:07:15");
INSERT INTO permissions VALUES("85","unit","web","2019-03-07 09:07:15","2019-03-07 09:07:15");
INSERT INTO permissions VALUES("86","tax","web","2019-03-07 09:07:15","2019-03-07 09:07:15");
INSERT INTO permissions VALUES("87","gift_card","web","2019-03-07 09:59:38","2019-03-07 09:59:38");
INSERT INTO permissions VALUES("88","coupon","web","2019-03-07 09:59:38","2019-03-07 09:59:38");
INSERT INTO permissions VALUES("89","holiday","web","2019-10-19 12:27:15","2019-10-19 12:27:15");
INSERT INTO permissions VALUES("90","warehouse-report","web","2019-10-22 09:30:23","2019-10-22 09:30:23");
INSERT INTO permissions VALUES("91","warehouse","web","2020-02-26 10:17:32","2020-02-26 10:17:32");
INSERT INTO permissions VALUES("92","brand","web","2020-02-26 10:29:59","2020-02-26 10:29:59");
INSERT INTO permissions VALUES("93","billers-index","web","2020-02-26 10:41:15","2020-02-26 10:41:15");
INSERT INTO permissions VALUES("94","billers-add","web","2020-02-26 10:41:15","2020-02-26 10:41:15");
INSERT INTO permissions VALUES("95","billers-edit","web","2020-02-26 10:41:15","2020-02-26 10:41:15");
INSERT INTO permissions VALUES("96","billers-delete","web","2020-02-26 10:41:15","2020-02-26 10:41:15");
INSERT INTO permissions VALUES("97","money-transfer","web","2020-03-02 09:11:48","2020-03-02 09:11:48");
INSERT INTO permissions VALUES("98","category","web","2020-07-13 16:43:16","2020-07-13 16:43:16");
INSERT INTO permissions VALUES("99","delivery","web","2020-07-13 16:43:16","2020-07-13 16:43:16");
INSERT INTO permissions VALUES("100","send_notification","web","2020-10-31 09:51:31","2020-10-31 09:51:31");
INSERT INTO permissions VALUES("101","today_sale","web","2020-10-31 10:27:04","2020-10-31 10:27:04");
INSERT INTO permissions VALUES("102","today_profit","web","2020-10-31 10:27:04","2020-10-31 10:27:04");
INSERT INTO permissions VALUES("103","currency","web","2020-11-09 03:53:11","2020-11-09 03:53:11");
INSERT INTO permissions VALUES("104","backup_database","web","2020-11-15 03:46:55","2020-11-15 03:46:55");



CREATE TABLE `pos_setting` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `product_number` int(11) NOT NULL,
  `keybord_active` tinyint(1) NOT NULL,
  `stripe_public_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_secret_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `pos_setting_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO pos_setting VALUES("1","11","1","1","4","0","pk_test_ITN7KOYiIsHSCQ0UMRcgaYUB","sk_test_TtQQaawhEYRwa3mU9CzttrEy","2018-09-02 07:47:04","2021-07-14 05:06:40");



CREATE TABLE `product_adjustments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_adjustments VALUES("2","2","1","6","+","2021-06-29 14:55:25","2021-06-29 14:55:25");
INSERT INTO product_adjustments VALUES("3","3","1","1","-","2021-07-01 11:55:33","2021-07-01 11:55:33");
INSERT INTO product_adjustments VALUES("4","4","1","1","-","2021-07-01 17:59:32","2021-07-01 17:59:32");



CREATE TABLE `product_purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `recieved` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_purchases VALUES("59","12","4","","200","200","1","1","0","0","0","200","2018-08-09 04:18:36","2018-08-09 04:18:36");
INSERT INTO product_purchases VALUES("60","12","5","","100","100","1","100","0","0","0","10000","2018-08-09 04:18:36","2018-08-09 04:18:36");
INSERT INTO product_purchases VALUES("66","13","2","","100","100","3","166.96","0","15","2504.35","19200","2018-08-09 04:19:55","2018-08-09 04:19:55");
INSERT INTO product_purchases VALUES("67","13","3","","100","100","1","200","0","0","0","20000","2018-08-09 04:19:55","2018-08-09 04:19:55");
INSERT INTO product_purchases VALUES("68","13","1","","150","150","1","320","0","10","4800","52800","2018-08-09 04:19:55","2018-08-09 04:19:55");
INSERT INTO product_purchases VALUES("69","13","10","","60","60","7","10","0","0","0","600","2018-08-09 04:19:55","2018-08-09 04:19:55");
INSERT INTO product_purchases VALUES("70","14","1","","100","100","1","320","0","10","3200","35200","2018-08-09 11:53:48","2018-08-09 11:53:48");
INSERT INTO product_purchases VALUES("71","14","2","","50","50","3","166.96","0","15","1252.17","9600","2018-08-09 11:53:48","2018-08-09 11:53:48");
INSERT INTO product_purchases VALUES("72","14","3","","100","100","1","200","0","0","0","20000","2018-08-09 11:53:49","2018-08-09 11:53:49");
INSERT INTO product_purchases VALUES("73","14","5","","100","100","1","100","0","0","0","10000","2018-08-09 11:53:49","2018-08-09 11:53:49");
INSERT INTO product_purchases VALUES("74","14","10","","50","50","7","10","0","0","0","500","2018-08-09 11:53:49","2018-08-09 11:53:49");
INSERT INTO product_purchases VALUES("76","15","22","","20","20","1","800","0","10","1600","17600","2018-09-03 08:36:46","2018-09-03 08:36:46");
INSERT INTO product_purchases VALUES("87","16","22","","20","20","1","800","0","10","1600","17600","2018-09-20 13:39:12","2018-09-20 13:39:12");
INSERT INTO product_purchases VALUES("89","18","4","","50","50","1","1","0","0","0","50","2018-10-22 13:56:25","2018-10-22 13:56:25");
INSERT INTO product_purchases VALUES("90","19","4","","50","50","1","1","0","0","0","50","2018-10-22 13:56:52","2018-10-22 13:56:52");
INSERT INTO product_purchases VALUES("91","20","25","","15","15","1","500","0","10","750","8250","2018-10-23 04:44:21","2018-10-23 04:44:21");
INSERT INTO product_purchases VALUES("93","21","25","","15","15","1","500","0","10","750","8250","2018-10-23 04:44:58","2018-10-23 04:44:58");
INSERT INTO product_purchases VALUES("94","22","22","","5","5","1","800","0","10","400","4400","2018-11-01 02:29:03","2018-11-01 02:29:03");
INSERT INTO product_purchases VALUES("96","23","22","","5","5","1","800","0","10","400","4400","2018-11-03 06:53:52","2018-11-03 06:53:52");
INSERT INTO product_purchases VALUES("97","24","22","","15","15","1","800","0","10","1200","13200","2018-11-05 06:48:19","2018-11-05 06:48:19");
INSERT INTO product_purchases VALUES("98","24","25","","5","5","1","500","0","10","250","2750","2018-11-05 06:48:19","2018-11-05 06:48:19");
INSERT INTO product_purchases VALUES("99","25","31","","15","15","1","250","0","0","0","3750","2018-12-05 03:04:30","2018-12-05 03:04:30");
INSERT INTO product_purchases VALUES("100","25","30","","15","15","1","50","0","0","0","750","2018-12-05 03:04:30","2018-12-05 03:04:30");
INSERT INTO product_purchases VALUES("101","26","31","","15","15","1","250","0","0","0","3750","2018-12-05 03:05:08","2018-12-05 03:05:08");
INSERT INTO product_purchases VALUES("102","26","30","","15","15","1","50","0","0","0","750","2018-12-05 03:05:08","2018-12-05 03:05:08");
INSERT INTO product_purchases VALUES("104","27","32","","10","10","1","1","0","0","0","10","2018-12-19 03:27:41","2018-12-19 03:27:41");
INSERT INTO product_purchases VALUES("112","33","33","","10","10","1","1","0","0","0","10","2018-12-24 06:34:21","2018-12-24 06:34:21");
INSERT INTO product_purchases VALUES("113","34","25","","2","2","1","500","0","10","100","1100","2019-01-03 04:31:24","2019-01-03 04:31:24");
INSERT INTO product_purchases VALUES("114","34","22","","2","2","1","800","0","10","160","1760","2019-01-03 04:31:24","2019-01-03 04:31:24");
INSERT INTO product_purchases VALUES("115","35","31","","2","2","1","250","0","0","0","500","2019-01-29 07:24:48","2019-01-29 07:24:48");
INSERT INTO product_purchases VALUES("116","35","30","","2","2","1","50","0","0","0","100","2019-01-29 07:24:48","2019-01-29 07:24:48");
INSERT INTO product_purchases VALUES("117","36","30","","3","3","1","50","0","0","0","150","2019-01-29 07:25:58","2019-01-29 07:25:58");
INSERT INTO product_purchases VALUES("118","36","31","","2","2","1","250","0","0","0","500","2019-01-29 07:25:58","2019-01-29 07:25:58");
INSERT INTO product_purchases VALUES("123","38","32","","10","10","1","1","0","0","0","10","2019-02-09 08:15:24","2019-02-09 08:15:24");
INSERT INTO product_purchases VALUES("124","38","25","","3","3","1","500","0","10","150","1650","2019-02-09 08:15:24","2019-02-09 08:15:24");
INSERT INTO product_purchases VALUES("125","37","33","","10","10","1","1","0","0","0","10","2019-02-09 08:16:22","2019-02-09 08:16:22");
INSERT INTO product_purchases VALUES("126","37","25","","2","2","1","500","0","10","100","1100","2019-02-09 08:16:23","2019-02-09 08:16:23");
INSERT INTO product_purchases VALUES("127","37","22","","6","6","1","800","0","10","480","5280","2019-02-09 08:16:23","2019-02-09 08:16:23");
INSERT INTO product_purchases VALUES("129","40","31","","1","1","1","250","0","0","0","250","2021-07-01 19:25:08","2021-07-01 19:25:08");
INSERT INTO product_purchases VALUES("130","40","60","9","1","1","1","1","0","0","0","1","2021-07-01 19:25:08","2021-07-01 19:25:08");
INSERT INTO product_purchases VALUES("131","41","1","","1","1","1","320","0","10","32","352","2021-07-02 16:23:14","2021-07-02 16:23:14");
INSERT INTO product_purchases VALUES("132","41","22","","1","1","1","800","0","10","80","880","2021-07-02 16:23:14","2021-07-02 16:23:14");
INSERT INTO product_purchases VALUES("133","39","1","","1","1","1","320","0","10","32","352","2021-07-02 16:23:39","2021-07-02 16:23:39");
INSERT INTO product_purchases VALUES("134","42","25","","1","1","4","500","0","10","50","550","2021-07-07 15:33:19","2021-07-07 15:33:19");
INSERT INTO product_purchases VALUES("135","43","1","","3","3","1","320","0","10","96","1056","2021-07-07 15:34:04","2021-07-07 15:34:04");
INSERT INTO product_purchases VALUES("136","43","22","","1","1","1","800","0","10","80","880","2021-07-07 15:34:04","2021-07-07 15:34:04");
INSERT INTO product_purchases VALUES("137","43","25","","1","1","4","500","0","10","50","550","2021-07-07 15:34:04","2021-07-07 15:34:04");
INSERT INTO product_purchases VALUES("138","44","2","","1","0","3","166.96","0","15","25.04","192","2021-07-08 21:32:08","2021-07-08 21:32:08");
INSERT INTO product_purchases VALUES("139","44","1","","1","0","1","320","0","10","32","352","2021-07-08 21:32:08","2021-07-08 21:32:08");
INSERT INTO product_purchases VALUES("140","45","2","","1","1","3","166.96","0","15","25.04","192","2021-07-08 21:32:43","2021-07-08 21:32:43");
INSERT INTO product_purchases VALUES("141","46","31","","1","1","1","250","0","0","0","250","2021-11-10 00:18:58","2021-11-10 00:18:58");



CREATE TABLE `product_quotation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_quotation VALUES("2","1","1","","1","2","5030","10","15","754.5","5784.5","2018-08-09 04:22:50","2018-08-28 04:39:57");
INSERT INTO product_quotation VALUES("3","1","4","","50","1","1.5","25","10","7.5","82.5","2018-08-09 04:23:25","2018-08-28 05:04:36");
INSERT INTO product_quotation VALUES("4","1","2","","6","1","9.55","0","10","5.73","63","2018-08-28 05:33:48","2018-08-28 05:37:07");
INSERT INTO product_quotation VALUES("5","2","10","","2.5","7","22","0","0","0","55","2018-09-04 02:32:58","2018-09-20 15:07:41");
INSERT INTO product_quotation VALUES("6","2","13","","1","0","21","0","0","0","21","2018-09-04 02:32:58","2018-09-04 02:32:58");
INSERT INTO product_quotation VALUES("7","3","1","","1","1","400","0","10","40","440","2018-10-23 03:42:49","2019-12-21 10:11:37");
INSERT INTO product_quotation VALUES("19","3","48","2","1","1","13","0","0","0","13","2019-12-07 12:20:02","2019-12-21 10:11:37");
INSERT INTO product_quotation VALUES("27","11","61","","2","1","10000","0","15","3000","23000","2020-10-24 06:38:14","2020-10-24 06:58:35");
INSERT INTO product_quotation VALUES("28","12","1","","1","1","360","0","10","36","396","2021-04-04 10:34:22","2021-04-04 10:34:22");
INSERT INTO product_quotation VALUES("29","13","1","","1","1","360","0","10","36","396","2021-07-01 11:55:03","2021-07-01 11:55:03");
INSERT INTO product_quotation VALUES("30","14","4","","2","1","2","0","0","0","4","2021-07-01 14:13:43","2021-07-01 14:13:43");
INSERT INTO product_quotation VALUES("31","14","1","","1","1","400","0","10","40","440","2021-07-01 14:13:43","2021-07-01 14:13:43");
INSERT INTO product_quotation VALUES("32","15","1","","1","1","400","0","10","40","440","2021-07-14 02:32:41","2021-07-14 02:32:41");
INSERT INTO product_quotation VALUES("33","16","4","","2","1","1.8","0","0","0","3.6","2021-07-14 02:34:29","2021-07-14 02:34:29");
INSERT INTO product_quotation VALUES("34","16","13","","1","0","18.9","0","0","0","18.9","2021-07-14 02:34:29","2021-07-14 02:34:29");
INSERT INTO product_quotation VALUES("35","17","62","12","1","1","2","0","0","0","2","2021-07-14 02:39:29","2021-11-10 00:56:46");



CREATE TABLE `product_returns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_returns VALUES("3","2","4","","20","1","2","0","0","0","40","","");
INSERT INTO product_returns VALUES("4","3","10","","2","7","22","0","0","0","44","","2018-10-07 05:49:40");
INSERT INTO product_returns VALUES("6","5","3","","1","1","250","0","0","0","250","","2018-12-26 01:46:08");
INSERT INTO product_returns VALUES("12","6","1","","1","1","400","0","10","40","440","","");
INSERT INTO product_returns VALUES("23","11","13","","1","0","21","0","0","0","21","2019-12-24 08:50:29","2019-12-24 08:50:29");
INSERT INTO product_returns VALUES("26","13","61","","1","1","10000","0","15","1500","11500","2020-08-16 20:55:02","2020-08-16 20:55:02");
INSERT INTO product_returns VALUES("27","14","1","","1","1","400","0","10","40","440","2020-10-13 15:09:54","2020-10-13 15:09:54");
INSERT INTO product_returns VALUES("31","18","61","","1","1","10000","0","15","1500","11500","2020-11-18 04:32:18","2020-11-18 04:32:18");
INSERT INTO product_returns VALUES("32","19","10","","1","7","22","0","0","0","22","2021-06-29 13:10:00","2021-06-29 13:10:00");
INSERT INTO product_returns VALUES("33","20","26","","1","0","1250","0","0","0","1250","2021-06-29 13:11:04","2021-06-29 13:11:04");
INSERT INTO product_returns VALUES("34","20","2","","1","2","125.22","0","15","18.78","144","2021-06-29 13:11:04","2021-06-29 13:11:04");
INSERT INTO product_returns VALUES("35","20","1","","1","1","400","0","10","40","440","2021-06-29 13:11:04","2021-06-29 13:11:04");



CREATE TABLE `product_sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=486 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_sales VALUES("1","1","2","","1","2","104.35","0","15","15.65","120","2018-08-08 15:06:23","2018-08-08 15:43:27");
INSERT INTO product_sales VALUES("3","1","5","","2","1","115","10","0","0","230","2018-08-08 15:43:28","2018-08-08 15:43:28");
INSERT INTO product_sales VALUES("4","2","1","","10","1","420","0","10","420","4620","2018-08-09 04:24:53","2018-08-09 04:24:53");
INSERT INTO product_sales VALUES("5","2","4","","50","1","2.1","0","0","0","105","2018-08-09 04:24:53","2018-08-09 04:24:53");
INSERT INTO product_sales VALUES("6","2","2","","3","2","109.57","0","15","49.3","378","2018-08-09 04:24:53","2018-08-09 04:24:53");
INSERT INTO product_sales VALUES("7","3","4","","20","1","2.1","0","0","0","42","2018-08-09 05:02:15","2018-08-09 05:02:15");
INSERT INTO product_sales VALUES("8","3","5","","5","1","126","0","0","0","630","2018-08-09 05:02:15","2018-08-09 05:02:15");
INSERT INTO product_sales VALUES("9","3","3","","1","1","225","0","0","0","225","2018-08-09 05:02:15","2018-08-09 05:02:15");
INSERT INTO product_sales VALUES("10","4","1","","2","1","400","0","10","80","880","2018-08-25 02:18:37","2018-08-25 02:18:37");
INSERT INTO product_sales VALUES("12","6","13","","1","0","18.9","0","0","0","18.9","2018-08-26 08:18:36","2018-08-26 10:18:05");
INSERT INTO product_sales VALUES("13","7","1","","2","1","400","0","10","80","880","2018-08-27 06:05:45","2018-08-27 06:05:45");
INSERT INTO product_sales VALUES("14","8","5","","2","2","1440","0","10","288","3168","2018-09-02 04:09:54","2018-09-02 04:09:54");
INSERT INTO product_sales VALUES("15","9","4","","10","1","2","0","0","0","20","2018-09-03 02:03:14","2018-09-03 02:03:14");
INSERT INTO product_sales VALUES("16","10","3","","1","1","250","0","0","0","250","2018-09-03 03:31:39","2018-09-03 03:31:39");
INSERT INTO product_sales VALUES("17","11","22","","5","1","1000","0","10","500","5500","2018-09-03 08:38:21","2018-09-03 08:38:21");
INSERT INTO product_sales VALUES("18","12","22","","10","1","1050","0","10","1050","11550","2018-09-03 08:40:33","2018-09-03 08:40:33");
INSERT INTO product_sales VALUES("46","29","5","","1","1","120","0","0","0","120","2018-09-09 08:08:41","2018-09-09 08:08:41");
INSERT INTO product_sales VALUES("47","30","1","","1","1","400","0","10","40","440","2018-09-10 03:27:06","2018-09-20 13:42:38");
INSERT INTO product_sales VALUES("48","31","1","","1","1","400","0","10","40","440","2018-09-26 06:50:59","2018-09-26 06:51:25");
INSERT INTO product_sales VALUES("49","31","2","","1","2","104.35","0","15","15.65","120","2018-09-26 06:50:59","2018-09-26 06:51:25");
INSERT INTO product_sales VALUES("50","32","1","","1","1","400","0","10","40","440","2018-10-04 07:25:48","2018-10-04 07:25:48");
INSERT INTO product_sales VALUES("51","33","1","","1","1","400","0","10","40","440","2018-10-04 07:30:23","2018-10-04 07:30:23");
INSERT INTO product_sales VALUES("57","37","3","","1","1","250","0","0","0","250","2018-10-07 04:16:05","2018-10-07 04:16:05");
INSERT INTO product_sales VALUES("58","38","1","","1","1","400","0","10","40","440","2018-10-07 04:17:19","2018-10-07 04:17:19");
INSERT INTO product_sales VALUES("61","40","1","","1","1","400","0","10","40","440","2018-10-07 04:43:12","2018-10-07 04:43:12");
INSERT INTO product_sales VALUES("62","41","1","","1","1","400","0","10","40","440","2018-10-10 01:46:21","2018-10-10 01:46:21");
INSERT INTO product_sales VALUES("63","41","13","","1","0","21","0","0","0","21","2018-10-10 01:46:21","2018-10-10 01:46:21");
INSERT INTO product_sales VALUES("64","42","1","","1","1","400","0","10","40","440","2018-10-10 03:04:51","2018-10-10 03:04:51");
INSERT INTO product_sales VALUES("65","43","1","","1","1","400","0","10","40","440","2018-10-16 01:04:35","2018-10-16 01:04:35");
INSERT INTO product_sales VALUES("78","55","3","","1","1","250","0","0","0","250","2018-10-21 04:23:34","2018-10-21 04:23:34");
INSERT INTO product_sales VALUES("80","57","1","","1","1","400","0","10","40","440","2018-10-21 05:56:12","2018-10-21 05:56:12");
INSERT INTO product_sales VALUES("81","57","13","","2","0","21","0","0","0","42","2018-10-21 05:56:13","2018-10-21 05:56:13");
INSERT INTO product_sales VALUES("82","58","22","","1","1","1000","0","10","100","1100","2018-10-22 12:57:24","2018-10-22 12:57:24");
INSERT INTO product_sales VALUES("83","58","5","","1","1","120","0","0","0","120","2018-10-22 12:57:24","2018-10-22 12:57:24");
INSERT INTO product_sales VALUES("101","73","25","","3","1","1000","0","10","300","3300","2018-10-23 04:45:43","2018-10-23 04:45:43");
INSERT INTO product_sales VALUES("102","73","22","","2","1","1000","0","10","200","2200","2018-10-23 04:45:44","2018-10-23 04:45:44");
INSERT INTO product_sales VALUES("103","74","22","","1","1","1000","0","10","100","1100","2018-10-23 04:46:44","2018-10-23 04:46:44");
INSERT INTO product_sales VALUES("104","74","25","","1","1","1000","0","10","100","1100","2018-10-23 04:46:44","2018-10-23 04:46:44");
INSERT INTO product_sales VALUES("105","74","5","","1","1","120","0","0","0","120","2018-10-23 04:46:44","2018-10-23 04:46:44");
INSERT INTO product_sales VALUES("106","75","2","","3","2","104.35","0","15","46.96","360","2018-11-01 02:30:27","2018-11-01 02:30:27");
INSERT INTO product_sales VALUES("107","75","22","","2","1","1000","0","10","200","2200","2018-11-01 02:30:27","2018-11-01 02:30:27");
INSERT INTO product_sales VALUES("108","75","25","","3","1","1000","0","10","300","3300","2018-11-01 02:30:27","2018-11-01 02:30:27");
INSERT INTO product_sales VALUES("109","75","1","","2","1","400","0","10","80","880","2018-11-01 02:30:27","2018-11-01 02:30:27");
INSERT INTO product_sales VALUES("110","75","5","","2","1","120","0","0","0","240","2018-11-01 02:30:27","2018-11-01 02:30:27");
INSERT INTO product_sales VALUES("111","76","3","","1","1","250","0","0","0","250","2018-11-01 02:31:26","2018-11-03 06:58:56");
INSERT INTO product_sales VALUES("112","76","22","","1","1","1000","0","10","100","1100","2018-11-01 02:31:27","2018-11-03 06:58:56");
INSERT INTO product_sales VALUES("113","76","13","","4","0","21","0","0","0","84","2018-11-01 02:31:27","2018-11-03 06:58:56");
INSERT INTO product_sales VALUES("117","79","1","","4","1","400","0","10","160","1760","2018-11-05 06:45:17","2018-11-05 06:45:17");
INSERT INTO product_sales VALUES("118","79","2","","7","2","104.35","0","15","109.57","840","2018-11-05 06:45:17","2018-11-05 06:45:17");
INSERT INTO product_sales VALUES("119","79","3","","7","1","250","0","0","0","1750","2018-11-05 06:45:17","2018-11-05 06:45:17");
INSERT INTO product_sales VALUES("120","79","4","","7","1","2","0","0","0","14","2018-11-05 06:45:17","2018-11-05 06:45:17");
INSERT INTO product_sales VALUES("121","79","22","","8","1","1000","0","10","800","8800","2018-11-05 06:45:17","2018-11-05 06:45:17");
INSERT INTO product_sales VALUES("122","79","13","","10","0","21","0","0","0","210","2018-11-05 06:45:17","2018-11-05 06:45:17");
INSERT INTO product_sales VALUES("123","79","5","","9","1","120","0","0","0","1080","2018-11-05 06:45:17","2018-11-05 06:45:17");
INSERT INTO product_sales VALUES("124","80","2","","2","2","104.35","0","15","31.3","240","2018-11-05 06:49:58","2018-11-05 06:49:58");
INSERT INTO product_sales VALUES("125","80","3","","2","1","250","0","0","0","500","2018-11-05 06:49:58","2018-11-05 06:49:58");
INSERT INTO product_sales VALUES("126","80","1","","4","1","400","0","10","160","1760","2018-11-05 06:49:58","2018-11-05 06:49:58");
INSERT INTO product_sales VALUES("132","86","22","","1","1","1000","0","10","100","1100","2018-11-05 07:29:48","2018-11-05 07:29:48");
INSERT INTO product_sales VALUES("134","88","22","","1","1","1000","0","10","100","1100","2018-11-05 07:32:58","2018-11-05 07:32:58");
INSERT INTO product_sales VALUES("142","94","2","","1","2","104.35","0","15","15.65","120","2018-11-26 11:35:34","2018-11-26 11:35:34");
INSERT INTO product_sales VALUES("143","95","5","","3","1","120","0","0","0","360","2018-11-27 07:06:08","2018-11-27 07:06:08");
INSERT INTO product_sales VALUES("144","95","5","","3","1","120","0","0","0","360","2018-11-27 07:06:08","2018-11-27 07:06:08");
INSERT INTO product_sales VALUES("145","96","2","","1","2","104.35","0","15","15.65","120","2018-11-28 04:45:09","2018-11-28 04:45:09");
INSERT INTO product_sales VALUES("146","97","2","","2","2","104.35","0","15","31.3","240","2018-12-01 03:35:18","2018-12-01 03:35:18");
INSERT INTO product_sales VALUES("147","97","10","","1","7","22","0","0","0","22","2018-12-01 03:35:18","2018-12-01 03:35:18");
INSERT INTO product_sales VALUES("148","98","30","","2","1","100","0","0","0","200","2018-12-05 03:05:58","2018-12-05 03:05:58");
INSERT INTO product_sales VALUES("149","98","31","","2","1","300","0","0","0","600","2018-12-05 03:05:58","2018-12-05 03:05:58");
INSERT INTO product_sales VALUES("150","99","30","","2","1","100","0","0","0","200","2018-12-05 03:07:19","2018-12-05 03:07:19");
INSERT INTO product_sales VALUES("151","99","31","","2","1","300","0","0","0","600","2018-12-05 03:07:20","2018-12-05 03:07:20");
INSERT INTO product_sales VALUES("153","101","30","","1","1","100","0","0","0","100","2018-12-08 03:50:26","2018-12-08 03:50:26");
INSERT INTO product_sales VALUES("155","103","2","","1","2","104.35","0","15","15.65","120","2018-12-24 02:28:32","2018-12-24 02:28:32");
INSERT INTO product_sales VALUES("156","104","33","","4","1","2","0","0","0","8","2018-12-24 06:45:27","2018-12-25 01:25:23");
INSERT INTO product_sales VALUES("157","104","26","","2","0","1250","0","0","0","2500","2018-12-25 01:17:54","2018-12-25 01:25:23");
INSERT INTO product_sales VALUES("158","105","13","","1","0","21","0","0","0","21","2019-01-01 03:15:38","2019-01-01 03:15:38");
INSERT INTO product_sales VALUES("159","106","2","","1","2","104.35","0","15","15.65","120","2019-01-01 06:40:40","2019-01-01 06:40:40");
INSERT INTO product_sales VALUES("160","106","3","","2","1","250","0","0","0","500","2019-01-01 06:40:40","2019-01-01 06:40:40");
INSERT INTO product_sales VALUES("161","106","5","","2","1","120","0","0","0","240","2019-01-01 06:40:40","2019-01-01 06:40:40");
INSERT INTO product_sales VALUES("162","107","3","","2","1","250","0","0","0","500","2019-01-03 04:26:27","2019-01-03 04:26:27");
INSERT INTO product_sales VALUES("163","107","5","","2","1","120","0","0","0","240","2019-01-03 04:26:27","2019-01-03 04:26:27");
INSERT INTO product_sales VALUES("164","107","22","","2","1","1000","0","10","200","2200","2019-01-03 04:26:27","2019-01-03 04:26:27");
INSERT INTO product_sales VALUES("165","107","25","","1","1","1000","0","10","100","1100","2019-01-03 04:26:27","2019-01-03 04:26:27");
INSERT INTO product_sales VALUES("166","107","1","","2","1","400","0","10","80","880","2019-01-03 04:26:27","2019-01-03 04:26:27");
INSERT INTO product_sales VALUES("167","107","2","","1","2","104.35","0","15","15.65","120","2019-01-03 04:26:27","2019-01-03 04:26:27");
INSERT INTO product_sales VALUES("168","108","2","","1","2","104.35","0","15","15.65","120","2019-01-20 13:28:24","2019-01-20 13:28:24");
INSERT INTO product_sales VALUES("169","109","1","","1","1","400","0","10","40","440","2019-01-29 07:44:43","2019-01-29 07:44:43");
INSERT INTO product_sales VALUES("170","109","30","","1","1","100","0","0","0","100","2019-01-29 07:44:43","2019-01-29 07:44:43");
INSERT INTO product_sales VALUES("171","110","31","","2","1","300","0","0","0","600","2019-01-29 09:20:41","2019-01-29 09:20:41");
INSERT INTO product_sales VALUES("172","110","25","","1","1","1000","0","10","100","1100","2019-01-29 09:20:41","2019-01-29 09:20:41");
INSERT INTO product_sales VALUES("173","111","3","","1","1","250","0","0","0","250","2019-01-31 08:38:39","2019-01-31 08:38:39");
INSERT INTO product_sales VALUES("174","111","13","","1","0","21","0","0","0","21","2019-01-31 08:38:39","2019-01-31 08:38:39");
INSERT INTO product_sales VALUES("175","112","1","","1","1","400","0","10","40","440","2019-02-02 08:10:45","2019-02-02 08:10:45");
INSERT INTO product_sales VALUES("176","113","3","","1","1","250","0","0","0","250","2019-02-02 09:11:17","2019-02-02 09:11:17");
INSERT INTO product_sales VALUES("177","113","30","","1","1","100","0","0","0","100","2019-02-02 09:11:17","2019-02-02 09:11:17");
INSERT INTO product_sales VALUES("178","114","1","","1","1","400","0","10","40","440","2019-02-05 12:34:45","2019-02-05 12:34:45");
INSERT INTO product_sales VALUES("183","118","1","","1","1","400","0","10","40","440","2019-02-07 08:45:42","2019-02-07 08:45:42");
INSERT INTO product_sales VALUES("185","120","1","","1","1","400","0","10","40","440","2019-02-07 09:10:37","2019-02-07 09:10:37");
INSERT INTO product_sales VALUES("186","121","3","","1","1","250","0","0","0","250","2019-02-09 08:18:14","2019-02-09 08:18:14");
INSERT INTO product_sales VALUES("187","121","2","","1","2","104.35","0","15","15.65","120","2019-02-09 08:18:14","2019-02-09 08:18:14");
INSERT INTO product_sales VALUES("188","121","4","","10","1","2","0","0","0","20","2019-02-09 08:18:15","2019-02-09 08:18:15");
INSERT INTO product_sales VALUES("189","121","13","","2","0","21","0","0","0","42","2019-02-09 08:18:15","2019-02-09 08:18:15");
INSERT INTO product_sales VALUES("190","121","1","","1","1","400","0","10","40","440","2019-02-09 08:18:15","2019-02-09 08:18:15");
INSERT INTO product_sales VALUES("191","121","31","","1","1","300","0","0","0","300","2019-02-09 08:18:15","2019-02-09 08:18:15");
INSERT INTO product_sales VALUES("192","121","30","","1","1","100","0","0","0","100","2019-02-09 08:18:15","2019-02-09 08:18:15");
INSERT INTO product_sales VALUES("194","123","1","","1","1","400","0","10","40","440","2019-02-19 12:02:14","2019-02-19 12:02:14");
INSERT INTO product_sales VALUES("198","127","31","","1","1","300","0","0","0","300","2019-03-03 08:10:10","2019-03-03 08:10:10");
INSERT INTO product_sales VALUES("199","127","25","","1","1","1000","0","10","100","1100","2019-03-03 08:10:10","2019-03-03 08:10:10");
INSERT INTO product_sales VALUES("200","127","22","","1","1","1000","0","10","100","1100","2019-03-03 08:10:10","2019-03-03 08:10:10");
INSERT INTO product_sales VALUES("201","128","1","","1","1","400","0","10","40","440","2019-04-04 08:25:55","2019-04-04 08:25:55");
INSERT INTO product_sales VALUES("202","128","2","","1","2","104.35","0","15","15.65","120","2019-04-04 08:25:55","2019-04-04 08:25:55");
INSERT INTO product_sales VALUES("203","129","5","","2","1","120","0","0","0","240","2019-04-04 08:29:37","2019-04-11 09:20:16");
INSERT INTO product_sales VALUES("204","130","1","","1","1","400","0","10","40","440","2019-04-21 10:51:24","2019-04-21 10:51:24");
INSERT INTO product_sales VALUES("205","130","2","","1","2","125.22","0","15","18.78","144","2019-04-21 10:51:24","2019-04-21 10:51:24");
INSERT INTO product_sales VALUES("206","130","4","","1","1","2","0","0","0","2","2019-04-21 10:51:24","2019-04-21 10:51:24");
INSERT INTO product_sales VALUES("207","131","1","","1","1","400","0","10","40","440","2019-05-28 09:02:29","2019-05-28 09:02:29");
INSERT INTO product_sales VALUES("208","131","3","","1","1","250","0","0","0","250","2019-05-28 09:02:29","2019-05-28 09:02:29");
INSERT INTO product_sales VALUES("209","131","25","","1","1","1000","0","10","100","1100","2019-05-28 09:02:29","2019-05-28 09:02:29");
INSERT INTO product_sales VALUES("210","131","22","","1","1","1000","0","10","100","1100","2019-05-28 09:02:29","2019-05-28 09:02:29");
INSERT INTO product_sales VALUES("211","132","1","","1","1","400","0","10","40","440","2019-06-13 08:46:37","2019-06-13 08:46:37");
INSERT INTO product_sales VALUES("212","132","30","","1","1","100","0","0","0","100","2019-06-13 08:46:37","2019-06-13 08:46:37");
INSERT INTO product_sales VALUES("213","132","31","","1","1","300","0","0","0","300","2019-06-13 08:46:37","2019-06-13 08:46:37");
INSERT INTO product_sales VALUES("214","133","3","","2","1","250","0","0","0","500","2019-06-13 08:47:51","2019-06-13 08:47:51");
INSERT INTO product_sales VALUES("215","133","25","","1","1","1000","0","10","100","1100","2019-06-13 08:47:52","2019-06-13 08:47:52");
INSERT INTO product_sales VALUES("216","133","22","","1","1","1000","0","10","100","1100","2019-06-13 08:47:52","2019-06-13 08:47:52");
INSERT INTO product_sales VALUES("217","134","1","","1","1","400","0","10","40","440","2019-10-19 13:00:28","2019-10-19 13:00:28");
INSERT INTO product_sales VALUES("218","134","22","","1","1","1000","0","10","100","1100","2019-10-19 13:00:28","2019-10-19 13:00:28");
INSERT INTO product_sales VALUES("219","134","25","","1","1","1000","0","10","100","1100","2019-10-19 13:00:28","2019-10-19 13:00:28");
INSERT INTO product_sales VALUES("220","134","31","","1","1","300","0","0","0","300","2019-10-19 13:00:28","2019-10-19 13:00:28");
INSERT INTO product_sales VALUES("224","138","5","","1","1","120","0","0","0","120","2019-10-31 09:59:37","2019-10-31 09:59:37");
INSERT INTO product_sales VALUES("225","139","2","","2","2","125.22","0","15","37.57","288","2019-11-03 09:10:44","2019-11-03 09:10:44");
INSERT INTO product_sales VALUES("226","139","4","","100","1","2","0","0","0","200","2019-11-03 09:10:44","2019-11-03 09:10:44");
INSERT INTO product_sales VALUES("236","144","22","","1","1","1000","0","10","100","1100","2019-11-09 17:11:31","2019-11-09 17:11:31");
INSERT INTO product_sales VALUES("237","144","5","","1","1","120","0","0","0","120","2019-11-09 17:11:31","2019-11-09 17:11:31");
INSERT INTO product_sales VALUES("241","147","22","","1","1","1000","0","10","100","1100","2019-11-11 08:10:08","2019-11-11 08:10:08");
INSERT INTO product_sales VALUES("242","147","25","","1","1","1000","0","10","100","1100","2019-11-11 08:10:08","2019-11-11 08:10:08");
INSERT INTO product_sales VALUES("243","147","4","","10","1","2","0","0","0","20","2019-11-11 08:10:08","2019-11-11 08:10:08");
INSERT INTO product_sales VALUES("282","172","1","","1","1","400","0","10","40","440","2019-12-03 13:16:31","2019-12-03 13:16:31");
INSERT INTO product_sales VALUES("283","173","3","","1","1","225","0","0","0","225","2019-12-04 20:49:40","2019-12-04 20:49:40");
INSERT INTO product_sales VALUES("284","173","1","","1","1","360","0","10","36","396","2019-12-04 20:49:40","2019-12-04 20:49:40");
INSERT INTO product_sales VALUES("306","187","2","","2","2","125.22","0","15","37.57","288","2019-12-22 08:10:58","2019-12-22 08:10:58");
INSERT INTO product_sales VALUES("308","190","22","","1","1","1000","0","10","100","1100","2019-12-23 10:29:46","2019-12-23 10:29:46");
INSERT INTO product_sales VALUES("312","193","25","","1","1","1000","0","10","100","1100","2020-01-01 11:50:28","2020-01-01 11:50:28");
INSERT INTO product_sales VALUES("313","194","1","","2","1","400","0","10","80","880","2020-01-02 14:09:47","2020-01-02 14:09:47");
INSERT INTO product_sales VALUES("314","194","2","","1","1","10.43","0","15","1.57","12","2020-01-02 14:09:47","2020-01-02 14:09:47");
INSERT INTO product_sales VALUES("323","201","5","","1","1","120","0","0","0","120","2020-02-03 13:22:56","2020-02-03 13:22:56");
INSERT INTO product_sales VALUES("324","202","25","","1","1","1000","0","10","100","1100","2020-02-04 20:28:53","2020-02-04 20:28:53");
INSERT INTO product_sales VALUES("325","202","31","","1","1","300","0","0","0","300","2020-02-04 20:28:53","2020-02-04 20:28:53");
INSERT INTO product_sales VALUES("326","203","3","","1","1","250","0","0","0","250","2020-03-02 09:24:14","2020-03-02 09:24:14");
INSERT INTO product_sales VALUES("327","203","30","","1","1","100","0","0","0","100","2020-03-02 09:24:14","2020-03-02 09:24:14");
INSERT INTO product_sales VALUES("328","204","4","","20","1","2","0","0","0","40","2020-03-02 09:27:41","2020-03-02 09:27:41");
INSERT INTO product_sales VALUES("329","205","1","","1","1","400","0","10","40","440","2020-03-11 14:16:42","2020-03-11 14:16:42");
INSERT INTO product_sales VALUES("330","206","5","","1","1","120","0","0","0","120","2020-03-11 14:22:30","2020-03-11 14:24:04");
INSERT INTO product_sales VALUES("331","207","30","","2","1","100","0","0","0","200","2020-04-06 18:10:24","2020-04-06 18:11:11");
INSERT INTO product_sales VALUES("332","207","31","","1","1","300","0","0","0","300","2020-04-06 18:10:24","2020-04-06 18:11:11");
INSERT INTO product_sales VALUES("333","207","2","","1","2","125.22","0","15","18.78","144","2020-04-06 18:11:11","2020-04-06 18:11:11");
INSERT INTO product_sales VALUES("334","208","25","","1","1","1000","0","10","100","1100","2020-05-06 21:29:50","2020-05-06 21:29:50");
INSERT INTO product_sales VALUES("335","208","1","","1","1","400","0","10","40","440","2020-05-06 21:29:50","2020-05-06 21:29:50");
INSERT INTO product_sales VALUES("336","209","5","","1","1","120","0","0","0","120","2020-06-09 11:12:48","2020-06-09 11:12:48");
INSERT INTO product_sales VALUES("337","209","25","","1","1","1000","0","10","100","1100","2020-06-09 11:12:48","2020-06-09 11:12:48");
INSERT INTO product_sales VALUES("340","212","1","","1","1","350","0","10","35","385","2020-07-03 17:09:14","2020-07-03 17:09:14");
INSERT INTO product_sales VALUES("341","212","25","","1","1","1000","0","10","100","1100","2020-07-03 17:09:14","2020-07-03 17:09:14");
INSERT INTO product_sales VALUES("342","212","22","","1","1","1000","0","10","100","1100","2020-07-03 17:09:14","2020-07-03 17:09:14");
INSERT INTO product_sales VALUES("343","213","48","2","1","1","13","0","0","0","13","2020-07-12 20:21:53","2020-07-12 20:21:53");
INSERT INTO product_sales VALUES("344","214","3","","1","1","250","0","0","0","250","2020-07-14 10:23:41","2020-07-14 10:23:41");
INSERT INTO product_sales VALUES("347","217","1","","1","1","350","0","10","35","385","2020-07-27 19:08:08","2020-07-27 19:08:08");
INSERT INTO product_sales VALUES("348","218","1","","1","1","350","0","10","35","385","2020-07-27 19:10:24","2020-07-27 19:10:24");
INSERT INTO product_sales VALUES("349","219","1","","1","1","350","0","10","35","385","2020-07-27 19:16:45","2020-07-27 19:16:45");
INSERT INTO product_sales VALUES("350","220","31","","2","1","300","0","0","0","600","2020-08-12 16:58:04","2020-08-12 16:58:04");
INSERT INTO product_sales VALUES("351","220","33","","3","1","20","0","0","0","60","2020-08-12 16:58:04","2020-08-12 16:58:04");
INSERT INTO product_sales VALUES("352","220","30","","1","1","100","0","0","0","100","2020-08-12 16:58:04","2020-08-12 16:58:04");
INSERT INTO product_sales VALUES("353","221","25","","1","1","1000","0","10","100","1100","2020-08-12 17:00:35","2020-08-12 17:00:35");
INSERT INTO product_sales VALUES("354","222","61","","2","1","10000","0","15","3000","23000","2020-08-16 20:34:24","2020-08-16 20:34:24");
INSERT INTO product_sales VALUES("355","223","1","","1","1","400","0","10","40","440","2020-08-16 20:35:23","2020-08-16 20:35:23");
INSERT INTO product_sales VALUES("356","224","1","","3","1","390","30","10","117","1287","2020-08-26 18:31:39","2020-08-26 18:31:39");
INSERT INTO product_sales VALUES("362","230","3","","1","1","250","0","0","0","250","2020-10-17 18:58:52","2020-10-17 18:58:52");
INSERT INTO product_sales VALUES("363","231","1","","1","1","400","0","10","40","440","2020-10-18 08:43:33","2020-10-18 08:43:33");
INSERT INTO product_sales VALUES("364","232","30","","1","1","100","0","0","0","100","2020-10-22 11:00:14","2020-10-22 11:00:14");
INSERT INTO product_sales VALUES("365","233","3","","1","1","250","0","0","0","250","2020-10-22 11:26:04","2020-10-22 11:26:04");
INSERT INTO product_sales VALUES("366","234","61","","1","1","10000","0","15","1500","11500","2020-10-24 04:35:06","2020-10-24 04:35:06");
INSERT INTO product_sales VALUES("367","235","3","","1","1","250","0","0","0","250","2020-10-24 04:37:52","2020-10-24 04:37:52");
INSERT INTO product_sales VALUES("369","237","25","","2","1","1000","0","10","200","2200","2020-10-24 13:16:01","2020-10-24 13:16:01");
INSERT INTO product_sales VALUES("370","237","22","","2","1","1000","0","10","200","2200","2020-10-24 13:16:01","2020-10-24 13:16:01");
INSERT INTO product_sales VALUES("371","237","61","","5","1","10000","0","15","7500","57500","2020-10-24 13:16:01","2020-10-24 13:16:01");
INSERT INTO product_sales VALUES("373","239","60","9","1","1","2","0","0","0","2","2020-10-27 03:10:02","2020-10-27 03:10:02");
INSERT INTO product_sales VALUES("374","240","60","9","2","1","3","0","0","0","6","2020-10-27 03:12:06","2020-10-27 03:12:06");
INSERT INTO product_sales VALUES("375","241","3","","1","1","250","0","0","0","250","2020-10-27 04:02:00","2020-10-27 04:02:00");
INSERT INTO product_sales VALUES("376","242","3","","1","1","250","0","0","0","250","2020-10-29 05:00:30","2020-10-29 05:00:30");
INSERT INTO product_sales VALUES("377","243","3","","1","1","250","0","0","0","250","2020-11-01 04:51:12","2020-11-01 04:51:12");
INSERT INTO product_sales VALUES("380","245","1","","2","1","400","0","10","80","880","2020-11-01 05:12:23","2020-11-01 05:12:23");
INSERT INTO product_sales VALUES("381","245","3","","1","1","250","0","0","0","250","2020-11-01 05:12:23","2020-11-01 05:12:23");
INSERT INTO product_sales VALUES("382","246","1","","1","1","400","0","10","40","440","2020-11-01 05:20:18","2020-11-02 14:09:17");
INSERT INTO product_sales VALUES("386","250","1","","1","1","344","0","10","34.4","378.4","2020-11-06 11:00:41","2020-11-06 11:00:41");
INSERT INTO product_sales VALUES("387","251","1","","1","1","344","0","10","34.4","378.4","2020-11-09 10:45:24","2020-11-09 10:45:24");
INSERT INTO product_sales VALUES("388","251","3","","1","1","232.2","0","0","0","232.2","2020-11-09 10:45:24","2020-11-09 10:45:24");
INSERT INTO product_sales VALUES("389","252","3","","1","1","229.5","0","0","0","229.5","2020-11-11 03:28:58","2020-11-11 03:28:58");
INSERT INTO product_sales VALUES("390","253","3","","1","1","212.5","0","0","0","212.5","2020-11-14 04:17:36","2020-11-14 04:17:36");
INSERT INTO product_sales VALUES("391","253","31","","1","1","255","0","0","0","255","2020-11-14 04:17:36","2020-11-14 04:17:36");
INSERT INTO product_sales VALUES("392","253","61","","1","1","8500","0","15","1275","9775","2020-11-14 04:17:36","2020-11-14 04:17:36");
INSERT INTO product_sales VALUES("395","256","1","","1","1","400","0","10","40","440","2020-11-17 04:17:48","2020-11-17 04:17:48");
INSERT INTO product_sales VALUES("396","256","3","","1","1","250","0","10","25","275","2020-11-17 04:17:48","2020-11-17 04:17:48");
INSERT INTO product_sales VALUES("397","257","3","","1","1","250","0","0","0","250","2020-11-17 04:39:19","2020-11-17 04:39:19");
INSERT INTO product_sales VALUES("398","258","61","","3","1","10000","0","15","4500","34500","2020-11-18 04:22:39","2020-11-18 04:22:39");
INSERT INTO product_sales VALUES("399","259","2","","1","2","125.22","0","15","18.78","144","2021-04-04 09:37:08","2021-04-04 09:37:08");
INSERT INTO product_sales VALUES("400","259","3","","1","1","250","0","0","0","250","2021-04-04 09:37:08","2021-04-04 09:37:08");
INSERT INTO product_sales VALUES("401","259","31","","1","1","300","0","0","0","300","2021-04-04 09:37:08","2021-04-04 09:37:08");
INSERT INTO product_sales VALUES("402","259","30","","1","1","100","0","0","0","100","2021-04-04 09:37:08","2021-04-04 09:37:08");
INSERT INTO product_sales VALUES("407","261","1","","1","1","400","0","10","40","440","2021-04-28 23:04:08","2021-07-02 15:53:12");
INSERT INTO product_sales VALUES("408","262","2","","2","2","125.22","0","15","37.57","288","2021-06-30 19:54:24","2021-06-30 19:54:24");
INSERT INTO product_sales VALUES("409","262","1","","1","1","400","0","10","40","440","2021-06-30 19:54:24","2021-06-30 19:54:24");
INSERT INTO product_sales VALUES("410","262","25","","1","1","1000","0","10","100","1100","2021-06-30 19:54:24","2021-06-30 19:54:24");
INSERT INTO product_sales VALUES("411","262","30","","1","1","100","0","0","0","100","2021-06-30 19:54:24","2021-06-30 19:54:24");
INSERT INTO product_sales VALUES("412","262","22","","1","1","1000","0","10","100","1100","2021-06-30 19:54:24","2021-06-30 19:54:24");
INSERT INTO product_sales VALUES("413","263","1","","1","1","400","0","10","40","440","2021-07-01 11:56:40","2021-07-01 11:56:40");
INSERT INTO product_sales VALUES("414","264","1","","1","1","400","0","10","40","440","2021-07-01 12:03:58","2021-07-01 12:03:58");
INSERT INTO product_sales VALUES("415","265","1","","4","1","400","0","10","160","1760","2021-07-01 13:22:51","2021-07-01 13:22:51");
INSERT INTO product_sales VALUES("416","265","4","","1","1","2","0","0","0","2","2021-07-01 13:22:51","2021-07-01 13:22:51");
INSERT INTO product_sales VALUES("417","266","1","","1","1","400","0","10","40","440","2021-07-01 17:04:33","2021-07-01 17:04:33");
INSERT INTO product_sales VALUES("418","267","25","","1","4","1000","0","10","100","1100","2021-07-01 19:40:43","2021-07-01 19:40:43");
INSERT INTO product_sales VALUES("419","267","30","","1","1","100","0","0","0","100","2021-07-01 19:40:43","2021-07-01 19:40:43");
INSERT INTO product_sales VALUES("420","268","22","","1","1","1000","0","10","100","1100","2021-07-01 19:49:19","2021-07-02 15:52:53");
INSERT INTO product_sales VALUES("421","269","2","","13","2","125.22","0","15","244.17","1872","2021-07-02 19:06:21","2021-07-02 19:06:21");
INSERT INTO product_sales VALUES("422","269","3","","16","1","250","0","0","0","4000","2021-07-02 19:06:21","2021-07-02 19:06:21");
INSERT INTO product_sales VALUES("423","269","31","","1","1","300","0","0","0","300","2021-07-02 19:06:21","2021-07-02 19:06:21");
INSERT INTO product_sales VALUES("424","269","30","","1","1","100","0","0","0","100","2021-07-02 19:06:21","2021-07-02 19:06:21");
INSERT INTO product_sales VALUES("425","269","1","","1","1","400","0","10","40","440","2021-07-02 19:06:21","2021-07-02 19:06:21");
INSERT INTO product_sales VALUES("426","270","1","","32","1","360","0","10","1152","12672","2021-07-02 19:09:01","2021-07-02 19:09:01");
INSERT INTO product_sales VALUES("427","270","10","","18","7","19.8","0","0","0","356.4","2021-07-02 19:09:01","2021-07-02 19:09:01");
INSERT INTO product_sales VALUES("428","270","4","","1","1","1.8","0","0","0","1.8","2021-07-02 19:09:01","2021-07-02 19:09:01");
INSERT INTO product_sales VALUES("429","271","10","","1","7","22","0","0","0","22","2021-07-08 20:23:31","2021-07-08 20:23:31");
INSERT INTO product_sales VALUES("430","272","1","","1","1","350","0","10","35","385","2021-07-14 03:36:44","2021-07-14 03:36:44");
INSERT INTO product_sales VALUES("431","272","2","","1","2","125.22","0","15","18.78","144","2021-07-14 03:36:44","2021-07-14 03:36:44");
INSERT INTO product_sales VALUES("432","273","2","","4","2","125.22","0","15","75.13","576","2021-07-14 03:37:09","2021-07-14 03:37:09");
INSERT INTO product_sales VALUES("433","273","1","","1","1","350","0","10","35","385","2021-07-14 03:37:09","2021-07-14 03:37:09");
INSERT INTO product_sales VALUES("434","274","2","","1","2","125.22","0","15","18.78","144","2021-07-14 03:39:48","2021-07-14 03:39:48");
INSERT INTO product_sales VALUES("435","274","1","","3","1","350","0","10","105","1155","2021-07-14 03:39:48","2021-07-14 03:39:48");
INSERT INTO product_sales VALUES("436","275","1","","1","1","350","0","10","35","385","2021-07-14 03:40:10","2021-07-14 03:40:10");
INSERT INTO product_sales VALUES("437","276","1","","1","1","350","0","10","35","385","2021-07-14 03:41:53","2021-07-14 03:41:53");
INSERT INTO product_sales VALUES("438","276","22","","1","1","1000","0","10","100","1100","2021-07-14 03:41:53","2021-07-14 03:41:53");
INSERT INTO product_sales VALUES("439","277","1","","1","1","350","0","10","35","385","2021-07-14 03:42:13","2021-07-14 03:42:13");
INSERT INTO product_sales VALUES("440","278","1","","2","1","350","0","10","70","770","2021-07-14 03:42:37","2021-07-14 03:42:37");
INSERT INTO product_sales VALUES("441","279","1","","1","1","350","0","10","35","385","2021-07-14 03:46:26","2021-07-14 03:46:26");
INSERT INTO product_sales VALUES("442","280","1","","1","1","350","0","10","35","385","2021-07-14 03:46:48","2021-07-14 03:46:48");
INSERT INTO product_sales VALUES("443","281","1","","1","1","350","0","10","35","385","2021-07-14 03:49:20","2021-07-14 03:49:20");
INSERT INTO product_sales VALUES("444","282","1","","1","1","350","0","10","35","385","2021-07-14 03:52:01","2021-07-14 03:52:01");
INSERT INTO product_sales VALUES("445","283","1","","1","1","350","0","10","35","385","2021-07-14 03:52:18","2021-07-14 03:52:18");
INSERT INTO product_sales VALUES("446","283","13","","1","0","21","0","0","0","21","2021-07-14 03:52:18","2021-07-14 03:52:18");
INSERT INTO product_sales VALUES("447","283","22","","1","1","1000","0","10","100","1100","2021-07-14 03:52:18","2021-07-14 03:52:18");
INSERT INTO product_sales VALUES("448","284","1","","1","1","350","0","10","35","385","2021-07-14 03:52:33","2021-07-14 03:52:33");
INSERT INTO product_sales VALUES("449","285","1","","1","1","350","0","10","35","385","2021-07-14 03:53:15","2021-07-14 03:53:15");
INSERT INTO product_sales VALUES("450","286","1","","1","1","350","0","10","35","385","2021-07-14 03:55:10","2021-07-14 03:55:10");
INSERT INTO product_sales VALUES("451","287","1","","1","1","350","0","10","35","385","2021-07-14 03:56:23","2021-07-14 03:56:23");
INSERT INTO product_sales VALUES("452","288","1","","1","1","350","0","10","35","385","2021-07-14 03:57:04","2021-07-14 03:57:04");
INSERT INTO product_sales VALUES("453","289","1","","17","1","350","0","10","595","6545","2021-07-14 04:02:37","2021-07-14 04:02:37");
INSERT INTO product_sales VALUES("454","290","1","","4","1","350","0","10","140","1540","2021-07-14 04:26:15","2021-07-14 04:26:15");
INSERT INTO product_sales VALUES("455","290","25","","1","4","1000","0","10","100","1100","2021-07-14 04:26:15","2021-07-14 04:26:15");
INSERT INTO product_sales VALUES("456","290","30","","1","1","100","0","0","0","100","2021-07-14 04:26:15","2021-07-14 04:26:15");
INSERT INTO product_sales VALUES("457","290","2","","1","2","125.22","0","15","18.78","144","2021-07-14 04:26:15","2021-07-14 04:26:15");
INSERT INTO product_sales VALUES("458","290","31","","1","1","300","0","0","0","300","2021-07-14 04:26:15","2021-07-14 04:26:15");
INSERT INTO product_sales VALUES("459","291","1","","5","1","350","0","10","175","1925","2021-07-14 04:33:59","2021-07-14 04:33:59");
INSERT INTO product_sales VALUES("460","291","2","","4","2","125.22","0","15","75.13","576","2021-07-14 04:33:59","2021-07-14 04:33:59");
INSERT INTO product_sales VALUES("461","292","1","","1","1","350","0","10","35","385","2021-07-14 04:34:15","2021-07-14 04:34:15");
INSERT INTO product_sales VALUES("462","293","1","","1","1","350","0","10","35","385","2021-07-14 04:34:33","2021-07-14 04:34:33");
INSERT INTO product_sales VALUES("463","294","1","","1","1","350","0","10","35","385","2021-07-14 04:34:49","2021-07-14 04:34:49");
INSERT INTO product_sales VALUES("464","295","1","","1","1","350","0","10","35","385","2021-07-14 04:35:04","2021-07-14 04:35:04");
INSERT INTO product_sales VALUES("465","296","1","","1","1","350","0","10","35","385","2021-07-14 04:36:39","2021-07-14 04:36:39");
INSERT INTO product_sales VALUES("466","296","2","","1","2","125.22","0","15","18.78","144","2021-07-14 04:36:39","2021-07-14 04:36:39");
INSERT INTO product_sales VALUES("467","297","1","","2","1","350","0","10","70","770","2021-07-14 04:37:05","2021-07-14 04:37:05");
INSERT INTO product_sales VALUES("468","297","2","","1","2","125.22","0","15","18.78","144","2021-07-14 04:37:05","2021-07-14 04:37:05");
INSERT INTO product_sales VALUES("469","298","1","","1","1","350","0","10","35","385","2021-07-14 04:37:58","2021-07-14 04:37:58");
INSERT INTO product_sales VALUES("470","299","1","","1","1","350","0","10","35","385","2021-07-14 04:38:20","2021-07-14 04:38:20");
INSERT INTO product_sales VALUES("471","301","1","","1","4","350","0","10","35","385","2021-07-14 05:02:24","2021-07-14 05:02:24");
INSERT INTO product_sales VALUES("472","302","1","","1","4","350","0","10","35","385","2021-07-14 05:02:42","2021-07-14 05:02:42");
INSERT INTO product_sales VALUES("473","304","1","","1","4","350","0","10","35","385","2021-07-14 05:07:01","2021-07-14 05:07:01");
INSERT INTO product_sales VALUES("474","305","1","","1","4","350","0","10","35","385","2021-07-14 05:07:23","2021-07-14 05:07:23");
INSERT INTO product_sales VALUES("475","306","1","","1","4","350","0","10","35","385","2021-07-14 05:07:54","2021-07-14 05:07:54");
INSERT INTO product_sales VALUES("476","307","1","","1","4","350","0","10","35","385","2021-11-09 17:12:25","2021-11-09 17:12:25");
INSERT INTO product_sales VALUES("477","307","25","","1","4","1000","0","10","100","1100","2021-11-09 17:12:25","2021-11-09 17:12:25");
INSERT INTO product_sales VALUES("478","307","30","","1","1","100","0","0","0","100","2021-11-09 17:12:25","2021-11-09 17:12:25");
INSERT INTO product_sales VALUES("479","307","2","","2","4","10.43","0","15","3.13","24","2021-11-09 17:12:25","2021-11-09 17:12:25");
INSERT INTO product_sales VALUES("480","307","4","","2","1","2","0","0","0","4","2021-11-09 17:12:25","2021-11-09 17:12:25");
INSERT INTO product_sales VALUES("481","307","31","","2","1","300","0","0","0","600","2021-11-09 17:12:25","2021-11-09 17:12:25");
INSERT INTO product_sales VALUES("482","307","61","","5","1","10000","0","15","7500","57500","2021-11-09 17:12:25","2021-11-09 17:12:25");
INSERT INTO product_sales VALUES("483","308","2","","1","4","10.43","0","15","1.57","12","2021-11-10 01:01:58","2021-11-10 01:01:58");
INSERT INTO product_sales VALUES("484","308","1","","1","4","350","0","10","35","385","2021-11-10 01:01:59","2021-11-10 01:01:59");
INSERT INTO product_sales VALUES("485","308","30","","1","1","100","0","0","0","100","2021-11-10 01:01:59","2021-11-10 01:01:59");



CREATE TABLE `product_transfer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_transfer VALUES("1","1","4","","100","1","1","0","0","100","2018-08-08 15:47:10","2018-12-25 01:46:55");
INSERT INTO product_transfer VALUES("7","6","48","3","1","1","2","0","0","2","2019-12-05 17:25:04","2019-12-05 17:39:42");
INSERT INTO product_transfer VALUES("11","8","5","","10","1","100","0","0","1000","2020-01-22 10:00:59","2020-01-22 10:00:59");
INSERT INTO product_transfer VALUES("13","10","1","","1","1","320","10","32","352","2020-10-08 10:57:35","2020-10-08 10:59:35");
INSERT INTO product_transfer VALUES("14","11","62","12","1","1","1","0","0","1","2020-10-18 15:47:08","2020-10-18 15:47:08");
INSERT INTO product_transfer VALUES("15","12","61","","10","1","3000","15","4500","34500","2020-10-24 06:31:46","2020-10-24 06:31:46");
INSERT INTO product_transfer VALUES("16","13","1","","1","1","320","10","32","352","2021-04-04 10:18:22","2021-04-04 10:18:22");
INSERT INTO product_transfer VALUES("17","13","10","","1","7","10","0","0","10","2021-04-04 10:18:22","2021-04-04 10:18:22");
INSERT INTO product_transfer VALUES("18","14","1","","3","1","320","10","96","1056","2021-07-01 19:21:56","2021-07-01 19:21:56");
INSERT INTO product_transfer VALUES("19","15","1","","1","1","320","10","32","352","2021-07-14 02:55:02","2021-07-14 02:55:02");



CREATE TABLE `product_variants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `item_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_price` double DEFAULT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_variants VALUES("3","48","3","1","S-93475396","","0","2019-11-21 10:33:04","2021-04-28 22:47:20");
INSERT INTO product_variants VALUES("5","48","5","3","L-93475396","50","0","2019-11-24 09:37:20","2021-04-28 22:47:19");
INSERT INTO product_variants VALUES("6","48","2","2","M-93475396","10","-1","2019-11-24 10:47:07","2021-04-28 22:47:20");
INSERT INTO product_variants VALUES("10","60","9","1","a-32081679","","-2","2020-05-18 21:14:14","2021-07-01 19:25:08");
INSERT INTO product_variants VALUES("11","60","11","2","b-32081679","","0","2020-05-18 21:28:31","2020-05-18 21:28:31");
INSERT INTO product_variants VALUES("12","62","12","1","variant 1-81145830","","0","2020-09-27 09:38:27","2021-04-28 22:47:10");
INSERT INTO product_variants VALUES("13","62","13","2","variant 2-81145830","","0","2020-09-27 09:38:27","2020-09-27 09:38:27");



CREATE TABLE `product_warehouse` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_warehouse VALUES("10","1","","1","91.5","","2018-08-08 13:00:12","2021-11-10 01:01:59");
INSERT INTO product_warehouse VALUES("11","2","","1","1377","","2018-08-08 13:00:12","2021-11-10 01:01:58");
INSERT INTO product_warehouse VALUES("12","3","","1","99","","2018-08-08 13:00:13","2021-04-28 22:47:19");
INSERT INTO product_warehouse VALUES("13","5","","1","77","","2018-08-08 13:00:13","2020-10-18 16:18:08");
INSERT INTO product_warehouse VALUES("14","4","","1","117","","2018-08-08 13:46:09","2021-11-09 17:12:25");
INSERT INTO product_warehouse VALUES("15","4","","2","-29","","2018-08-08 15:46:15","2021-04-28 22:47:28");
INSERT INTO product_warehouse VALUES("16","2","","2","1559","","2018-08-08 15:56:49","2021-07-14 04:37:05");
INSERT INTO product_warehouse VALUES("17","1","","2","0.5","","2018-08-08 16:03:33","2021-07-14 05:02:42");
INSERT INTO product_warehouse VALUES("18","3","","2","44","","2018-08-09 04:17:23","2021-07-02 19:06:21");
INSERT INTO product_warehouse VALUES("19","5","","2","62","","2018-08-09 04:18:36","2020-06-09 11:12:48");
INSERT INTO product_warehouse VALUES("20","10","","1","33","","2018-08-09 04:19:29","2021-07-02 19:09:01");
INSERT INTO product_warehouse VALUES("21","10","","2","60","","2018-08-09 04:19:55","2021-04-04 10:18:22");
INSERT INTO product_warehouse VALUES("22","22","","1","25","","2018-09-03 08:36:09","2021-07-07 15:34:04");
INSERT INTO product_warehouse VALUES("23","22","","2","4","","2018-09-03 08:37:14","2021-07-14 03:41:53");
INSERT INTO product_warehouse VALUES("24","24","","2","0","","2018-09-16 02:19:30","2018-09-16 02:20:49");
INSERT INTO product_warehouse VALUES("25","25","","1","14","","2018-10-23 04:44:21","2021-11-09 17:12:25");
INSERT INTO product_warehouse VALUES("26","25","","2","2","","2018-10-23 04:44:41","2021-07-14 04:26:15");
INSERT INTO product_warehouse VALUES("27","31","","1","13","","2018-12-05 03:04:30","2021-11-10 00:18:58");
INSERT INTO product_warehouse VALUES("28","30","","1","11","","2018-12-05 03:04:30","2021-11-10 01:01:59");
INSERT INTO product_warehouse VALUES("29","31","","2","3","","2018-12-05 03:05:08","2021-07-14 04:26:15");
INSERT INTO product_warehouse VALUES("30","30","","2","4","","2018-12-05 03:05:08","2021-07-14 04:26:15");
INSERT INTO product_warehouse VALUES("31","32","","1","10","","2018-12-19 03:27:16","2019-02-09 08:15:23");
INSERT INTO product_warehouse VALUES("32","32","","2","10","","2018-12-19 03:27:41","2021-04-28 22:47:28");
INSERT INTO product_warehouse VALUES("33","33","","1","6","","2018-12-24 04:08:40","2021-04-28 22:47:29");
INSERT INTO product_warehouse VALUES("34","33","","2","7","","2019-02-09 07:51:38","2021-04-28 22:47:29");
INSERT INTO product_warehouse VALUES("35","48","3","1","-1","","2019-11-25 17:53:02","2021-04-28 22:47:20");
INSERT INTO product_warehouse VALUES("36","48","2","1","0","","2019-11-26 10:17:42","2021-04-28 22:47:20");
INSERT INTO product_warehouse VALUES("37","48","3","2","1","","2019-11-26 11:42:08","2021-04-28 22:47:18");
INSERT INTO product_warehouse VALUES("38","48","2","2","-1","","2019-11-26 11:42:08","2021-04-28 22:47:20");
INSERT INTO product_warehouse VALUES("39","48","5","1","0","","2019-12-21 13:48:51","2021-04-28 22:47:19");
INSERT INTO product_warehouse VALUES("40","48","5","2","0","","2019-12-22 12:06:39","2021-04-28 22:47:19");
INSERT INTO product_warehouse VALUES("45","61","","2","-20","","2020-08-16 20:32:07","2021-04-28 22:47:10");
INSERT INTO product_warehouse VALUES("46","62","12","1","-1","","2020-09-27 10:25:33","2021-04-28 22:47:10");
INSERT INTO product_warehouse VALUES("47","62","12","2","1","","2020-10-18 15:47:08","2020-10-27 03:09:39");
INSERT INTO product_warehouse VALUES("48","61","","1","5","","2020-10-24 06:31:46","2021-11-09 17:12:25");
INSERT INTO product_warehouse VALUES("49","60","9","1","-2","","2020-10-26 14:04:05","2021-07-01 19:25:08");



CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_symbology` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `cost` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` double DEFAULT NULL,
  `alert_quantity` double DEFAULT NULL,
  `promotion` tinyint(4) DEFAULT NULL,
  `promotion_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starting_date` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `tax_method` int(11) DEFAULT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_variant` tinyint(1) DEFAULT NULL,
  `is_diffPrice` tinyint(1) DEFAULT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `product_list` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_list` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_list` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_details` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO products VALUES("1","موس","63920719","standard","C39","4","3","4","4","4","320","400","93","20","1","350","2020-06-30","2020-07-31","1","1","toponemouse.jpg","","","0","1","","","","<p style=@text-align: center;@>11:11:30 AM<img src=@https://pbs.twimg.com/profile_images/900037286879838208/sZhajgua_400x400.jpg@ alt=@lioncoders@ width=@400@ height=@400@ /><span style=@background-color: #ccffff;@>hello world<br /></span></p>","1","2018-05-13 02:53:03","2021-11-10 01:01:58");
INSERT INTO products VALUES("2","لیمو","72782608","standard","C128","","1","4","4","4","8","12","2936","100","","","","","2","2","mango.jpg","","","0","1","","","","","1","2018-05-13 03:08:31","2021-11-10 01:01:58");
INSERT INTO products VALUES("3","هندزفری","85415108","standard","C128","4","2","1","1","1","200","250","143","25","","220","2020-11-02","2020-11-30","","1","airphonesamsung.jpg","","","0","1","","","","<p>Earphone with good <strong>sound quality.</strong></p>
<p>jhjkhjkhjh @@</p>","0","2018-05-13 03:09:55","2021-07-02 19:06:21");
INSERT INTO products VALUES("4","lychee","38314290","standard","C128","","1","1","1","1","1","2","88","50","","","","","","1","lychee.jpg","","","","1","","","","<p style=@text-align: center;@><em>sweet lychee from <strong>kalipur</strong>, bashkhali</em></p>","1","2018-05-24 03:24:56","2021-11-09 17:12:25");
INSERT INTO products VALUES("5","Baby doll","31261512","standard","C128","3","4","1","1","1","100","120","139","50","1","100","2020-02-28","2020-02-29","","1","lalacrybabydoll.jpg,15992893905761572515542825e4e2e433-e29b-4ca1-abb2-aad995574f2a_1.e4dc9f20c1d8b2999d66556ae0aa1600.jpeg","","","","1","","","","","0","2018-05-24 03:28:20","2020-10-18 16:18:08");
INSERT INTO products VALUES("6","test","78041363","standard","C128","","2","1","1","1","12","21","0","","","","","","","1","","","","","","","","","","0","2018-05-28 04:20:25","2018-05-28 04:23:24");
INSERT INTO products VALUES("10","potato","212132","standard","C128","","9","7","7","7","10","22","94","","","","","","","1","potato.jpeg","","","","","","","","","1","2018-06-25 06:04:53","2021-07-02 19:09:01");
INSERT INTO products VALUES("13","ldms","45973520","digital","C128","3","3","0","0","0","0","21","0","","","","","","","1","ldms.jpg,1636492996783woocommerce-placeholder.png","1532330693.JPG","","0","1","","","","<p>Amazon Prime 1 Month<br />Price: 300tk</p>
<p>User Ability: Max 2 Mobile User<br />Duration: 1 Month<br />Package: Premium</p>","1","2018-07-23 05:39:29","2021-11-10 00:54:17");
INSERT INTO products VALUES("14","ni","40237871","standard","C128","","9","8","8","8","55","56","0","","","","","","","1","","","","","","","","","","0","2018-08-01 03:06:51","2018-08-01 03:11:48");
INSERT INTO products VALUES("15","edawe","awd","standard","C128","","1","4","4","4","312","132","0","","","","","","","1","","","","","","","","","","0","2018-08-05 05:56:19","2018-08-05 05:57:03");
INSERT INTO products VALUES("16","weq","eqw","digital","C128","","2","0","0","0","0","2","0","","","","","","","1","","1533454125.jpg","","","","","","","","0","2018-08-05 05:58:45","2018-08-05 05:59:23");
INSERT INTO products VALUES("17","et","wer","standard","C128","","2","4","4","4","12","21","0","","","","","","","1","","","","","","","","","","0","2018-08-06 08:55:43","2018-08-06 08:57:41");
INSERT INTO products VALUES("18","wre","wre","standard","C128","","1","4","4","4","3","2","0","","","","","","","1","","","","","","","","","","0","2018-08-06 09:15:42","2018-08-06 09:27:41");
INSERT INTO products VALUES("19","ewr","wer","standard","C128","","2","4","4","4","3","23","0","","1","","2018-08-06","2018-08-10","","1","","","","","","","","","","0","2018-08-06 10:11:46","2019-11-28 08:46:47");
INSERT INTO products VALUES("20","dim","4234","standard","C128","","10","1","1","1","1","2","0","","","","","","","1","","","","","","","","","","0","2018-08-29 04:07:07","2018-08-29 04:13:18");
INSERT INTO products VALUES("21","dim","1","standard","C128","","11","1","1","1","1","2","0","","","","","","","1","","","","","","","","","","0","2018-08-29 04:19:27","2018-08-29 04:23:21");
INSERT INTO products VALUES("22","iphone-X","97103461","standard","C128","5","2","1","1","1","800","1000","29","20","","","","","1","1","iphoneX.jpg","","","","1","","","","","1","2018-09-03 08:35:17","2021-07-14 03:41:53");
INSERT INTO products VALUES("23","qwq","1237920612311a","standard","C39","","2","1","1","1","1","2","0","","","","","","","1","","","","","","","","","","0","2018-09-11 04:23:18","2018-09-11 04:26:04");
INSERT INTO products VALUES("24","chocolate","84802317","standard","C128","","9","1","1","1","1","2","0","","","","","","","1","","","","","1","","","","","0","2018-09-16 02:12:01","2018-09-16 02:40:43");
INSERT INTO products VALUES("25","Galaxy S9","72100265","standard","C128","4","2","4","4","4","500","1000","16","50","1","50","1400-04-08","1400-04-25","1","1","SamsungGalaxyS9.jpg","","","0","1","","","","","1","2018-10-23 04:43:22","2021-11-09 17:12:25");
INSERT INTO products VALUES("26","Samsung Set","39053411","combo","C128","4","2","0","0","0","0","1250","0","","","","","","","1","zummXD2dvAtI.png","","","","","3,25","1,1","250,1000","","1","2018-11-19 07:29:06","2018-11-20 05:42:02");
INSERT INTO products VALUES("27","mixed fruit juice","24805187","combo","C128","","9","0","0","0","0","16","0","","","","","","","1","zummXD2dvAtI.png","","","","","4,2","3,1","2,10","","0","2018-11-19 13:09:26","2018-11-25 02:05:51");
INSERT INTO products VALUES("28","ssaaa","sasas","standard","C128","","2","1","1","2","1","2","0","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","0","2018-11-20 07:44:12","2018-11-20 08:04:02");
INSERT INTO products VALUES("29","testcloth","16055884","standard","C128","","4","10","10","10","10","15","0","","","","2018-11-29","","","1","zummXD2dvAtI.png","","","","","","","","","0","2018-11-29 07:19:25","2019-03-01 18:39:27");
INSERT INTO products VALUES("30","Polo Shirt","53467102","standard","C128","","12","1","1","1","50","100","15","10","","","","","","1","PoloShirt.jpg","","","","1","","","","","1","2018-12-05 02:59:43","2021-11-10 01:01:59");
INSERT INTO products VALUES("31","Shoe","90471412","standard","C128","","12","1","1","1","250","300","16","10","","","","","","1","Shoe.jpg","","","","1","","","","","1","2018-12-05 03:03:09","2021-11-10 00:18:58");
INSERT INTO products VALUES("32","Toothpaste","859875003032","standard","C128","","12","1","1","1","5","10","20","","","","","","","1","1572759415477product-page-fresh-breath.jpg","","","","","","","","","1","2018-12-19 03:26:08","2021-04-28 22:47:28");
INSERT INTO products VALUES("33","tissue","8941161008066","standard","C128","","12","1","1","1","10","20","13","","","","","","","1","zummXD2dvAtI.png","","","","0","","","","","1","2018-12-24 03:03:58","2021-04-28 22:47:29");
INSERT INTO products VALUES("48","T-shirt","93475396","standard","C128","","12","1","1","1","2","3","-1","","","","","","","1","1577165120189220px-Blue_Tshirt.jpg","","1","","0","","","","","1","2019-11-21 10:33:04","2021-04-28 22:47:20");
INSERT INTO products VALUES("60","testvar","32081679","standard","C128","","12","1","1","1","1","2","-2","","","","","","","1","zummXD2dvAtI.png","","1","","0","","","","","1","2020-05-18 21:14:14","2021-07-01 19:25:08");
INSERT INTO products VALUES("61","TV","32703342","standard","C128","4","2","1","1","1","3000","10000","-15","","","","","","2","1","zummXD2dvAtI.png","","","","1","","","","","1","2020-08-16 20:28:39","2021-11-09 17:12:25");
INSERT INTO products VALUES("62","Test variant","81145830","standard","C128","","4","1","1","1","1","2","0","","","","","","","1","zummXD2dvAtI.png","","1","","","","","","","1","2020-09-27 09:38:27","2021-04-28 22:47:10");
INSERT INTO products VALUES("68","شکلات ایرانی","70258696","standard","C128","4","4","1","1","1","7","3","0","4","","","","","","1","zummXD2dvAtI.png","","","","","","","","<p>ییسیس</p>","0","2021-04-03 11:28:10","2021-04-04 17:31:05");
INSERT INTO products VALUES("69","jaferi","77321890","standard","C128","","12","1","3","2","3333333","333333","0","3","","","","","1","1","zummXD2dvAtI.png","","","","","","","","<p>33333</p>","1","2021-04-03 15:54:39","2021-04-03 15:54:39");
INSERT INTO products VALUES("70","گلابی","61001852","standard","C128","","9","7","7","7","5000","5000","0","50000","","","","","1","1","1617539350149Koala.jpg","","","","","","","","<p>یسسسسسسسسسسسسسسسسسسسسسسسسسسسسسس</p>","0","2021-04-04 12:29:27","2021-04-04 17:31:05");
INSERT INTO products VALUES("71","سیسییسیس","09778139","standard","C39","3","1","4","4","4","344343","4343","0","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","0","2021-04-04 17:30:44","2021-04-04 17:31:06");



CREATE TABLE `purchase_product_return` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO purchase_product_return VALUES("1","1","3","","1","1","200","0","0","0","200","","2019-12-07 14:49:03");
INSERT INTO purchase_product_return VALUES("2","2","1","","1","1","320","0","10","32","352","2021-07-14 02:44:13","2021-07-14 02:44:13");



CREATE TABLE `purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `paid_amount` double NOT NULL,
  `status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO purchases VALUES("12","pr-20180808-051614","1","2","3","2","300","0","0","10200","0","0","0","0","10200","0","1","1","","","2018-08-08 15:46:14","2018-09-22 06:23:24");
INSERT INTO purchases VALUES("13","pr-20180809-054723","1","2","3","4","410","0","7304.35","92600","10","9260","0","500","102360","300","1","1","","","2018-08-09 04:17:23","2018-08-30 07:37:18");
INSERT INTO purchases VALUES("14","pr-20180809-012348","1","1","1","5","400","0","4452.17","75300","10","7480","500","1000","83280","0","1","1","","","2018-08-09 11:53:48","2018-08-09 11:53:48");
INSERT INTO purchases VALUES("15","pr-20180903-100609","1","1","1","1","20","0","1600","17600","0","0","0","100","17700","0","1","1","","","2018-09-03 08:36:09","2018-10-08 01:41:24");
INSERT INTO purchases VALUES("16","pr-20180903-100714","1","2","3","1","20","0","1600","17600","0","0","0","150","17750","3350","1","1","","","2018-09-03 08:37:14","2018-10-07 04:27:36");
INSERT INTO purchases VALUES("18","pr-20181022-042625","1","1","1","1","50","0","0","50","0","0","","","50","0","1","1","","","2018-10-22 13:56:25","2018-10-22 13:56:25");
INSERT INTO purchases VALUES("19","pr-20181022-042652","1","2","3","1","50","0","0","50","0","0","","","50","0","1","1","","","2018-10-22 13:56:52","2018-10-22 13:56:52");
INSERT INTO purchases VALUES("20","pr-20181023-071420","11","1","1","1","15","0","750","8250","0","0","","","8250","0","1","1","","","2018-10-23 04:44:20","2018-10-23 04:44:20");
INSERT INTO purchases VALUES("21","pr-20181023-071441","11","2","3","1","15","0","750","8250","0","0","0","0","8250","0","1","1","","","2018-10-23 04:44:41","2018-10-23 04:44:58");
INSERT INTO purchases VALUES("22","pr-20181101-045903","1","1","1","1","5","0","400","4400","0","0","","","4400","0","1","1","","","2018-11-01 02:29:03","2018-11-01 02:29:03");
INSERT INTO purchases VALUES("23","pr-20181101-045928","1","2","3","1","5","0","400","4400","10","430","100","0","4730","500","1","1","","","2018-11-01 02:29:28","2018-12-04 04:31:34");
INSERT INTO purchases VALUES("24","pr-20181105-091819","1","2","1","2","20","0","1450","15950","0","0","","","15950","15950","1","2","","","2018-11-05 06:48:19","2018-11-05 06:51:27");
INSERT INTO purchases VALUES("25","pr-20181205-053429","1","1","1","2","30","0","0","4500","0","0","100","50","4450","4450","1","2","","","2018-12-05 03:04:29","2018-12-05 03:04:43");
INSERT INTO purchases VALUES("26","pr-20181205-053508","1","2","3","2","30","0","0","4500","0","0","","","4500","0","1","1","","","2018-12-05 03:05:08","2018-12-10 03:50:52");
INSERT INTO purchases VALUES("27","pr-20181219-055716","1","2","","1","10","0","0","10","0","0","0","0","10","10","1","2","","","2018-12-19 03:27:16","2018-12-20 04:04:39");
INSERT INTO purchases VALUES("33","pr-20181224-063840","1","1","","1","10","0","0","10","0","0","0","0","10","0","1","1","","","2018-12-24 04:08:40","2018-12-24 06:34:21");
INSERT INTO purchases VALUES("34","pr-20190103-070123","1","1","1","2","4","0","260","2860","0","0","","","2860","2860","1","2","","","2019-01-03 04:31:23","2019-01-29 07:33:24");
INSERT INTO purchases VALUES("35","pr-20190129-095448","9","1","1","2","4","0","0","600","0","0","","","600","100","1","1","","","2019-01-29 07:24:48","2019-02-07 10:36:40");
INSERT INTO purchases VALUES("36","pr-20190129-095558","9","2","1","2","5","0","0","650","0","0","","","650","650","1","2","","","2019-01-29 07:25:58","2019-01-29 07:33:02");
INSERT INTO purchases VALUES("37","pr-20190209-102138","1","2","1","3","18","0","580","6390","0","0","0","0","6390","6390","1","2","","","2019-02-09 07:51:38","2019-06-13 08:43:51");
INSERT INTO purchases VALUES("38","pr-20190209-102208","1","1","1","2","13","0","150","1660","0","0","0","0","1660","1660","1","2","","","2019-02-09 07:52:08","2019-02-09 08:19:40");
INSERT INTO purchases VALUES("39","pr-20210628-023936","1","1","1","1","1","0","32","352","10","33.2","20","500000","500365.2","500365.2","1","2","","","2021-06-28 14:39:36","2021-06-29 15:14:57");
INSERT INTO purchases VALUES("40","pr-20210701-072508","1","1","1","2","2","0","0","251","10","24.9","2","22222","22495.9","0","1","1","","","2021-07-01 19:25:08","2021-07-01 19:25:08");
INSERT INTO purchases VALUES("41","pr-20210702-042314","1","1","1","2","2","0","112","1232","10","123","2","22222","23575","23575","1","2","","","2021-07-02 16:23:14","2021-07-02 16:28:19");
INSERT INTO purchases VALUES("42","pr-20210707-033319","1","2","1","1","1","0","50","550","0","0","","","550","0","1","1","","","2021-07-07 15:33:19","2021-07-07 15:33:19");
INSERT INTO purchases VALUES("43","pr-20210707-033404","1","1","1","3","5","0","226","2486","0","0","","","2486","0","1","1","","dddddddddddddddddddddddddddddddddddddd","2021-07-07 15:34:04","2021-07-07 15:34:04");
INSERT INTO purchases VALUES("44","pr-20210708-093208","1","1","1","2","2","0","57.04","544","0","0","2","22","564","0","3","1","","2","2021-07-08 21:32:08","2021-07-08 21:32:08");
INSERT INTO purchases VALUES("45","pr-20210708-093243","1","1","1","1","1","0","25.04","192","0","0","","","192","0","1","1","","تست می باشد","2021-07-08 21:32:43","2021-07-08 21:32:43");
INSERT INTO purchases VALUES("46","pr-20211110-121858","1","1","","1","1","0","0","250","0","0","","","250","0","1","1","","","2021-11-10 00:18:58","2021-11-10 00:18:58");



CREATE TABLE `quotations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `quotation_status` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO quotations VALUES("1","qr-20180809-055250","1","1","3","3","1","3","57","35","767.73","5930","10","583","100","500","6913","2","","first quotation...","2018-08-09 04:22:50","2018-09-04 08:02:16");
INSERT INTO quotations VALUES("2","qr-20180904-040257","1","1","","1","1","2","3.5","0","0","76","0","0","1.6","2.7","77.1","1","","","2018-09-04 02:32:57","2018-09-21 11:35:57");
INSERT INTO quotations VALUES("3","qr-20181023-061249","9","1","3","11","1","2","2","0","40","453","0","0","0","0","453","2","","","2018-10-23 03:42:49","2019-12-21 10:11:36");
INSERT INTO quotations VALUES("11","qr-20201024-090814","1","1","","1","1","1","2","0","3000","23000","0","0","0","0","23000","1","","","2020-10-24 06:38:14","2020-10-24 06:58:35");
INSERT INTO quotations VALUES("12","qr-20210404-103422","1","1","1","2","1","1","1","0","36","396","0","0","","","396","1","","","2021-04-04 10:34:22","2021-04-04 10:34:22");
INSERT INTO quotations VALUES("13","qr-20210701-115503","1","1","1","2","1","1","1","0","36","396","15","59.1","2","2222","2675.1","2","","sds","2021-07-01 11:55:03","2021-07-01 11:55:03");
INSERT INTO quotations VALUES("14","qr-20210701-021343","1","2","3","1","1","2","3","0","40","444","10","44.2","2","22","508.2","1","Desert.jpg","","2021-07-01 14:13:43","2021-07-01 14:13:43");
INSERT INTO quotations VALUES("15","qr-20210714-023241","1","1","1","1","1","1","1","0","40","440","0","0","2","122222","122660","2","","","2021-07-14 02:32:41","2021-07-14 02:32:41");
INSERT INTO quotations VALUES("16","qr-20210714-023429","1","2","1","2","7","2","3","0","0","22.5","0","0","","","22.5","1","","","2021-07-14 02:34:29","2021-07-14 02:34:29");
INSERT INTO quotations VALUES("17","qr-20210714-023929","1","1","1","1","1","1","1","0","0","2","0","0","0","0","2","1","","","2021-07-14 02:39:29","2021-11-10 00:56:46");



CREATE TABLE `return_purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_note` text COLLATE utf8mb4_unicode_ci,
  `staff_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO return_purchases VALUES("1","prr-20190101-090759","3","1","1","1","1","1","0","0","200","0","0","200","","","","2019-01-01 06:37:59","2019-12-07 14:49:03");
INSERT INTO return_purchases VALUES("2","prr-20210714-024413","1","1","1","3","1","1","0","32","352","0","0","352","","سیی","","2021-07-14 02:44:13","2021-07-14 02:44:13");



CREATE TABLE `returns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_note` text COLLATE utf8mb4_unicode_ci,
  `staff_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO returns VALUES("2","rr-20180809-055834","1","","1","1","1","1","1","20","0","0","40","10","4","44","","","","2018-08-09 04:28:34","2018-08-09 04:28:34");
INSERT INTO returns VALUES("3","rr-20180828-045527","1","","1","2","1","1","1","2","0","0","44","0","0","44","","","","2018-08-28 03:25:27","2018-09-20 15:33:47");
INSERT INTO returns VALUES("5","rr-20181007-082129","1","","11","2","2","1","1","1","0","0","250","0","0","250","","","","2018-10-07 05:51:29","2018-12-26 01:46:08");
INSERT INTO returns VALUES("6","rr-20190101-090630","9","","1","1","1","1","1","1","0","40","440","0","0","440","","","","2019-01-01 06:36:30","2019-01-01 06:36:30");
INSERT INTO returns VALUES("13","rr-20200816-102502","1","","1","2","2","1","1","1","0","1500","11500","0","0","11500","","","","2020-08-16 20:55:02","2020-08-16 20:55:02");
INSERT INTO returns VALUES("14","rr-20201013-053954","9","1","1","1","1","1","1","1","0","40","440","0","0","440","","","","2020-10-13 15:09:54","2020-10-13 15:09:54");
INSERT INTO returns VALUES("18","rr-20201118-070218","1","4","1","2","1","1","1","1","0","1500","11500","0","0","11500","","","","2020-11-18 04:32:18","2020-11-18 04:32:18");
INSERT INTO returns VALUES("19","rr-20210629-011000","1","3","1","1","2","1","1","1","0","0","22","15","3.3","25.3","","sss","ss","2021-06-29 13:10:00","2021-06-29 13:10:00");
INSERT INTO returns VALUES("20","rr-20210629-011103","1","4","21","2","5","1","3","3","0","58.78","1834","20","366.8","2200.8","","سسسسسسسسسسسسسسسسسسس","سسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسس","2021-06-29 13:11:03","2021-06-29 13:11:03");



CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO role_has_permissions VALUES("4","1");
INSERT INTO role_has_permissions VALUES("5","1");
INSERT INTO role_has_permissions VALUES("6","1");
INSERT INTO role_has_permissions VALUES("7","1");
INSERT INTO role_has_permissions VALUES("8","1");
INSERT INTO role_has_permissions VALUES("9","1");
INSERT INTO role_has_permissions VALUES("10","1");
INSERT INTO role_has_permissions VALUES("11","1");
INSERT INTO role_has_permissions VALUES("12","1");
INSERT INTO role_has_permissions VALUES("13","1");
INSERT INTO role_has_permissions VALUES("14","1");
INSERT INTO role_has_permissions VALUES("15","1");
INSERT INTO role_has_permissions VALUES("16","1");
INSERT INTO role_has_permissions VALUES("17","1");
INSERT INTO role_has_permissions VALUES("18","1");
INSERT INTO role_has_permissions VALUES("19","1");
INSERT INTO role_has_permissions VALUES("20","1");
INSERT INTO role_has_permissions VALUES("21","1");
INSERT INTO role_has_permissions VALUES("22","1");
INSERT INTO role_has_permissions VALUES("23","1");
INSERT INTO role_has_permissions VALUES("24","1");
INSERT INTO role_has_permissions VALUES("25","1");
INSERT INTO role_has_permissions VALUES("26","1");
INSERT INTO role_has_permissions VALUES("27","1");
INSERT INTO role_has_permissions VALUES("28","1");
INSERT INTO role_has_permissions VALUES("29","1");
INSERT INTO role_has_permissions VALUES("30","1");
INSERT INTO role_has_permissions VALUES("31","1");
INSERT INTO role_has_permissions VALUES("32","1");
INSERT INTO role_has_permissions VALUES("33","1");
INSERT INTO role_has_permissions VALUES("34","1");
INSERT INTO role_has_permissions VALUES("35","1");
INSERT INTO role_has_permissions VALUES("36","1");
INSERT INTO role_has_permissions VALUES("37","1");
INSERT INTO role_has_permissions VALUES("38","1");
INSERT INTO role_has_permissions VALUES("39","1");
INSERT INTO role_has_permissions VALUES("40","1");
INSERT INTO role_has_permissions VALUES("41","1");
INSERT INTO role_has_permissions VALUES("42","1");
INSERT INTO role_has_permissions VALUES("43","1");
INSERT INTO role_has_permissions VALUES("44","1");
INSERT INTO role_has_permissions VALUES("45","1");
INSERT INTO role_has_permissions VALUES("46","1");
INSERT INTO role_has_permissions VALUES("47","1");
INSERT INTO role_has_permissions VALUES("48","1");
INSERT INTO role_has_permissions VALUES("49","1");
INSERT INTO role_has_permissions VALUES("50","1");
INSERT INTO role_has_permissions VALUES("51","1");
INSERT INTO role_has_permissions VALUES("52","1");
INSERT INTO role_has_permissions VALUES("53","1");
INSERT INTO role_has_permissions VALUES("54","1");
INSERT INTO role_has_permissions VALUES("55","1");
INSERT INTO role_has_permissions VALUES("56","1");
INSERT INTO role_has_permissions VALUES("57","1");
INSERT INTO role_has_permissions VALUES("58","1");
INSERT INTO role_has_permissions VALUES("59","1");
INSERT INTO role_has_permissions VALUES("60","1");
INSERT INTO role_has_permissions VALUES("61","1");
INSERT INTO role_has_permissions VALUES("62","1");
INSERT INTO role_has_permissions VALUES("63","1");
INSERT INTO role_has_permissions VALUES("64","1");
INSERT INTO role_has_permissions VALUES("65","1");
INSERT INTO role_has_permissions VALUES("66","1");
INSERT INTO role_has_permissions VALUES("67","1");
INSERT INTO role_has_permissions VALUES("68","1");
INSERT INTO role_has_permissions VALUES("69","1");
INSERT INTO role_has_permissions VALUES("70","1");
INSERT INTO role_has_permissions VALUES("71","1");
INSERT INTO role_has_permissions VALUES("72","1");
INSERT INTO role_has_permissions VALUES("73","1");
INSERT INTO role_has_permissions VALUES("74","1");
INSERT INTO role_has_permissions VALUES("75","1");
INSERT INTO role_has_permissions VALUES("76","1");
INSERT INTO role_has_permissions VALUES("77","1");
INSERT INTO role_has_permissions VALUES("78","1");
INSERT INTO role_has_permissions VALUES("79","1");
INSERT INTO role_has_permissions VALUES("80","1");
INSERT INTO role_has_permissions VALUES("81","1");
INSERT INTO role_has_permissions VALUES("82","1");
INSERT INTO role_has_permissions VALUES("83","1");
INSERT INTO role_has_permissions VALUES("84","1");
INSERT INTO role_has_permissions VALUES("85","1");
INSERT INTO role_has_permissions VALUES("86","1");
INSERT INTO role_has_permissions VALUES("87","1");
INSERT INTO role_has_permissions VALUES("88","1");
INSERT INTO role_has_permissions VALUES("89","1");
INSERT INTO role_has_permissions VALUES("90","1");
INSERT INTO role_has_permissions VALUES("91","1");
INSERT INTO role_has_permissions VALUES("92","1");
INSERT INTO role_has_permissions VALUES("93","1");
INSERT INTO role_has_permissions VALUES("94","1");
INSERT INTO role_has_permissions VALUES("95","1");
INSERT INTO role_has_permissions VALUES("96","1");
INSERT INTO role_has_permissions VALUES("97","1");
INSERT INTO role_has_permissions VALUES("98","1");
INSERT INTO role_has_permissions VALUES("99","1");
INSERT INTO role_has_permissions VALUES("100","1");
INSERT INTO role_has_permissions VALUES("101","1");
INSERT INTO role_has_permissions VALUES("102","1");
INSERT INTO role_has_permissions VALUES("103","1");
INSERT INTO role_has_permissions VALUES("104","1");
INSERT INTO role_has_permissions VALUES("4","2");
INSERT INTO role_has_permissions VALUES("5","2");
INSERT INTO role_has_permissions VALUES("6","2");
INSERT INTO role_has_permissions VALUES("7","2");
INSERT INTO role_has_permissions VALUES("8","2");
INSERT INTO role_has_permissions VALUES("9","2");
INSERT INTO role_has_permissions VALUES("10","2");
INSERT INTO role_has_permissions VALUES("11","2");
INSERT INTO role_has_permissions VALUES("12","2");
INSERT INTO role_has_permissions VALUES("13","2");
INSERT INTO role_has_permissions VALUES("14","2");
INSERT INTO role_has_permissions VALUES("15","2");
INSERT INTO role_has_permissions VALUES("16","2");
INSERT INTO role_has_permissions VALUES("17","2");
INSERT INTO role_has_permissions VALUES("18","2");
INSERT INTO role_has_permissions VALUES("19","2");
INSERT INTO role_has_permissions VALUES("20","2");
INSERT INTO role_has_permissions VALUES("21","2");
INSERT INTO role_has_permissions VALUES("22","2");
INSERT INTO role_has_permissions VALUES("23","2");
INSERT INTO role_has_permissions VALUES("24","2");
INSERT INTO role_has_permissions VALUES("25","2");
INSERT INTO role_has_permissions VALUES("26","2");
INSERT INTO role_has_permissions VALUES("27","2");
INSERT INTO role_has_permissions VALUES("28","2");
INSERT INTO role_has_permissions VALUES("29","2");
INSERT INTO role_has_permissions VALUES("30","2");
INSERT INTO role_has_permissions VALUES("31","2");
INSERT INTO role_has_permissions VALUES("32","2");
INSERT INTO role_has_permissions VALUES("33","2");
INSERT INTO role_has_permissions VALUES("34","2");
INSERT INTO role_has_permissions VALUES("35","2");
INSERT INTO role_has_permissions VALUES("36","2");
INSERT INTO role_has_permissions VALUES("37","2");
INSERT INTO role_has_permissions VALUES("38","2");
INSERT INTO role_has_permissions VALUES("39","2");
INSERT INTO role_has_permissions VALUES("40","2");
INSERT INTO role_has_permissions VALUES("41","2");
INSERT INTO role_has_permissions VALUES("42","2");
INSERT INTO role_has_permissions VALUES("43","2");
INSERT INTO role_has_permissions VALUES("44","2");
INSERT INTO role_has_permissions VALUES("45","2");
INSERT INTO role_has_permissions VALUES("46","2");
INSERT INTO role_has_permissions VALUES("47","2");
INSERT INTO role_has_permissions VALUES("48","2");
INSERT INTO role_has_permissions VALUES("49","2");
INSERT INTO role_has_permissions VALUES("50","2");
INSERT INTO role_has_permissions VALUES("51","2");
INSERT INTO role_has_permissions VALUES("52","2");
INSERT INTO role_has_permissions VALUES("53","2");
INSERT INTO role_has_permissions VALUES("54","2");
INSERT INTO role_has_permissions VALUES("55","2");
INSERT INTO role_has_permissions VALUES("56","2");
INSERT INTO role_has_permissions VALUES("57","2");
INSERT INTO role_has_permissions VALUES("58","2");
INSERT INTO role_has_permissions VALUES("59","2");
INSERT INTO role_has_permissions VALUES("60","2");
INSERT INTO role_has_permissions VALUES("61","2");
INSERT INTO role_has_permissions VALUES("62","2");
INSERT INTO role_has_permissions VALUES("63","2");
INSERT INTO role_has_permissions VALUES("64","2");
INSERT INTO role_has_permissions VALUES("65","2");
INSERT INTO role_has_permissions VALUES("66","2");
INSERT INTO role_has_permissions VALUES("67","2");
INSERT INTO role_has_permissions VALUES("68","2");
INSERT INTO role_has_permissions VALUES("69","2");
INSERT INTO role_has_permissions VALUES("70","2");
INSERT INTO role_has_permissions VALUES("71","2");
INSERT INTO role_has_permissions VALUES("72","2");
INSERT INTO role_has_permissions VALUES("73","2");
INSERT INTO role_has_permissions VALUES("74","2");
INSERT INTO role_has_permissions VALUES("75","2");
INSERT INTO role_has_permissions VALUES("76","2");
INSERT INTO role_has_permissions VALUES("77","2");
INSERT INTO role_has_permissions VALUES("78","2");
INSERT INTO role_has_permissions VALUES("79","2");
INSERT INTO role_has_permissions VALUES("80","2");
INSERT INTO role_has_permissions VALUES("81","2");
INSERT INTO role_has_permissions VALUES("82","2");
INSERT INTO role_has_permissions VALUES("83","2");
INSERT INTO role_has_permissions VALUES("84","2");
INSERT INTO role_has_permissions VALUES("85","2");
INSERT INTO role_has_permissions VALUES("86","2");
INSERT INTO role_has_permissions VALUES("87","2");
INSERT INTO role_has_permissions VALUES("88","2");
INSERT INTO role_has_permissions VALUES("89","2");
INSERT INTO role_has_permissions VALUES("90","2");
INSERT INTO role_has_permissions VALUES("91","2");
INSERT INTO role_has_permissions VALUES("92","2");
INSERT INTO role_has_permissions VALUES("93","2");
INSERT INTO role_has_permissions VALUES("94","2");
INSERT INTO role_has_permissions VALUES("95","2");
INSERT INTO role_has_permissions VALUES("96","2");
INSERT INTO role_has_permissions VALUES("97","2");
INSERT INTO role_has_permissions VALUES("98","2");
INSERT INTO role_has_permissions VALUES("99","2");
INSERT INTO role_has_permissions VALUES("100","2");
INSERT INTO role_has_permissions VALUES("101","2");
INSERT INTO role_has_permissions VALUES("102","2");
INSERT INTO role_has_permissions VALUES("103","2");
INSERT INTO role_has_permissions VALUES("104","2");
INSERT INTO role_has_permissions VALUES("4","4");
INSERT INTO role_has_permissions VALUES("6","4");
INSERT INTO role_has_permissions VALUES("7","4");
INSERT INTO role_has_permissions VALUES("8","4");
INSERT INTO role_has_permissions VALUES("9","4");
INSERT INTO role_has_permissions VALUES("12","4");
INSERT INTO role_has_permissions VALUES("13","4");
INSERT INTO role_has_permissions VALUES("20","4");
INSERT INTO role_has_permissions VALUES("21","4");
INSERT INTO role_has_permissions VALUES("22","4");
INSERT INTO role_has_permissions VALUES("24","4");
INSERT INTO role_has_permissions VALUES("25","4");
INSERT INTO role_has_permissions VALUES("28","4");
INSERT INTO role_has_permissions VALUES("29","4");
INSERT INTO role_has_permissions VALUES("55","4");
INSERT INTO role_has_permissions VALUES("56","4");
INSERT INTO role_has_permissions VALUES("57","4");
INSERT INTO role_has_permissions VALUES("63","4");
INSERT INTO role_has_permissions VALUES("64","4");



CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO roles VALUES("1","مدیر","دسترسی به تمام سامانه ...","web","1","2018-06-02 04:16:44","2021-07-01 12:09:57");
INSERT INTO roles VALUES("2","صاحب","مالکیت فروش...","web","1","2018-10-22 06:08:13","2021-07-14 03:08:55");
INSERT INTO roles VALUES("4","کارمند","دسترسی مخصوص کارمند...","web","1","2018-06-02 04:35:27","2021-07-01 12:10:23");
INSERT INTO roles VALUES("5","مشتری","","web","1","2020-11-05 10:13:16","2021-04-04 15:32:08");



CREATE TABLE `sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `grand_total` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `sale_status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `sale_note` text COLLATE utf8mb4_unicode_ci,
  `staff_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO sales VALUES("1","sr-20180808-043622","1","","1","1","1","2","3","10","15.65","350","380","10","30","50","","","50","1","2","","0","ukgjkgjkgkj","gjkgjkgkujg","2018-08-08 15:06:22","2018-10-06 12:55:29");
INSERT INTO sales VALUES("2","sr-20180809-055453","1","","3","1","1","3","63","0","469.3","5103","5503","0","0","100","","","500","1","2","","2200","","","2018-08-09 04:24:53","2018-08-09 04:26:35");
INSERT INTO sales VALUES("3","posr-20180809-063214","1","","2","2","2","3","26","0","0","897","897","0","0","","","","","1","4","","897","","","2018-08-09 05:02:14","2018-08-09 05:02:14");
INSERT INTO sales VALUES("4","sr-20180825-034836","1","","1","1","1","1","2","0","80","880","880","0","0","","","","","1","2","","300","","","2018-08-25 02:18:36","2018-09-22 06:26:03");
INSERT INTO sales VALUES("6","sr-20180826-094836","1","","2","1","2","1","1","0","0","18.9","20","0","0","0","","","1.1","1","4","","20","","","2018-08-26 08:18:36","2018-08-26 10:18:05");
INSERT INTO sales VALUES("7","sr-20180827-073545","1","","1","1","1","1","2","0","80","880","880","0","0","","","","","1","4","","880","","","2018-08-27 06:05:45","2018-08-27 06:05:45");
INSERT INTO sales VALUES("8","posr-20180902-053954","1","","1","1","2","1","2","0","288","3168","3529.8","10","311.8","50","","","100","1","4","","3529.8","good customer","good customer","2018-09-02 04:09:54","2018-09-02 04:09:54");
INSERT INTO sales VALUES("9","posr-20180903-033314","1","","1","2","1","1","10","0","0","20","20","0","0","","","","","1","4","","20","","","2018-09-03 02:03:14","2018-09-03 02:03:14");
INSERT INTO sales VALUES("10","posr-20180903-050138","1","","11","2","1","1","1","0","0","250","250","0","0","","","","","1","2","","200","","","2018-09-03 03:31:38","2018-09-10 02:10:28");
INSERT INTO sales VALUES("11","posr-20180903-100821","1","","11","2","1","1","5","0","500","5500","5500","0","0","","","","","1","4","","5500","","","2018-09-03 08:38:21","2018-09-03 08:38:21");
INSERT INTO sales VALUES("12","sr-20180903-101026","1","","3","1","5","1","10","0","1050","11550","11550","0","0","","","","","1","2","","0","","","2018-09-03 08:40:26","2018-09-22 06:25:14");
INSERT INTO sales VALUES("29","sr-20180909-093841","1","","1","1","1","1","1","0","0","120","132","10","12","","","","","1","2","","0","","","2018-09-09 08:08:41","2018-10-06 06:06:52");
INSERT INTO sales VALUES("30","posr-20180910-045706","1","","11","2","1","1","1","0","40","440","440","0","0","0","","","0","1","2","","120","","","2018-09-10 03:27:06","2018-10-06 04:23:20");
INSERT INTO sales VALUES("31","posr-20180926-092059","1","","11","2","1","2","2","0","55.65","560","560","0","0","0","","","0","1","4","","560","","","2018-09-26 06:50:59","2018-09-26 06:51:25");
INSERT INTO sales VALUES("32","posr-20181004-095547","1","","11","2","1","1","1","0","40","440","440","0","0","","","","","1","2","","","","","2018-10-04 07:25:47","2018-10-04 07:25:47");
INSERT INTO sales VALUES("33","posr-20181004-100022","1","","11","2","1","1","1","0","40","440","440","0","0","","","","","1","2","","","","","2018-10-04 07:30:22","2018-10-04 07:30:22");
INSERT INTO sales VALUES("37","sr-20181007-064605","1","","1","1","1","1","1","0","0","250","250","0","0","","","","","1","2","","0","","","2018-10-07 04:16:05","2018-10-07 04:16:28");
INSERT INTO sales VALUES("38","posr-20181007-064719","1","","11","2","1","1","1","0","40","440","440","0","0","","","","","1","2","","0","","","2018-10-07 04:17:19","2018-10-07 06:47:02");
INSERT INTO sales VALUES("40","posr-20181007-071312","1","","11","2","1","1","1","0","40","440","440","0","0","","","","","1","2","","0","","","2018-10-07 04:43:12","2018-10-07 06:47:39");
INSERT INTO sales VALUES("41","posr-20181010-041621","1","","1","2","1","2","2","0","40","461","461","0","0","","","","","1","4","","461","","","2018-10-10 01:46:21","2018-10-10 01:46:21");
INSERT INTO sales VALUES("42","posr-20181010-053450","1","","1","2","1","1","1","0","40","440","440","0","0","","","","","1","4","","440","","","2018-10-10 03:04:50","2018-10-10 03:04:50");
INSERT INTO sales VALUES("43","sr-20181016-033434","1","","1","1","1","1","1","0","40","440","440","0","0","","","","","1","2","","0","sss
sss
s","","2018-10-16 01:04:34","2018-10-23 03:51:27");
INSERT INTO sales VALUES("55","posr-20181021-065334","1","","11","2","1","1","1","0","0","250","250","0","0","","","","","1","4","","250","","","2018-10-21 04:23:34","2018-10-21 04:23:34");
INSERT INTO sales VALUES("57","posr-20181021-082612","1","","11","2","1","2","3","0","40","482","575.2","10","43.2","50","","","100","1","4","","575.2","","","2018-10-21 05:56:12","2018-10-21 05:56:12");
INSERT INTO sales VALUES("58","posr-20181022-032723","1","","11","2","1","2","2","0","100","1220","1220","0","0","","","","","1","4","","1220","","","2018-10-22 12:57:23","2018-10-22 12:57:23");
INSERT INTO sales VALUES("73","posr-20181023-071543","11","","11","1","5","2","5","0","500","5500","5500","0","0","","","","","1","4","","5500","","","2018-10-23 04:45:43","2018-10-23 04:45:43");
INSERT INTO sales VALUES("74","posr-20181023-071644","1","","11","2","1","3","3","0","200","2320","2320","0","0","","","","","1","4","","2320","","","2018-10-23 04:46:44","2018-10-23 04:46:44");
INSERT INTO sales VALUES("75","posr-20181101-050027","1","","11","2","1","5","12","0","626.96","6980","7678","10","698","","","","","1","4","","7678","","","2018-11-01 02:30:27","2018-11-01 02:30:27");
INSERT INTO sales VALUES("76","posr-20181101-050126","1","","11","2","1","3","6","0","100","1434","1424","0","0","10","","","0","1","4","","1424","","","2018-11-01 02:31:26","2018-11-08 07:14:51");
INSERT INTO sales VALUES("79","posr-20181105-091516","1","","11","2","1","7","52","0","1069.57","14454","14454","0","0","","","","","1","4","","14454","","","2018-11-05 06:45:16","2018-11-05 06:45:16");
INSERT INTO sales VALUES("80","posr-20181105-091958","1","","11","2","1","3","8","0","191.3","2500","2500","0","0","","","","","1","4","","2500","","","2018-11-05 06:49:58","2018-11-05 06:49:58");
INSERT INTO sales VALUES("86","posr-20181105-095948","1","","11","2","1","1","1","0","100","1100","1100","0","0","","","","","1","4","","1100","","","2018-11-05 07:29:48","2018-11-05 07:29:48");
INSERT INTO sales VALUES("88","posr-20181105-100258","1","","11","2","1","1","1","0","100","1100","1100","0","0","","","","","1","4","","1100","","","2018-11-05 07:32:58","2018-11-05 07:32:58");
INSERT INTO sales VALUES("94","posr-20181126-020534","1","","11","2","1","1","1","0","15.65","120","120","0","0","","","","","1","4","","120","","","2018-11-26 11:35:34","2018-11-26 11:35:34");
INSERT INTO sales VALUES("95","posr-20181127-093608","1","","11","2","1","1","3","0","0","360","360","0","0","","","","","1","2","","","","","2018-11-27 07:06:08","2018-11-27 07:06:08");
INSERT INTO sales VALUES("96","posr-20181128-071509","1","","11","2","1","1","1","0","15.65","120","132","10","12","","","","","1","4","","132","","","2018-11-28 04:45:09","2018-11-28 04:45:09");
INSERT INTO sales VALUES("97","posr-20181201-060518","1","","11","2","1","2","3","0","31.3","262","262","0","0","","","","","1","2","","200","","","2018-12-01 03:35:18","2018-12-04 03:51:05");
INSERT INTO sales VALUES("98","posr-20181205-053558","1","","11","2","1","2","4","0","0","800","800","0","0","","","","","1","4","","800","","","2018-12-05 03:05:58","2018-12-05 03:05:58");
INSERT INTO sales VALUES("99","posr-20181205-053719","1","","11","1","1","2","4","0","0","800","800","0","0","","","","","1","4","","800","","","2018-12-05 03:07:19","2018-12-05 03:07:19");
INSERT INTO sales VALUES("101","posr-20181208-062026","1","","11","2","1","1","1","0","0","100","100","0","0","","","","","1","4","","100","","","2018-12-08 03:50:26","2018-12-08 03:50:26");
INSERT INTO sales VALUES("103","posr-20181224-045832","1","","11","2","1","1","1","0","15.65","120","120","0","0","","","","","1","4","","120","","","2018-12-24 02:28:32","2018-12-24 02:28:32");
INSERT INTO sales VALUES("104","sr-20181224-091527","1","","1","1","2","2","6","0","0","2508","2518","0","0","0","","","10","1","2","","","","","2018-12-24 06:45:27","2018-12-25 01:25:23");
INSERT INTO sales VALUES("105","posr-20190101-054538","1","","1","2","1","1","1","0","0","21","21","0","0","","","","","1","4","","21","","","2019-01-01 03:15:38","2019-01-01 03:15:38");
INSERT INTO sales VALUES("106","posr-20190101-091040","1","","11","2","1","3","5","0","15.65","860","860","0","0","","","","","1","4","","860","","","2019-01-01 06:40:40","2019-01-01 06:40:40");
INSERT INTO sales VALUES("107","posr-20190103-065626","1","","11","2","1","6","10","0","395.65","5040","5040","0","0","","","","","1","4","","5040","","","2019-01-03 04:26:26","2019-01-03 04:26:26");
INSERT INTO sales VALUES("108","posr-20190120-035824","1","","11","2","1","1","1","0","15.65","120","120","0","0","","","","","1","4","","120","","","2019-01-20 13:28:24","2019-01-20 13:28:24");
INSERT INTO sales VALUES("109","posr-20190129-101443","9","","11","1","5","2","2","0","40","540","540","0","0","","","","","1","4","","540","","","2019-01-29 07:44:43","2019-01-29 07:44:43");
INSERT INTO sales VALUES("110","posr-20190129-115041","9","","11","1","5","2","3","0","100","1700","1700","0","0","","","","","1","4","","1700","","","2019-01-29 09:20:41","2019-01-29 09:20:41");
INSERT INTO sales VALUES("111","posr-20190131-110839","9","","11","1","5","2","2","0","0","271","271","0","0","","","","","1","4","","271","","","2019-01-31 08:38:39","2019-01-31 08:38:39");
INSERT INTO sales VALUES("112","posr-20190202-104045","1","","11","2","1","1","1","0","40","440","440","0","0","","","","","1","4","","440","","","2019-02-02 08:10:45","2019-02-02 08:10:45");
INSERT INTO sales VALUES("113","posr-20190202-114117","1","","11","2","1","2","2","0","0","350","350","0","0","","","","","1","4","","350","","","2019-02-02 09:11:17","2019-02-02 09:11:17");
INSERT INTO sales VALUES("114","posr-20190205-030445","1","","11","2","1","1","1","0","40","440","440","0","0","","","","","1","4","","440","","","2019-02-05 12:34:45","2019-02-05 12:34:45");
INSERT INTO sales VALUES("118","posr-20190207-111542","1","","11","2","1","1","1","0","40","440","440","0","0","","","","","3","2","","","","","2019-02-07 08:45:42","2019-02-07 08:45:42");
INSERT INTO sales VALUES("120","sr-20190207-114036","1","","1","1","2","1","1","0","40","440","440","0","0","","","","","1","2","","50","","","2019-02-07 09:10:36","2019-02-07 10:39:15");
INSERT INTO sales VALUES("121","posr-20190209-104814","1","","11","2","1","7","17","0","55.65","1272","1272","0","0","","","","","1","4","","1272","","","2019-02-09 08:18:14","2019-02-09 08:18:14");
INSERT INTO sales VALUES("123","posr-20190219-023214","1","","11","2","1","1","1","0","40","440","440","0","0","","","","","1","4","","440","","","2019-02-19 12:02:14","2019-02-19 12:02:14");
INSERT INTO sales VALUES("127","posr-20190303-104010","1","","11","2","1","3","3","0","200","2500","2500","0","0","","","","","1","4","","2500","","","2019-03-03 08:10:10","2019-03-03 08:10:10");
INSERT INTO sales VALUES("128","posr-20190404-095555","1","","11","2","1","2","2","0","55.65","560","560","0","0","","","","","1","4","","560","","","2019-04-04 08:25:55","2019-04-04 08:25:55");
INSERT INTO sales VALUES("129","posr-20190404-095937","1","","11","2","1","1","2","0","0","240","240","0","0","0","","","0","1","2","","120","","","2019-04-04 08:29:37","2019-04-11 09:20:16");
INSERT INTO sales VALUES("130","posr-20190421-122124","1","","11","2","1","3","3","0","58.78","586","586","0","0","","","","","1","4","","586","","","2019-04-21 10:51:24","2019-04-21 10:51:24");
INSERT INTO sales VALUES("131","posr-20190528-103229","1","","11","2","1","4","4","0","240","2890","2890","0","0","","","","","1","4","","2890","","","2019-05-28 09:02:29","2019-05-28 09:02:29");
INSERT INTO sales VALUES("132","posr-20190613-101637","1","","11","2","1","3","3","0","40","840","840","0","0","","","","","1","4","","840","","","2019-06-13 08:46:37","2019-06-13 08:46:37");
INSERT INTO sales VALUES("133","posr-20190613-101751","1","","11","2","1","3","4","0","200","2700","2700","0","0","","","","","1","4","","2700","","","2019-06-13 08:47:51","2019-06-13 08:47:51");
INSERT INTO sales VALUES("134","posr-20191019-033028","1","","11","2","1","4","4","0","240","2940","2940","0","0","","","","","1","4","","2940","","","2019-10-19 13:00:28","2019-10-19 13:00:28");
INSERT INTO sales VALUES("138","sr-20191031-122937","1","","1","1","1","1","1","0","0","120","120","0","0","","","","","1","1","","","","","2019-10-31 09:59:37","2019-10-31 09:59:37");
INSERT INTO sales VALUES("139","posr-20191103-114044","1","","11","2","1","2","102","0","37.57","488","488","0","0","","","","","1","4","","488","","","2019-11-03 09:10:44","2019-11-03 09:10:44");
INSERT INTO sales VALUES("144","posr-20191109-074131","1","","11","2","1","2","2","0","100","1220","1220","0","0","0","","","0","1","4","","1220","","","2019-11-09 17:11:31","2019-11-09 17:11:31");
INSERT INTO sales VALUES("147","posr-20191111-104008","1","","11","2","1","3","12","0","200","2220","2220","0","0","","","","","1","4","","2220","","","2019-11-11 08:10:08","2019-11-11 08:10:08");
INSERT INTO sales VALUES("172","posr-20191203-034631","1","","11","2","1","1","1","0","40","440","440","0","0","","","","","1","2","","","","","2019-12-03 13:16:31","2019-12-03 13:16:31");
INSERT INTO sales VALUES("173","sr-20191204-111940","1","","2","1","1","2","2","0","36","621","621","0","0","","","","","1","4","","621","","","2019-12-04 20:49:40","2019-12-05 06:57:12");
INSERT INTO sales VALUES("187","posr-20191222-104058","1","","11","2","1","1","2","0","37.57","288","288","0","0","","","","","1","4","","288","","","2019-12-22 08:10:58","2019-12-22 08:10:58");
INSERT INTO sales VALUES("190","posr-20191223-125946","1","","11","2","1","1","1","0","100","1100","1100","0","0","","","","","1","4","","1100","","","2019-12-23 10:29:46","2019-12-23 10:29:46");
INSERT INTO sales VALUES("193","posr-20200101-022028","1","","11","2","1","1","1","0","100","1100","1100","0","0","","","","","1","4","","1100","","","2020-01-01 11:50:28","2020-01-01 11:50:28");
INSERT INTO sales VALUES("194","posr-20200102-043947","1","","11","2","1","2","3","0","81.57","892","892","0","0","","","","","1","4","","892","","","2020-01-02 14:09:47","2020-01-02 14:09:47");
INSERT INTO sales VALUES("201","posr-20200203-035256","1","","11","2","1","1","1","0","0","120","120","0","0","","","","","1","4","","120","","","2020-02-03 13:22:56","2020-02-03 13:22:56");
INSERT INTO sales VALUES("202","posr-20200204-105853","1","","11","2","1","2","2","0","100","1400","1400","0","0","","","","","1","4","","1400","","","2020-02-04 20:28:53","2020-02-04 20:28:53");
INSERT INTO sales VALUES("203","posr-20200302-115414","1","","11","2","1","2","2","0","0","350","350","0","0","","","","","1","4","","350","","","2020-03-02 09:24:14","2020-03-02 09:24:14");
INSERT INTO sales VALUES("204","posr-20200302-115741","1","","11","2","1","1","20","0","0","40","40","0","0","","","","","1","4","","40","","","2020-03-02 09:27:41","2020-03-02 09:27:41");
INSERT INTO sales VALUES("205","posr-20200311-044641","1","","11","2","1","1","1","0","40","440","352","0","0","","1","88","","1","4","","352","","","2020-03-11 14:16:42","2020-03-11 14:16:42");
INSERT INTO sales VALUES("206","sr-20200311-045230","1","","1","1","1","1","1","0","0","120","120","0","0","0","","","0","1","2","","","","","2020-03-11 14:22:30","2020-03-11 14:24:04");
INSERT INTO sales VALUES("207","posr-20200406-074024","1","","11","2","1","3","4","0","18.78","644","644","0","0","0","","","0","1","4","","644","","","2020-04-06 18:10:24","2020-04-06 18:12:01");
INSERT INTO sales VALUES("208","posr-20200506-105950","1","","11","2","1","2","2","0","140","1540","1540","0","0","","","","","1","4","","1540","","","2020-05-06 21:29:50","2020-05-06 21:29:50");
INSERT INTO sales VALUES("209","posr-20200609-124248","1","","11","2","1","2","2","0","100","1220","1220","0","0","","","","","1","4","","1220","","","2020-06-09 11:12:48","2020-06-09 11:12:48");
INSERT INTO sales VALUES("212","posr-20200703-063914","1","","11","2","1","3","3","0","235","2585","2585","0","0","","","","","1","4","","2585","","","2020-07-03 17:09:14","2020-07-03 17:09:14");
INSERT INTO sales VALUES("213","posr-20200712-095153","1","","11","2","1","1","1","0","0","13","13","0","0","","","","","1","4","","13","","","2020-07-12 20:21:53","2020-07-12 20:21:53");
INSERT INTO sales VALUES("214","posr-20200714-115341","1","","11","2","1","1","1","0","0","250","309.5","10","24.5","5","","","40","3","2","","","","","2020-07-14 10:23:41","2020-07-14 10:23:41");
INSERT INTO sales VALUES("217","posr-20200727-083808","1","","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2020-07-27 19:08:08","2020-07-27 19:08:08");
INSERT INTO sales VALUES("218","posr-20200727-084024","1","","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2020-07-27 19:10:24","2020-07-27 19:10:24");
INSERT INTO sales VALUES("219","posr-20200727-084644","1","","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2020-07-27 19:16:45","2020-07-27 19:16:45");
INSERT INTO sales VALUES("220","posr-20200812-062804","1","","11","2","1","3","6","0","0","760","760","0","0","","","","","1","4","","760","","","2020-08-12 16:58:04","2020-08-12 16:58:04");
INSERT INTO sales VALUES("221","posr-20200812-063035","1","","11","2","1","1","1","0","100","1100","1100","0","0","","","","","1","4","","1100","","","2020-08-12 17:00:35","2020-08-12 17:00:35");
INSERT INTO sales VALUES("222","posr-20200816-100424","1","","11","2","1","1","2","0","3000","23000","23000","0","0","","","","","1","4","","23000","","","2020-08-16 20:34:24","2020-08-16 20:34:24");
INSERT INTO sales VALUES("223","posr-20200816-100523","1","","11","2","1","1","1","0","40","440","440","0","0","","","","","1","4","","440","","","2020-08-16 20:35:23","2020-08-16 20:37:35");
INSERT INTO sales VALUES("224","sr-20200826-080139","1","","1","1","1","1","3","30","117","1287","1287","0","0","","","","","1","1","","","","","2020-08-26 18:31:39","2020-08-26 18:31:39");
INSERT INTO sales VALUES("230","posr-20201017-092852","9","2","11","1","5","1","1","0","0","250","250","0","0","","","","","1","2","","350","","","2020-10-17 18:58:52","2020-10-18 08:21:38");
INSERT INTO sales VALUES("231","sr-20201018-111333","9","2","1","1","5","1","1","0","40","440","440","0","0","","","","","1","2","","250","","","2020-10-18 08:43:33","2020-10-18 08:47:24");
INSERT INTO sales VALUES("232","posr-20201022-013014","9","2","11","1","5","1","1","0","0","100","100","0","0","","","","","1","4","","100","","","2020-10-22 11:00:14","2020-10-22 11:00:14");
INSERT INTO sales VALUES("233","posr-20201022-015604","1","3","11","1","1","1","1","0","0","250","250","0","0","","","","","1","4","","250","","","2020-10-22 11:26:04","2020-10-22 11:26:04");
INSERT INTO sales VALUES("234","posr-20201024-070506","1","4","11","2","1","1","1","0","1500","11500","11500","0","0","","","","","1","4","","11500","","","2020-10-24 04:35:06","2020-10-24 04:35:06");
INSERT INTO sales VALUES("235","posr-20201024-070751","1","4","11","2","1","1","1","0","0","250","250","0","0","","","","","1","4","","250","","","2020-10-24 04:37:51","2020-10-24 04:37:51");
INSERT INTO sales VALUES("237","posr-20201024-034601","1","4","11","2","1","3","9","0","7900","61900","61900","0","0","","","","","1","4","","61900","","","2020-10-24 13:16:01","2020-10-24 13:16:01");
INSERT INTO sales VALUES("239","posr-20201027-054002","1","3","11","1","1","1","1","0","0","2","2","0","0","","","","","1","4","","2","","","2020-10-27 03:10:02","2020-10-27 03:10:02");
INSERT INTO sales VALUES("240","posr-20201027-054206","1","3","11","1","1","1","2","0","0","6","6","0","0","","","","","1","4","","6","","","2020-10-27 03:12:06","2020-10-27 03:12:06");
INSERT INTO sales VALUES("241","posr-20201027-063200","1","4","11","2","1","1","1","0","0","250","250","0","0","","","","","1","4","","250","","","2020-10-27 04:02:00","2020-10-27 04:02:00");
INSERT INTO sales VALUES("242","posr-20201029-073030","1","4","11","2","1","1","1","0","0","250","250","0","0","","","","","1","4","","250","","","2020-10-29 05:00:30","2020-10-29 05:00:30");
INSERT INTO sales VALUES("243","posr-20201101-072112","1","4","11","2","1","1","1","0","0","250","250","0","0","","","","","1","4","","250","","","2020-11-01 04:51:12","2020-11-01 04:51:12");
INSERT INTO sales VALUES("245","posr-20201101-074223","1","3","11","1","5","2","3","0","80","1130","1130","","0","0","","","0","1","4","","1130","","","2020-11-01 05:12:23","2020-11-01 05:12:23");
INSERT INTO sales VALUES("246","posr-20201101-075017","1","4","11","2","1","1","1","0","40","440","440","0","0","0","","","0","1","4","","440","ssss
ssas","hhhh
kkkk","2020-11-01 05:20:17","2020-11-02 14:09:17");
INSERT INTO sales VALUES("250","posr-20201106-013041","1","4","11","2","1","1","1","0","34.4","378.4","378.4","0","0","","","","","1","4","","378.4","","","2020-11-06 11:00:41","2020-11-06 11:00:41");
INSERT INTO sales VALUES("251","posr-20201109-011524","1","4","19","2","1","2","2","0","34.4","610.6","610.6","0","0","","","","","1","2","","500","","","2020-11-09 10:45:24","2020-11-09 10:45:24");
INSERT INTO sales VALUES("252","posr-20201111-055858","1","3","11","1","1","1","1","0","0","229.5","229.5","0","0","","","","","1","4","","229.5","","","2020-11-11 03:28:58","2020-11-11 03:28:58");
INSERT INTO sales VALUES("253","posr-20201114-064736","1","4","11","2","1","3","3","0","1275","10242.5","10242.5","0","0","","","","","1","4","","10242.5","","","2020-11-14 04:17:36","2020-11-14 04:17:36");
INSERT INTO sales VALUES("256","posr-20201117-064748","1","4","11","2","1","2","2","0","65","715","715","0","0","","","","","1","4","","715","","","2020-11-17 04:17:48","2020-11-17 04:17:48");
INSERT INTO sales VALUES("257","posr-20201117-070919","1","4","11","2","1","1","1","0","0","250","250","0","0","","","","","1","4","","250","","","2020-11-17 04:39:19","2020-11-17 04:39:19");
INSERT INTO sales VALUES("258","posr-20201118-065239","1","4","11","2","1","1","3","0","4500","34500","27200","0","0","600","1","6800","100","1","4","","27200","","","2020-11-18 04:22:39","2020-11-18 04:22:39");
INSERT INTO sales VALUES("259","posr-20210404-093707","1","4","11","2","1","4","4","0","18.78","794","794","0","0","","","","","1","4","","794","","","2021-04-04 09:37:07","2021-04-04 09:37:07");
INSERT INTO sales VALUES("261","sr-20210428-110408","1","3","19","1","2","1","1","0","40","440","602.8","10","43.8","2","","","121","1","4","۲۰۲۱۰۲۲۶_۲۲۰۰۲۳.jpg","602.8","aaaaaaaaaaaaaa","aaaaaaaaaaaaaaa","2021-04-28 23:04:08","2021-04-28 23:04:08");
INSERT INTO sales VALUES("262","posr-20210630-075424","1","4","11","2","1","5","6","0","277.57","3028","3028","0","0","","","","","3","4","","3028","","","2021-06-30 19:54:24","2021-06-30 19:54:24");
INSERT INTO sales VALUES("263","posr-20210701-115640","1","4","11","2","1","1","1","0","40","440","440","0","0","","","","","1","4","","440","","","2021-07-01 11:56:40","2021-07-01 11:56:40");
INSERT INTO sales VALUES("264","sr-20210701-120357","1","3","1","1","1","1","1","0","40","440","440","0","0","","","","","1","1","","","","","2021-07-01 12:03:57","2021-07-01 12:03:57");
INSERT INTO sales VALUES("265","sr-20210701-012251","1","3","1","1","1","2","5","0","160","1762","1962","0","0","22","","","222","1","4","","1962","سسس","سس","2021-07-01 13:22:51","2021-07-03 16:31:18");
INSERT INTO sales VALUES("266","posr-20210701-050433","1","4","11","2","1","1","1","0","40","440","439","0","0","1","","","","3","4","","439","","","2021-07-01 17:04:33","2021-07-01 17:04:33");
INSERT INTO sales VALUES("267","posr-20210701-074043","1","4","11","2","1","2","2","0","100","1200","1200","0","0","","","","","1","4","","1200","","","2021-07-01 19:40:43","2021-07-01 19:40:43");
INSERT INTO sales VALUES("268","sr-20210701-074919","1","3","1","1","1","1","1","0","100","1100","3320","0","0","2","","","2222","1","4","","3320","22","2","2021-07-01 19:49:19","2021-07-02 16:02:53");
INSERT INTO sales VALUES("269","posr-20210702-070621","1","4","11","2","1","5","32","0","284.17","6712","6712","","0","0","","","0","1","4","","6712","","","2021-07-02 19:06:21","2021-07-02 19:06:21");
INSERT INTO sales VALUES("270","sr-20210702-070901","1","3","2","1","1","3","51","0","1152","13030.2","2013029.2","0","0","1","","","2000000","1","2","","2013029","","","2021-07-02 19:09:01","2021-07-02 19:09:36");
INSERT INTO sales VALUES("271","sr-20210708-082331","1","4","1","2","1","1","1","0","0","22","22","0","0","33","","","33","2","4","","22","ds","dd","2021-07-08 20:23:31","2021-07-14 01:46:52");
INSERT INTO sales VALUES("272","posr-20210714-033644","1","4","11","2","1","2","2","0","53.78","529","529","0","0","","","","","3","4","","529","","","2021-07-14 03:36:44","2021-07-14 03:36:44");
INSERT INTO sales VALUES("273","posr-20210714-033709","1","4","11","2","1","2","5","0","110.13","961","961","0","0","","","","","1","4","","961","","","2021-07-14 03:37:09","2021-07-14 03:37:09");
INSERT INTO sales VALUES("274","posr-20210714-033948","1","4","11","2","1","2","4","0","123.78","1299","1299","0","0","","","","","3","4","","1299","","","2021-07-14 03:39:48","2021-07-14 03:39:48");
INSERT INTO sales VALUES("275","posr-20210714-034010","1","4","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2021-07-14 03:40:10","2021-07-14 03:40:10");
INSERT INTO sales VALUES("276","posr-20210714-034153","1","4","11","2","1","2","2","0","135","1485","1485","0","0","","","","","1","4","","1485","","","2021-07-14 03:41:53","2021-07-14 03:41:53");
INSERT INTO sales VALUES("277","posr-20210714-034213","1","4","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","sss","ss","2021-07-14 03:42:13","2021-07-14 03:42:13");
INSERT INTO sales VALUES("278","posr-20210714-034237","1","4","11","2","1","1","2","0","70","770","770","0","0","","","","","1","4","","770","sss","ss","2021-07-14 03:42:37","2021-07-14 03:42:37");
INSERT INTO sales VALUES("279","posr-20210714-034626","1","4","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2021-07-14 03:46:26","2021-07-14 03:46:26");
INSERT INTO sales VALUES("280","posr-20210714-034648","1","4","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2021-07-14 03:46:48","2021-07-14 03:46:48");
INSERT INTO sales VALUES("281","posr-20210714-034920","1","4","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2021-07-14 03:49:20","2021-07-14 03:49:20");
INSERT INTO sales VALUES("282","posr-20210714-035201","1","4","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2021-07-14 03:52:01","2021-07-14 03:52:01");
INSERT INTO sales VALUES("283","posr-20210714-035218","1","4","11","2","1","3","3","0","135","1506","1506","0","0","","","","","3","2","","","","","2021-07-14 03:52:18","2021-07-14 03:52:18");
INSERT INTO sales VALUES("284","posr-20210714-035233","1","4","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2021-07-14 03:52:33","2021-07-14 03:52:33");
INSERT INTO sales VALUES("285","posr-20210714-035315","1","4","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2021-07-14 03:53:15","2021-07-14 03:53:15");
INSERT INTO sales VALUES("286","posr-20210714-035510","1","4","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2021-07-14 03:55:10","2021-07-14 03:55:10");
INSERT INTO sales VALUES("287","posr-20210714-035623","1","4","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2021-07-14 03:56:23","2021-07-14 03:56:23");
INSERT INTO sales VALUES("288","posr-20210714-035704","1","4","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2021-07-14 03:57:04","2021-07-14 03:57:04");
INSERT INTO sales VALUES("289","posr-20210714-040237","1","4","11","2","1","1","17","0","595","6545","6545","0","0","","","","","1","4","","6545","","","2021-07-14 04:02:37","2021-07-14 04:02:37");
INSERT INTO sales VALUES("290","posr-20210714-042615","1","5","11","2","1","5","8","0","258.78","3184","3184","0","0","","","","","1","4","","3184","","","2021-07-14 04:26:15","2021-07-14 04:26:15");
INSERT INTO sales VALUES("291","posr-20210714-043359","1","5","11","2","1","2","9","0","250.13","2501","2501","0","0","","","","","1","4","","2501","","","2021-07-14 04:33:59","2021-07-14 04:33:59");
INSERT INTO sales VALUES("292","posr-20210714-043415","1","5","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2021-07-14 04:34:15","2021-07-14 04:34:15");
INSERT INTO sales VALUES("293","posr-20210714-043433","1","5","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","x","d","2021-07-14 04:34:33","2021-07-14 04:34:33");
INSERT INTO sales VALUES("294","posr-20210714-043449","1","5","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","x","d","2021-07-14 04:34:49","2021-07-14 04:34:49");
INSERT INTO sales VALUES("295","posr-20210714-043502","1","5","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","x","d","2021-07-14 04:35:02","2021-07-14 04:35:02");
INSERT INTO sales VALUES("296","posr-20210714-043639","1","5","11","2","1","2","2","0","53.78","529","529","0","0","","","","","1","4","","529","x","d","2021-07-14 04:36:39","2021-07-14 04:36:39");
INSERT INTO sales VALUES("297","posr-20210714-043705","1","5","11","2","1","2","3","0","88.78","914","914","0","0","","","","","1","4","","914","x","d","2021-07-14 04:37:05","2021-07-14 04:37:05");
INSERT INTO sales VALUES("298","posr-20210714-043758","1","5","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2021-07-14 04:37:58","2021-07-14 04:37:58");
INSERT INTO sales VALUES("299","posr-20210714-043820","1","5","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2021-07-14 04:38:20","2021-07-14 04:38:20");
INSERT INTO sales VALUES("300","posr-20210714-045020","1","5","11","2","1","3","3","0","37.57","388","388","0","0","","","","","1","4","","388","","","2021-07-14 04:50:20","2021-07-14 04:50:20");
INSERT INTO sales VALUES("301","posr-20210714-050224","1","5","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2021-07-14 05:02:24","2021-07-14 05:02:24");
INSERT INTO sales VALUES("302","posr-20210714-050242","1","5","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2021-07-14 05:02:42","2021-07-14 05:02:42");
INSERT INTO sales VALUES("303","posr-20210714-050309","1","5","11","2","1","1","0","0","0","0","0","0","0","","","","","1","4","","0","","","2021-07-14 05:03:09","2021-07-14 05:03:09");
INSERT INTO sales VALUES("304","posr-20210714-050701","1","3","11","1","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2021-07-14 05:07:01","2021-07-14 05:07:01");
INSERT INTO sales VALUES("305","posr-20210714-050723","1","3","11","1","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2021-07-14 05:07:23","2021-07-14 05:07:23");
INSERT INTO sales VALUES("306","posr-20210714-050754","1","3","11","1","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2021-07-14 05:07:54","2021-07-14 05:07:54");
INSERT INTO sales VALUES("307","posr-20211109-051225","1","3","11","1","1","7","14","0","7638.13","59713","59713","0","0","","","","","1","4","","59713","","","2021-11-09 17:12:25","2021-11-09 17:12:25");
INSERT INTO sales VALUES("308","posr-20211110-010158","1","3","11","1","1","3","3","0","36.57","497","497","0","0","","","","","1","4","","497","","","2021-11-10 01:01:58","2021-11-10 01:01:58");



CREATE TABLE `stock_counts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `category_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `is_adjusted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO stock_counts VALUES("1","scr-20190228-124939","2","","","1","full","20190228-124939.csv","","","0","2019-02-28 10:19:39","2019-02-28 10:19:39");
INSERT INTO stock_counts VALUES("2","scr-20210404-085240","2","","","1","full","20210404-085240.csv","","","0","2021-04-04 08:52:40","2021-04-04 08:52:40");



CREATE TABLE `suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO suppliers VALUES("1","عبداله","globaltouch.jpg","شرکت نوین پرداز","","abdullah@globaltouch.com","231231","کرج","البرز","","","ایران","1","2018-05-13 02:36:34","2021-07-01 15:36:50");
INSERT INTO suppliers VALUES("2","test","lion.jpg","lion","","lion@gmail.com","242","gfdg","fgd","","","","0","2018-05-30 04:29:41","2018-05-30 04:30:06");
INSERT INTO suppliers VALUES("3","اسماعیل","","همت صنعت نوین","","ismail@test.com","23123123","مشهد","مشهد","","","ایران","1","2018-07-20 09:04:17","2021-07-14 03:06:49");
INSERT INTO suppliers VALUES("4","modon","mogaFruit.jpg","mogaFruit","","modon@gmail.com","32321","nasirabad","chittagong","","","bd","0","2018-09-01 09:00:07","2018-09-01 09:07:20");
INSERT INTO suppliers VALUES("5","sadman","","anda boda","dsa","asd@dsa.com","3212313","dadas","sdad","Other","1312","Australia","0","2020-06-22 14:18:33","2020-06-22 14:18:52");



CREATE TABLE `taxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO taxes VALUES("1","مالیات","10","1","2018-05-12 14:28:30","2021-07-01 17:24:16");
INSERT INTO taxes VALUES("2","ارزش افزوده","15","1","2018-05-12 14:28:43","2021-07-01 17:24:27");
INSERT INTO taxes VALUES("3","test","6","0","2018-05-28 04:02:54","2018-05-28 04:04:44");
INSERT INTO taxes VALUES("4","vat 20","20","0","2018-09-01 05:28:57","2021-07-01 17:24:46");



CREATE TABLE `transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `from_warehouse_id` int(11) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO transfers VALUES("1","tr-20180808-051710","1","1","2","1","1","100","0","100","0","100","","","2018-08-08 15:47:10","2018-12-25 01:46:55");
INSERT INTO transfers VALUES("6","tr-20191205-075504","1","1","1","2","1","1","0","2","0","2","","","2019-12-05 17:25:04","2019-12-05 17:39:42");
INSERT INTO transfers VALUES("8","tr-20200122-123058","1","1","1","2","1","10","0","1000","","1000","","","2020-01-22 10:00:58","2020-01-22 10:00:58");
INSERT INTO transfers VALUES("10","tr-20201008-012735","9","1","1","2","1","1","32","352","0","352","","","2020-10-08 10:57:35","2020-10-08 10:59:35");
INSERT INTO transfers VALUES("11","tr-20201018-061708","9","1","1","2","1","1","0","1","","1","","","2020-10-18 15:47:08","2020-10-18 15:47:08");
INSERT INTO transfers VALUES("12","tr-20201024-090146","1","1","2","1","1","10","4500","34500","","34500","","","2020-10-24 06:31:46","2020-10-24 06:31:46");
INSERT INTO transfers VALUES("13","tr-20210404-101822","1","3","2","1","2","2","32","362","322","684","","DSSDDS","2021-04-04 10:18:22","2021-04-04 10:18:22");
INSERT INTO transfers VALUES("14","tr-20210701-072156","1","2","1","2","1","3","96","1056","22","1078","","سسس","2021-07-01 19:21:56","2021-07-01 19:21:56");
INSERT INTO transfers VALUES("15","tr-20210714-025502","1","2","1","2","1","1","32","352","","352","","","2021-07-14 02:55:02","2021-07-14 02:55:02");



CREATE TABLE `units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unit_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_value` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO units VALUES("1","pc","Piece","","*","1","0","2018-05-12 06:57:46","2021-04-04 10:00:30");
INSERT INTO units VALUES("2","dozen","dozen box","1","*","12","0","2018-05-12 14:27:05","2021-04-04 10:00:23");
INSERT INTO units VALUES("3","cartoon","کارتون","1","*","24","0","2018-05-12 14:27:45","2021-04-04 10:00:35");
INSERT INTO units VALUES("4","mater","متر","","*","1","1","2018-05-12 14:28:07","2021-04-04 10:00:51");
INSERT INTO units VALUES("6","test","test","","*","1","0","2018-05-28 03:50:20","2018-05-28 03:50:25");
INSERT INTO units VALUES("7","kg","کیلوگرم","","*","1","1","2018-06-25 05:19:26","2021-04-04 09:59:46");
INSERT INTO units VALUES("8","20","ni33","8","*","1","0","2018-08-01 03:05:51","2018-08-01 03:10:54");
INSERT INTO units VALUES("9","gm","گرم","7","/","1000","1","2018-09-01 04:36:28","2021-04-04 09:59:55");
INSERT INTO units VALUES("10","gz","goz","","*","1","0","2018-11-29 07:10:29","2019-03-02 15:23:29");



CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES("1","admin","jaferi.mehran@yahoo.com","$2y$10$nHSkhoSWE6BO17AQ0XrSPOXJ1XKFsWfPDjWXiz/mF1DnH/Q2DV2RS","Mvj7q1bPIYMrA8JJtjQwsITGAFujGcs0h8enUnhetPFdyfCmolPDZ2WAkQA5","09222872486","کارگروه فناوری اطلاعات ایدو","1","","","1","0","2018-06-02 07:54:15","2021-11-09 14:17:29");
INSERT INTO users VALUES("3","dhiman da","dhiman@gmail.com","$2y$10$Fef6vu5E67nm11hX7V5a2u1ThNCQ6n9DRCvRF9TD7stk.Pmt2R6O.","5ehQM6JIfiQfROgTbB5let0Z93vjLHS7rd9QD5RPNgOxli3xdo7fykU7vtTt","212","lioncoders","1","","","0","1","2018-06-14 02:30:31","2020-11-05 10:36:51");
INSERT INTO users VALUES("6","test","test@gmail.com","$2y$10$TDAeHcVqHyCmurki0wjLZeIl1SngKX3WLOhyTiCoZG3souQfqv.LS","KpW1gYYlOFacumklO2IcRfSsbC3KcWUZzOI37gqoqM388Xie6KdhaOHIFEYm","1234","212312","4","","","0","1","2018-06-23 07:35:33","2018-06-23 07:43:45");
INSERT INTO users VALUES("8","test","test@yahoo.com","$2y$10$hlMigidZV0j2/IPkgE/xsOSb8WM2IRlsMv.1hg1NM7kfyd6bGX3hC","","31231","","4","","","0","1","2018-06-25 03:05:49","2018-07-02 05:37:39");
INSERT INTO users VALUES("9","staff","anda@gmail.com","$2y$10$kxDbnynB6mB1e1w3pmtbSOlSxy/WwbLPY5TJpMi0Opao5ezfuQjQm","DIDsmdI5kMZfkk2n4OkOpuH8yYHs3O0aPp9xUO0zuY4TwPvylsW5H6ovgE0K","3123","","4","5","1","1","0","2018-07-02 05:38:08","2018-10-24 01:11:13");
INSERT INTO users VALUES("10","abul","abul@alpha.com","$2y$10$5zgB2OOMyNBNVAd.QOQIju5a9fhNnTqPx5H6s4oFlXhNiF6kXEsPq","x7HlttI5bM0vSKViqATaowHFJkLS3PHwfvl7iJdFl5Z1SsyUgWCVbLSgAoi0","1234","anda","1","","","0","1","2018-09-08 04:14:48","2021-04-04 15:30:50");
INSERT INTO users VALUES("11","teststaff","a@a.com","$2y$10$5KNBIIhZzvvZEQEhkHaZGu.Q8bbQNfqYvYgL5N55B8Pb4P5P/b/Li","DkHDEcCA0QLfsKPkUK0ckL0CPM6dPiJytNa0k952gyTbeAyMthW3vi7IRitp","111","aa","4","5","1","0","1","2018-10-22 06:17:56","2018-10-23 05:40:56");
INSERT INTO users VALUES("12","john","john@gmail.com","$2y$10$P/pN2J/uyTYNzQy2kRqWwuSv7P2f6GE/ykBwtHdda7yci3XsfOKWe","O0f1WJBVjT5eKYl3Js5l1ixMMtoU6kqrH7hbHDx9I1UCcD9CmiSmCBzHbQZg","10001","","4","2","2","0","1","2018-12-30 04:18:37","2019-03-06 08:29:49");
INSERT INTO users VALUES("13","jjj","test@test.com","$2y$10$/Qx3gHWYWUhlF1aPfzXaCeZA7fRzfSEyCIOnk/dcC4ejO8PsoaalG","","1213","","1","","","0","1","2019-01-03 03:38:31","2019-03-03 07:32:29");
INSERT INTO users VALUES("19","shakalaka","shakalaka@gmail.com","$2y$10$ketLWT0Ib/JXpo00eJlxoeSw.7leS8V1CUGInfbyOWT4F5.Xuo7S2","","1212","Digital image","5","","","1","0","2020-11-09 03:37:16","2020-11-09 03:37:16");
INSERT INTO users VALUES("21","modon","modon@gmail.com","$2y$10$7VpoeGMkP8QCvL5zLwFW..6MYJ5MRumDLDoX.TTQtClS561rpFHY.","","2222","modon company","5","","","0","1","2020-11-13 10:42:08","2021-04-04 15:29:28");
INSERT INTO users VALUES("22","dhiman","dhiman@gmail.com","$2y$10$3mPygsC6wwnDtw/Sg85IpuExtUhgaHx52Lwp7Rz0.FNfuFdfKVpRq","","+8801111111101","lioncoders","5","","","0","1","2020-11-15 09:44:58","2021-04-04 15:29:28");
INSERT INTO users VALUES("23","novin@yahoo.com","novin@yahoo.com","$2y$10$SHuVV9Gcyh9LRYd8L9MK8ukMcMFTh.IHYZrLRc5lwBnEHGE2t9lvG","","09033602978","نونی پرداز","5","","","1","0","2021-07-01 16:55:43","2021-07-01 16:55:43");



CREATE TABLE `variants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO variants VALUES("2","Medium","2019-11-21 10:33:04","2019-11-24 12:13:52");
INSERT INTO variants VALUES("3","Small","2019-11-21 10:33:04","2019-11-24 12:13:52");
INSERT INTO variants VALUES("5","Large","2019-11-24 09:37:20","2019-11-24 12:14:56");
INSERT INTO variants VALUES("9","a","2020-05-18 21:14:14","2020-05-18 21:14:14");
INSERT INTO variants VALUES("11","b","2020-05-18 21:23:49","2020-05-18 21:23:49");
INSERT INTO variants VALUES("12","variant 1","2020-09-27 09:38:27","2020-09-27 09:38:27");
INSERT INTO variants VALUES("13","variant 2","2020-09-27 09:38:27","2020-09-27 09:38:27");
INSERT INTO variants VALUES("15","S","2020-11-16 09:39:33","2020-11-16 09:39:33");
INSERT INTO variants VALUES("16","M","2020-11-16 09:39:33","2020-11-16 09:39:33");
INSERT INTO variants VALUES("17","L","2020-11-16 09:39:33","2020-11-16 09:39:33");



CREATE TABLE `warehouses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO warehouses VALUES("1","انبار شماره یک","2312121","war1@lion.com","تهران شمس آباد","1","2018-05-12 12:21:44","2021-04-04 08:54:49");
INSERT INTO warehouses VALUES("2","انبار شماره دو","1234","","مازندران شهرک صنعتی نور","1","2018-05-12 12:39:03","2021-04-04 08:55:10");
INSERT INTO warehouses VALUES("3","test","","","dqwdeqw","0","2018-05-30 04:44:23","2018-05-30 04:44:47");
INSERT INTO warehouses VALUES("6","gudam","2121","","gazipur","0","2018-09-01 03:23:26","2018-09-01 03:24:48");
INSERT INTO warehouses VALUES("7","انبار شماره سه","09222","iran@yahoo.com","خوزستان بندر ماهشهر","1","2021-04-04 10:09:48","2021-04-04 10:10:01");

