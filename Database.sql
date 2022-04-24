--Creating measurements table
CREATE TABLE [measurements] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [name] nvarchar(255) not NULL
)
-- Inserting data into measurements table
insert into measurements(name) values ('Tablespoon')
insert into measurements(name) values ('Cup')
insert into measurements(name) values ('Teaspoon')
insert into measurements(name) values ('Gr')
insert into measurements(name) values ('Piece')

--Creating products table
CREATE TABLE [products] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255) not NULL
)
-- Inserting data into products table
insert into products (name) values ('Brocoli') --1
insert into products (name) values ('Carrot') --2
insert into products (name) values ('Pepper') --3
insert into products (name) values ('Potatoes') --4
insert into products (name) values ('Corn') -- 5
insert into products (name) values ('Eggplant') --6
insert into products (name) values ('Onion') --7
insert into products (name) values ('Garlic')--8
insert into products (name) values ('Cucumber')--9
insert into products (name) values ('Tomatoes')--10
insert into products (name) values ('Apple')--11
insert into products (name) values ('Pineapple')--12
insert into products (name) values ('Plum')--13
insert into products (name) values ('Cherry')--14
insert into products (name) values ('Strawberry')--15
insert into products (name) values ('Blackberry')--16
insert into products (name) values ('Rassberry')--17
insert into products (name) values ('Watermelon')--18
insert into products (name) values ('Melon')--19
insert into products (name) values ('Pear')--20
insert into products (name) values ('Egg')--21
insert into products (name) values ('Flour')--22
insert into products (name) values ('Oil')--23
insert into products (name) values ('Salt')--24
insert into products (name) values ('Blackpepper')--25
insert into products (name) values ('Sugar')--26
insert into products (name) values ('Rice')--27
insert into products (name) values ('Cumin')--28
insert into products (name) values ('Ground Meat')--29
insert into products (name) values ('Chicken')--30
insert into products (name) values ('Cheese')--31
insert into products (name) values ('Milk')--32
insert into products (name) values ('Water')--33
insert into products (name) values ('Sour Cream')--34
insert into products (name) values ('Yoghurt')--35
insert into products (name) values ('Fish')--36
insert into products (name) values ('Pasta')--37
insert into products (name) values ('Yeast')--38
insert into products (name) values ('Ketchup')--39
insert into products (name) values ('Bread')--40


--Creating category table
CREATE TABLE [category] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255) not NULL
)

-- Inserting data into category table
insert into category (name) values ('Dessert')
insert into category (name) values ('Lunch')
insert into category (name) values ('Dinner')
insert into category (name) values ('Breakfast')
insert into category (name) values ('Hot Start')
insert into category (name) values ('Cold Start')
insert into category (name) values ('Snack')
insert into category (name) values ('Soup')


--Creating status table
CREATE TABLE [status] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [title] nvarchar(255) not NULL
)

-- Inserting data into status table
insert into [status] (title) values ('Expert')
insert into [status] (title) values ('Beginner')
insert into [status] (title) values ('Chef')
insert into [status] (title) values ('Executive Chef')

--Creating publisher table
CREATE TABLE [publisher] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255) not NULL,
  [surname] nvarchar(255) not NULL,
  [dob] date not NULL,
  [statusID] int references status(id),
  [joined] datetime not NULL
)

-- Inserting data into publisher table
insert into publisher (name,surname,dob,statusID,joined) values ('Berke','Yilmaz','2001-06-30',2,'2021-12-12')
insert into publisher (name,surname,dob,statusID,joined) values ('Kaan','Yilmaz','2001-05-30',3,'2021-06-11')
insert into publisher (name,surname,dob,statusID,joined) values ('Kaan','Berke','1997-06-21',1,'2022-01-01')
insert into publisher (name,surname,dob,statusID,joined) values ('Yilmaz','Berke','2000-04-10',4,'2019-05-02')
insert into publisher (name,surname,dob,statusID,joined) values ('Yilmaz','Kaan','1990-02-15',3,'2010-11-06')
insert into publisher (name,surname,dob,statusID,joined) values ('Berke','Kaan','2005-03-28',2,'2007-10-25')


--Creating recipe table
CREATE TABLE [recipe] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255) not NULL,
  [describtion] nvarchar(255),
  [instruction] nvarchar(255),
  [categoryID] int not NULL references category(id),
  [publisherID] int not NULL references publisher(id),
  [created] datetime not NULL
)

-- Inserting data into recipe table
insert into recipe (name, describtion,instruction, categoryID,publisherID,created) values ('Tomato Strawberry Desert','lorem ipsum','lorem ipsum',1,1,'2022-04-24')
insert into recipe (name, describtion,instruction, categoryID,publisherID,created) values ('Meat Bomb','lorem ipsum','lorem ipsum',3,2,'2022-04-24')
insert into recipe (name, describtion,instruction, categoryID,publisherID,created) values ('Classic Fish','lorem ipsum','lorem ipsum',5,3,'2022-04-24')
insert into recipe (name, describtion,instruction, categoryID,publisherID,created) values ('Good Morning','lorem ipsum','lorem ipsum',4,4,'2022-04-24')
insert into recipe (name, describtion,instruction, categoryID,publisherID,created) values ('Sick Soup','lorem ipsum','lorem ipsum',8,5,'2022-04-24')
insert into recipe (name, describtion,instruction, categoryID,publisherID,created) values ('Tomato Strawberry Desert','lorem ipsum','lorem ipsum',6,1,'2022-04-24')

