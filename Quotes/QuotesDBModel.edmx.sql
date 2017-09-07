
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/06/2017 21:18:02
-- Generated from EDMX file: c:\users\maximus\documents\visual studio 2015\Projects\Quotes\Quotes\QuotesDBModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [QuotesDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_QuotesCategories]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CategoriesSet] DROP CONSTRAINT [FK_QuotesCategories];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[CategoriesSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CategoriesSet];
GO
IF OBJECT_ID(N'[dbo].[QuotesSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[QuotesSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'QuotesSet'
CREATE TABLE [dbo].[QuotesSet] (
    [QuoteId] int IDENTITY(1,1) NOT NULL,
    [QuoteText] nvarchar(250)  NOT NULL,
    [DateAdded] datetime  NOT NULL,
    [NameOfAuthor] nvarchar(50)  NOT NULL,
    [CategoryId] int  NOT NULL
);
GO

-- Creating table 'CategoriesSet'
CREATE TABLE [dbo].[CategoriesSet] (
    [CategoryId] int IDENTITY(1,1) NOT NULL,
    [CategoryName] nvarchar(30)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [QuoteId] in table 'QuotesSet'
ALTER TABLE [dbo].[QuotesSet]
ADD CONSTRAINT [PK_QuotesSet]
    PRIMARY KEY CLUSTERED ([QuoteId] ASC);
GO

-- Creating primary key on [CategoryId] in table 'CategoriesSet'
ALTER TABLE [dbo].[CategoriesSet]
ADD CONSTRAINT [PK_CategoriesSet]
    PRIMARY KEY CLUSTERED ([CategoryId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CategoryId] in table 'QuotesSet'
ALTER TABLE [dbo].[QuotesSet]
ADD CONSTRAINT [FK_CategoriesQuotes]
    FOREIGN KEY ([CategoryId])
    REFERENCES [dbo].[CategoriesSet]
        ([CategoryId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoriesQuotes'
CREATE INDEX [IX_FK_CategoriesQuotes]
ON [dbo].[QuotesSet]
    ([CategoryId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------