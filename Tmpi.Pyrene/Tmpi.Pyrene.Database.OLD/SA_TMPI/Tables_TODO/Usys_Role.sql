CREATE TABLE [SA_TMPI].[Usys_Role] (
    [CleRole] INT           IDENTITY (1, 1) NOT NULL,
    [NomRole] VARCHAR (50)  NOT NULL,
    [TxtRole] VARCHAR (256) NULL,
    CONSTRAINT [PK_Usys_Role] PRIMARY KEY CLUSTERED ([CleRole] ASC),
    CONSTRAINT [UN_Usys_Role] UNIQUE NONCLUSTERED ([NomRole] ASC)
);

