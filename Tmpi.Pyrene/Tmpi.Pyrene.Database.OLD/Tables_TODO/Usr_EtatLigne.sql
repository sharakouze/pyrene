CREATE TABLE [SA_TMPI].[Usr_EtatLigne] (
    [CleObjetU]    INT            NOT NULL,
    [CleEtat]      SMALLINT       NOT NULL,
    [NumOrdre]     SMALLINT       NOT NULL,
    [IndVue]       BIT            CONSTRAINT [DF_Usr_EtatLigne_IndVue] DEFAULT ((0)) NOT NULL,
    [CodTable]     VARCHAR (50)   NULL,
    [IndReference] BIT            CONSTRAINT [DF_Usr_EtatLigne_IndReference] DEFAULT ((0)) NOT NULL,
    [TxtRequete]   VARCHAR (4000) NULL,
    [TxtParam]     VARCHAR (255)  NULL,
    [EstActif]     BIT            NOT NULL,
    CONSTRAINT [PK_Usr_EtatLigne] PRIMARY KEY CLUSTERED ([CleObjetU] ASC, [CleEtat] ASC, [NumOrdre] ASC)
);

