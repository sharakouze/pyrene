CREATE TABLE [SA_TMPI].[EdiP_Trs_TypIdent] (
    [CleTypIdent]    INT            IDENTITY (1, 1) NOT NULL,
    [TypReferentiel] TINYINT        NOT NULL,
    [CodTypIdent]    VARCHAR (50)   NOT NULL,
    [LibTypIdent]    VARCHAR (255)  NOT NULL,
    [TxtTypIdent]    VARCHAR (2000) NULL,
    [CleSI]          INT            NOT NULL,
    [EstActif]       BIT            CONSTRAINT [DF_EdiP_Trs_TypIdent_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]    SMALLDATETIME  CONSTRAINT [DF_EdiP_Trs_TypIdent_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]    SMALLINT       NOT NULL,
    [DatModif]       SMALLDATETIME  NULL,
    [CleOperateur]   SMALLINT       NULL,
    CONSTRAINT [PK_EdiP_Trs_TypIdent] PRIMARY KEY CLUSTERED ([CleTypIdent] ASC),
    CONSTRAINT [UN_EdiP_Trs_TypIdent] UNIQUE NONCLUSTERED ([TypReferentiel] ASC, [CodTypIdent] ASC, [CleSI] ASC)
);