--Creating recipeIngredients table
CREATE TABLE [recipeIngredients] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [recipeID] int not NULL references recipe(id),
  [productsID] int not NULL references products(id),
  [measurementsID] int not NULL references measurements(id),
  [amount] int not NULL,
  [created] datetime not NULL
)

-- Inserting data into recipeIngredients table
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) VALUES (1,10,5,5,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) VALUES (1,15,5,10,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (1,35,2,1,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (1,26,4,200,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (2,23,1,2,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) VALUES (2,24,3,1,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (2,25,3,1,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (2,29,4,500,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (2,7,5,1,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (2,8,5,2,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (2,10,5,2,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (3,23,1,2,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (3,24,3,1,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (3,25,3,1,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (3,36,4,400,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (3,8,5,1,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (4,21,5,3,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (4,23,1,1,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (4,24,3,1,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (4,25,3,1,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (5,23,1,2,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (5,24,3,2,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (5,25,3,2,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (5,30,4,300,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) VALUES (5,7,5,2,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (5,8,5,3,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (5,10,5,3,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (5,2,5,1,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) VALUES (6,10,5,5,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) VALUES (6,15,5,10,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (6,35,2,1,'2022-04-24')
insert into recipeIngredients (recipeID,productsID,measurementsID,amount,created) values (6,26,4,200,'2022-04-24')


--Creating orderRecipe table
CREATE TABLE [orderRecipe] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [recipeID] int not NULL references recipe(id),
  [publisherID] int not NULL references publisher(id),
  [orderedAt] datetime not NULL
)

-- Inserting data into orderRecipe table
insert into orderRecipe (recipeID,publisherid,orderedat) values (1,3,'2022-04-24')
insert into orderRecipe (recipeID,publisherid,orderedat) values (1,4,'2022-04-24')
insert into orderRecipe (recipeID,publisherid,orderedat) values (2,3,'2022-04-24')
insert into orderRecipe (recipeID,publisherid,orderedat) values (2,3,'2022-04-24')


--This view is created to see all the ingredients for recipes 
--Inner join used for connection between related tables
create VIEW showRecipeIngredients
as Select  recipeIngredients.id as recipeIngredientsID,recipeIngredients.recipeID as recipeID,products.name as productName, measurements.name as MeasurementName, recipeIngredients.amount,recipeIngredients.created 
from products
inner join recipeIngredients on products.id = recipeIngredients.productsid
inner join measurements on recipeIngredients.measurementsID = measurements.id

--To drop the showRecipe table 
drop VIEW showRecipeIngredients
-- Seeing the created view
Select * from showRecipeIngredients

--This view is created to see all the information about recipes such as who did publish it, how to use the recipe with instructions etc.
--Inner join used for connection between related tables
create view showRecipe as Select recipeIngredientsID,recipeID,recipe.name as recipeName,productName,showRecipeIngredients.amount,MeasurementName,recipe.describtion,recipe.instruction,publisher.name as publisherName,status.title as publisherTitle,showRecipeIngredients.created 
from showRecipeIngredients 
inner join recipe on recipe.id = showRecipeIngredients.recipeID
inner join category on  category.id = recipe.categoryID
inner join publisher on publisher.id = recipe.publisherID
inner join status on status.id = publisher.statusID

--To drop the showRecipe table 
drop VIEW showRecipe
-- Seeing the created view
select * from showRecipe


--How much oil used in all recipes
Select sum(recipeIngredients.amount) as oilUsed from recipeIngredients 
inner join measurements on recipeIngredients.measurementsID  = measurements.id
where measurements.id  = 1

--How much grams of products used in all recipes
Select sum(recipeIngredients.amount) as gramsUsed from recipeIngredients 
inner join measurements on recipeIngredients.measurementsID  = measurements.id
where measurements.id  = 4

--What is the average salt using in recipes
Select avg(cast(recipeIngredients.amount as float)) as tableSpoonUsed from measurements 
inner join recipeIngredients on recipeIngredients.measurementsID  = measurements.id
inner join products on products.id = recipeIngredients.productsID
where products.id = 24

--Select the recipes whose publisher's title is 'Chef' A to Z
Select recipe.name as recipeName,publisher.name as publisherName, status.title as publisherTitle 
from recipe
inner join publisher on publisher.id = recipe.publisherID
inner join status on status.id = publisher.statusID
where status.title = 'Chef' order by recipeName asc  

--Count how many recipe ordered by whose id is equal to 3
Select count(orderRecipe.id) as orderRecipeID from orderRecipe 
inner join recipe on recipe.id = orderRecipe.recipeID
inner join publisher on publisher.id = orderRecipe.publisherID
where publisher.id = 3

--Select from publisher oldest and youngest publisher's birthdate and select the date for last and first joined publishers
Select min(publisher.dob) as oldest, max(publisher.dob) as youngest, min(publisher.joined) as firstJoined, max(publisher.joined) as lastJoined from publisher 

--List publishers by their birthdate from oldest to youngest
Select publisher.name,publisher.surname,publisher.dob from publisher order by publisher.dob