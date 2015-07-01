USE [SEVIMEX_LUIS]
GO

/****** Object:  Table [dbo].[Pers_Temp_IdDoc_LineasFacturasRec]    Script Date: 01/07/2015 13:56:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Pers_Temp_IdDoc_LineasFacturasRec](
	[Id_IdDoc] [dbo].[T_Id_Doc] NULL,
	[IdDoc] [dbo].[T_Id_Doc] IDENTITY(1,1) NOT NULL,
	[InsertUpdate] [dbo].[T_CEESI_Insert_Update] NOT NULL,
	[Usuario] [dbo].[T_CEESI_Usuario] NOT NULL,
	[FechaInsertUpdate] [dbo].[T_CEESI_Fecha_Sistema] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO