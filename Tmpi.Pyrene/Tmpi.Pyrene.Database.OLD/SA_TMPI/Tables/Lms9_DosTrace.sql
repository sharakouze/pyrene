CREATE TABLE [SA_TMPI].[Lms9_DosTrace] (
    [CleDossier]        INT            NOT NULL,
    [CleDosEchantillon] INT            NULL,
    [CleGroupeP]        SMALLINT       NULL,
    [CleObjet1]         INT            NOT NULL,
    [CodObjet1]         VARCHAR (25)   NOT NULL,
    [CodObjet2]         VARCHAR (25)   NOT NULL,
    [ValAvant]          VARCHAR (4000) NULL,
    [ValApres]          VARCHAR (4000) NULL,
    [DatCreation]       SMALLDATETIME  NOT NULL,
    [CleCreateur]       INT            NOT NULL
);

