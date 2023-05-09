-- Trabajo con Sakila

-- Vamos a realizar el trabajo con una BBDD existente en la documentación oficial de MySql. Su nombre es Sakila.

-- El diagrama ER de esta BBDD es el siguiente:

-- La base de datos está disponible en la web oficial de MySQL.

-- A continuación se debe de realizar la carga de la BBDD.

-- Sigue los siguientes pasos para la carga del esquema y los datos.

-- Se pide:

--     Realiza la carga de la BBDD de Sakila, tal y como se muestra en los enlaces proporcionados.
--     Realiza cada una de las siguientes consultas:
--         Actores que tienen de primer nombre Scarlett.
select * from actor where first_name = 'Scarlett';
/*
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|       81 | SCARLETT   | DAMON     | 2006-02-15 04:34:33 |
|      124 | SCARLETT   | BENING    | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
*/
--         Actores que tienen de apellido Johansson.
select * from actor where last_name = 'Johansson';
/*
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|        8 | MATTHEW    | JOHANSSON | 2006-02-15 04:34:33 |
|       64 | RAY        | JOHANSSON | 2006-02-15 04:34:33 |
|      146 | ALBERT     | JOHANSSON | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
*/
--         Actores que contengan una O en su nombre.
select * from actor where first_name like '%O%';
/*
+----------+-------------+--------------+---------------------+
| actor_id | first_name  | last_name    | last_update         |
+----------+-------------+--------------+---------------------+
|        1 | PENELOPE    | GUINESS      | 2006-02-15 04:34:33 |
|        5 | JOHNNY      | LOLLOBRIGIDA | 2006-02-15 04:34:33 |
|        9 | JOE         | SWANK        | 2006-02-15 04:34:33 |
|       11 | ZERO        | CAGE         | 2006-02-15 04:34:33 |
|       19 | BOB         | FAWCETT      | 2006-02-15 04:34:33 |
|       24 | CAMERON     | STREEP       | 2006-02-15 04:34:33 |
|       28 | WOODY       | HOFFMAN      | 2006-02-15 04:34:33 |
|       38 | TOM         | MCKELLEN     | 2006-02-15 04:34:33 |
|       39 | GOLDIE      | BRODY        | 2006-02-15 04:34:33 |
|       40 | JOHNNY      | CAGE         | 2006-02-15 04:34:33 |
|       41 | JODIE       | DEGENERES    | 2006-02-15 04:34:33 |
|       42 | TOM         | MIRANDA      | 2006-02-15 04:34:33 |
|       54 | PENELOPE    | PINKETT      | 2006-02-15 04:34:33 |
|       63 | CAMERON     | WRAY         | 2006-02-15 04:34:33 |
|       78 | GROUCHO     | SINATRA      | 2006-02-15 04:34:33 |
|       82 | WOODY       | JOLIE        | 2006-02-15 04:34:33 |
|       91 | CHRISTOPHER | BERRY        | 2006-02-15 04:34:33 |
|      104 | PENELOPE    | CRONYN       | 2006-02-15 04:34:33 |
|      106 | GROUCHO     | DUNST        | 2006-02-15 04:34:33 |
|      111 | CAMERON     | ZELLWEGER    | 2006-02-15 04:34:33 |
|      113 | MORGAN      | HOPKINS      | 2006-02-15 04:34:33 |
|      114 | MORGAN      | MCDORMAND    | 2006-02-15 04:34:33 |
|      115 | HARRISON    | BALE         | 2006-02-15 04:34:33 |
|      120 | PENELOPE    | MONROE       | 2006-02-15 04:34:33 |
|      137 | MORGAN      | WILLIAMS     | 2006-02-15 04:34:33 |
|      140 | WHOOPI      | HURT         | 2006-02-15 04:34:33 |
|      151 | GEOFFREY    | HESTON       | 2006-02-15 04:34:33 |
|      162 | OPRAH       | KILMER       | 2006-02-15 04:34:33 |
|      163 | CHRISTOPHER | WEST         | 2006-02-15 04:34:33 |
|      171 | OLYMPIA     | PFEIFFER     | 2006-02-15 04:34:33 |
|      172 | GROUCHO     | WILLIAMS     | 2006-02-15 04:34:33 |
|      176 | JON         | CHASE        | 2006-02-15 04:34:33 |
|      188 | ROCK        | DUKAKIS      | 2006-02-15 04:34:33 |
|      191 | GREGORY     | GOODING      | 2006-02-15 04:34:33 |
|      192 | JOHN        | SUVARI       | 2006-02-15 04:34:33 |
|      200 | THORA       | TEMPLE       | 2006-02-15 04:34:33 |
+----------+-------------+--------------+---------------------+
*/
--         Actores que contengan una O en su nombre y en una A en su apellido.
select * from actor where first_name like '%O%' and last_name like '%A%';
/*
+----------+------------+--------------+---------------------+
| actor_id | first_name | last_name    | last_update         |
+----------+------------+--------------+---------------------+
|        5 | JOHNNY     | LOLLOBRIGIDA | 2006-02-15 04:34:33 |
|        9 | JOE        | SWANK        | 2006-02-15 04:34:33 |
|       11 | ZERO       | CAGE         | 2006-02-15 04:34:33 |
|       19 | BOB        | FAWCETT      | 2006-02-15 04:34:33 |
|       28 | WOODY      | HOFFMAN      | 2006-02-15 04:34:33 |
|       40 | JOHNNY     | CAGE         | 2006-02-15 04:34:33 |
|       42 | TOM        | MIRANDA      | 2006-02-15 04:34:33 |
|       63 | CAMERON    | WRAY         | 2006-02-15 04:34:33 |
|       78 | GROUCHO    | SINATRA      | 2006-02-15 04:34:33 |
|      114 | MORGAN     | MCDORMAND    | 2006-02-15 04:34:33 |
|      115 | HARRISON   | BALE         | 2006-02-15 04:34:33 |
|      137 | MORGAN     | WILLIAMS     | 2006-02-15 04:34:33 |
|      172 | GROUCHO    | WILLIAMS     | 2006-02-15 04:34:33 |
|      176 | JON        | CHASE        | 2006-02-15 04:34:33 |
|      188 | ROCK       | DUKAKIS      | 2006-02-15 04:34:33 |
|      192 | JOHN       | SUVARI       | 2006-02-15 04:34:33 |
+----------+------------+--------------+---------------------+
*/
--         Actores que contengan dos O en su nombre y en una A en su apellido.
select * from actor where first_name like '%O%O%' and last_name like '%A%';
/*
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|       28 | WOODY      | HOFFMAN   | 2006-02-15 04:34:33 |
|       78 | GROUCHO    | SINATRA   | 2006-02-15 04:34:33 |
|      172 | GROUCHO    | WILLIAMS  | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
*/
--         Actores donde su tercera letra sea B.
select * from actor where first_name like '__B%';
/*
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|       15 | CUBA       | OLIVIER   | 2006-02-15 04:34:33 |
|       19 | BOB        | FAWCETT   | 2006-02-15 04:34:33 |
|      118 | CUBA       | ALLEN     | 2006-02-15 04:34:33 |
|      125 | ALBERT     | NOLTE     | 2006-02-15 04:34:33 |
|      146 | ALBERT     | JOHANSSON | 2006-02-15 04:34:33 |
|      182 | DEBBIE     | AKROYD    | 2006-02-15 04:34:33 |
|      189 | CUBA       | BIRCH     | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
*/
--         Ciudades que empiezan por a.
select * from city where city like 'a%';
/*
+---------+-------------------------+------------+---------------------+
| city_id | city                    | country_id | last_update         |
+---------+-------------------------+------------+---------------------+
|       1 | A Coruña (La Coruña)    |         87 | 2006-02-15 04:45:25 |
|       2 | Abha                    |         82 | 2006-02-15 04:45:25 |
|       3 | Abu Dhabi               |        101 | 2006-02-15 04:45:25 |
|       4 | Acuña                   |         60 | 2006-02-15 04:45:25 |
|       5 | Adana                   |         97 | 2006-02-15 04:45:25 |
|       6 | Addis Abeba             |         31 | 2006-02-15 04:45:25 |
|       7 | Aden                    |        107 | 2006-02-15 04:45:25 |
|       8 | Adoni                   |         44 | 2006-02-15 04:45:25 |
|       9 | Ahmadnagar              |         44 | 2006-02-15 04:45:25 |
|      10 | Akishima                |         50 | 2006-02-15 04:45:25 |
|      11 | Akron                   |        103 | 2006-02-15 04:45:25 |
|      12 | al-Ayn                  |        101 | 2006-02-15 04:45:25 |
|      13 | al-Hawiya               |         82 | 2006-02-15 04:45:25 |
|      14 | al-Manama               |         11 | 2006-02-15 04:45:25 |
|      15 | al-Qadarif              |         89 | 2006-02-15 04:45:25 |
|      16 | al-Qatif                |         82 | 2006-02-15 04:45:25 |
|      17 | Alessandria             |         49 | 2006-02-15 04:45:25 |
|      18 | Allappuzha (Alleppey)   |         44 | 2006-02-15 04:45:25 |
|      19 | Allende                 |         60 | 2006-02-15 04:45:25 |
|      20 | Almirante Brown         |          6 | 2006-02-15 04:45:25 |
|      21 | Alvorada                |         15 | 2006-02-15 04:45:25 |
|      22 | Ambattur                |         44 | 2006-02-15 04:45:25 |
|      23 | Amersfoort              |         67 | 2006-02-15 04:45:25 |
|      24 | Amroha                  |         44 | 2006-02-15 04:45:25 |
|      25 | Angra dos Reis          |         15 | 2006-02-15 04:45:25 |
|      26 | Anápolis                |         15 | 2006-02-15 04:45:25 |
|      27 | Antofagasta             |         22 | 2006-02-15 04:45:25 |
|      28 | Aparecida de Goiânia    |         15 | 2006-02-15 04:45:25 |
|      29 | Apeldoorn               |         67 | 2006-02-15 04:45:25 |
|      30 | Araçatuba               |         15 | 2006-02-15 04:45:25 |
|      31 | Arak                    |         46 | 2006-02-15 04:45:25 |
|      32 | Arecibo                 |         77 | 2006-02-15 04:45:25 |
|      33 | Arlington               |        103 | 2006-02-15 04:45:25 |
|      34 | Ashdod                  |         48 | 2006-02-15 04:45:25 |
|      35 | Ashgabat                |         98 | 2006-02-15 04:45:25 |
|      36 | Ashqelon                |         48 | 2006-02-15 04:45:25 |
|      37 | Asunción                |         73 | 2006-02-15 04:45:25 |
|      38 | Athenai                 |         39 | 2006-02-15 04:45:25 |
|      39 | Atšinsk                 |         80 | 2006-02-15 04:45:25 |
|      40 | Atlixco                 |         60 | 2006-02-15 04:45:25 |
|      41 | Augusta-Richmond County |        103 | 2006-02-15 04:45:25 |
|      42 | Aurora                  |        103 | 2006-02-15 04:45:25 |
|      43 | Avellaneda              |          6 | 2006-02-15 04:45:25 |
|     190 | Águas Lindas de Goiás   |         15 | 2006-02-15 04:45:25 |
+---------+-------------------------+------------+---------------------+
*/
--         Ciudades que acaban por s.
select * from city where city like '%s';
/*
+---------+----------------------------+------------+---------------------+
| city_id | city                       | country_id | last_update         |
+---------+----------------------------+------------+---------------------+
|      25 | Angra dos Reis             |         15 | 2006-02-15 04:45:25 |
|      26 | Anápolis                   |         15 | 2006-02-15 04:45:25 |
|      79 | Bilbays                    |         29 | 2006-02-15 04:45:25 |
|     102 | Caracas                    |        104 | 2006-02-15 04:45:25 |
|     118 | Ciomas                     |         45 | 2006-02-15 04:45:25 |
|     120 | Citrus Heights             |        103 | 2006-02-15 04:45:25 |
|     125 | Coatzacoalcos              |         60 | 2006-02-15 04:45:25 |
|     135 | Dallas                     |        103 | 2006-02-15 04:45:25 |
|     137 | Daugavpils                 |         54 | 2006-02-15 04:45:25 |
|     147 | Dos Quebradas              |         24 | 2006-02-15 04:45:25 |
|     190 | Águas Lindas de Goiás      |         15 | 2006-02-15 04:45:25 |
|     212 | Huejutla de Reyes          |         60 | 2006-02-15 04:45:25 |
|     221 | Imus                       |         75 | 2006-02-15 04:45:25 |
|     238 | Jelets                     |         80 | 2006-02-15 04:45:25 |
|     266 | Kilis                      |         97 | 2006-02-15 04:45:25 |
|     297 | Le Mans                    |         34 | 2006-02-15 04:45:25 |
|     330 | Matamoros                  |         60 | 2006-02-15 04:45:25 |
|     333 | Memphis                    |        103 | 2006-02-15 04:45:25 |
|     391 | Ozamis                     |         75 | 2006-02-15 04:45:25 |
|     401 | Patras                     |         39 | 2006-02-15 04:45:25 |
|     413 | Poços de Caldas            |         15 | 2006-02-15 04:45:25 |
|     424 | Quilmes                    |          6 | 2006-02-15 04:45:25 |
|     441 | Saint Louis                |        103 | 2006-02-15 04:45:25 |
|     442 | Saint-Denis                |         79 | 2006-02-15 04:45:25 |
|     446 | Salinas                    |        103 | 2006-02-15 04:45:25 |
|     460 | Santiago de los Caballeros |         27 | 2006-02-15 04:45:25 |
|     482 | Sivas                      |         97 | 2006-02-15 04:45:25 |
|     497 | Springs                    |         85 | 2006-02-15 04:45:25 |
|     499 | Sterling Heights           |        103 | 2006-02-15 04:45:25 |
|     529 | Tarsus                     |         97 | 2006-02-15 04:45:25 |
|     570 | Vilnius                    |         56 | 2006-02-15 04:45:25 |
+---------+----------------------------+------------+---------------------+
*/
--         Ciudades del country 61.
select * from city where country_id = 61;
/*
+---------+----------+------------+---------------------+
| city_id | city     | country_id | last_update         |
+---------+----------+------------+---------------------+
|     115 | Chisinau |         61 | 2006-02-15 04:45:25 |
+---------+----------+------------+---------------------+
*/
--         Ciudades del country Spain.
select * from city where country_id = (select country_id from city where
city = 'Valencia');
/*
+---------+--------------------+------------+---------------------+
| city_id | city               | country_id | last_update         |
+---------+--------------------+------------+---------------------+
|      55 | Barcelona          |        104 | 2006-02-15 04:45:25 |
|     102 | Caracas            |        104 | 2006-02-15 04:45:25 |
|     132 | Cumaná             |        104 | 2006-02-15 04:45:25 |
|     326 | Maracaíbo          |        104 | 2006-02-15 04:45:25 |
|     373 | Ocumare del Tuy    |        104 | 2006-02-15 04:45:25 |
|     561 | Valencia           |        104 | 2006-02-15 04:45:25 |
|     562 | Valle de la Pascua |        104 | 2006-02-15 04:45:25 |
+---------+--------------------+------------+---------------------+
*/
--         Ciudades con nombres compuestos.
select * from city where city like '% %';
/*
+---------+----------------------------+------------+---------------------+
| city_id | city                       | country_id | last_update         |
+---------+----------------------------+------------+---------------------+
|       1 | A Coruña (La Coruña)       |         87 | 2006-02-15 04:45:25 |
|       3 | Abu Dhabi                  |        101 | 2006-02-15 04:45:25 |
|       6 | Addis Abeba                |         31 | 2006-02-15 04:45:25 |
|      18 | Allappuzha (Alleppey)      |         44 | 2006-02-15 04:45:25 |
|      20 | Almirante Brown            |          6 | 2006-02-15 04:45:25 |
|      25 | Angra dos Reis             |         15 | 2006-02-15 04:45:25 |
|      28 | Aparecida de Goiânia       |         15 | 2006-02-15 04:45:25 |
|      41 | Augusta-Richmond County    |        103 | 2006-02-15 04:45:25 |
|      45 | Bahía Blanca               |          6 | 2006-02-15 04:45:25 |
|      53 | Bandar Seri Begawan        |         16 | 2006-02-15 04:45:25 |
|      57 | Bat Yam                    |         48 | 2006-02-15 04:45:25 |
|      69 | Benin City                 |         69 | 2006-02-15 04:45:25 |
|      71 | Berhampore (Baharampur)    |         44 | 2006-02-15 04:45:25 |
|      84 | Boa Vista                  |         15 | 2006-02-15 04:45:25 |
|     100 | Cam Ranh                   |        105 | 2006-02-15 04:45:25 |
|     101 | Cape Coral                 |        103 | 2006-02-15 04:45:25 |
|     111 | Charlotte Amalie           |        106 | 2006-02-15 04:45:25 |
|     120 | Citrus Heights             |        103 | 2006-02-15 04:45:25 |
|     121 | Città del Vaticano         |         41 | 2006-02-15 04:45:25 |
|     122 | Ciudad del Este            |         73 | 2006-02-15 04:45:25 |
|     124 | Coacalco de Berriozábal    |         60 | 2006-02-15 04:45:25 |
|     141 | Deba Habe                  |         69 | 2006-02-15 04:45:25 |
|     144 | Dhule (Dhulia)             |         44 | 2006-02-15 04:45:25 |
|     146 | Donostia-San Sebastián     |         87 | 2006-02-15 04:45:25 |
|     147 | Dos Quebradas              |         24 | 2006-02-15 04:45:25 |
|     153 | El Alto                    |         14 | 2006-02-15 04:45:25 |
|     154 | El Fuerte                  |         60 | 2006-02-15 04:45:25 |
|     155 | El Monte                   |        103 | 2006-02-15 04:45:25 |
|     177 | Garden Grove               |        103 | 2006-02-15 04:45:25 |
|     185 | Grand Prairie              |        103 | 2006-02-15 04:45:25 |
|     190 | Águas Lindas de Goiás      |         15 | 2006-02-15 04:45:25 |
|     212 | Huejutla de Reyes          |         60 | 2006-02-15 04:45:25 |
|     233 | Jalib al-Shuyukh           |         53 | 2006-02-15 04:45:25 |
|     246 | José Azueta                |         60 | 2006-02-15 04:45:25 |
|     247 | Juazeiro do Norte          |         15 | 2006-02-15 04:45:25 |
|     248 | Juiz de Fora               |         15 | 2006-02-15 04:45:25 |
|     262 | Kansas City                |        103 | 2006-02-15 04:45:25 |
|     279 | Kowloon and New Kowloon    |         42 | 2006-02-15 04:45:25 |
|     288 | La Paz                     |         60 | 2006-02-15 04:45:25 |
|     289 | La Plata                   |          6 | 2006-02-15 04:45:25 |
|     290 | La Romana                  |         27 | 2006-02-15 04:45:25 |
|     297 | Le Mans                    |         34 | 2006-02-15 04:45:25 |
|     324 | Mandi Bahauddin            |         72 | 2006-02-15 04:45:25 |
|     337 | Mit Ghamr                  |         29 | 2006-02-15 04:45:25 |
|     346 | Munger (Monghyr)           |         44 | 2006-02-15 04:45:25 |
|     352 | Nabereznyje Tšelny         |         80 | 2006-02-15 04:45:25 |
|     358 | Nakhon Sawan               |         94 | 2006-02-15 04:45:25 |
|     359 | Nam Dinh                   |        105 | 2006-02-15 04:45:25 |
|     366 | Nha Trang                  |        105 | 2006-02-15 04:45:25 |
|     368 | Novi Sad                   |        108 | 2006-02-15 04:45:25 |
|     373 | Ocumare del Tuy            |        104 | 2006-02-15 04:45:25 |
|     388 | Ourense (Orense)           |         87 | 2006-02-15 04:45:25 |
|     393 | Pachuca de Soto            |         60 | 2006-02-15 04:45:25 |
|     394 | Pak Kret                   |         94 | 2006-02-15 04:45:25 |
|     395 | Palghat (Palakkad)         |         44 | 2006-02-15 04:45:25 |
|     396 | Pangkal Pinang             |         45 | 2006-02-15 04:45:25 |
|     406 | Phnom Penh                 |         18 | 2006-02-15 04:45:25 |
|     413 | Poços de Caldas            |         15 | 2006-02-15 04:45:25 |
|     418 | Purnea (Purnia)            |         44 | 2006-02-15 04:45:25 |
|     425 | Rae Bareli                 |         44 | 2006-02-15 04:45:25 |
|     430 | Richmond Hill              |         20 | 2006-02-15 04:45:25 |
|     431 | Rio Claro                  |         15 | 2006-02-15 04:45:25 |
|     441 | Saint Louis                |        103 | 2006-02-15 04:45:25 |
|     449 | San Bernardino             |        103 | 2006-02-15 04:45:25 |
|     450 | San Felipe de Puerto Plata |         27 | 2006-02-15 04:45:25 |
|     451 | San Felipe del Progreso    |         60 | 2006-02-15 04:45:25 |
|     452 | San Juan Bautista Tuxtepec |         60 | 2006-02-15 04:45:25 |
|     453 | San Lorenzo                |         73 | 2006-02-15 04:45:25 |
|     454 | San Miguel de Tucumán      |          6 | 2006-02-15 04:45:25 |
|     456 | Santa Brbara dOeste        |         15 | 2006-02-15 04:45:25 |
|     457 | Santa Fé                   |          6 | 2006-02-15 04:45:25 |
|     458 | Santa Rosa                 |         75 | 2006-02-15 04:45:25 |
|     459 | Santiago de Compostela     |         87 | 2006-02-15 04:45:25 |
|     460 | Santiago de los Caballeros |         27 | 2006-02-15 04:45:25 |
|     461 | Santo André                |         15 | 2006-02-15 04:45:25 |
|     467 | Shahr-e Kord               |         46 | 2006-02-15 04:45:25 |
|     476 | Shubra al-Khayma           |         29 | 2006-02-15 04:45:25 |
|     478 | Siliguri (Shiliguri)       |         44 | 2006-02-15 04:45:25 |
|     485 | São Bernardo do Campo      |         15 | 2006-02-15 04:45:25 |
|     486 | São Leopoldo               |         15 | 2006-02-15 04:45:25 |
|     493 | South Hill                 |          5 | 2006-02-15 04:45:25 |
|     498 | Stara Zagora               |         17 | 2006-02-15 04:45:25 |
|     499 | Sterling Heights           |        103 | 2006-02-15 04:45:25 |
|     507 | Sungai Petani              |         59 | 2006-02-15 04:45:25 |
|     533 | Tel Aviv-Jaffa             |         48 | 2006-02-15 04:45:25 |
|     562 | Valle de la Pascua         |        104 | 2006-02-15 04:45:25 |
|     563 | Valle de Santiago          |         60 | 2006-02-15 04:45:25 |
|     566 | Varanasi (Benares)         |         44 | 2006-02-15 04:45:25 |
|     567 | Vicente López              |          6 | 2006-02-15 04:45:25 |
|     569 | Vila Velha                 |         15 | 2006-02-15 04:45:25 |
|     572 | Vitória de Santo Antão     |         15 | 2006-02-15 04:45:25 |
|     582 | Yamuna Nagar               |         44 | 2006-02-15 04:45:25 |
+---------+----------------------------+------------+---------------------+
*/
--         Películas con una duración entre 80 y 100.
select title from film where length between 80 and 100;
/*
+-------------------------+
| title                   |
+-------------------------+
| ACADEMY DINOSAUR        |
| ALICE FANTASIA          |
| ALONE TRIP              |
| AMISTAD MIDSUMMER       |
| ANACONDA CONFESSIONS    |
| ANNIE IDENTITY          |
| ANTHEM LUKE             |
| ANYTHING SAVANNAH       |
| APACHE DIVINE           |
| ARMAGEDDON LOST         |
| ATTRACTION NEWTON       |
| BANG KWAI               |
| BASIC EASY              |
| BEAST HUNCHBACK         |
| BEHAVIOR RUNAWAY        |
| BEVERLY OUTLAW          |
| BILKO ANONYMOUS         |
| BILL OTHERS             |
| BLACKOUT PRIVATE        |
| BOUND CHEAPER           |
| BUTTERFLY CHOCOLAT      |
| CANYON STOCK            |
| CARIBBEAN LIBERTY       |
| CASABLANCA SUPER        |
| CHEAPER CLYDE           |
| CIRCUS YOUTH            |
| CLASH FREDDY            |
| CLUELESS BUCKET         |
| CONGENIALITY QUEST      |
| CORE SUIT               |
| DAISY MENAGERIE         |
| DARES PLUTO             |
| DARKNESS WAR            |
| DELIVERANCE MULHOLLAND  |
| DESPERATE TRAINSPOTTING |
| DETAILS PACKER          |
| DEVIL DESIRE            |
| DISTURBING SCARFACE     |
| DIVINE RESURRECTION     |
| DRUMS DYNAMITE          |
| EARLY HOME              |
| EARRING INSTINCT        |
| EARTH VISION            |
| EGYPT TENENBAUMS        |
| ENCOUNTERS CURTAIN      |
| ENDING CROWDS           |
| EXPENDABLE STALLION     |
| FATAL HAUNTED           |
| FEUD FROGMEN            |
| FIGHT JAWBREAKER        |
| FLAMINGOS CONNECTICUT   |
| FLATLINERS KILLER       |
| FORWARD TEMPLE          |
| FRENCH HOLIDAY          |
| FROST HEAD              |
| FUGITIVE MAGUIRE        |
| FULL FLATLINERS         |
| GANDHI KWAI             |
| GARDEN ISLAND           |
| GHOST GROUNDHOG         |
| GLEAMING JAWBREAKER     |
| GOLDFINGER SENSIBILITY  |
| GONE TROUBLE            |
| GRAIL FRANKENSTEIN      |
| GREATEST NORTH          |
| GUN BONNIE              |
| GUYS FALCON             |
| HAPPINESS UNITED        |
| HIGH ENCINO             |
| HILLS NEIGHBORS         |
| HOLY TADPOLE            |
| HONEY TIES              |
| HORN WORKING            |
| HUSTLER PARTY           |
| HYDE DOCTOR             |
| IDOLS SNATCHERS         |
| INVASION CYCLONE        |
| ISLAND EXORCIST         |
| JEEPERS WEDDING         |
| KANE EXORCIST           |
| LICENSE WEEKEND         |
| LOLA AGENT              |
| LOSER HUSTLER           |
| LOST BIRD               |
| LUCKY FLYING            |
| MADRE GABLES            |
| MEET CHOCOLATE          |
| MIDNIGHT WESTWARD       |
| MOON BUNCH              |
| MYSTIC TRUMAN           |
| NATIONAL STORY          |
| NONE SPIKING            |
| OPPOSITE NECKLACE       |
| OZ LIAISONS             |
| PACKER MADIGAN          |
| PANKY SUBMARINE         |
| PATIENT SISTER          |
| PEAK FOREVER            |
| PERDITION FARGO         |
| PERFECT GROOVE          |
| PET HAUNTING            |
| PIRATES ROXANNE         |
| PLUTO OLEANDER          |
| PREJUDICE OLEANDER      |
| PULP BEVERLY            |
| PUNK DIVORCE            |
| PURPLE MOVIE            |
| RAIDERS ANTITRUST       |
| REAR TRADING            |
| REIGN GENTLEMEN         |
| ROMAN PUNK              |
| ROOTS REMEMBER          |
| SABRINA MIDNIGHT        |
| SADDLE ANTITRUST        |
| SAVANNAH TOWN           |
| SEA VIRGIN              |
| SECRET GROUNDHOG        |
| SENSIBILITY REAR        |
| SHANE DARKNESS          |
| SHAWSHANK BUBBLE        |
| SLEUTH ORIENT           |
| SLING LUKE              |
| STAGE WORLD             |
| STING PERSONAL          |
| STONE FIRE              |
| SUICIDES SILENCE        |
| SUNDANCE INVASION       |
| TARZAN VIDEOTAPE        |
| TENENBAUMS COMMAND      |
| TERMINATOR CLUB         |
| TITANS JERK             |
| TREATMENT JEKYLL        |
| TRUMAN CRAZY            |
| TURN STAR               |
| TYCOON GATHERING        |
| UPTOWN YOUNG            |
| VARSITY TRIP            |
| VERTIGO NORTHWEST       |
| WAR NOTTING             |
| WARLOCK WEREWOLF        |
| WASTELAND DIVINE        |
| WINDOW SIDE             |
| WISDOM WORKER           |
| WITCHES PANIC           |
| WONKA SEA               |
| WYOMING STORM           |
| YENTL IDAHO             |
+-------------------------+
*/
--         Peliculas con un rental_rate entre 1 y 3.
select title from film where rental_rate between 1 and 3;
/*
+-----------------------------+
| title                       |
+-----------------------------+
| ADAPTATION HOLES            |
| AFFAIR PREJUDICE            |
| AFRICAN EGG                 |
| AGENT TRUMAN                |
| ALABAMA DEVIL               |
| ALIEN CENTER                |
| ALLEY EVOLUTION             |
| AMISTAD MIDSUMMER           |
| ANALYZE HOOSIERS            |
| ANGELS LIFE                 |
| ANTITRUST TOMATOES          |
| ANYTHING SAVANNAH           |
| APOLLO TEEN                 |
| ARACHNOPHOBIA ROLLERCOASTER |
| ARIZONA BANG                |
| ARTIST COLDBLOODED          |
| ATLANTIS CAUSE              |
| BADMAN DAWN                 |
| BAKED CLEOPATRA             |
| BALLOON HOMEWARD            |
| BANG KWAI                   |
| BARBARELLA STREETCAR        |
| BAREFOOT MANCHURIAN         |
| BASIC EASY                  |
| BEACH HEARTBREAKERS         |
| BEAR GRACELAND              |
| BED HIGHBALL                |
| BERETS AGENT                |
| BEVERLY OUTLAW              |
| BILL OTHERS                 |
| BINGO TALENTED              |
| BLACKOUT PRIVATE            |
| BLANKET BEVERLY             |
| BLUES INSTINCT              |
| BRAVEHEART HUMAN            |
| BREAKING HOME               |
| BRINGING HYSTERICAL         |
| BUGSY SONG                  |
| BULWORTH COMMANDMENTS       |
| BUNCH MINDS                 |
| CAMPUS REMEMBER             |
| CANDIDATE PERDITION         |
| CAROL TEXAS                 |
| CASSIDY WYOMING             |
| CAUSE DATE                  |
| CHANCE RESURRECTION         |
| CHAPLIN LICENSE             |
| CHARADE DUFFEL              |
| CHARIOTS CONSPIRACY         |
| CHITTY LOCK                 |
| CHOCOLATE DUCK              |
| CIDER DESIRE                |
| CIRCUS YOUTH                |
| CLASH FREDDY                |
| CLONES PINOCCHIO            |
| CLUELESS BUCKET             |
| COLOR PHILADELPHIA          |
| COMFORTS RUSH               |
| CONFUSED CANDLES            |
| CONSPIRACY SPIRIT           |
| CONTACT ANONYMOUS           |
| CORE SUIT                   |
| COWBOY DOOM                 |
| CRANES RESERVOIR            |
| CRAZY HOME                  |
| CROSSROADS CASUALTIES       |
| CRUSADE HONEY               |
| CRYSTAL BREAKING            |
| CUPBOARD SINNERS            |
| CYCLONE FAMILY              |
| DARES PLUTO                 |
| DARKNESS WAR                |
| DEER VIRGINIAN              |
| DESIRE ALIEN                |
| DIARY PANIC                 |
| DINOSAUR SECRETARY          |
| DIRTY ACE                   |
| DISTURBING SCARFACE         |
| DIVIDE MONSTER              |
| DIVINE RESURRECTION         |
| DIVORCE SHINING             |
| DOCTOR GRAIL                |
| DOLLS RAGE                  |
| DREAM PICKUP                |
| DRIVER ANNIE                |
| DUCK RACER                  |
| DWARFS ALTER                |
| EGG IGBY                    |
| ENOUGH RAGING               |
| ESCAPE METROPOLIS           |
| EXORCIST STING              |
| EXPRESS LONELY              |
| EXTRAORDINARY CONQUERER     |
| EYES DRIVING                |
| FANTASIA PARK               |
| FARGO GANDHI                |
| FATAL HAUNTED               |
| FERRIS MOTHER               |
| FISH OPUS                   |
| FLATLINERS KILLER           |
| FLOATS GARDEN               |
| FLYING HOOK                 |
| FOREVER CANDIDATE           |
| FORREST SONS                |
| FORWARD TEMPLE              |
| FREAKY POCUS                |
| FRIDA SLIPPER               |
| FULL FLATLINERS             |
| GANGS PRIDE                 |
| GASLIGHT CRUSADE            |
| GENTLEMEN STAGE             |
| GIANT TROOPERS              |
| GLEAMING JAWBREAKER         |
| GLORY TRACY                 |
| GODFATHER DIARY             |
| GONE TROUBLE                |
| GORGEOUS BINGO              |
| GRADUATE LORD               |
| GRAIL FRANKENSTEIN          |
| GREATEST NORTH              |
| GREEK EVERYONE              |
| GUNFIGHTER MUSSOLINI        |
| HALF OUTFIELD               |
| HALLOWEEN NUTS              |
| HAMLET WISDOM               |
| HANKY OCTOBER               |
| HAPPINESS UNITED            |
| HARDLY ROBBERS              |
| HEAVEN FREEDOM              |
| HEDWIG ALTER                |
| HELLFIGHTERS SIERRA         |
| HIGH ENCINO                 |
| HOCUS FRIDA                 |
| HOMICIDE PEACH              |
| HOOSIERS BIRDCAGE           |
| HOPE TOOTSIE                |
| HORN WORKING                |
| HOUSE DYNAMITE              |
| HUMAN GRAFFITI              |
| HUNTER ALTER                |
| HUNTING MUSKETEERS          |
| HURRICANE AFFAIR            |
| HYDE DOCTOR                 |
| ICE CROSSING                |
| IDAHO LOVE                  |
| IDENTITY LOVER              |
| IDOLS SNATCHERS             |
| IMAGE PRINCESS              |
| INSIDER ARIZONA             |
| INSTINCT AIRPORT            |
| INTENTIONS EMPIRE           |
| INVASION CYCLONE            |
| ISLAND EXORCIST             |
| JACKET FRISCO               |
| JADE BUNCH                  |
| JASON TRAP                  |
| JAWS HARRY                  |
| JEEPERS WEDDING             |
| JEKYLL FROGMEN              |
| JERICHO MULAN               |
| JERK PAYCHECK               |
| JUMANJI BLADE               |
| KENTUCKIAN GIANT            |
| KILLER INNOCENT             |
| KNOCK WARLOCK               |
| KRAMER CHOCOLATE            |
| LABYRINTH LEAGUE            |
| LEATHERNECKS DWARFS         |
| LEBOWSKI SOLDIERS           |
| LIBERTY MAGNIFICENT         |
| LICENSE WEEKEND             |
| LIFE TWISTED                |
| LOCK REAR                   |
| LOLITA WORLD                |
| LONELY ELEPHANT             |
| LORD ARIZONA                |
| LOST BIRD                   |
| LOVELY JINGLE               |
| LOVER TRUMAN                |
| LUCK OPUS                   |
| LUCKY FLYING                |
| LUKE MUMMY                  |
| LUST LOCK                   |
| MADISON TRAP                |
| MADRE GABLES                |
| MAGNIFICENT CHITTY          |
| MAGUIRE APACHE              |
| MALKOVICH PET               |
| MANCHURIAN CURTAIN          |
| MANNEQUIN WORST             |
| MARRIED GO                  |
| MASK PEACH                  |
| MASSAGE IMAGE               |
| MEET CHOCOLATE              |
| MENAGERIE RUSHMORE          |
| METAL ARMAGEDDON            |
| METROPOLIS COMA             |
| MICROCOSMOS PARADISE        |
| MIGHTY LUCK                 |
| MIRACLE VIRTUAL             |
| MIXED DOORS                 |
| MONEY HAROLD                |
| MONSTER SPARTACUS           |
| MULHOLLAND BEAST            |
| MURDER ANTITRUST            |
| MUSCLE BRIGHT               |
| MUSSOLINI SPOILERS          |
| NASH CHOCOLAT               |
| NATIONAL STORY              |
| NEMO CAMPUS                 |
| NETWORK PEAK                |
| NOON PAPI                   |
| NORTHWEST POLISH            |
| OPERATION OPERATION         |
| ORDER BETRAYED              |
| ORIENT CLOSER               |
| OSCAR GOLD                  |
| OTHERS SOUP                 |
| OZ LIAISONS                 |
| PARADISE SABRINA            |
| PARIS WEEKEND               |
| PARTY KNOCK                 |
| PATRIOT ROMAN               |
| PATTON INTERVIEW            |
| PEACH INNOCENT              |
| PEARL DESTINY               |
| PERFECT GROOVE              |
| PHANTOM GLORY               |
| PICKUP DRIVING              |
| PILOT HOOSIERS              |
| PIZZA JUMANJI               |
| POLLOCK DELIVERANCE         |
| POND SEATTLE                |
| POTLUCK MIXED               |
| POTTER CONNECTICUT          |
| PRINCESS GIANT              |
| PRIX UNDEFEATED             |
| PSYCHO SHRUNK               |
| PULP BEVERLY                |
| PURE RUNNER                 |
| PURPLE MOVIE                |
| QUEST MUSSOLINI             |
| RACER EGG                   |
| RANDOM GO                   |
| REAP UNFAITHFUL             |
| REDEMPTION COMFORTS         |
| REIGN GENTLEMEN             |
| REMEMBER DIARY              |
| RESERVOIR ADAPTATION        |
| RIDER CADDYSHACK            |
| ROBBERS JOON                |
| ROLLERCOASTER BRINGING      |
| RUSHMORE MERMAID            |
| SADDLE ANTITRUST            |
| SAGEBRUSH CLUELESS          |
| SAINTS BRIDE                |
| SALUTE APOLLO               |
| SAMURAI LION                |
| SANTA PARIS                 |
| SCISSORHANDS SLUMS          |
| SEA VIRGIN                  |
| SEABISCUIT PUNK             |
| SEARCHERS WAIT              |
| SHAKESPEARE SADDLE          |
| SHANE DARKNESS              |
| SHANGHAI TYCOON             |
| SHIP WONDERLAND             |
| SHOCK CABIN                 |
| SHREK LICENSE               |
| SHRUNK DIVINE               |
| SINNERS ATLANTIS            |
| SKY MIRACLE                 |
| SLEEPY JAPANESE             |
| SMILE EARRING               |
| SNATCHERS MONTEZUMA         |
| SONS INTERVIEW              |
| SOUTH WAIT                  |
| SPEAKEASY DATE              |
| SPIKING ELEMENT             |
| SPINAL ROCKY                |
| SPY MILE                    |
| SQUAD FISH                  |
| STAGE WORLD                 |
| STAR OPERATION              |
| STATE WASTELAND             |
| STOCK GLASS                 |
| STRICTLY SCARFACE           |
| SUSPECTS QUILLS             |
| SWEET BROTHERHOOD           |
| TADPOLE PARK                |
| TARZAN VIDEOTAPE            |
| TELEMARK HEARTBREAKERS      |
| TOMORROW HUSTLER            |
| TOWN ARK                    |
| TROJAN TOMORROW             |
| TROUBLE DATE                |
| TURN STAR                   |
| TUXEDO MILE                 |
| UNCUT SUICIDES              |
| UNFAITHFUL KILL             |
| UNTOUCHABLES SUNRISE        |
| UPRISING UPTOWN             |
| UPTOWN YOUNG                |
| VACATION BOONDOCK           |
| VANISHING ROCKY             |
| VARSITY TRIP                |
| VERTIGO NORTHWEST           |
| WAGON JAWS                  |
| WARDROBE PHANTOM            |
| WARLOCK WEREWOLF            |
| WARS PLUTO                  |
| WASTELAND DIVINE            |
| WEEKEND PERSONAL            |
| WILLOW TRACY                |
| WINDOW SIDE                 |
| WON DARES                   |
| WONDERFUL DROP              |
| WONKA SEA                   |
| WORDS HUNTER                |
| WORKER TARZAN               |
| WORST BANGER                |
| WRONG BEHAVIOR              |
| ZOOLANDER FICTION           |
+-----------------------------+
*/
--         Películas con un titulo de más de 12 letras.
select title from film where length(title) >= 12;
/*
+-----------------------------+
| title                       |
+-----------------------------+
| ACADEMY DINOSAUR            |
| ACE GOLDFINGER              |
| ADAPTATION HOLES            |
| AFFAIR PREJUDICE            |
| AGENT TRUMAN                |
| AIRPLANE SIERRA             |
| AIRPORT POLLOCK             |
| ALABAMA DEVIL               |
| ALADDIN CALENDAR            |
| ALAMO VIDEOTAPE             |
| ALASKA PHANTOM              |
| ALICE FANTASIA              |
| ALIEN CENTER                |
| ALLEY EVOLUTION             |
| ALTER VICTORY               |
| AMADEUS HOLY                |
| AMELIE HELLFIGHTERS         |
| AMERICAN CIRCUS             |
| AMISTAD MIDSUMMER           |
| ANACONDA CONFESSIONS        |
| ANALYZE HOOSIERS            |
| ANNIE IDENTITY              |
| ANONYMOUS HUMAN             |
| ANTITRUST TOMATOES          |
| ANYTHING SAVANNAH           |
| APACHE DIVINE               |
| APOCALYPSE FLAMINGOS        |
| ARABIA DOGMA                |
| ARACHNOPHOBIA ROLLERCOASTER |
| ARGONAUTS TOWN              |
| ARIZONA BANG                |
| ARK RIDGEMONT               |
| ARMAGEDDON LOST             |
| ARMY FLINTSTONES            |
| ARSENIC INDEPENDENCE        |
| ARTIST COLDBLOODED          |
| ATLANTIS CAUSE              |
| ATTACKS HATE                |
| ATTRACTION NEWTON           |
| BACKLASH UNDEFEATED         |
| BAKED CLEOPATRA             |
| BALLOON HOMEWARD            |
| BALLROOM MOCKINGBIRD        |
| BANGER PINOCCHIO            |
| BARBARELLA STREETCAR        |
| BAREFOOT MANCHURIAN         |
| BEACH HEARTBREAKERS         |
| BEAR GRACELAND              |
| BEAST HUNCHBACK             |
| BEAUTY GREASE               |
| BED HIGHBALL                |
| BEDAZZLED MARRIED           |
| BEETHOVEN EXORCIST          |
| BEHAVIOR RUNAWAY            |
| BENEATH RUSH                |
| BERETS AGENT                |
| BETRAYED REAR               |
| BEVERLY OUTLAW              |
| BIKINI BORROWERS            |
| BILKO ANONYMOUS             |
| BINGO TALENTED              |
| BIRCH ANTITRUST             |
| BIRD INDEPENDENCE           |
| BIRDCAGE CASPER             |
| BIRDS PERDITION             |
| BLACKOUT PRIVATE            |
| BLADE POLISH                |
| BLANKET BEVERLY             |
| BLINDNESS GUN               |
| BLOOD ARGONAUTS             |
| BLUES INSTINCT              |
| BOILED DARES                |
| BONNIE HOLOCAUST            |
| BOOGIE AMELIE               |
| BOONDOCK BALLROOM           |
| BORROWERS BEDAZZLED         |
| BOULEVARD MOB               |
| BOUND CHEAPER               |
| BOWFINGER GABLES            |
| BRANNIGAN SUNRISE           |
| BRAVEHEART HUMAN            |
| BREAKFAST GOLDFINGER        |
| BREAKING HOME               |
| BRIDE INTRIGUE              |
| BRIGHT ENCOUNTERS           |
| BRINGING HYSTERICAL         |
| BROOKLYN DESERT             |
| BROTHERHOOD BLANKET         |
| BUBBLE GROSSE               |
| BUCKET BROTHERHOOD          |
| BULL SHAWSHANK              |
| BULWORTH COMMANDMENTS       |
| BUTCH PANTHER               |
| BUTTERFLY CHOCOLAT          |
| CADDYSHACK JEDI             |
| CALENDAR GUNFIGHT           |
| CALIFORNIA BIRDS            |
| CAMELOT VACATION            |
| CAMPUS REMEMBER             |
| CANDIDATE PERDITION         |
| CANDLES GRAPES              |
| CANYON STOCK                |
| CAPER MOTIONS               |
| CARIBBEAN LIBERTY           |
| CARRIE BUNCH                |
| CASABLANCA SUPER            |
| CASPER DRAGONFLY            |
| CASSIDY WYOMING             |
| CASUALTIES ENCINO           |
| CAT CONEHEADS               |
| CATCH AMISTAD               |
| CELEBRITY HORN              |
| CENTER DINOSAUR             |
| CHAINSAW UPTOWN             |
| CHAMBER ITALIAN             |
| CHAMPION FLATLINERS         |
| CHANCE RESURRECTION         |
| CHAPLIN LICENSE             |
| CHARADE DUFFEL              |
| CHARIOTS CONSPIRACY         |
| CHASING FIGHT               |
| CHEAPER CLYDE               |
| CHICAGO NORTH               |
| CHICKEN HELLFIGHTERS        |
| CHINATOWN GLADIATOR         |
| CHISUM BEHAVIOR             |
| CHOCOLAT HARRY              |
| CHOCOLATE DUCK              |
| CHRISTMAS MOONSHINE         |
| CIDER DESIRE                |
| CINCINATTI WHISPERER        |
| CIRCUS YOUTH                |
| CITIZEN SHREK               |
| CLASH FREDDY                |
| CLEOPATRA DEVIL             |
| CLERKS ANGELS               |
| CLOCKWORK PARADISE          |
| CLONES PINOCCHIO            |
| CLUB GRAFFITI               |
| CLUELESS BUCKET             |
| CLYDE THEORY                |
| COAST RAINBOW               |
| COLDBLOODED DARLING         |
| COLOR PHILADELPHIA          |
| COMANCHEROS ENEMY           |
| COMFORTS RUSH               |
| COMMAND DARLING             |
| COMMANDMENTS EXPRESS        |
| CONEHEADS SMOOCHY           |
| CONFESSIONS MAGUIRE         |
| CONFIDENTIAL INTERVIEW      |
| CONFUSED CANDLES            |
| CONGENIALITY QUEST          |
| CONNECTICUT TRAMP           |
| CONNECTION MICROCOSMOS      |
| CONQUERER NUTS              |
| CONSPIRACY SPIRIT           |
| CONTACT ANONYMOUS           |
| CONTROL ANTHEM              |
| CONVERSATION DOWNHILL       |
| CRAFT OUTFIELD              |
| CRANES RESERVOIR            |
| CREATURES SHAKESPEARE       |
| CREEPERS KANE               |
| CROOKED FROGMEN             |
| CROSSING DIVORCE            |
| CROSSROADS CASUALTIES       |
| CROWDS TELEMARK             |
| CRUELTY UNFORGIVEN          |
| CRUSADE HONEY               |
| CRYSTAL BREAKING            |
| CUPBOARD SINNERS            |
| CURTAIN VIDEOTAPE           |
| CYCLONE FAMILY              |
| DADDY PITTSBURGH            |
| DAISY MENAGERIE             |
| DALMATIONS SWEDEN           |
| DANCING FEVER               |
| DANGEROUS UPTOWN            |
| DARKNESS WAR                |
| DARKO DORADO                |
| DARLING BREAKING            |
| DARN FORRESTER              |
| DAUGHTER MADIGAN            |
| DAY UNFAITHFUL              |
| DECEIVER BETRAYED           |
| DEEP CRUSADE                |
| DEER VIRGINIAN              |
| DELIVERANCE MULHOLLAND      |
| DESERT POSEIDON             |
| DESIRE ALIEN                |
| DESPERATE TRAINSPOTTING     |
| DESTINATION JERK            |
| DESTINY SATURDAY            |
| DETAILS PACKER              |
| DETECTIVE VISION            |
| DEVIL DESIRE                |
| DINOSAUR SECRETARY          |
| DISCIPLE MOTHER             |
| DISTURBING SCARFACE         |
| DIVIDE MONSTER              |
| DIVINE RESURRECTION         |
| DIVORCE SHINING             |
| DOCTOR GRAIL                |
| DOGMA FAMILY                |
| DONNIE ALLEY                |
| DOOM DANCING                |
| DOORS PRESIDENT             |
| DORADO NOTTING              |
| DOUBLE WRATH                |
| DOUBTFIRE LABYRINTH         |
| DOWNHILL ENOUGH             |
| DRACULA CRYSTAL             |
| DRAGON SQUAD                |
| DRAGONFLY STRANGERS         |
| DREAM PICKUP                |
| DRIFTER COMMANDMENTS        |
| DRIVER ANNIE                |
| DRIVING POLISH              |
| DROP WATERFRONT             |
| DRUMLINE CYCLONE            |
| DRUMS DYNAMITE              |
| DUDE BLINDNESS              |
| DUFFEL APOCALYPSE           |
| DURHAM PANKY                |
| DWARFS ALTER                |
| DYNAMITE TARZAN             |
| EAGLES PANKY                |
| EARRING INSTINCT            |
| EARTH VISION                |
| EASY GLADIATOR              |
| EDGE KISSING                |
| EFFECT GLADIATOR            |
| EGYPT TENENBAUMS            |
| ELEMENT FREDDY              |
| ELEPHANT TROJAN             |
| ELIZABETH SHANE             |
| EMPIRE MALKOVICH            |
| ENCOUNTERS CURTAIN          |
| ENDING CROWDS               |
| ENGLISH BULWORTH            |
| ENOUGH RAGING               |
| ENTRAPMENT SATISFACTION     |
| ESCAPE METROPOLIS           |
| EVE RESURRECTION            |
| EVERYONE CRAFT              |
| EVOLUTION ALTER             |
| EXCITEMENT EVE              |
| EXORCIST STING              |
| EXPECATIONS NATURAL         |
| EXPENDABLE STALLION         |
| EXPRESS LONELY              |
| EXTRAORDINARY CONQUERER     |
| EYES DRIVING                |
| FACTORY DRAGON              |
| FALCON VOLUME               |
| FAMILY SWEET                |
| FANTASIA PARK               |
| FANTASY TROOPERS            |
| FARGO GANDHI                |
| FATAL HAUNTED               |
| FEATHERS METAL              |
| FELLOWSHIP AUTUMN           |
| FERRIS MOTHER               |
| FEUD FROGMEN                |
| FEVER EMPIRE                |
| FICTION CHRISTMAS           |
| FIDDLER LOST                |
| FIDELITY DEVIL              |
| FIGHT JAWBREAKER            |
| FINDING ANACONDA            |
| FIREBALL PHILADELPHIA       |
| FIREHOUSE VIETNAM           |
| FLAMINGOS CONNECTICUT       |
| FLATLINERS KILLER           |
| FLINTSTONES HAPPINESS       |
| FLOATS GARDEN               |
| FOOL MOCKINGBIRD            |
| FOREVER CANDIDATE           |
| FORREST SONS                |
| FORRESTER COMANCHEROS       |
| FORWARD TEMPLE              |
| FRANKENSTEIN STRANGER       |
| FREAKY POCUS                |
| FREDDY STORM                |
| FREEDOM CLEOPATRA           |
| FRENCH HOLIDAY              |
| FRIDA SLIPPER               |
| FRISCO FORREST              |
| FROGMEN BREAKING            |
| FRONTIER CABIN              |
| FUGITIVE MAGUIRE            |
| FULL FLATLINERS             |
| GABLES METROPOLIS           |
| GALAXY SWEETHEARTS          |
| GAMES BOWFINGER             |
| GARDEN ISLAND               |
| GASLIGHT CRUSADE            |
| GATHERING CALENDAR          |
| GENTLEMEN STAGE             |
| GHOST GROUNDHOG             |
| GHOSTBUSTERS ELF            |
| GIANT TROOPERS              |
| GILBERT PELICAN             |
| GILMORE BOILED              |
| GLADIATOR WESTWARD          |
| GLEAMING JAWBREAKER         |
| GODFATHER DIARY             |
| GOLDFINGER SENSIBILITY      |
| GOLDMINE TYCOON             |
| GONE TROUBLE                |
| GOODFELLAS SALUTE           |
| GORGEOUS BINGO              |
| GOSFORD DONNIE              |
| GRACELAND DYNAMITE          |
| GRADUATE LORD               |
| GRAFFITI LOVE               |
| GRAIL FRANKENSTEIN          |
| GREASE YOUTH                |
| GREATEST NORTH              |
| GREEDY ROOTS                |
| GREEK EVERYONE              |
| GRINCH MASSAGE              |
| GRIT CLOCKWORK              |
| GROOVE FICTION              |
| GROSSE WONDERFUL            |
| GROUNDHOG UNCUT             |
| GUNFIGHT MOON               |
| GUNFIGHTER MUSSOLINI        |
| HALF OUTFIELD               |
| HALL CASSIDY                |
| HALLOWEEN NUTS              |
| HAMLET WISDOM               |
| HANDICAP BOONDOCK           |
| HANGING DEEP                |
| HANKY OCTOBER               |
| HANOVER GALAXY              |
| HAPPINESS UNITED            |
| HARDLY ROBBERS              |
| HAROLD FRENCH               |
| HARPER DYING                |
| HATE HANDICAP               |
| HAUNTED ANTITRUST           |
| HAUNTING PIANIST            |
| HEAD STRANGER               |
| HEARTBREAKERS BRIGHT        |
| HEAVEN FREEDOM              |
| HEAVENLY GUN                |
| HEAVYWEIGHTS BEAST          |
| HEDWIG ALTER                |
| HELLFIGHTERS SIERRA         |
| HIGHBALL POTTER             |
| HILLS NEIGHBORS             |
| HOBBIT ALIEN                |
| HOLES BRANNIGAN             |
| HOLIDAY GAMES               |
| HOLLOW JEOPARDY             |
| HOLLYWOOD ANONYMOUS         |
| HOLOCAUST HIGHBALL          |
| HOLY TADPOLE                |
| HOMEWARD CIDER              |
| HOMICIDE PEACH              |
| HOOK CHARIOTS               |
| HOOSIERS BIRDCAGE           |
| HOPE TOOTSIE                |
| HORN WORKING                |
| HORROR REIGN                |
| HOTEL HAPPINESS             |
| HOUSE DYNAMITE              |
| HUMAN GRAFFITI              |
| HUNCHBACK IMPOSSIBLE        |
| HUNTER ALTER                |
| HUNTING MUSKETEERS          |
| HURRICANE AFFAIR            |
| HUSTLER PARTY               |
| HYSTERICAL GRAIL            |
| ICE CROSSING                |
| IDENTITY LOVER              |
| IDOLS SNATCHERS             |
| ILLUSION AMELIE             |
| IMAGE PRINCESS              |
| IMPACT ALADDIN              |
| IMPOSSIBLE PREJUDICE        |
| INDEPENDENCE HOTEL          |
| INFORMER DOUBLE             |
| INNOCENT USUAL              |
| INSECTS STONE               |
| INSIDER ARIZONA             |
| INSTINCT AIRPORT            |
| INTENTIONS EMPIRE           |
| INTERVIEW LIAISONS          |
| INTOLERABLE INTENTIONS      |
| INTRIGUE WORST              |
| INVASION CYCLONE            |
| ISHTAR ROCKETEER            |
| ISLAND EXORCIST             |
| ITALIAN AFRICAN             |
| JACKET FRISCO               |
| JAPANESE RUN                |
| JAWBREAKER BROOKLYN         |
| JEDI BENEATH                |
| JEEPERS WEDDING             |
| JEKYLL FROGMEN              |
| JEOPARDY ENCINO             |
| JERICHO MULAN               |
| JERK PAYCHECK               |
| JERSEY SASSY                |
| JET NEIGHBORS               |
| JINGLE SAGEBRUSH            |
| JOON NORTHWEST              |
| JUGGLER HARDLY              |
| JUMANJI BLADE               |
| JUMPING WRATH               |
| JUNGLE CLOSER               |
| KANE EXORCIST               |
| KENTUCKIAN GIANT            |
| KICK SAVANNAH               |
| KILL BROTHERHOOD            |
| KILLER INNOCENT             |
| KING EVOLUTION              |
| KISSING DOLLS               |
| KNOCK WARLOCK               |
| KRAMER CHOCOLATE            |
| KWAI HOMEWARD               |
| LABYRINTH LEAGUE            |
| LADYBUGS ARMAGEDDON         |
| LAMBS CINCINATTI            |
| LANGUAGE COWBOY             |
| LAWLESS VISION              |
| LAWRENCE LOVE               |
| LEAGUE HELLFIGHTERS         |
| LEATHERNECKS DWARFS         |
| LEBOWSKI SOLDIERS           |
| LEGALLY SECRETARY           |
| LESSON CLEOPATRA            |
| LIAISONS SWEET              |
| LIBERTY MAGNIFICENT         |
| LICENSE WEEKEND             |
| LIES TREATMENT              |
| LIFE TWISTED                |
| LOATHING LEGALLY            |
| LOLITA WORLD                |
| LONELY ELEPHANT             |
| LORD ARIZONA                |
| LOSER HUSTLER               |
| LOUISIANA HARRY             |
| LOVE SUICIDES               |
| LOVELY JINGLE               |
| LOVER TRUMAN                |
| LOVERBOY ATTACKS            |
| LUCKY FLYING                |
| MADIGAN DORADO              |
| MADISON TRAP                |
| MADNESS ATTACKS             |
| MADRE GABLES                |
| MAGIC MALLRATS              |
| MAGNIFICENT CHITTY          |
| MAGNOLIA FORRESTER          |
| MAGUIRE APACHE              |
| MAJESTIC FLOATS             |
| MAKER GABLES                |
| MALKOVICH PET               |
| MALLRATS UNITED             |
| MALTESE HOPE                |
| MANCHURIAN CURTAIN          |
| MANNEQUIN WORST             |
| MASKED BUBBLE               |
| MASSACRE USUAL              |
| MASSAGE IMAGE               |
| MATRIX SNOWMAN              |
| MEET CHOCOLATE              |
| MEMENTO ZOOLANDER           |
| MENAGERIE RUSHMORE          |
| MERMAID INSECTS             |
| METAL ARMAGEDDON            |
| METROPOLIS COMA             |
| MICROCOSMOS PARADISE        |
| MIDNIGHT WESTWARD           |
| MIDSUMMER GROUNDHOG         |
| MINDS TRUMAN                |
| MINORITY KISS               |
| MIRACLE VIRTUAL             |
| MISSION ZOOLANDER           |
| MOCKINGBIRD HOLLYWOOD       |
| MOD SECRETARY               |
| MODERN DORADO               |
| MONEY HAROLD                |
| MONSOON CAUSE               |
| MONSTER SPARTACUS           |
| MONTEREY LABYRINTH          |
| MONTEZUMA COMMAND           |
| MOONSHINE CABIN             |
| MOONWALKER FOOL             |
| MOSQUITO ARMAGEDDON         |
| MOTHER OLEANDER             |
| MOTIONS DETAILS             |
| MOURNING PURPLE             |
| MOVIE SHAKESPEARE           |
| MULHOLLAND BEAST            |
| MUMMY CREATURES             |
| MURDER ANTITRUST            |
| MUSCLE BRIGHT               |
| MUSIC BOONDOCK              |
| MUSKETEERS WAIT             |
| MUSSOLINI SPOILERS          |
| MYSTIC TRUMAN               |
| NAME DETECTIVE              |
| NASH CHOCOLAT               |
| NATIONAL STORY              |
| NATURAL STOCK               |
| NECKLACE OUTBREAK           |
| NEIGHBORS CHARADE           |
| NETWORK PEAK                |
| NEWSIES STORY               |
| NEWTON LABYRINTH            |
| NIGHTMARE CHILL             |
| NONE SPIKING                |
| NORTH TEQUILA               |
| NORTHWEST POLISH            |
| NOTORIOUS REUNION           |
| NOTTING SPEAKEASY           |
| NOVOCAINE FLIGHT            |
| OCTOBER SUBMARINE           |
| OKLAHOMA JUMANJI            |
| OLEANDER CLUE               |
| OPEN AFRICAN                |
| OPERATION OPERATION         |
| OPPOSITE NECKLACE           |
| ORANGE GRAPES               |
| ORDER BETRAYED              |
| ORIENT CLOSER               |
| OUTBREAK DIVINE             |
| OUTFIELD MASSACRE           |
| OUTLAW HANKY                |
| PACIFIC AMISTAD             |
| PACKER MADIGAN              |
| PAJAMA JAWBREAKER           |
| PANKY SUBMARINE             |
| PANTHER REDS                |
| PAPI NECKLACE               |
| PARADISE SABRINA            |
| PARIS WEEKEND               |
| PARK CITIZEN                |
| PAST SUICIDES               |
| PATHS CONTROL               |
| PATIENT SISTER              |
| PATRIOT ROMAN               |
| PATTON INTERVIEW            |
| PAYCHECK WAIT               |
| PEACH INNOCENT              |
| PEAK FOREVER                |
| PEARL DESTINY               |
| PELICAN COMFORTS            |
| PERDITION FARGO             |
| PERFECT GROOVE              |
| PERSONAL LADYBUGS           |
| PET HAUNTING                |
| PHANTOM GLORY               |
| PHILADELPHIA WIFE           |
| PIANIST OUTFIELD            |
| PICKUP DRIVING              |
| PILOT HOOSIERS              |
| PINOCCHIO SIMON             |
| PIRATES ROXANNE             |
| PITTSBURGH HUNCHBACK        |
| PIZZA JUMANJI               |
| PLATOON INSTINCT            |
| PLUTO OLEANDER              |
| POLISH BROOKLYN             |
| POLLOCK DELIVERANCE         |
| POND SEATTLE                |
| POSEIDON FOREVER            |
| POTLUCK MIXED               |
| POTTER CONNECTICUT          |
| PREJUDICE OLEANDER          |
| PRESIDENT BANG              |
| PRIMARY GLASS               |
| PRINCESS GIANT              |
| PRIVATE DROP                |
| PRIX UNDEFEATED             |
| PSYCHO SHRUNK               |
| PULP BEVERLY                |
| PUNK DIVORCE                |
| PURPLE MOVIE                |
| QUEST MUSSOLINI             |
| RAGING AIRPLANE             |
| RAIDERS ANTITRUST           |
| RAINBOW SHOCK               |
| RANGE MOONWALKER            |
| REAP UNFAITHFUL             |
| REAR TRADING                |
| REBEL AIRPORT               |
| RECORDS ZORRO               |
| REDEMPTION COMFORTS         |
| REIGN GENTLEMEN             |
| REMEMBER DIARY              |
| REQUIEM TYCOON              |
| RESERVOIR ADAPTATION        |
| RESURRECTION SILVERADO      |
| REUNION WITCHES             |
| RIDER CADDYSHACK            |
| RIDGEMONT SUBMARINE         |
| RIGHT CRANES                |
| RINGS HEARTBREAKERS         |
| RIVER OUTLAW                |
| ROAD ROXANNE                |
| ROBBERS JOON                |
| ROBBERY BRIGHT              |
| ROCK INSTINCT               |
| ROCKETEER MOTHER            |
| ROLLERCOASTER BRINGING      |
| ROOF CHAMPION               |
| ROOTS REMEMBER              |
| ROSES TREASURE              |
| ROXANNE REBEL               |
| RUGRATS SHAKESPEARE         |
| RUNAWAY TENENBAUMS          |
| RUNNER MADIGAN              |
| RUSH GOODFELLAS             |
| RUSHMORE MERMAID            |
| SABRINA MIDNIGHT            |
| SADDLE ANTITRUST            |
| SAGEBRUSH CLUELESS          |
| SAINTS BRIDE                |
| SALUTE APOLLO               |
| SAMURAI LION                |
| SASSY PACKER                |
| SATISFACTION CONFIDENTIAL   |
| SATURDAY LAMBS              |
| SAVANNAH TOWN               |
| SCALAWAG DUCK               |
| SCARFACE BANG               |
| SCHOOL JACKET               |
| SCISSORHANDS SLUMS          |
| SCORPION APOLLO             |
| SEABISCUIT PUNK             |
| SEARCHERS WAIT              |
| SEATTLE EXPECATIONS         |
| SECRET GROUNDHOG            |
| SECRETARY ROUGE             |
| SECRETS PARADISE            |
| SENSIBILITY REAR            |
| SHAKESPEARE SADDLE          |
| SHANE DARKNESS              |
| SHANGHAI TYCOON             |
| SHAWSHANK BUBBLE            |
| SHEPHERD MIDSUMMER          |
| SHINING ROSES               |
| SHIP WONDERLAND             |
| SHOOTIST SUPERFLY           |
| SHREK LICENSE               |
| SHRUNK DIVINE               |
| SIERRA DIVIDE               |
| SILENCE KANE                |
| SILVERADO GOLDFINGER        |
| SINNERS ATLANTIS            |
| SISTER FREDDY               |
| SLACKER LIAISONS            |
| SLEEPING SUSPECTS           |
| SLEEPLESS MONSOON           |
| SLEEPY JAPANESE             |
| SLEUTH ORIENT               |
| SLIPPER FIDELITY            |
| SMILE EARRING               |
| SMOKING BARBARELLA          |
| SMOOCHY CONTROL             |
| SNATCH SLIPPER              |
| SNATCHERS MONTEZUMA         |
| SNOWMAN ROLLERCOASTER       |
| SOLDIERS EVOLUTION          |
| SOMETHING DUCK              |
| SONS INTERVIEW              |
| SORORITY QUEEN              |
| SPARTACUS CHEAPER           |
| SPEAKEASY DATE              |
| SPICE SORORITY              |
| SPIKING ELEMENT             |
| SPINAL ROCKY                |
| SPIRIT FLINTSTONES          |
| SPIRITED CASUALTIES         |
| SPLENDOR PATTON             |
| SPOILERS HELLFIGHTERS       |
| STAGECOACH ARMAGEDDON       |
| STALLION SUNDANCE           |
| STAMPEDE DISTURBING         |
| STAR OPERATION              |
| STATE WASTELAND             |
| STEERS ARMAGEDDON           |
| STEPMOM DREAM               |
| STING PERSONAL              |
| STORM HAPPINESS             |
| STRAIGHT HOURS              |
| STRANGELOVE DESIRE          |
| STRANGER STRANGERS          |
| STRANGERS GRAFFITI          |
| STREAK RIDGEMONT            |
| STREETCAR INTENTIONS        |
| STRICTLY SCARFACE           |
| SUBMARINE BED               |
| SUICIDES SILENCE            |
| SUMMER SCARFACE             |
| SUN CONFESSIONS             |
| SUNDANCE INVASION           |
| SUNRISE LEAGUE              |
| SUNSET RACER                |
| SUPER WYOMING               |
| SUPERFLY TRIP               |
| SUSPECTS QUILLS             |
| SWEDEN SHINING              |
| SWEET BROTHERHOOD           |
| SWEETHEARTS SUSPECTS        |
| TADPOLE PARK                |
| TALENTED HOMICIDE           |
| TARZAN VIDEOTAPE            |
| TELEGRAPH VOYAGE            |
| TELEMARK HEARTBREAKERS      |
| TEMPLE ATTRACTION           |
| TENENBAUMS COMMAND          |
| TEQUILA PAST                |
| TERMINATOR CLUB             |
| THEORY MERMAID              |
| THIEF PELICAN               |
| THIN SAGEBRUSH              |
| TIMBERLAND SKY              |
| TITANIC BOONDOCK            |
| TOMATOES HELLFIGHTERS       |
| TOMORROW HUSTLER            |
| TOOTSIE PILOT               |
| TORQUE BOUND                |
| TOURIST PELICAN             |
| TOWERS HURRICANE            |
| TRADING PINOCCHIO           |
| TRAFFIC HOBBIT              |
| TRAINSPOTTING STRANGERS     |
| TRAMP OTHERS                |
| TRANSLATION SUMMER          |
| TREASURE COMMAND            |
| TREATMENT JEKYLL            |
| TROJAN TOMORROW             |
| TROOPERS METAL              |
| TROUBLE DATE                |
| TRUMAN CRAZY                |
| TWISTED PIRATES             |
| TYCOON GATHERING            |
| UNBREAKABLE KARATE          |
| UNCUT SUICIDES              |
| UNDEFEATED DALMATIONS       |
| UNFAITHFUL KILL             |
| UNFORGIVEN ZOOLANDER        |
| UNITED PILOT                |
| UNTOUCHABLES SUNRISE        |
| UPRISING UPTOWN             |
| UPTOWN YOUNG                |
| USUAL UNTOUCHABLES          |
| VACATION BOONDOCK           |
| VALENTINE VANISHING         |
| VALLEY PACKER               |
| VAMPIRE WHALE               |
| VANISHED GARDEN             |
| VANISHING ROCKY             |
| VARSITY TRIP                |
| VELVET TERMINATOR           |
| VERTIGO NORTHWEST           |
| VICTORY ACADEMY             |
| VIDEOTAPE ARSENIC           |
| VIETNAM SMOOCHY             |
| VILLAIN DESPERATE           |
| VIRGIN DAISY                |
| VIRGINIAN PLUTO             |
| VIRTUAL SPOILERS            |
| VISION TORQUE               |
| VOLCANO TEXAS               |
| VOLUME HOUSE                |
| VOYAGE LEGALLY              |
| WALLS ARTIST                |
| WANDA CHAMBER               |
| WARDROBE PHANTOM            |
| WARLOCK WEREWOLF            |
| WASH HEAVENLY               |
| WASTELAND DIVINE            |
| WATERFRONT DELIVERANCE      |
| WATERSHIP FRONTIER          |
| WEDDING APOLLO              |
| WEEKEND PERSONAL            |
| WEREWOLF LOLA               |
| WESTWARD SEABISCUIT         |
| WHALE BIKINI                |
| WHISPERER GIANT             |
| WILLOW TRACY                |
| WIND PHANTOM                |
| WISDOM WORKER               |
| WITCHES PANIC               |
| WIZARD COLDBLOODED          |
| WOLVES DESIRE               |
| WOMEN DORADO                |
| WONDERFUL DROP              |
| WONDERLAND CHRISTMAS        |
| WORDS HUNTER                |
| WORKER TARZAN               |
| WORKING MICROCOSMOS         |
| WORLD LEATHERNECKS          |
| WORST BANGER                |
| WRONG BEHAVIOR              |
| WYOMING STORM               |
| YOUNG LANGUAGE              |
| ZHIVAGO CORE                |
| ZOOLANDER FICTION           |
+-----------------------------+
*/
--         Peliculas con un rating de PG o G.
select title from film where rating = 'PG' or rating = 'G';
/*
+---------------------------+
| title                     |
+---------------------------+
| ACADEMY DINOSAUR          |
| ACE GOLDFINGER            |
| AFFAIR PREJUDICE          |
| AFRICAN EGG               |
| AGENT TRUMAN              |
| ALAMO VIDEOTAPE           |
| ALASKA PHANTOM            |
| ALI FOREVER               |
| AMADEUS HOLY              |
| AMISTAD MIDSUMMER         |
| ANGELS LIFE               |
| ANNIE IDENTITY            |
| ARIZONA BANG              |
| ARMAGEDDON LOST           |
| ARSENIC INDEPENDENCE      |
| ATLANTIS CAUSE            |
| AUTUMN CROW               |
| BAKED CLEOPATRA           |
| BALLROOM MOCKINGBIRD      |
| BARBARELLA STREETCAR      |
| BAREFOOT MANCHURIAN       |
| BEACH HEARTBREAKERS       |
| BEAUTY GREASE             |
| BEDAZZLED MARRIED         |
| BEHAVIOR RUNAWAY          |
| BILL OTHERS               |
| BIRCH ANTITRUST           |
| BIRD INDEPENDENCE         |
| BIRDS PERDITION           |
| BLACKOUT PRIVATE          |
| BLANKET BEVERLY           |
| BLOOD ARGONAUTS           |
| BLUES INSTINCT            |
| BOILED DARES              |
| BONNIE HOLOCAUST          |
| BORN SPINAL               |
| BORROWERS BEDAZZLED       |
| BOUND CHEAPER             |
| BRANNIGAN SUNRISE         |
| BREAKFAST GOLDFINGER      |
| BRIDE INTRIGUE            |
| BRINGING HYSTERICAL       |
| BUCKET BROTHERHOOD        |
| BUGSY SONG                |
| BULWORTH COMMANDMENTS     |
| BUNCH MINDS               |
| BUTTERFLY CHOCOLAT        |
| CAPER MOTIONS             |
| CAROL TEXAS               |
| CARRIE BUNCH              |
| CASABLANCA SUPER          |
| CASUALTIES ENCINO         |
| CAT CONEHEADS             |
| CATCH AMISTAD             |
| CENTER DINOSAUR           |
| CHAINSAW UPTOWN           |
| CHAMPION FLATLINERS       |
| CHARADE DUFFEL            |
| CHASING FIGHT             |
| CHEAPER CLYDE             |
| CHICKEN HELLFIGHTERS      |
| CHILL LUCK                |
| CHINATOWN GLADIATOR       |
| CHISUM BEHAVIOR           |
| CHITTY LOCK               |
| CIDER DESIRE              |
| CITIZEN SHREK             |
| CLASH FREDDY              |
| CLERKS ANGELS             |
| COAST RAINBOW             |
| COLDBLOODED DARLING       |
| COLOR PHILADELPHIA        |
| CONNECTION MICROCOSMOS    |
| CONQUERER NUTS            |
| CONTROL ANTHEM            |
| COWBOY DOOM               |
| CRAZY HOME                |
| CROSSROADS CASUALTIES     |
| CROW GREASE               |
| CRUELTY UNFORGIVEN        |
| CYCLONE FAMILY            |
| DADDY PITTSBURGH          |
| DAISY MENAGERIE           |
| DALMATIONS SWEDEN         |
| DANCING FEVER             |
| DANGEROUS UPTOWN          |
| DARN FORRESTER            |
| DAWN POND                 |
| DAY UNFAITHFUL            |
| DAZED PUNK                |
| DESPERATE TRAINSPOTTING   |
| DESTINY SATURDAY          |
| DIARY PANIC               |
| DISCIPLE MOTHER           |
| DIVORCE SHINING           |
| DOCTOR GRAIL              |
| DOGMA FAMILY              |
| DOWNHILL ENOUGH           |
| DRACULA CRYSTAL           |
| DREAM PICKUP              |
| DRUMLINE CYCLONE          |
| DRUMS DYNAMITE            |
| DUDE BLINDNESS            |
| DUFFEL APOCALYPSE         |
| DWARFS ALTER              |
| DYING MAKER               |
| EASY GLADIATOR            |
| EFFECT GLADIATOR          |
| EGG IGBY                  |
| EGYPT TENENBAUMS          |
| EMPIRE MALKOVICH          |
| ENCINO ELF                |
| EVE RESURRECTION          |
| EVERYONE CRAFT            |
| EXCITEMENT EVE            |
| EXORCIST STING            |
| EXPENDABLE STALLION       |
| EXTRAORDINARY CONQUERER   |
| FANTASIA PARK             |
| FARGO GANDHI              |
| FATAL HAUNTED             |
| FERRIS MOTHER             |
| FICTION CHRISTMAS         |
| FIDELITY DEVIL            |
| FIREBALL PHILADELPHIA     |
| FIREHOUSE VIETNAM         |
| FLATLINERS KILLER         |
| FOOL MOCKINGBIRD          |
| FRENCH HOLIDAY            |
| FRISCO FORREST            |
| FROST HEAD                |
| FULL FLATLINERS           |
| GABLES METROPOLIS         |
| GARDEN ISLAND             |
| GASLIGHT CRUSADE          |
| GHOST GROUNDHOG           |
| GILBERT PELICAN           |
| GLADIATOR WESTWARD        |
| GLASS DYING               |
| GOLDFINGER SENSIBILITY    |
| GOODFELLAS SALUTE         |
| GOSFORD DONNIE            |
| GRADUATE LORD             |
| GRAFFITI LOVE             |
| GRAPES FURY               |
| GREASE YOUTH              |
| GREEK EVERYONE            |
| GRIT CLOCKWORK            |
| GUN BONNIE                |
| HANGING DEEP              |
| HAPPINESS UNITED          |
| HARPER DYING              |
| HATE HANDICAP             |
| HEARTBREAKERS BRIGHT      |
| HEAVEN FREEDOM            |
| HEAVYWEIGHTS BEAST        |
| HELLFIGHTERS SIERRA       |
| HILLS NEIGHBORS           |
| HOCUS FRIDA               |
| HOLES BRANNIGAN           |
| HOLLYWOOD ANONYMOUS       |
| HOOK CHARIOTS             |
| HOOSIERS BIRDCAGE         |
| HORN WORKING              |
| HUNGER ROOF               |
| HURRICANE AFFAIR          |
| HYDE DOCTOR               |
| HYSTERICAL GRAIL          |
| INSTINCT AIRPORT          |
| INTRIGUE WORST            |
| INVASION CYCLONE          |
| IRON MOON                 |
| ITALIAN AFRICAN           |
| JAPANESE RUN              |
| JAWBREAKER BROOKLYN       |
| JAWS HARRY                |
| JEDI BENEATH              |
| JEKYLL FROGMEN            |
| JERSEY SASSY              |
| JUMANJI BLADE             |
| KENTUCKIAN GIANT          |
| KILL BROTHERHOOD          |
| LADY STAGE                |
| LAWLESS VISION            |
| LEGALLY SECRETARY         |
| LEGEND JEDI               |
| LIAISONS SWEET            |
| LIBERTY MAGNIFICENT       |
| LION UNCUT                |
| LOLA AGENT                |
| LONELY ELEPHANT           |
| LOSER HUSTLER             |
| LOVELY JINGLE             |
| LOVER TRUMAN              |
| LUST LOCK                 |
| MAGIC MALLRATS            |
| MAIDEN HOME               |
| MAJESTIC FLOATS           |
| MALKOVICH PET             |
| MALLRATS UNITED           |
| MANCHURIAN CURTAIN        |
| MARRIED GO                |
| MASSAGE IMAGE             |
| MEET CHOCOLATE            |
| MENAGERIE RUSHMORE        |
| MIDNIGHT WESTWARD         |
| MIDSUMMER GROUNDHOG       |
| MIGHTY LUCK               |
| MILE MULAN                |
| MINORITY KISS             |
| MOB DUFFEL                |
| MOCKINGBIRD HOLLYWOOD     |
| MODERN DORADO             |
| MONEY HAROLD              |
| MONSOON CAUSE             |
| MONSTER SPARTACUS         |
| MONTEREY LABYRINTH        |
| MOON BUNCH                |
| MOONWALKER FOOL           |
| MOSQUITO ARMAGEDDON       |
| MOTIONS DETAILS           |
| MOURNING PURPLE           |
| MOVIE SHAKESPEARE         |
| MULAN MOON                |
| MULHOLLAND BEAST          |
| MUPPET MILE               |
| MURDER ANTITRUST          |
| MUSCLE BRIGHT             |
| MUSKETEERS WAIT           |
| MUSSOLINI SPOILERS        |
| NECKLACE OUTBREAK         |
| NEWSIES STORY             |
| NEWTON LABYRINTH          |
| NIGHTMARE CHILL           |
| NOON PAPI                 |
| NORTHWEST POLISH          |
| NOVOCAINE FLIGHT          |
| OKLAHOMA JUMANJI          |
| OLEANDER CLUE             |
| OPEN AFRICAN              |
| OPERATION OPERATION       |
| OPPOSITE NECKLACE         |
| OSCAR GOLD                |
| OTHERS SOUP               |
| PACIFIC AMISTAD           |
| PANIC CLUB                |
| PANKY SUBMARINE           |
| PAPI NECKLACE             |
| PARTY KNOCK               |
| PATHS CONTROL             |
| PATRIOT ROMAN             |
| PATTON INTERVIEW          |
| PEAK FOREVER              |
| PELICAN COMFORTS          |
| PET HAUNTING              |
| PICKUP DRIVING            |
| PILOT HOOSIERS            |
| PINOCCHIO SIMON           |
| PIRATES ROXANNE           |
| POLISH BROOKLYN           |
| POLLOCK DELIVERANCE       |
| POTLUCK MIXED             |
| POTTER CONNECTICUT        |
| PRESIDENT BANG            |
| PRIMARY GLASS             |
| PRIVATE DROP              |
| PULP BEVERLY              |
| PUNK DIVORCE              |
| QUEEN LUKE                |
| RAINBOW SHOCK             |
| RANGE MOONWALKER          |
| REBEL AIRPORT             |
| RECORDS ZORRO             |
| RESURRECTION SILVERADO    |
| RIDER CADDYSHACK          |
| RINGS HEARTBREAKERS       |
| ROCK INSTINCT             |
| ROOM ROMAN                |
| RUSH GOODFELLAS           |
| SABRINA MIDNIGHT          |
| SAGEBRUSH CLUELESS        |
| SAINTS BRIDE              |
| SAMURAI LION              |
| SANTA PARIS               |
| SASSY PACKER              |
| SATISFACTION CONFIDENTIAL |
| SATURDAY LAMBS            |
| SCISSORHANDS SLUMS        |
| SEA VIRGIN                |
| SECRET GROUNDHOG          |
| SECRETARY ROUGE           |
| SECRETS PARADISE          |
| SENSIBILITY REAR          |
| SHANE DARKNESS            |
| SHANGHAI TYCOON           |
| SHAWSHANK BUBBLE          |
| SHINING ROSES             |
| SIDE ARK                  |
| SILVERADO GOLDFINGER      |
| SKY MIRACLE               |
| SLEEPLESS MONSOON         |
| SLEEPY JAPANESE           |
| SLUMS DUCK                |
| SMILE EARRING             |
| SNATCH SLIPPER            |
| SNOWMAN ROLLERCOASTER     |
| SPIKING ELEMENT           |
| SPLASH GUMP               |
| SPOILERS HELLFIGHTERS     |
| SQUAD FISH                |
| STAGE WORLD               |
| STAR OPERATION            |
| STEERS ARMAGEDDON         |
| STOCK GLASS               |
| STONE FIRE                |
| STRANGER STRANGERS        |
| SUGAR WONKA               |
| SUICIDES SILENCE          |
| SUMMER SCARFACE           |
| SUPER WYOMING             |
| SUPERFLY TRIP             |
| SUSPECTS QUILLS           |
| SWEDEN SHINING            |
| SWEETHEARTS SUSPECTS      |
| TADPOLE PARK              |
| TALENTED HOMICIDE         |
| TEEN APOLLO               |
| TELEGRAPH VOYAGE          |
| TEMPLE ATTRACTION         |
| TEQUILA PAST              |
| TIMBERLAND SKY            |
| TITANS JERK               |
| TOMATOES HELLFIGHTERS     |
| TOOTSIE PILOT             |
| TORQUE BOUND              |
| TRACY CIDER               |
| TRADING PINOCCHIO         |
| TRAFFIC HOBBIT            |
| TRAMP OTHERS              |
| TRAP GUYS                 |
| TREATMENT JEKYLL          |
| TROJAN TOMORROW           |
| TROUBLE DATE              |
| TRUMAN CRAZY              |
| TURN STAR                 |
| TWISTED PIRATES           |
| TYCOON GATHERING          |
| UNBREAKABLE KARATE        |
| UNFORGIVEN ZOOLANDER      |
| UPTOWN YOUNG              |
| VALLEY PACKER             |
| VOLUME HOUSE              |
| WAGON JAWS                |
| WAKE JAWS                 |
| WALLS ARTIST              |
| WAR NOTTING               |
| WARDROBE PHANTOM          |
| WARLOCK WEREWOLF          |
| WARS PLUTO                |
| WASTELAND DIVINE          |
| WATCH TRACY               |
| WATERFRONT DELIVERANCE    |
| WATERSHIP FRONTIER        |
| WEDDING APOLLO            |
| WEREWOLF LOLA             |
| WEST LION                 |
| WIZARD COLDBLOODED        |
| WON DARES                 |
| WONDERLAND CHRISTMAS      |
| WORDS HUNTER              |
| WORST BANGER              |
| YOUNG LANGUAGE            |
+---------------------------+
*/
--         Peliculas que no tengan un rating de NC-17.
select title from film where rating != 'NC-17';
/*
+-----------------------------+
| title                       |
+-----------------------------+
| ACADEMY DINOSAUR            |
| ACE GOLDFINGER              |
| AFFAIR PREJUDICE            |
| AFRICAN EGG                 |
| AGENT TRUMAN                |
| AIRPLANE SIERRA             |
| AIRPORT POLLOCK             |
| ALABAMA DEVIL               |
| ALAMO VIDEOTAPE             |
| ALASKA PHANTOM              |
| ALI FOREVER                 |
| ALONE TRIP                  |
| ALTER VICTORY               |
| AMADEUS HOLY                |
| AMELIE HELLFIGHTERS         |
| AMERICAN CIRCUS             |
| AMISTAD MIDSUMMER           |
| ANACONDA CONFESSIONS        |
| ANALYZE HOOSIERS            |
| ANGELS LIFE                 |
| ANNIE IDENTITY              |
| ANTHEM LUKE                 |
| ANYTHING SAVANNAH           |
| APOCALYPSE FLAMINGOS        |
| APOLLO TEEN                 |
| ARACHNOPHOBIA ROLLERCOASTER |
| ARGONAUTS TOWN              |
| ARIZONA BANG                |
| ARMAGEDDON LOST             |
| ARMY FLINTSTONES            |
| ARSENIC INDEPENDENCE        |
| ATLANTIS CAUSE              |
| ATTACKS HATE                |
| ATTRACTION NEWTON           |
| AUTUMN CROW                 |
| BACKLASH UNDEFEATED         |
| BADMAN DAWN                 |
| BAKED CLEOPATRA             |
| BALLROOM MOCKINGBIRD        |
| BANGER PINOCCHIO            |
| BARBARELLA STREETCAR        |
| BAREFOOT MANCHURIAN         |
| BASIC EASY                  |
| BEACH HEARTBREAKERS         |
| BEAR GRACELAND              |
| BEAST HUNCHBACK             |
| BEAUTY GREASE               |
| BEDAZZLED MARRIED           |
| BEETHOVEN EXORCIST          |
| BEHAVIOR RUNAWAY            |
| BERETS AGENT                |
| BEVERLY OUTLAW              |
| BILKO ANONYMOUS             |
| BILL OTHERS                 |
| BINGO TALENTED              |
| BIRCH ANTITRUST             |
| BIRD INDEPENDENCE           |
| BIRDS PERDITION             |
| BLACKOUT PRIVATE            |
| BLADE POLISH                |
| BLANKET BEVERLY             |
| BLINDNESS GUN               |
| BLOOD ARGONAUTS             |
| BLUES INSTINCT              |
| BOILED DARES                |
| BONNIE HOLOCAUST            |
| BOOGIE AMELIE               |
| BORN SPINAL                 |
| BORROWERS BEDAZZLED         |
| BOULEVARD MOB               |
| BOUND CHEAPER               |
| BRANNIGAN SUNRISE           |
| BRAVEHEART HUMAN            |
| BREAKFAST GOLDFINGER        |
| BREAKING HOME               |
| BRIDE INTRIGUE              |
| BRIGHT ENCOUNTERS           |
| BRINGING HYSTERICAL         |
| BROOKLYN DESERT             |
| BROTHERHOOD BLANKET         |
| BUBBLE GROSSE               |
| BUCKET BROTHERHOOD          |
| BUGSY SONG                  |
| BULWORTH COMMANDMENTS       |
| BUNCH MINDS                 |
| BUTCH PANTHER               |
| BUTTERFLY CHOCOLAT          |
| CAMPUS REMEMBER             |
| CANDIDATE PERDITION         |
| CANYON STOCK                |
| CAPER MOTIONS               |
| CAROL TEXAS                 |
| CARRIE BUNCH                |
| CASABLANCA SUPER            |
| CASPER DRAGONFLY            |
| CASUALTIES ENCINO           |
| CAT CONEHEADS               |
| CATCH AMISTAD               |
| CAUSE DATE                  |
| CELEBRITY HORN              |
| CENTER DINOSAUR             |
| CHAINSAW UPTOWN             |
| CHAMPION FLATLINERS         |
| CHANCE RESURRECTION         |
| CHARADE DUFFEL              |
| CHARIOTS CONSPIRACY         |
| CHASING FIGHT               |
| CHEAPER CLYDE               |
| CHICAGO NORTH               |
| CHICKEN HELLFIGHTERS        |
| CHILL LUCK                  |
| CHINATOWN GLADIATOR         |
| CHISUM BEHAVIOR             |
| CHITTY LOCK                 |
| CHOCOLATE DUCK              |
| CIDER DESIRE                |
| CIRCUS YOUTH                |
| CITIZEN SHREK               |
| CLASH FREDDY                |
| CLEOPATRA DEVIL             |
| CLERKS ANGELS               |
| CLOCKWORK PARADISE          |
| CLONES PINOCCHIO            |
| CLOSER BANG                 |
| CLUB GRAFFITI               |
| CLUELESS BUCKET             |
| CLYDE THEORY                |
| COAST RAINBOW               |
| COLDBLOODED DARLING         |
| COLOR PHILADELPHIA          |
| COMANCHEROS ENEMY           |
| COMMAND DARLING             |
| COMMANDMENTS EXPRESS        |
| CONFESSIONS MAGUIRE         |
| CONFUSED CANDLES            |
| CONGENIALITY QUEST          |
| CONNECTICUT TRAMP           |
| CONNECTION MICROCOSMOS      |
| CONQUERER NUTS              |
| CONSPIRACY SPIRIT           |
| CONTACT ANONYMOUS           |
| CONTROL ANTHEM              |
| CONVERSATION DOWNHILL       |
| CORE SUIT                   |
| COWBOY DOOM                 |
| CRAZY HOME                  |
| CROOKED FROGMEN             |
| CROSSING DIVORCE            |
| CROSSROADS CASUALTIES       |
| CROW GREASE                 |
| CROWDS TELEMARK             |
| CRUELTY UNFORGIVEN          |
| CRUSADE HONEY               |
| CUPBOARD SINNERS            |
| CURTAIN VIDEOTAPE           |
| CYCLONE FAMILY              |
| DADDY PITTSBURGH            |
| DAISY MENAGERIE             |
| DALMATIONS SWEDEN           |
| DANCING FEVER               |
| DANGEROUS UPTOWN            |
| DARES PLUTO                 |
| DARLING BREAKING            |
| DARN FORRESTER              |
| DATE SPEED                  |
| DAUGHTER MADIGAN            |
| DAWN POND                   |
| DAY UNFAITHFUL              |
| DAZED PUNK                  |
| DEEP CRUSADE                |
| DELIVERANCE MULHOLLAND      |
| DESERT POSEIDON             |
| DESPERATE TRAINSPOTTING     |
| DESTINATION JERK            |
| DESTINY SATURDAY            |
| DETAILS PACKER              |
| DETECTIVE VISION            |
| DEVIL DESIRE                |
| DIARY PANIC                 |
| DINOSAUR SECRETARY          |
| DISCIPLE MOTHER             |
| DISTURBING SCARFACE         |
| DIVIDE MONSTER              |
| DIVINE RESURRECTION         |
| DIVORCE SHINING             |
| DOCTOR GRAIL                |
| DOGMA FAMILY                |
| DOLLS RAGE                  |
| DOOM DANCING                |
| DOUBLE WRATH                |
| DOUBTFIRE LABYRINTH         |
| DOWNHILL ENOUGH             |
| DRACULA CRYSTAL             |
| DREAM PICKUP                |
| DRIFTER COMMANDMENTS        |
| DRIVER ANNIE                |
| DROP WATERFRONT             |
| DRUMLINE CYCLONE            |
| DRUMS DYNAMITE              |
| DUDE BLINDNESS              |
| DUFFEL APOCALYPSE           |
| DURHAM PANKY                |
| DWARFS ALTER                |
| DYING MAKER                 |
| DYNAMITE TARZAN             |
| EARRING INSTINCT            |
| EASY GLADIATOR              |
| EFFECT GLADIATOR            |
| EGG IGBY                    |
| EGYPT TENENBAUMS            |
| ELEPHANT TROJAN             |
| EMPIRE MALKOVICH            |
| ENCINO ELF                  |
| ENGLISH BULWORTH            |
| ENTRAPMENT SATISFACTION     |
| ESCAPE METROPOLIS           |
| EVE RESURRECTION            |
| EVERYONE CRAFT              |
| EVOLUTION ALTER             |
| EXCITEMENT EVE              |
| EXORCIST STING              |
| EXPECATIONS NATURAL         |
| EXPENDABLE STALLION         |
| EXPRESS LONELY              |
| EXTRAORDINARY CONQUERER     |
| EYES DRIVING                |
| FACTORY DRAGON              |
| FALCON VOLUME               |
| FAMILY SWEET                |
| FANTASIA PARK               |
| FANTASY TROOPERS            |
| FARGO GANDHI                |
| FATAL HAUNTED               |
| FEATHERS METAL              |
| FERRIS MOTHER               |
| FEUD FROGMEN                |
| FEVER EMPIRE                |
| FICTION CHRISTMAS           |
| FIDDLER LOST                |
| FIDELITY DEVIL              |
| FIGHT JAWBREAKER            |
| FINDING ANACONDA            |
| FIRE WOLVES                 |
| FIREBALL PHILADELPHIA       |
| FIREHOUSE VIETNAM           |
| FISH OPUS                   |
| FLAMINGOS CONNECTICUT       |
| FLATLINERS KILLER           |
| FLIGHT LIES                 |
| FLINTSTONES HAPPINESS       |
| FLOATS GARDEN               |
| FOOL MOCKINGBIRD            |
| FORREST SONS                |
| FREAKY POCUS                |
| FREEDOM CLEOPATRA           |
| FRENCH HOLIDAY              |
| FRIDA SLIPPER               |
| FRISCO FORREST              |
| FROGMEN BREAKING            |
| FRONTIER CABIN              |
| FROST HEAD                  |
| FUGITIVE MAGUIRE            |
| FULL FLATLINERS             |
| FURY MURDER                 |
| GABLES METROPOLIS           |
| GALAXY SWEETHEARTS          |
| GAMES BOWFINGER             |
| GANDHI KWAI                 |
| GANGS PRIDE                 |
| GARDEN ISLAND               |
| GASLIGHT CRUSADE            |
| GATHERING CALENDAR          |
| GHOST GROUNDHOG             |
| GHOSTBUSTERS ELF            |
| GIANT TROOPERS              |
| GILBERT PELICAN             |
| GILMORE BOILED              |
| GLADIATOR WESTWARD          |
| GLASS DYING                 |
| GLORY TRACY                 |
| GO PURPLE                   |
| GOLD RIVER                  |
| GOLDFINGER SENSIBILITY      |
| GOLDMINE TYCOON             |
| GONE TROUBLE                |
| GOODFELLAS SALUTE           |
| GORGEOUS BINGO              |
| GOSFORD DONNIE              |
| GRACELAND DYNAMITE          |
| GRADUATE LORD               |
| GRAFFITI LOVE               |
| GRAPES FURY                 |
| GREASE YOUTH                |
| GREEDY ROOTS                |
| GREEK EVERYONE              |
| GRINCH MASSAGE              |
| GRIT CLOCKWORK              |
| GROSSE WONDERFUL            |
| GROUNDHOG UNCUT             |
| GUN BONNIE                  |
| GUNFIGHTER MUSSOLINI        |
| GUYS FALCON                 |
| HALF OUTFIELD               |
| HALLOWEEN NUTS              |
| HAMLET WISDOM               |
| HANDICAP BOONDOCK           |
| HANGING DEEP                |
| HAPPINESS UNITED            |
| HARDLY ROBBERS              |
| HARPER DYING                |
| HARRY IDAHO                 |
| HATE HANDICAP               |
| HAUNTING PIANIST            |
| HAWK CHILL                  |
| HEAD STRANGER               |
| HEARTBREAKERS BRIGHT        |
| HEAVEN FREEDOM              |
| HEAVYWEIGHTS BEAST          |
| HELLFIGHTERS SIERRA         |
| HIGH ENCINO                 |
| HIGHBALL POTTER             |
| HILLS NEIGHBORS             |
| HOBBIT ALIEN                |
| HOCUS FRIDA                 |
| HOLES BRANNIGAN             |
| HOLIDAY GAMES               |
| HOLLYWOOD ANONYMOUS         |
| HOLOCAUST HIGHBALL          |
| HOLY TADPOLE                |
| HOME PITY                   |
| HOMEWARD CIDER              |
| HOMICIDE PEACH              |
| HONEY TIES                  |
| HOOK CHARIOTS               |
| HOOSIERS BIRDCAGE           |
| HORN WORKING                |
| HORROR REIGN                |
| HOTEL HAPPINESS             |
| HOUSE DYNAMITE              |
| HUNCHBACK IMPOSSIBLE        |
| HUNGER ROOF                 |
| HUNTER ALTER                |
| HURRICANE AFFAIR            |
| HYDE DOCTOR                 |
| HYSTERICAL GRAIL            |
| ICE CROSSING                |
| IDAHO LOVE                  |
| IDENTITY LOVER              |
| ILLUSION AMELIE             |
| IMAGE PRINCESS              |
| IMPACT ALADDIN              |
| INNOCENT USUAL              |
| INSTINCT AIRPORT            |
| INTENTIONS EMPIRE           |
| INTERVIEW LIAISONS          |
| INTOLERABLE INTENTIONS      |
| INTRIGUE WORST              |
| INVASION CYCLONE            |
| IRON MOON                   |
| ISHTAR ROCKETEER            |
| ITALIAN AFRICAN             |
| JACKET FRISCO               |
| JAPANESE RUN                |
| JAWBREAKER BROOKLYN         |
| JAWS HARRY                  |
| JEDI BENEATH                |
| JEEPERS WEDDING             |
| JEKYLL FROGMEN              |
| JEOPARDY ENCINO             |
| JERSEY SASSY                |
| JET NEIGHBORS               |
| JINGLE SAGEBRUSH            |
| JUGGLER HARDLY              |
| JUMANJI BLADE               |
| KANE EXORCIST               |
| KARATE MOON                 |
| KENTUCKIAN GIANT            |
| KICK SAVANNAH               |
| KILL BROTHERHOOD            |
| KILLER INNOCENT             |
| KISS GLORY                  |
| KISSING DOLLS               |
| KNOCK WARLOCK               |
| KRAMER CHOCOLATE            |
| KWAI HOMEWARD               |
| LABYRINTH LEAGUE            |
| LADY STAGE                  |
| LAMBS CINCINATTI            |
| LAWLESS VISION              |
| LEAGUE HELLFIGHTERS         |
| LEATHERNECKS DWARFS         |
| LEBOWSKI SOLDIERS           |
| LEGALLY SECRETARY           |
| LEGEND JEDI                 |
| LIAISONS SWEET              |
| LIBERTY MAGNIFICENT         |
| LIGHTS DEER                 |
| LION UNCUT                  |
| LOATHING LEGALLY            |
| LOCK REAR                   |
| LOLA AGENT                  |
| LONELY ELEPHANT             |
| LORD ARIZONA                |
| LOSE INCH                   |
| LOSER HUSTLER               |
| LOST BIRD                   |
| LOUISIANA HARRY             |
| LOVE SUICIDES               |
| LOVELY JINGLE               |
| LOVER TRUMAN                |
| LOVERBOY ATTACKS            |
| LUCKY FLYING                |
| LUST LOCK                   |
| MADIGAN DORADO              |
| MADISON TRAP                |
| MADNESS ATTACKS             |
| MADRE GABLES                |
| MAGIC MALLRATS              |
| MAGNIFICENT CHITTY          |
| MAGNOLIA FORRESTER          |
| MAIDEN HOME                 |
| MAJESTIC FLOATS             |
| MAKER GABLES                |
| MALKOVICH PET               |
| MALLRATS UNITED             |
| MALTESE HOPE                |
| MANCHURIAN CURTAIN          |
| MANNEQUIN WORST             |
| MARRIED GO                  |
| MASKED BUBBLE               |
| MASSACRE USUAL              |
| MASSAGE IMAGE               |
| MATRIX SNOWMAN              |
| MAUDE MOD                   |
| MEET CHOCOLATE              |
| MENAGERIE RUSHMORE          |
| METAL ARMAGEDDON            |
| METROPOLIS COMA             |
| MICROCOSMOS PARADISE        |
| MIDNIGHT WESTWARD           |
| MIDSUMMER GROUNDHOG         |
| MIGHTY LUCK                 |
| MILE MULAN                  |
| MILLION ACE                 |
| MINDS TRUMAN                |
| MINE TITANS                 |
| MINORITY KISS               |
| MIRACLE VIRTUAL             |
| MISSION ZOOLANDER           |
| MIXED DOORS                 |
| MOB DUFFEL                  |
| MOCKINGBIRD HOLLYWOOD       |
| MODERN DORADO               |
| MONEY HAROLD                |
| MONSOON CAUSE               |
| MONSTER SPARTACUS           |
| MONTEREY LABYRINTH          |
| MOON BUNCH                  |
| MOONSHINE CABIN             |
| MOONWALKER FOOL             |
| MOSQUITO ARMAGEDDON         |
| MOTHER OLEANDER             |
| MOTIONS DETAILS             |
| MOULIN WAKE                 |
| MOURNING PURPLE             |
| MOVIE SHAKESPEARE           |
| MULAN MOON                  |
| MULHOLLAND BEAST            |
| MUPPET MILE                 |
| MURDER ANTITRUST            |
| MUSCLE BRIGHT               |
| MUSIC BOONDOCK              |
| MUSKETEERS WAIT             |
| MUSSOLINI SPOILERS          |
| NAME DETECTIVE              |
| NASH CHOCOLAT               |
| NATURAL STOCK               |
| NECKLACE OUTBREAK           |
| NEIGHBORS CHARADE           |
| NETWORK PEAK                |
| NEWSIES STORY               |
| NEWTON LABYRINTH            |
| NIGHTMARE CHILL             |
| NOON PAPI                   |
| NORTHWEST POLISH            |
| NOTTING SPEAKEASY           |
| NOVOCAINE FLIGHT            |
| OCTOBER SUBMARINE           |
| OKLAHOMA JUMANJI            |
| OLEANDER CLUE               |
| OPEN AFRICAN                |
| OPERATION OPERATION         |
| OPPOSITE NECKLACE           |
| OPUS ICE                    |
| ORANGE GRAPES               |
| ORDER BETRAYED              |
| ORIENT CLOSER               |
| OSCAR GOLD                  |
| OTHERS SOUP                 |
| OUTLAW HANKY                |
| OZ LIAISONS                 |
| PACIFIC AMISTAD             |
| PACKER MADIGAN              |
| PAJAMA JAWBREAKER           |
| PANIC CLUB                  |
| PANKY SUBMARINE             |
| PAPI NECKLACE               |
| PARADISE SABRINA            |
| PARIS WEEKEND               |
| PARK CITIZEN                |
| PARTY KNOCK                 |
| PAST SUICIDES               |
| PATHS CONTROL               |
| PATRIOT ROMAN               |
| PATTON INTERVIEW            |
| PAYCHECK WAIT               |
| PEACH INNOCENT              |
| PEAK FOREVER                |
| PELICAN COMFORTS            |
| PERFECT GROOVE              |
| PERSONAL LADYBUGS           |
| PET HAUNTING                |
| PHILADELPHIA WIFE           |
| PICKUP DRIVING              |
| PILOT HOOSIERS              |
| PINOCCHIO SIMON             |
| PIRATES ROXANNE             |
| PITTSBURGH HUNCHBACK        |
| PLATOON INSTINCT            |
| PLUTO OLEANDER              |
| POLISH BROOKLYN             |
| POLLOCK DELIVERANCE         |
| POND SEATTLE                |
| POSEIDON FOREVER            |
| POTLUCK MIXED               |
| POTTER CONNECTICUT          |
| PREJUDICE OLEANDER          |
| PRESIDENT BANG              |
| PRIMARY GLASS               |
| PRIVATE DROP                |
| PRIX UNDEFEATED             |
| PSYCHO SHRUNK               |
| PULP BEVERLY                |
| PUNK DIVORCE                |
| PURPLE MOVIE                |
| QUEEN LUKE                  |
| QUEST MUSSOLINI             |
| QUILLS BULL                 |
| RAGE GAMES                  |
| RAGING AIRPLANE             |
| RAIDERS ANTITRUST           |
| RAINBOW SHOCK               |
| RANGE MOONWALKER            |
| REAP UNFAITHFUL             |
| REBEL AIRPORT               |
| RECORDS ZORRO               |
| REDS POCUS                  |
| REIGN GENTLEMEN             |
| REMEMBER DIARY              |
| REQUIEM TYCOON              |
| RESERVOIR ADAPTATION        |
| RESURRECTION SILVERADO      |
| REUNION WITCHES             |
| RIDER CADDYSHACK            |
| RIDGEMONT SUBMARINE         |
| RIGHT CRANES                |
| RINGS HEARTBREAKERS         |
| RIVER OUTLAW                |
| ROAD ROXANNE                |
| ROBBERS JOON                |
| ROBBERY BRIGHT              |
| ROCK INSTINCT               |
| ROCKETEER MOTHER            |
| ROCKY WAR                   |
| ROLLERCOASTER BRINGING      |
| ROOF CHAMPION               |
| ROOM ROMAN                  |
| ROOTS REMEMBER              |
| ROSES TREASURE              |
| ROXANNE REBEL               |
| RUGRATS SHAKESPEARE         |
| RULES HUMAN                 |
| RUN PACIFIC                 |
| RUSH GOODFELLAS             |
| RUSHMORE MERMAID            |
| SABRINA MIDNIGHT            |
| SADDLE ANTITRUST            |
| SAGEBRUSH CLUELESS          |
| SAINTS BRIDE                |
| SALUTE APOLLO               |
| SAMURAI LION                |
| SANTA PARIS                 |
| SASSY PACKER                |
| SATISFACTION CONFIDENTIAL   |
| SATURDAY LAMBS              |
| SATURN NAME                 |
| SAVANNAH TOWN               |
| SCARFACE BANG               |
| SCHOOL JACKET               |
| SCISSORHANDS SLUMS          |
| SEA VIRGIN                  |
| SEATTLE EXPECATIONS         |
| SECRET GROUNDHOG            |
| SECRETARY ROUGE             |
| SECRETS PARADISE            |
| SENSE GREEK                 |
| SENSIBILITY REAR            |
| SEVEN SWARM                 |
| SHAKESPEARE SADDLE          |
| SHANE DARKNESS              |
| SHANGHAI TYCOON             |
| SHAWSHANK BUBBLE            |
| SHEPHERD MIDSUMMER          |
| SHINING ROSES               |
| SHIP WONDERLAND             |
| SHOCK CABIN                 |
| SHOOTIST SUPERFLY           |
| SHOW LORD                   |
| SHREK LICENSE               |
| SHRUNK DIVINE               |
| SIDE ARK                    |
| SIEGE MADRE                 |
| SILENCE KANE                |
| SILVERADO GOLDFINGER        |
| SINNERS ATLANTIS            |
| SISTER FREDDY               |
| SKY MIRACLE                 |
| SLACKER LIAISONS            |
| SLEEPING SUSPECTS           |
| SLEEPLESS MONSOON           |
| SLEEPY JAPANESE             |
| SLING LUKE                  |
| SLIPPER FIDELITY            |
| SLUMS DUCK                  |
| SMILE EARRING               |
| SMOKING BARBARELLA          |
| SMOOCHY CONTROL             |
| SNATCH SLIPPER              |
| SNATCHERS MONTEZUMA         |
| SNOWMAN ROLLERCOASTER       |
| SOLDIERS EVOLUTION          |
| SONG HEDWIG                 |
| SOUP WISDOM                 |
| SOUTH WAIT                  |
| SPEAKEASY DATE              |
| SPEED SUIT                  |
| SPIKING ELEMENT             |
| SPINAL ROCKY                |
| SPIRIT FLINTSTONES          |
| SPIRITED CASUALTIES         |
| SPLASH GUMP                 |
| SPLENDOR PATTON             |
| SPOILERS HELLFIGHTERS       |
| SPY MILE                    |
| SQUAD FISH                  |
| STAGE WORLD                 |
| STAGECOACH ARMAGEDDON       |
| STALLION SUNDANCE           |
| STAMPEDE DISTURBING         |
| STAR OPERATION              |
| STEERS ARMAGEDDON           |
| STOCK GLASS                 |
| STONE FIRE                  |
| STORY SIDE                  |
| STRAIGHT HOURS              |
| STRANGER STRANGERS          |
| STRANGERS GRAFFITI          |
| STREAK RIDGEMONT            |
| STREETCAR INTENTIONS        |
| STRICTLY SCARFACE           |
| SUBMARINE BED               |
| SUGAR WONKA                 |
| SUICIDES SILENCE            |
| SUIT WALLS                  |
| SUMMER SCARFACE             |
| SUN CONFESSIONS             |
| SUNRISE LEAGUE              |
| SUPER WYOMING               |
| SUPERFLY TRIP               |
| SUSPECTS QUILLS             |
| SWARM GOLD                  |
| SWEDEN SHINING              |
| SWEET BROTHERHOOD           |
| SWEETHEARTS SUSPECTS        |
| TADPOLE PARK                |
| TALENTED HOMICIDE           |
| TARZAN VIDEOTAPE            |
| TAXI KICK                   |
| TEEN APOLLO                 |
| TELEGRAPH VOYAGE            |
| TELEMARK HEARTBREAKERS      |
| TEMPLE ATTRACTION           |
| TENENBAUMS COMMAND          |
| TEQUILA PAST                |
| TERMINATOR CLUB             |
| THEORY MERMAID              |
| THIEF PELICAN               |
| THIN SAGEBRUSH              |
| TIES HUNGER                 |
| TIGHTS DAWN                 |
| TIMBERLAND SKY              |
| TITANIC BOONDOCK            |
| TITANS JERK                 |
| TOMATOES HELLFIGHTERS       |
| TOMORROW HUSTLER            |
| TOOTSIE PILOT               |
| TORQUE BOUND                |
| TOURIST PELICAN             |
| TOWN ARK                    |
| TRACY CIDER                 |
| TRADING PINOCCHIO           |
| TRAFFIC HOBBIT              |
| TRAIN BUNCH                 |
| TRAINSPOTTING STRANGERS     |
| TRAMP OTHERS                |
| TRANSLATION SUMMER          |
| TRAP GUYS                   |
| TREASURE COMMAND            |
| TREATMENT JEKYLL            |
| TRIP NEWTON                 |
| TROJAN TOMORROW             |
| TROOPERS METAL              |
| TROUBLE DATE                |
| TRUMAN CRAZY                |
| TURN STAR                   |
| TUXEDO MILE                 |
| TWISTED PIRATES             |
| TYCOON GATHERING            |
| UNBREAKABLE KARATE          |
| UNCUT SUICIDES              |
| UNDEFEATED DALMATIONS       |
| UNFAITHFUL KILL             |
| UNFORGIVEN ZOOLANDER        |
| UNITED PILOT                |
| UPTOWN YOUNG                |
| USUAL UNTOUCHABLES          |
| VACATION BOONDOCK           |
| VALENTINE VANISHING         |
| VALLEY PACKER               |
| VANISHED GARDEN             |
| VELVET TERMINATOR           |
| VERTIGO NORTHWEST           |
| VICTORY ACADEMY             |
| VIETNAM SMOOCHY             |
| VILLAIN DESPERATE           |
| VIRGIN DAISY                |
| VIRGINIAN PLUTO             |
| VISION TORQUE               |
| VOICE PEACH                 |
| VOLUME HOUSE                |
| VOYAGE LEGALLY              |
| WAGON JAWS                  |
| WAIT CIDER                  |
| WAKE JAWS                   |
| WALLS ARTIST                |
| WANDA CHAMBER               |
| WAR NOTTING                 |
| WARDROBE PHANTOM            |
| WARLOCK WEREWOLF            |
| WARS PLUTO                  |
| WASH HEAVENLY               |
| WASTELAND DIVINE            |
| WATCH TRACY                 |
| WATERFRONT DELIVERANCE      |
| WATERSHIP FRONTIER          |
| WEDDING APOLLO              |
| WEEKEND PERSONAL            |
| WEREWOLF LOLA               |
| WEST LION                   |
| WHALE BIKINI                |
| WHISPERER GIANT             |
| WILD APOLLO                 |
| WILLOW TRACY                |
| WIND PHANTOM                |
| WINDOW SIDE                 |
| WISDOM WORKER               |
| WIZARD COLDBLOODED          |
| WOMEN DORADO                |
| WON DARES                   |
| WONDERLAND CHRISTMAS        |
| WORDS HUNTER                |
| WORKER TARZAN               |
| WORKING MICROCOSMOS         |
| WORLD LEATHERNECKS          |
| WORST BANGER                |
| WRONG BEHAVIOR              |
| WYOMING STORM               |
| YENTL IDAHO                 |
| YOUNG LANGUAGE              |
| ZOOLANDER FICTION           |
+-----------------------------+
*/
--         Peliculas con un rating PG y duracion de más de 120.
select title from film where rating = 'PG' and length > 120;
/*
+-----------------------+
| title                 |
+-----------------------+
| AGENT TRUMAN          |
| ALASKA PHANTOM        |
| ALI FOREVER           |
| ARIZONA BANG          |
| ARSENIC INDEPENDENCE  |
| BIRCH ANTITRUST       |
| BORN SPINAL           |
| BRANNIGAN SUNRISE     |
| BRINGING HYSTERICAL   |
| BUCKET BROTHERHOOD    |
| CAROL TEXAS           |
| CENTER DINOSAUR       |
| CHICKEN HELLFIGHTERS  |
| CHILL LUCK            |
| COWBOY DOOM           |
| CRAZY HOME            |
| CYCLONE FAMILY        |
| DANGEROUS UPTOWN      |
| DISCIPLE MOTHER       |
| DREAM PICKUP          |
| DYING MAKER           |
| EVERYONE CRAFT        |
| FERRIS MOTHER         |
| FIREBALL PHILADELPHIA |
| FOOL MOCKINGBIRD      |
| GABLES METROPOLIS     |
| GLADIATOR WESTWARD    |
| GREEK EVERYONE        |
| GRIT CLOCKWORK        |
| HOLES BRANNIGAN       |
| HYSTERICAL GRAIL      |
| JEDI BENEATH          |
| KENTUCKIAN GIANT      |
| LIAISONS SWEET        |
| MAIDEN HOME           |
| MAJESTIC FLOATS       |
| MALLRATS UNITED       |
| MANCHURIAN CURTAIN    |
| MASSAGE IMAGE         |
| MIGHTY LUCK           |
| MONEY HAROLD          |
| MONSOON CAUSE         |
| MOTIONS DETAILS       |
| MOURNING PURPLE       |
| MULHOLLAND BEAST      |
| MURDER ANTITRUST      |
| NECKLACE OUTBREAK     |
| NIGHTMARE CHILL       |
| NORTHWEST POLISH      |
| OLEANDER CLUE         |
| OPEN AFRICAN          |
| PAPI NECKLACE         |
| PATTON INTERVIEW      |
| POLLOCK DELIVERANCE   |
| PRESIDENT BANG        |
| QUEEN LUKE            |
| RANGE MOONWALKER      |
| RECORDS ZORRO         |
| RIDER CADDYSHACK      |
| SANTA PARIS           |
| SECRETARY ROUGE       |
| SKY MIRACLE           |
| SLEEPY JAPANESE       |
| SLUMS DUCK            |
| SPLASH GUMP           |
| SQUAD FISH            |
| STAR OPERATION        |
| STEERS ARMAGEDDON     |
| STOCK GLASS           |
| SWEDEN SHINING        |
| TADPOLE PARK          |
| TALENTED HOMICIDE     |
| TELEGRAPH VOYAGE      |
| TOOTSIE PILOT         |
| TRADING PINOCCHIO     |
| TRAMP OTHERS          |
| TWISTED PIRATES       |
| UNFORGIVEN ZOOLANDER  |
| VOLUME HOUSE          |
| WAGON JAWS            |
| WALLS ARTIST          |
| WORST BANGER          |
+-----------------------+
*/
--         ¿Cuantos actores hay?
select count(*) from actor;
/*
+----------+
| count(*) |
+----------+
|      200 |
+----------+
*/
--         ¿Cuántas ciudades tiene el country Spain?
select count(*) from city where country_id = (select country_id from city where
city = 'Valencia');
/*
+----------+
| count(*) |
+----------+
|        7 |
+----------+
*/
--         ¿Cuántos countries hay que empiezan por a?
select count(*) from country;
/*
+----------+
| count(*) |
+----------+
|      109 |
+----------+
*/
--         Media de duración de peliculas con PG.
select avg(length) from film where rating = 'PG';
/*
+-------------+
| avg(length) |
+-------------+
|    112.0052 |
+-------------+
*/
--         Suma de rental_rate de todas las peliculas.
select sum(rental_rate) from film;
/*
+------------------+
| sum(rental_rate) |
+------------------+
|          2980.00 |
+------------------+
*/
--         Pelicula con mayor duración.
select title from film where length = (select max(length) from film);
/*
+--------------------+
| title              |
+--------------------+
| CHICAGO NORTH      |
| CONTROL ANTHEM     |
| DARN FORRESTER     |
| GANGS PRIDE        |
| HOME PITY          |
| MUSCLE BRIGHT      |
| POND SEATTLE       |
| SOLDIERS EVOLUTION |
| SWEET BROTHERHOOD  |
| WORST BANGER       |
+--------------------+
*/
--         Película con menor duración.
select title from film where length = (select min(length) from film);
/*
+---------------------+
| title               |
+---------------------+
| ALIEN CENTER        |
| IRON MOON           |
| KWAI HOMEWARD       |
| LABYRINTH LEAGUE    |
| RIDGEMONT SUBMARINE |
+---------------------+
*/
--         Mostrar las ciudades del country Spain (multitabla).
select city from city join country as c on c.country_id = city.country_id where country = 'Spain';
/*
+-------------------------+
| city                    |
+-------------------------+
| A Coruña (La Coruña)    |
| Donostia-San Sebastián  |
| Gijón                   |
| Ourense (Orense)        |
| Santiago de Compostela  |
+-------------------------+
*/
--         Mostrar el nombre de la película y el nombre de los actores.
select a.first_name, f.title from actor as a join film_actor as fa join film as f on a.actor_id = fa.actor_id and fa.film_id = f.film_id limit 10;
/*
+------------+-----------------------+
| first_name | title                 |
+------------+-----------------------+
| PENELOPE   | ACADEMY DINOSAUR      |
| PENELOPE   | ANACONDA CONFESSIONS  |
| PENELOPE   | ANGELS LIFE           |
| PENELOPE   | BULWORTH COMMANDMENTS |
| PENELOPE   | CHEAPER CLYDE         |
| PENELOPE   | COLOR PHILADELPHIA    |
| PENELOPE   | ELEPHANT TROJAN       |
| PENELOPE   | GLEAMING JAWBREAKER   |
| PENELOPE   | HUMAN GRAFFITI        |
| PENELOPE   | KING EVOLUTION        |
+------------+-----------------------+
*/
--         Mostrar el nombre de la película y el de sus categorías.
select f.title, c.name from film as f join film_category as fc join category as c on c.category_id = fc.category_id and fc.film_id = f.film_id limit 10;
/*
+---------------------+--------+
| title               | name   |
+---------------------+--------+
| AMADEUS HOLY        | Action |
| AMERICAN CIRCUS     | Action |
| ANTITRUST TOMATOES  | Action |
| ARK RIDGEMONT       | Action |
| BAREFOOT MANCHURIAN | Action |
| BERETS AGENT        | Action |
| BRIDE INTRIGUE      | Action |
| BULL SHAWSHANK      | Action |
| CADDYSHACK JEDI     | Action |
| CAMPUS REMEMBER     | Action |
+---------------------+--------+
*/
--         Mostrar el country, la ciudad y dirección de cada miembro del staff.

--         Mostrar el country, la ciudad y dirección de cada customer.

--         Numero de películas de cada rating
--         Cuantas películas ha realizado el actor ED CHASE.

--         Media de duración de las películas cada categoría.

--     Nota: Se debe de mostrar la salida de cada una de las consultas.

-- A continuación se muestran algunas de las vistas que se han utilizado en la base de datos Sakila:

-- --
-- -- View structure for view `customer_list`
-- --

CREATE VIEW customer_list AS
SELECT 
    cu.customer_id AS ID, 
    CONCAT(cu.first_name, _utf8mb4' ', cu.last_name) AS name, 
    a.address AS address, 
    a.postal_code AS `zip code`,
    a.phone AS phone, 
    city.city AS city, 
    country.country AS country, 
    IF(cu.active, _utf8mb4'active',_utf8mb4'') AS notes, 
    cu.store_id AS SID
FROM 
    customer AS cu JOIN address AS a 
    ON cu.address_id = a.address_id 
    JOIN city 
    ON a.city_id = city.city_id
    JOIN country 
    ON city.country_id = country.country_id;


CREATE VIEW film_list AS
SELECT 
    film.film_id AS FID, 
    film.title AS title, 
    film.description AS description, 
    category.name AS category, 
    film.rental_rate AS price,
    film.length AS length, 
    film.rating AS rating, 
    GROUP_CONCAT(CONCAT(actor.first_name, _utf8mb4' ', actor.last_name) SEPARATOR ', ') AS actors
