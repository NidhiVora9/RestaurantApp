drop table RA_MENU_CATEGORY cascade constraints;
drop table RA_MENU cascade constraints;

CREATE TABLE RA_MENU_CATEGORY
(category_id number(3) NOT NULL,
category_name varchar2(20),
CONSTRAINT pk_cate PRIMARY KEY (category_id));

CREATE TABLE RA_TRACKUSERS
(IPADDRESS VARCHAR2(50) NOT NULL,visited_on TIMESTAMP,CONSTRAINT pk_truser PRIMARY KEY(IPADDRESS));

CREATE TABLE RA_MENU
(menu_id number(3) NOT NULL,
menu_name varchar2(50) NOT NULL,
category_id number(3) NOT NULL,
menu_description varchar2(200),
menu_imageurl varchar2(50) NOT NULL,
menu_price number(3,2) NOT NULL,
CONSTRAINT pk_menu PRIMARY KEY (menu_id),
CONSTRAINT fk_menu_category FOREIGN KEY (category_id) REFERENCES RA_MENU_CATEGORY(category_id));

CREATE TABLE RA_USER
(user_id varchar(50) NOT NULL,
user_fname varchar2(50) NOT NULL,
user_lname varchar2(50),
user_img varchar2(200),
CONSTRAINT pk_user PRIMARY KEY (user_id));

insert into RA_MENU_CATEGORY values(1,'Pizza');
insert into RA_MENU_CATEGORY values(2,'Sides');
insert into RA_MENU_CATEGORY values(3,'Drinks');
insert into RA_MENU_CATEGORY values(4,'Extras');
insert into RA_MENU_CATEGORY values(5,'Deserts');

insert into RA_MENU values(1,'Pepperoni',1,'Premium pepperoni, 100% real cheese made from mozzarella and your choice of crust.','/images/pizza/pepperoni.jpg','10.22');
insert into RA_MENU values(2,'Sausage',1,'Sausage and 100% real cheese made from mozzarella with your choice of crust.','/images/pizza/sausage.jpg','10.82');
insert into RA_MENU values(3,'Cheese Pizza',1,'100% real cheese made from mozzarella, pizza sauce and your choice of crust.','/images/pizza/cheese.jpg','90.12');
insert into RA_MENU values(4,'Johns Favorite',1,'Pepperoni, sausage, a six-cheese blend and Italian seasoning.','/images/pizza/john.jpg','11.72');
insert into RA_MENU values(5,'The Works',1,'Pepperoni, Canadian bacon, spicy Italian sausage, onions, green peppers, mushrooms and black olives.','/images//pizzaworks.jpg','15.02');
insert into RA_MENU values(6,'The Meats',1,'Pepperoni, sausage, beef, bacon and Canadian bacon.','/images/pizza/meat.jpg','8.21');
insert into RA_MENU values(7,'Spicy Italian',1,'Pepperoni plus a double portion of spicy Italian sausage.','/images/pizza/spicy.jpg','9.99');
insert into RA_MENU values(8,'BBQ Chicken Bacon',1,'BBQ sauce topped with all-white chicken, bacon and onions.','/images/pizza/bacon.jpg','12.99');
insert into RA_MENU values(9,'Hawaiian BBQ Chicken',1,'BBQ sauce with chicken, bacon, onions and pineapple.','/images/pizza/hawaiian.jpg','11.99');
insert into RA_MENU values(10,'Garden Fresh',1,'Green peppers, onions, mushrooms, black olives and Roma tomatoes','/images/pizza/garden.jpg','8.99');
insert into RA_MENU values(11,'Spinach Alfredo',1,'Spinach and a rich, creamy garlic Parmesan Alfredo sauce.','/images/pizza/spinach.jpg','13.99');
insert into RA_MENU values(12,'Tuscan Six Cheese',1,'An authentic blend of Parmesan, Romano, Asiago, Fontina, Provolone and 100% real cheese made from Mozzarella.','/images/pizza/tuscan.jpg','14.99');
insert into RA_MENU values(13,'Mediterranean Veggie',1,'300 or fewer calories per slice with a lighter portion of cheese. Roma tomatoes, onions, banana peppers, mushrooms, ripe black olives and 100% real cheese made from mozzarella.','/images/pizza/mediterranean.jpg','9.59');
insert into RA_MENU values(14,'Chicken and Veggie',1,'300 or fewer calories per slice with a lighter portion of cheese. Grilled chicken, onions, Roma tomatoes, green peppers, mushrooms, black olives and 100% real cheese made from mozzarella.','/images/pizza/veggie.jpg','9.89');
insert into RA_MENU values(15,'Grilled Chicken and Canadian Bacon',1,'300 or fewer calories per slice with a lighter portion of cheese. Grilled chicken, Canadian bacon, Roma tomatoes and 100% real cheese made from mozzarella.','/images/pizza/canadian.jpg','9.69');
insert into RA_MENU values(16,'Tropical Luau',1,'300 or fewer calories per slice with a lighter portion of cheese. Canadian bacon, sweet pineapple, green peppers and 100% real cheese made from mozzarella.','/images/pizza/tropical.jpg','11.29');

insert into RA_MENU values(17,'Garlic Knots',2,'8 Knots made with fresh dough and garlic parmesan seasoning are served with pizza sauce.','/images/sides/1.jpg','4.21');
insert into RA_MENU values(18,'Garlic Parmesan Breadsticks',2,'Fresh-baked and brushed with garlic sauce and seasonings','/images/sides/2.jpg','3.99');
insert into RA_MENU values(19,'Cheesesticks',2,'Fresh dough covered in garlic sauce and topped with mozzarella','/images/sides/3.jpg','4.11');
insert into RA_MENU values(20,'Original Breadsticks',2,'Fresh baked and served with your choice of dipping sauce.','/images/sides/4.jpg','5.291');
insert into RA_MENU values(21,'Unsauced Roasted Wings',2,'Oven-baked, unsauced and irresistibly tasty and tender','/images/sides/5.jpg','4.99');
insert into RA_MENU values(22,'Buffalo Wings',2,'Bone-in wings are oven baked and tossed in tangy buffalo sauce','/images/sides/6.jpg','3.21');
insert into RA_MENU values(23,'BBQ Wings',2,'Bone-in wings are oven baked and covered in a bold BBQ sauce','/images/sides/7.jpg','4.99');
insert into RA_MENU values(24,'Honey Chipotle Wings',2,'Bone-in, oven baked wings tossed in honey chipotle sauce','/images/sides/8.jpg','4099');
insert into RA_MENU values(25,'Chicken Poppers',2,'All-white chicken breast pieces breaded and oven-baked','/images/sides/9.jpg','5.99');

insert into RA_MENU values(26,'Pepsi',3,'','/images/drinks/1.jpg','1.99');
insert into RA_MENU values(27,'Mountain Dew',3,'','/images/drinks/2.jpg','1.69');
insert into RA_MENU values(28,'Diet Mountain Dew',3,'','/images/drinks/3.jpg','1.99');
insert into RA_MENU values(29,'Diet Pepsi',3,'','/images/drinks/4.jpg','1.89');
insert into RA_MENU values(30,'Aquafina',3,'','/images/drinks/5.jpg','1.99');
insert into RA_MENU values(31,'Pepsi Max',3,'','/images/drinks/6.jpg','1.69');
insert into RA_MENU values(32,'Mist TWST',3,'','/images/drinks/7.jpg','1.99');

insert into RA_MENU values(33,'Special Garlic Sauce',4,'Special Garlic Dipping Sauce Cup','/images/extras/1.jpg','0.99');
insert into RA_MENU values(34,'Pizza Sauce',4,'Pizza Sauce Dipping Cup','/images/extras/2.jpg','0.99');
insert into RA_MENU values(35,'Ranch Sauce',4,'Ranch Dipping Sauce Cup','/images/extras/3.jpg','0.99');
insert into RA_MENU values(36,'Blue Cheese Sauce',4,'Blue Cheese Dipping Sauce Cup','/images/extras/4.jpg','0.99');
insert into RA_MENU values(37,'Buffalo Sauce ',4,'Buffalo Dipping Sauce Cup','/images/extras/5.jpg','0.99');
insert into RA_MENU values(38,'BBQ Sauce',4,'BBQ Dipping Sauce Cup','/images/extras/6.jpg','0.99');
insert into RA_MENU values(39,'Honey Mustard Sauce',4,'Honey Mustard Dipping Sauce Cup','/images/extras/7.jpg','0.99');
insert into RA_MENU values(40,'Cheese Sauce',4,'Cheese Dipping Sauce Cup','/images/extras/8.jpg','0.99');
insert into RA_MENU values(41,'Honey Chipotle Sauce',4,'Honey Chipotle Dipping Sauce Cup','/images/extras/9.jpg','0.99');
insert into RA_MENU values(42,'Special Seasonings',4,'Special Seasonings','/images/extras/10.jpg','2.99');
insert into RA_MENU values(43,'Crushed Red Pepper',4,'Crushed Red Pepper','/images/extras/11.jpg','2.99');
insert into RA_MENU values(44,'Parmesan Cheese',4,'Parmesan Cheese','/images/extras/12.jpg','3.99');
insert into RA_MENU values(45,'Pepperoncinis',4,'Whole pepperoncini peppers are subtly sweet with medium-heat','/images/extras/13.jpg','3.99');

insert into RA_MENU values(46,'Brookie',5,'A family sized chocolate chip cookie with a chocolate chip brownie center is freshly baked and served warm.','/images/desserts/1.jpg','1.69');
insert into RA_MENU values(47,'Cinnamon Knots',5,'New Cinnamon Knots with cinnamon and icing on top of fresh-baked dough and served warm','/images/desserts/2.jpg','1.89');
insert into RA_MENU values(48,'Chocolate Chip Cookie',5,'Loaded with chocolate chips, cut into 8 slices, served warm','/images/desserts/3.jpg','1.39');
insert into RA_MENU values(49,'Double Chocolate Chip Brownie',5,'Filled with chocolate chips, cut into 9 squares and served warm','/images/desserts/4.jpg','1.99');

commit;


