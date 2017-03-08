CREATE TABLE [SA_TMPI].[LmsP_DicLigne] (
    [CleLangue1]      SMALLINT       NOT NULL,
    [CleLangue2]      SMALLINT       NOT NULL,
    [TypObjet]        TINYINT        NOT NULL,
    [CleObjet]        INT            NOT NULL,
    [CleDicLigne]     INT            IDENTITY (1, 1) NOT NULL,
    [TxtLigne]        VARCHAR (4000) NOT NULL,
    [DatModification] SMALLDATETIME  NULL,
    [CleModificateur] SMALLINT       NULL
);

