
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblAddress](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[AddressBusiness] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.tblAddress] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblAddressNames](
	[NameId] [int] IDENTITY(1,1) NOT NULL,
	[AddressId] [int] NOT NULL,
	[AddressFirstName] [nvarchar](50) NULL,
	[AddressSurname] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.tblAddressNames] PRIMARY KEY CLUSTERED 
(
	[NameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblAddressNames]  WITH CHECK ADD  CONSTRAINT [FK_dbo.tblAddressNames_dbo.tblAddress_AddressId] FOREIGN KEY([AddressId])
REFERENCES [dbo].[tblAddress] ([AddressId])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[tblAddressNames] CHECK CONSTRAINT [FK_dbo.tblAddressNames_dbo.tblAddress_AddressId]
GO

--delete from tblAddress;
--delete from tblAddressNames;

SET IDENTITY_INSERT dbo.tblAddress ON;

with randowvalues
    as(
        select 1 id, 
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) randomname,
			CAST(RAND(CHECKSUM(NEWID()))*3+17946 as int) randomskill
        union  all
        select id + 1, 
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) randomname,
			CAST(RAND(CHECKSUM(NEWID()))*3+17946 as int) randomskill
        from randowvalues
        where id < 10000
    )

insert into tblAddress(AddressId, AddressBusiness)
select id, randomname as name
from randowvalues
OPTION(MAXRECURSION 0);

SET IDENTITY_INSERT dbo.tblAddress OFF;

with randowvalues
    as(
        select 1 id, 
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) randomname,
			CAST(RAND(CHECKSUM(NEWID()))*10000+1 as int) randomskill
        union  all
        select id + 1, 
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) +
            CHAR(CAST(RAND(CHECKSUM(NEWID()))*25+65 as int)) randomname,
			CAST(RAND(CHECKSUM(NEWID()))*10000+1 as int) randomskill
        from randowvalues
        where id < 1000000
    )

insert into tblAddressNames(AddressId, AddressFirstName, AddressSurname)
select randomskill, randomname, randomname
from randowvalues
OPTION(MAXRECURSION 0);

