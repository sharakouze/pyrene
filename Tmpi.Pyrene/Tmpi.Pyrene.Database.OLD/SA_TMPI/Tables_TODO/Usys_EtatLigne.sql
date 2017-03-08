CREATE TABLE [SA_TMPI].[Usys_EtatLigne] (
    [CleEtat]      SMALLINT      NOT NULL,
    [NumOrdre]     TINYINT       NOT NULL,
    [IndVue]       BIT           CONSTRAINT [DF_Usys_EtatLigne_IndVue] DEFAULT ((0)) NOT NULL,
    [CodTable]     VARCHAR (50)  NULL,
    [IndReference] BIT           CONSTRAINT [DF_Usys_EtatLigne_IndReference] DEFAULT ((0)) NOT NULL,
    [TxtRequete]   TEXT          NOT NULL,
    [TxtParam]     VARCHAR (255) NULL,
    CONSTRAINT [PK_USys_EtatLigne] PRIMARY KEY CLUSTERED ([CleEtat] ASC, [NumOrdre] ASC)
);

