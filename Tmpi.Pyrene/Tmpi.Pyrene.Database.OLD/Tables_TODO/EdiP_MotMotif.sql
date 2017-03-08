CREATE TABLE [SA_TMPI].[EdiP_MotMotif] (
    [CleMotif]       INT            IDENTITY (1, 1) NOT NULL,
    [TypReferentiel] TINYINT        NOT NULL,
    [CodMotif]       VARCHAR (50)   NOT NULL,
    [LibMotif]       VARCHAR (255)  NOT NULL,
    [TxtMotif]       VARCHAR (2000) NULL,
    [CleSI]          INT            NOT NULL,
    [EstActif]       BIT            CONSTRAINT [DF_EdiP_MotMotif_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]    SMALLDATETIME  CONSTRAINT [DF_EdiP_MotMotif_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]    SMALLINT       NOT NULL,
    [DatModif]       SMALLDATETIME  NULL,
    [CleOperateur]   SMALLINT       NULL,
    CONSTRAINT [PK_EdiP_MotMotif] PRIMARY KEY CLUSTERED ([CleMotif] ASC),
    CONSTRAINT [UN_EdiP_MotMotif] UNIQUE NONCLUSTERED ([TypReferentiel] ASC, [CodMotif] ASC, [CleSI] ASC)
);

