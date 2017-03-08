CREATE TABLE [SA_TMPI].[t_EReception] (
    [CleECommande]  INT           NOT NULL,
    [CleEReception] INT           IDENTITY (1, 1) NOT NULL,
    [NumReception]  VARCHAR (25)  NOT NULL,
    [DatReception]  DATETIME      NOT NULL,
    [CleFourn]      SMALLINT      NOT NULL,
    [CleClient]     SMALLINT      NOT NULL,
    [TxtReception]  VARCHAR (255) NULL,
    [CleValideur]   SMALLINT      NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatSaisie]     DATETIME      NULL,
    [DatValidation] DATETIME      NULL,
    [NivSaisie]     TINYINT       NULL,
    [NumLivraison]  VARCHAR (50)  NULL,
    [DatLivraison]  DATETIME      NULL,
    CONSTRAINT [PK_t_EReception] PRIMARY KEY CLUSTERED ([CleEReception] ASC),
    CONSTRAINT [FK1_T_ERECEPTION] FOREIGN KEY ([CleECommande]) REFERENCES [SA_TMPI].[t_ECommande] ([CleECommande])
);

