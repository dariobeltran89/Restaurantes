-- =============================================
-- Author:		Darío Beltrán
-- Create date: 22/06/2020
-- Description:	Creación de las tablas
-- Module:		Restaurantes
-- =============================================

USE Restaurantes;

GO

IF (OBJECT_ID('[dbo].[Restaurante]') IS NOT NULL) BEGIN
	DROP TABLE [dbo].[Restaurante]
END
PRINT 'Creando [dbo].[Restaurante]...'
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description:	Creación de tabla [dbo].[Restaurante]
-- =============================================

CREATE TABLE [dbo].[Restaurante](
	[IdRestaurante] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [VARCHAR](32) NOT NULL,
	[Calificacion] [decimal](2,1) NULL,
	[Estado] [int] NOT NULL,
	[RutaIamgen] [varchar](max) NULL,
	[Favorito] [int] NULL,
 CONSTRAINT [PK_AmicusCuriae] PRIMARY KEY CLUSTERED 
(
	[IdRestaurante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
PRINT 'Ejecución Exitosa [dbo].[Restaurante].'
GO

-- =============================================
-- Description:	Creación de tabla [dbo].[Producto]
-- =============================================

IF (OBJECT_ID('[dbo].[Producto]') IS NOT NULL) BEGIN
	DROP TABLE [dbo].Producto
END
PRINT 'Creando [dbo].[Producto]...'
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[IdRestaurante] [int] NULL,
	[Nombre] [varchar](24) NULL,
	[Descripcion] [varchar](124) NULL,
	[calificacion] [decimal](2,1) NULL,
	[RutaImagen] [varchar](max) NULL,
	[CantidadDeVisitas] [int] NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
PRINT 'Ejecución Exitosa [dbo].[Producto].'
GO

-- =============================================
-- Description:	Creación de llaves de las tablas
-- =============================================

ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Restaurante] FOREIGN KEY([IdRestaurante])
REFERENCES [dbo].[Restaurante] ([IdRestaurante])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Restaurante]
GO