FROM 
    category LEFT JOIN film_category 
    ON category.category_id = film_category.category_id 
    LEFT JOIN film 
    ON film_category.film_id = film.film_id
    JOIN film_actor 
    ON film.film_id = film_actor.film_id
    JOIN actor 
    ON film_actor.actor_id = actor.actor_id
GROUP BY film.film_id,  category.name; 

-- Conociendo es estos momentos ya la BBDD, se pide:

--     Muestra el resultado de la consulta de las vistas que se proporcionan.

select * from customer_list limit 10;
/*
+-----+------------------+-------------------------------+----------+--------------+-----------------+----------------+--------+-----+
| ID  | name             | address                       | zip code | phone        | city            | country        | notes  | SID |
+-----+------------------+-------------------------------+----------+--------------+-----------------+----------------+--------+-----+
| 218 | VERA MCCOY       | 1168 Najafabad Parkway        | 40301    | 886649065861 | Kabul           | Afghanistan    | active |   1 |
| 441 | MARIO CHEATHAM   | 1924 Shimonoseki Drive        | 52625    | 406784385440 | Batna           | Algeria        | active |   1 |
|  69 | JUDY GRAY        | 1031 Daugavpils Parkway       | 59025    | 107137400143 | Béchar          | Algeria        | active |   2 |
| 176 | JUNE CARROLL     | 757 Rustenburg Avenue         | 89668    | 506134035434 | Skikda          | Algeria        | active |   1 |
| 320 | ANTHONY SCHWAB   | 1892 Nabereznyje Telny Lane   | 28396    | 478229987054 | Tafuna          | American Samoa | active |   2 |
| 528 | CLAUDE HERZOG    | 486 Ondo Parkway              | 35202    | 105882218332 | Benguela        | Angola         | active |   1 |
| 383 | MARTIN BALES     | 368 Hunuco Boulevard          | 17165    | 106439158941 | Namibe          | Angola         | active |   1 |
| 381 | BOBBY BOUDREAU   | 1368 Maracabo Boulevard       | 32716    | 934352415130 | South Hill      | Anguilla       | active |   2 |
| 359 | WILLIE MARKHAM   | 1623 Kingstown Drive          | 91299    | 296394569728 | Almirante Brown | Argentina      | active |   2 |
| 560 | JORDAN ARCHULETA | 1229 Varanasi (Benares) Manor | 40195    | 817740355461 | Avellaneda      | Argentina      | active |   1 |
+-----+------------------+-------------------------------+----------+--------------+-----------------+----------------+--------+-----+
*/

