CREATE TABLE [SA_TMPI].[t_EFactureLig] (
    [CleEFacture]      INT             NOT NULL,
    [QteArticle]       DECIMAL (15, 3) CONSTRAINT [DF_t_EFactureLig_QteArticle] DEFAULT ((0)) NOT NULL,
    [CleArticle]       INT             NULL,
    [CodArticle]       VARCHAR (50)    NULL,
    [LibArticle]       VARCHAR (255)   NULL,
    [PrxUnitaire]      DECIMAL (15, 4) CONSTRAINT [DF_t_EFactureLig_PrxUnitaire] DEFAULT ((0)) NOT NULL,
    [TauTva]           DECIMAL (5, 2)  CONSTRAINT [DF_t_EFactureLig_TauTva] DEFAULT ((0)) NOT NULL,
    [CleDevise]        TINYINT         NULL,
    [CleImput]         SMALLINT        NULL,
    [CleEReceptionLig] INT             NULL,
    [CleNomenc]        SMALLINT        NULL,
    [ValConditionF]    DECIMAL (10, 3) NOT NULL,
    [TauRemise]        DECIMAL (5, 2)  CONSTRAINT [DF_t_EFactureLig_TauRemise] DEFAULT ((0)) NOT NULL,
    [CleFactureLig]    INT             IDENTITY (1, 1) NOT NULL,
    [MntEnPlus]        DECIMAL (15, 2) CONSTRAINT [DF_t_EFactureLig_MntEnPlus] DEFAULT ((0)) NOT NULL,
    [CleFacture]       INT             NULL,
    [NumEngLigne]      INT             NULL,
    CONSTRAINT [PK_t_EFactureLig] PRIMARY KEY CLUSTERED ([CleFactureLig] ASC),
    CONSTRAINT [FK1_t_EFactureLig] FOREIGN KEY ([CleEFacture]) REFERENCES [SA_TMPI].[t_EFacture] ([CleEFacture]),
    CONSTRAINT [FK2_t_EFactureLig] FOREIGN KEY ([CleEReceptionLig]) REFERENCES [SA_TMPI].[t_EReceptionLig] ([CleEReceptionLig]),
    CONSTRAINT [FK3_t_EFactureLig] FOREIGN KEY ([CleImput]) REFERENCES [SA_TMPI].[t_Imput] ([CleImput])
);


GO
CREATE NONCLUSTERED INDEX [ID1_t_EFactureLig]
    ON [SA_TMPI].[t_EFactureLig]([CleEFacture] ASC);

