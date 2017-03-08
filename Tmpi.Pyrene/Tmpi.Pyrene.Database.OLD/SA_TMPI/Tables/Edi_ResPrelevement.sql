CREATE TABLE [SA_TMPI].[Edi_ResPrelevement] (
    [CleDosPrelevement] INT           NOT NULL,
    [CleDossier]        INT           NOT NULL,
    [NumOrdre]          SMALLINT      NOT NULL,
    [NumPrelevement]    VARCHAR (100) NULL,
    [DatPrelevement]    SMALLDATETIME NULL,
    [HeuPrelevement]    SMALLDATETIME NULL,
    [CleMatFamille]     INT           NULL,
    [CleMatFamille_Ref] INT           NULL,
    [CleMethode]        INT           NULL,
    [CleMethode_Ref]    INT           NULL,
    [NumPointP]         VARCHAR (50)  NULL,
    [NomPointP]         VARCHAR (100) NULL,
    [NumPointS]         VARCHAR (50)  NULL,
    [NomPointS]         VARCHAR (100) NULL,
    [TxtPrelevement]    VARCHAR (255) NULL,
    CONSTRAINT [PK_Edi_ResPrelevement] PRIMARY KEY CLUSTERED ([CleDosPrelevement] ASC)
);

