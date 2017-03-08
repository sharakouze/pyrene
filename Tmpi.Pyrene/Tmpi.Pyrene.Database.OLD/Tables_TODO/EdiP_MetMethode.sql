CREATE TABLE [SA_TMPI].[EdiP_MetMethode] (
    [CleMethode]     INT            IDENTITY (1, 1) NOT NULL,
    [TypReferentiel] TINYINT        NOT NULL,
    [CodMethode]     VARCHAR (50)   NOT NULL,
    [LibMethode]     VARCHAR (255)  NOT NULL,
    [TxtMethode]     VARCHAR (2000) NULL,
    [CleFamille]     INT            NULL,
    [EstGenerique]   BIT            NOT NULL,
    [CleMethode_G]   INT            NULL,
    [EstActif]       BIT            CONSTRAINT [DF_EdiP_MetMethode_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]    SMALLDATETIME  CONSTRAINT [DF_EdiP_MetMethode_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]    SMALLINT       NOT NULL,
    [DatModif]       SMALLDATETIME  NULL,
    [CleOperateur]   SMALLINT       NULL,
    CONSTRAINT [PK_EdiP_MetMethode] PRIMARY KEY CLUSTERED ([CleMethode] ASC),
    CONSTRAINT [UN_EdiP_MetMethode] UNIQUE NONCLUSTERED ([TypReferentiel] ASC, [CodMethode] ASC)
);

