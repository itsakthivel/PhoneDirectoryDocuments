create table mst_Organisation_Type(
	Org_TypeId int not null PRIMARY KEY,
	Org_TypeName varchar(100) not null,
	Created_Date DATETIME default now(),
	IsActive bit default 1
	)
create table trn_Organisation(
	Org_Id int not null PRIMARY KEY,
	Org_Name varchar(100) not null,
	Org_TypeId int not null,
	Created_Date DATETIME default now(),
	IsActive bit default 1,
	FOREIGN KEY(Org_TypeId) REFERENCES mst_Organisation_Type (Org_TypeId)
)
create table trn_Department(
	Department_Id int not null PRIMARY KEY,
	Department_Name varchar(100) not null,
	Org_Id int not null,
	Created_Date DATETIME default now(),
	IsActive bit default 1,
	FOREIGN KEY(Org_Id) REFERENCES trn_Organisation(Org_Id)
)
create table trn_Designation(
	Designation_Id int not null PRIMARY KEY,
	Designation_Name varchar(100) not null,
	Department_Id int not null,
	Created_Date DATETIME default now(),
	IsActive bit default 1,
	FOREIGN KEY(Department_Id) REFERENCES trn_Department(Department_Id)
)
create table mst_AddressType(
	Address_TypeId int not null PRIMARY KEY,
	Address_Name varchar(100) not null,
	Created_Date DATETIME default now(),
	IsActive bit default 1
)
create table mst_Gender(
	Gender_Id int not null PRIMARY KEY,
	Gender_Name varchar(10) not null,
	Created_Date DATETIME default now(),
	IsActive bit default 1
)
create table mst_Country(
	Country_Id int not null PRIMARY KEY,
	Country_Name varchar(100) not null,
	Nationality_Name varchar(100) not null,
	Created_Date DATETIME default now(),
	IsActive bit default 1
)
create table trn_State(
	State_Id int not null PRIMARY KEY,
	State_Name varchar(100) not null,
	Country_Id int not null,
	Created_Date DATETIME default now(),
	IsActive bit default 1,
	FOREIGN KEY(Country_Id) REFERENCES mst_Country(Country_Id)
)
create table trn_User(
	User_Id int not null PRIMARY KEY,
	First_Name varchar(100) not null,
	Last_Name varchar(100) not null,
	Gender_Id int not null,
	Designation_Id int not null,
	Org_Id int not null,
	Org_TypeId int not null,
	Department_Id int not null,
	Created_Date DATETIME default now(),
	IsActive bit default 1,
	FOREIGN KEY(Gender_Id) REFERENCES mst_Gender(Gender_Id),
	FOREIGN KEY(Designation_Id) REFERENCES 	trn_Designation(Designation_Id),
	FOREIGN KEY(Org_Id) REFERENCES trn_Organisation(Org_Id),
	FOREIGN KEY(Org_TypeId) REFERENCES mst_Organisation_Type(Org_TypeId),
	FOREIGN KEY(Department_Id) REFERENCES trn_Department(Department_Id)
)
create table trn_User_Address(
	Address_Id int not null PRIMARY KEY,
	Door_No varchar(50) not null,
	Street_Name varchar(50) not null,
	City varchar(50) not null,
	State_Id int not null,
	Pincode varchar(10) not null,
	Country_Id int not null,
	User_Id int not null,
	IsSame bit default 1,
	Address_TypeId int not null,
	Created_Date DATETIME default now(),
	Modified_Date DATETIME default now(),
	FOREIGN KEY(State_Id) REFERENCES trn_State(State_Id),
	FOREIGN KEY(Country_Id) REFERENCES mst_Country(Country_Id),
	FOREIGN KEY(User_Id) REFERENCES trn_User(User_Id),
	FOREIGN KEY(Address_TypeId) REFERENCES mst_AddressType(Address_TypeId)
)
create table trn_Password(
	Password_Id int not null PRIMARY KEY,
	Password1 varchar(20) not null,
	Password2 varchar(20) not null,
	Password3 varchar(20) not null,
	User_Id int not null,
	Created_Date DATETIME default now(),
	Modified_Date DATETIME default now(),
	IsActive bit default 1,
	FOREIGN KEY(User_Id) REFERENCES trn_User(User_Id)
)
create table trn_User_Mobile_Details(
	Mobile_Id int not null PRIMARY KEY,
	User_Id int not null,
	Primary_Phone varchar(15) not null,
	Secondary_Phone varchar(15) not null,
	Created_Date DATETIME default now(),
	Modified_Date DATETIME default now(),
	IsActive bit default 1,
	FOREIGN KEY(User_Id) REFERENCES trn_User(User_Id)
)
create table trn_User_MailId(
	User_MailId int not null PRIMARY KEY,
	User_Id int not null,
	Primary_Email varchar(50) not null,
	Secondary_Email varchar(50),
	Created_Date DATETIME default now(),
	Modified_Date DATETIME default now(),
	IsActive bit default 1,
	FOREIGN KEY(User_Id) REFERENCES trn_User(User_Id)
)
create table trn_Events(
	Event_Id int not null PRIMARY KEY,
	Department_Id int not null,
	Event_Messages varchar(250),
	Event_Notification varchar(250),
	Created_Date DATETIME default now(),
	Modified_Date DATETIME default now(),
	IsActive bit default 1,
	FOREIGN KEY(Department_Id) REFERENCES trn_Department(Department_Id)
)



