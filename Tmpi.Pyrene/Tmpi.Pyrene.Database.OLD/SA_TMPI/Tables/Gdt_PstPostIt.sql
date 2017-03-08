CREATE TABLE [SA_TMPI].[Gdt_PstPostIt] (
    [ClePostIt]      INT            IDENTITY (1, 1) NOT NULL,
    [AbvPostIt]      VARCHAR (10)   NULL,
    [TxtPostIt]      VARCHAR (1000) NULL,
    [EstPersonnel]   BIT            NULL,
    [EstMultiTiers]  BIT            NULL,
    [DatCreation]    SMALLDATETIME  CONSTRAINT [DF_Gdt_PstPostIt_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]    SMALLINT       NOT NULL,
    [DatModif]       SMALLDATETIME  NULL,
    [CleOperateur]   SMALLINT       NULL,
    [DatSuppression] SMALLDATETIME  NULL,
    CONSTRAINT [PK_Gdt_PstPostIt] PRIMARY KEY CLUSTERED ([ClePostIt] ASC)
);

