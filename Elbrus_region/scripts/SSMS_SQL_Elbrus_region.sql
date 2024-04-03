use [master]
go 

drop database IF exists [Elbrus_region]
go
 
create database [Elbrus_region]
go

use [Elbrus_region]
go 


create table [dbo].[Client] (
	[code] [varchar] (6) not null,
	[LastName] [varchar] (100) not null,
	[FirstName] [varchar] (50) not null,
	[Patronymic] [varchar] (50) not null,
	[Gender] [varchar] (1) not null,
	[Phone] [varchar] (20) not null,
	[Email] [varchar] (50) not null, 
	CONSTRAINT pk_Client PRIMARY KEY ([code]),
	CONSTRAINT chk_Gender CHECK ([Gender] IN ('F', 'M'))
)
go

create table [dbo].[Employee] (
	[code] [varchar] (6) not null,
	[Post] [varchar] (30) not null,
	[FullName] [varchar] (300) not null,
	[Login] [varchar] (300) not null,
	[Password] [varchar] (300) not null,
	[LastTry] [varchar] (300) not null,
	[TypeLogin] [varchar] (300) not null,
	CONSTRAINT pk_Employee PRIMARY KEY ([code]),
	CONSTRAINT check_Post CHECK ([Post] IN ('Продавец', 'Администратор', 'Старший смены')),
)
go


create table [dbo].[Country] (
	[code] [varchar] (3) not null,
	[name] [varchar] (100) not null,
	[flag] [BINARY] not null,
	CONSTRAINT pk_Country PRIMARY KEY ([code]),
)
go

create table [dbo].[HotelPhoto] (
	[ID] [INT] not null IDENTITY,
	[Preview] [BINARY] not null,
	[PhotoPath] [VARCHAR] (200) not null,
	CONSTRAINT pk_HotelPhoto PRIMARY KEY ([ID]),
)
go

create table [dbo].[Service] (
	[ID] [INT] not null IDENTITY,
	[Name] [varchar] (100) not null,
	[PatherID] [INT] not null,
	[HotelID] [INT] not null,
	[Price] [DECIMAL] (10, 2) not null,
	CONSTRAINT [pk_Service] PRIMARY KEY ([ID]),
	--FOREIGN KEY ([PatherID]) REFERENCES Pather([ID])
)
go

create table [dbo].[ServiceByTour] (
	[ID] [INT] not null,
	[ServiceID] [INT] not null,
	[IsControl] [BIT] not null,
	CONSTRAINT [pk_ServiceByTour] PRIMARY KEY ([ID]),
	FOREIGN KEY ([ServiceID]) REFERENCES [Service]([ID])
)
go

INSERT INTO Employee ([code], [Post], [FullName], [Login], [Password], [LastTry], [TypeLogin])
VALUES 
('101', 'Продавец', 'Иванов Иван Иванович', 'Ivanov@namecomp.ru', '2L6KZG', '15:05:2022 13:13:00', 'Успешно'),
('102', 'Продавец', 'Петров Петр Петрович', 'petrov@namecomp.ru', 'uzWC67', '15:05:2022 13:13:00', 'Успешно'),
('103', 'Администратор', 'Федоров Федор Федорович', 'fedorov@namecomp.ru', '8ntwUp', '15:05:2022 13:13:00', 'Успешно'),
('104', 'Старший смены', 'Миронов Вениамин Куприянович', 'mironov@namecomp.ru', 'YOyhfR', '15:05:2022 13:13:00', 'Успешно'),
('105', 'Старший смены', 'Ширяев Ермолай Вениаминович', 'shiryev@namecomp.ru', 'RSbvHv', '15:05:2022 13:13:00', 'Неуспешно'),
('106', 'Старший смены', 'Игнатов Кассиан Васильевич', 'ignatov@namecomp.ru', 'rwVDh9', '15:05:2022 13:13:00', 'Успешно'),
('107', 'Продавец', 'Хохлов Владимир Мэлсович', 'hohlov@namecomp.ru', 'LdNyos', '15:05:2022 13:13:00', 'Успешно'),
('108', 'Продавец', 'Стрелков Мстислав Георгьевич', 'strelkov@namecomp.ru', 'gynQMT', '15:05:2022 13:13:00', 'Неуспешно'),
('109', 'Продавец', 'Беляева Лилия Наумовна', 'belyeva@@namecomp.ru', 'AtnDjr', '15:05:2022 13:13:00', 'Успешно'),
('110', 'Продавец', 'Смирнова Ульяна Гордеевна', 'smirnova@@namecomp.ru', 'JlFRCZ', '15:05:2022 13:13:00', 'Успешно')
go