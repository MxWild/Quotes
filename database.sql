USE [QuotesDB]
GO
/****** Object:  Table [dbo].[CategoriesSet]    Script Date: 07.09.2017 13:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriesSet](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_CategoriesSet] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuotesSet]    Script Date: 07.09.2017 13:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuotesSet](
	[QuoteId] [int] IDENTITY(1,1) NOT NULL,
	[QuoteText] [nvarchar](250) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[NameOfAuthor] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_QuotesSet] PRIMARY KEY CLUSTERED 
(
	[QuoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[QuotesSet]  WITH CHECK ADD  CONSTRAINT [FK_CategoriesQuotes] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[CategoriesSet] ([CategoryId])
GO
ALTER TABLE [dbo].[QuotesSet] CHECK CONSTRAINT [FK_CategoriesQuotes]
GO
