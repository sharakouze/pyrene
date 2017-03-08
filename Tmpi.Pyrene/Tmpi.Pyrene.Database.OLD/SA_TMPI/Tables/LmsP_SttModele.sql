CREATE TABLE [SA_TMPI].[LmsP_SttModele] (
    [CleMStats]     SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodMStats]     VARCHAR (50)  NOT NULL,
    [LibMStats]     VARCHAR (255) NOT NULL,
    [TypMStats]     TINYINT       NOT NULL,
    [TxtMStats]     VARCHAR (255) NULL,
    [IndRegroupe]   BIT           NOT NULL,
    [CleProprio]    SMALLINT      NOT NULL,
    [IndCommun]     BIT           NULL,
    [CodEtatS]      VARCHAR (50)  NULL,
    [CodEtatU]      VARCHAR (50)  NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   DATETIME      NULL,
    CONSTRAINT [PK_LmsP_SttModele] PRIMARY KEY CLUSTERED ([CleMStats] ASC) WITH (FILLFACTOR = 90)
);

