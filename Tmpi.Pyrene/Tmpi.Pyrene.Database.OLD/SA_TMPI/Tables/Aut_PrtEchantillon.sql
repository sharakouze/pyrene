CREATE TABLE [SA_TMPI].[Aut_PrtEchantillon] (
    [NumPortoir]        INT            NOT NULL,
    [NumEchantillon]    VARCHAR (25)   NOT NULL,
    [ClePrtEchantillon] INT            IDENTITY (1, 1) NOT NULL,
    [PosEchantillon]    TINYINT        NOT NULL,
    [NumLigne]          TINYINT        NOT NULL,
    [NumColonne]        TINYINT        NOT NULL,
    [CleDosEchantillon] INT            NULL,
    [TxtEtiquette]      VARCHAR (100)  NULL,
    [NumDemande]        VARCHAR (50)   NULL,
    [NumPreDossier]     VARCHAR (50)   NULL,
    [TxtPreDossier]     VARCHAR (2000) NULL,
    [DatDecodage]       SMALLDATETIME  CONSTRAINT [DF_Aut_PrtEchantillon_DatDecodage] DEFAULT (getdate()) NOT NULL,
    [CleProduit]        SMALLINT       NULL,
    [CleDemande]        INT            NULL,
    [NumOrdre]          SMALLINT       CONSTRAINT [DF_Aut_PrtEchantillon_NumOrdre] DEFAULT ((0)) NULL,
    [CleDossier]        INT            NULL,
    [CleErreur]         SMALLINT       NULL,
    CONSTRAINT [UN_Aut_PrtEchantillon] UNIQUE NONCLUSTERED ([NumPreDossier] ASC, [TxtEtiquette] ASC)
);

