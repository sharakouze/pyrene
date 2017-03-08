CREATE TABLE [SA_TMPI].[GenP_MdtMandataire] (
    [CleMandat]        SMALLINT NOT NULL,
    [CleMdtMandataire] INT      IDENTITY (1, 1) NOT NULL,
    [CleMandataire]    SMALLINT NOT NULL,
    [CleSociete]       SMALLINT NOT NULL,
    [CleSecteur]       SMALLINT NULL,
    [CleService]       SMALLINT NULL,
    [EstSuspendu]      BIT      CONSTRAINT [DF_GenP_MdtMandataire_EstSuspendu] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_GenP_MdtMandataire] PRIMARY KEY CLUSTERED ([CleMdtMandataire] ASC),
    CONSTRAINT [FK1_GenP_MdtMandataire] FOREIGN KEY ([CleMandat]) REFERENCES [SA_TMPI].[GenP_MdtMandat] ([CleMandat]),
    CONSTRAINT [U1_GenP_MdtMandataire] UNIQUE NONCLUSTERED ([CleMandat] ASC, [CleMandataire] ASC, [CleSociete] ASC, [CleSecteur] ASC, [CleService] ASC)
);

