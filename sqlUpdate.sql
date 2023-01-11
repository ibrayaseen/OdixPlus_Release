USE [ODS1]
GO

/****** Object:  Table [dbo].[Z_RsdDetails]    Script Date: 11/01/2023 08:09:40 ص ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Z_RsdDetails](
	[Guid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Z_RsdDetails_Guid]  DEFAULT (newid()),
	[RsdGuid] [uniqueidentifier] NULL,
	[GTIN] [nvarchar](16) NULL,
	[XD] [date] NULL,
	[BN] [nvarchar](20) NULL,
	[SN] [nvarchar](20) NULL,
	[RC] [nvarchar](20) NULL,
	[DataMatrix] [nvarchar](350) NOT NULL,
	[ItemId] [bigint] NULL,
 CONSTRAINT [PK_Z_RsdDetails] PRIMARY KEY CLUSTERED 
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [ODS1]
GO

/****** Object:  Table [dbo].[Z_Rsd]    Script Date: 11/01/2023 08:13:03 ص ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Z_Rsd](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[InvGuid] [uniqueidentifier] NULL,
	[Guid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Z_Rsd_Guid]  DEFAULT (newid()),
	[TOGLN] [nvarchar](50) NOT NULL CONSTRAINT [DF_Z_Rsd_TOGLN]  DEFAULT ((0.0)),
	[DOCTORID] [nvarchar](50) NOT NULL CONSTRAINT [DF_Z_Rsd_DOCTORID]  DEFAULT ((0)),
	[PATIENTNATIONALID] [nvarchar](50) NOT NULL CONSTRAINT [DF_Z_Rsd_PATIENTNATIONALID]  DEFAULT ((0)),
	[PRESCRIPTIONID] [nvarchar](50) NOT NULL CONSTRAINT [DF_Z_Rsd_PRESCRIPTIONID]  DEFAULT ((0)),
	[PRESCRIPTIONDATE] [date] NOT NULL CONSTRAINT [DF_Z_Rsd_PRESCRIPTIONDATE]  DEFAULT (getdate()),
	[NOTIFICATIONID] [nvarchar](150) NULL,
	[DateCreate] [datetime] NOT NULL CONSTRAINT [DF_Z_Rsd_DateCreate]  DEFAULT (getdate()),
	[UserCreate] [uniqueidentifier] NULL,
	[ServiceType] [smallint] NOT NULL CONSTRAINT [DF_Z_Rsd_ServiceType]  DEFAULT ((0)),
 CONSTRAINT [PK_Z_Rsd] PRIMARY KEY CLUSTERED 
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


