USE [ODS1]
GO
/****** Object:  StoredProcedure [dbo].[Barcode_Update]    Script Date: 07/01/2023 11:05:36 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Barcode_Update]
     @ID BIGINT,
	@GuidItem UNIQUEIDENTIFIER,
	@Unit_ID BIGINT,
	@Barcode NVARCHAR(150),
	@EndUser decimal(18, 8),
	@Half decimal(18, 8),
	@Whole decimal(18, 8),
	@Vendor decimal(18, 8),
	@RatioUnit decimal(18, 8),
		@GTIN NVARCHAR(150)=''
AS
BEGIN

	 
UPDATE	[Barcode]
	SET		
   GuidItem =@GuidItem,
	Unit_ID =@Unit_ID,
	Barcode =@Barcode,
	EndUser =@EndUser,
	Half =@Half,
	Whole =@Whole,
	Vendor=@Vendor,
	RatioUnit=@RatioUnit,
	GTIN=@GTIN
			
	WHERE	id = @id;

	
END;





 

ALTER PROCEDURE [dbo].[Barcode_Get]
	@GuidItem UNIQUEIDENTIFIER
AS
BEGIN
SELECT [ID]
      ,[GuidItem]
	  ,[unititemNameA]
      ,[RatioUnit]
      ,[Unit_ID]
      ,[Barcode]
      ,[EndUser]
      ,[Half]
      ,[Whole]
      ,[Vendor]
      ,[unititemCardNo]     
      ,[unititemNameL]
      ,[temCardNo]
      ,[itemNameA]
	  ,CLength,
		CDisplay,
		CSize,
		Cnumber,
		Cweight,
		[GTIN]
		
  FROM [dbo].[View_Barcode]
	WHERE	GuidItem=@GuidItem  ;
END;







ALTER VIEW [dbo].[View_Barcode]
AS
SELECT        dbo.Barcode.ID, dbo.Barcode.GuidItem, dbo.Barcode.RatioUnit, dbo.Barcode.Unit_ID, dbo.Barcode.Barcode, dbo.Barcode.EndUser, dbo.Barcode.Half, dbo.Barcode.Whole, dbo.Barcode.Vendor, 
                         dbo.unititem.CardNo AS unititemCardNo, dbo.unititem.NameA AS unititemNameA, dbo.unititem.NameL AS unititemNameL, dbo.item.CardNo AS temCardNo, dbo.item.NameA AS itemNameA, dbo.Barcode.CLength, 
                         dbo.Barcode.CDisplay, dbo.Barcode.CSize, dbo.Barcode.Cnumber, dbo.Barcode.Cweight, dbo.Barcode.GTIN
FROM            dbo.Barcode INNER JOIN
                         dbo.unititem ON dbo.Barcode.Unit_ID = dbo.unititem.id INNER JOIN
                         dbo.item ON dbo.Barcode.GuidItem = dbo.item.guid





ALTER PROCEDURE [dbo].[Barcode_Add]
	@GuidItem UNIQUEIDENTIFIER,
	@Unit_ID BIGINT,
	@Barcode NVARCHAR(150),
	@EndUser decimal(18, 8),
	@Half decimal(18, 8),
	@Whole decimal(18, 8),
	@Vendor decimal(18, 8),
	@RatioUnit decimal(18, 8),
	@CLength decimal(18, 8),
	@CDisplay decimal(18, 8),
	@CSize decimal(18, 8),
	@Cnumber decimal(18, 8),
	@Cweight decimal(18, 8),
	@GTIN NVARCHAR(150)
AS
BEGIN

	 

	INSERT INTO [Barcode]
	(
		[GuidItem],
		[Unit_ID],
		[Barcode],
		[EndUser],
		[Half],
		[Whole],
		Vendor,
		RatioUnit,
		CLength,
		CDisplay,
		CSize,
		Cnumber,
		Cweight,
		[GTIN]
		 
		 
	)
	VALUES
	(
		@GuidItem,
		@Unit_ID,
		@Barcode,
		@EndUser,
		@Half,
		@Whole,
		@Vendor,
		@RatioUnit ,
		@CLength,
		@CDisplay,
		@CSize,
		@Cnumber,
		@Cweight,
		 
	@GTIN);

	
END;







