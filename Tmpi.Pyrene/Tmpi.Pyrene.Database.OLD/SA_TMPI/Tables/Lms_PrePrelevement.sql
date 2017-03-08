CREATE TABLE [SA_TMPI].[Lms_PrePrelevement] (
    [ClePreDossier]     INT           NOT NULL,
    [ClePrePrelevement] INT           IDENTITY (1, 1) NOT NULL,
    [NumPrelevement]    VARCHAR (25)  NULL,
    [NumOrdre]          SMALLINT      NULL,
    [DatPrelevement]    SMALLDATETIME NULL,
    [DatReception]      SMALLDATETIME NULL,
    [TxtEtiquette]      VARCHAR (100) NULL,
    CONSTRAINT [PK_Lms_PrePrelevement] PRIMARY KEY CLUSTERED ([ClePrePrelevement] ASC),
    CONSTRAINT [FK1_Lms_PrePrelevement] FOREIGN KEY ([ClePreDossier]) REFERENCES [SA_TMPI].[Lms_PreDossier] ([ClePreDossier]),
    CONSTRAINT [UN_Lms_PrePrelevement] UNIQUE NONCLUSTERED ([ClePreDossier] ASC, [NumPrelevement] ASC)
);

