[use MM_Temporal_Test]

CREATE TABLE Post (
    [PostId] [int] NOT NULL IDENTITY(1,1),
    [PostName] [varchar](50)  NOT NULL,
    [Version] [timestamp] NOT NULL,
	[PeriodStart] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[PeriodEnd] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
    (
        [PostId] ASC
    )  ON [PRIMARY], PERIOD FOR SYSTEM_TIME ([PeriodStart], [PeriodEnd])
) WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[PostHistory]))

CREATE TABLE Tag (
    [TagId] [int] NOT NULL IDENTITY(1,1),
    [TagName] [varchar](50)  NOT NULL,
    [Version] [timestamp] NOT NULL,
	[PeriodStart] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[PeriodEnd] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
    (
        [TagId] ASC
    )  ON [PRIMARY], PERIOD FOR SYSTEM_TIME ([PeriodStart], [PeriodEnd])
) WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[TagHistory]))

CREATE TABLE PostTag (
    [PostTagId] [int] NOT NULL IDENTITY(1,1),
    [PostId] [int] NOT NULL,
    [TagId] [int] NOT NULL,
    [Version] [timestamp] NOT NULL,
	[PeriodStart] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[PeriodEnd] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_PostTag] PRIMARY KEY CLUSTERED 
    (
        [PostTagId] ASC
    )  ON [PRIMARY], PERIOD FOR SYSTEM_TIME ([PeriodStart], [PeriodEnd])
) WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[PostTagHistory]))
GO

ALTER TABLE [dbo].[PostTag]  WITH CHECK ADD FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([PostId])
GO

ALTER TABLE [dbo].[PostTag]  WITH CHECK ADD FOREIGN KEY([TagId])
REFERENCES [dbo].[Tag] ([TagId])
GO