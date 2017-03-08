CREATE TABLE [SA_TMPI].[EdiP_ParParametre] (
    [CleParametre]   INT            IDENTITY (1, 1) NOT NULL,
    [TypReferentiel] TINYINT        NOT NULL,
    [CodParametre]   VARCHAR (50)   NOT NULL,
    [LibParametre]   VARCHAR (255)  NOT NULL,
    [TxtParametre]   VARCHAR (2000) NULL,
    [CleFamille]     INT            NULL,
    [CleAnalyte]     INT            NOT NULL,
    [CleMethode]     INT            NOT NULL,
    [EstCalcule]     BIT            NOT NULL,
    [EstActif]       BIT            CONSTRAINT [DF_EdiP_ParParametre_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]    SMALLDATETIME  CONSTRAINT [DF_EdiP_ParParametre_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]    SMALLINT       NOT NULL,
    [DatModif]       SMALLDATETIME  NULL,
    [CleOperateur]   SMALLINT       NULL,
    CONSTRAINT [PK_EdiP_ParParametre] PRIMARY KEY CLUSTERED ([CleParametre] ASC),
    CONSTRAINT [UN_EdiP_ParParametre] UNIQUE NONCLUSTERED ([TypReferentiel] ASC, [CodParametre] ASC, [CleAnalyte] ASC, [CleMethode] ASC)
);