select * from film_list limit 10;
/*
+-----+------------------+-----------------------------------------------------------------------------------------------------------------------+-------------+-------+--------+--------+------------------------------------------------------------------------------------------------------------------------------------------------+
| FID | title            | description                                                                                                           | category    | price | length | rating | actors                                                                                                                                         |
+-----+------------------+-----------------------------------------------------------------------------------------------------------------------+-------------+-------+--------+--------+------------------------------------------------------------------------------------------------------------------------------------------------+
|   1 | ACADEMY DINOSAUR | A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies                      | Documentary |  0.99 |     86 | PG     | CHRISTIAN GABLE, LUCILLE TRACY, SANDRA PECK, JOHNNY CAGE, MENA TEMPLE, WARREN NOLTE, OPRAH KILMER, ROCK DUKAKIS, MARY KEITEL, PENELOPE GUINESS |
|   2 | ACE GOLDFINGER   | A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China                  | Horror      |  4.99 |     48 | G      | CHRIS DEPP, SEAN GUINESS, MINNIE ZELLWEGER, BOB FAWCETT                                                                                        |
|   3 | ADAPTATION HOLES | A Astounding Reflection of a Lumberjack And a Car who must Sink a Lumberjack in A Baloon Factory                      | Documentary |  2.99 |     50 | NC-17  | NICK WAHLBERG, BOB FAWCETT, CAMERON STREEP, RAY JOHANSSON, JULIANNE DENCH                                                                      |
|   4 | AFFAIR PREJUDICE | A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank                          | Horror      |  2.99 |    117 | G      | JODIE DEGENERES, SCARLETT DAMON, KENNETH PESCI, FAY WINSLET, OPRAH KILMER                                                                      |
|   5 | AFRICAN EGG      | A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico | Family      |  2.99 |    130 | G      | DUSTIN TAUTOU, THORA TEMPLE, MATTHEW CARREY, MATTHEW LEIGH, GARY PHOENIX                                                                       |
|   6 | AGENT TRUMAN     | A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China                             | Foreign     |  2.99 |    169 | PG     | KIRSTEN PALTROW, SANDRA KILMER, JAYNE NEESON, WARREN NOLTE, MORGAN WILLIAMS, KENNETH HOFFMAN, REESE WEST                                       |
|   7 | AIRPLANE SIERRA  | A Touching Saga of a Hunter And a Butler who must Discover a Butler in A Jet Boat                                     | Comedy      |  4.99 |     62 | PG-13  | RICHARD PENN, MICHAEL BOLGER, MENA HOPPER, OPRAH KILMER, JIM MOSTEL                                                                            |
|   8 | AIRPORT POLLOCK  | A Epic Tale of a Moose And a Girl who must Confront a Monkey in Ancient India                                         | Horror      |  4.99 |     54 | R      | FAY KILMER, GENE WILLIS, SUSAN DAVIS, LUCILLE DEE                                                                                              |
|   9 | ALABAMA DEVIL    | A Thoughtful Panorama of a Database Administrator And a Mad Scientist who must Outgun a Mad Scientist in A Jet Boat   | Horror      |  2.99 |    114 | PG-13  | WARREN NOLTE, GRETA KEITEL, WILLIAM HACKMAN, MERYL ALLEN, CHRISTIAN GABLE, MENA TEMPLE, RIP WINSLET, ELVIS MARX, RIP CRAWFORD                  |
|  10 | ALADDIN CALENDAR | A Action-Packed Tale of a Man And a Lumberjack who must Reach a Feminist in Ancient China                             | Sports      |  4.99 |     63 | NC-17  | ALEC WAYNE, JUDY DEAN, VAL BOLGER, RAY JOHANSSON, RENEE TRACY, JADA RYDER, GRETA MALDEN, ROCK DUKAKIS                                          |
+-----+------------------+-----------------------------------------------------------------------------------------------------------------------+-------------+-------+--------+--------+------------------------------------------------------------------------------------------------------------------------------------------------+
*/

--     Crea 5 vistas sobre la BBDD, y realizar la consulta, para mostrar los resultados. Las vistas deben de tener 3 o más tablas de la BBDD.


CREATE VIEW actor_film_list AS
SELECT 
    CONCAT(actor.first_name, ' ', actor.last_name) AS AN,
    film.title as FT
FROM film LEFT JOIN film_actor
    ON film.film_id = film_actor.film_id 
    LEFT JOIN actor
    ON film_actor.film_id = actor.actor_id
GROUP BY AN;

CREATE VIEW top_ten AS
SELECT 
film.title as FT,
category.name as CN,
language.name as LN
FROM film LEFT JOIN film_category
ON film.film_id = film_category.film_id 
LEFT JOIN category
ON film_category.film_id  = category.category_id
JOIN language
ON film.film_id = language.language_id
GROUP BY FT
LIMIT 10;