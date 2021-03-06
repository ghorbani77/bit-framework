CREATE DATABASE [CustomersDb]
GO

USE [CustomersDB]
GO

CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))

GO

CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))

GO

DECLARE @i INT = 1
WHILE (@i <= 10000) 
BEGIN
    SET @i = @i + 1
	INSERT [dbo].[Customers] ([FirstName], [LastName]) VALUES ('' + @i, '' + @i)

	DECLARE @j INT = 1
	WHILE (@j <= 3)
	BEGIN
		SET @j = @j + 1
		INSERT [dbo].[Orders] ([CustomerId], [Description]) VALUES (@i, '' + @j)
	END
END
GO