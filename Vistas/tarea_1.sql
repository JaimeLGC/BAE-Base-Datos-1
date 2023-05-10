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