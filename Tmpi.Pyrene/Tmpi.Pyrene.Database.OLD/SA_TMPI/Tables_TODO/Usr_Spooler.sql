CREATE TABLE [SA_TMPI].[Usr_Spooler] (
    [CleSpooler]    INT           IDENTITY (1, 1) NOT NULL,
    [CodEtatStd]    VARCHAR (50)  NULL,
    [CodEtatUsr]    VARCHAR (50)  NULL,
    [LstKey_B]      IMAGE         NULL,
    [LstParam_B]    IMAGE         NULL,
    [NbrCopie]      TINYINT       CONSTRAINT [DF_Usr_Spooler_NbrCopie] DEFAULT ((1)) NOT NULL,
    [NivPriorite]   TINYINT       CONSTRAINT [DF_Usr_Spooler_NivPriorite] DEFAULT ((128)) NOT NULL,
    [NomImprimante] VARCHAR (100) NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Usr_Spooler_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      NOT NULL,
    CONSTRAINT [PK_Usr_Spooler] PRIMARY KEY CLUSTERED ([CleSpooler] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Usr_Spooler]
    ON [SA_TMPI].[Usr_Spooler]([CleCreateur] ASC) WITH (FILLFACTOR = 90);

