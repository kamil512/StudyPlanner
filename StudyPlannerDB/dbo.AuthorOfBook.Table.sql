USE [StudyPlanner]
GO
/****** Object:  Table [dbo].[AuthorOfBook]    Script Date: 2016-06-30 09:27:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthorOfBook](
	[BookId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL,
	[Priority] [int] NOT NULL
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[AuthorOfBook]  WITH CHECK ADD  CONSTRAINT [FK_AuthorOfBook_Author] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Author] ([AuthorId])
GO
ALTER TABLE [dbo].[AuthorOfBook] CHECK CONSTRAINT [FK_AuthorOfBook_Author]
GO
ALTER TABLE [dbo].[AuthorOfBook]  WITH CHECK ADD  CONSTRAINT [FK_AuthorOfBook_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([BookId])
GO
ALTER TABLE [dbo].[AuthorOfBook] CHECK CONSTRAINT [FK_AuthorOfBook_Book]
GO
