CREATE TABLE [SA_TMPI].[EdiP_GrpGroupeP] (
    [CleGroupeP]     INT            IDENTITY (1, 1) NOT NULL,
    [TypReferentiel] TINYINT        NOT NULL,
    [CodGroupeP]     VARCHAR (50)   NOT NULL,
    [LibGroupeP]     VARCHAR (255)  NOT NULL,
    [TxtGroupeP]     VARCHAR (2000) NULL,
    [CleSI]          INT            NOT NULL,
    [EstActif]       BIT            CONSTRAINT [DF_EdiP_GrpGroupeP_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]    SMALLDATETIME  CONSTRAINT [DF_EdiP_GrpGroupeP_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]    SMALLINT       NOT NULL,
    [DatModif]       SMALLDATETIME  NULL,
    [CleOperateur]   SMALLINT       NULL,
    CONSTRAINT [PK_EdiP_GrpGroupeP] PRIMARY KEY CLUSTERED ([CleGroupeP] ASC),
    CONSTRAINT [UN_EdiP_GrpGroupeP] UNIQUE NONCLUSTERED ([TypReferentiel] ASC, [CodGroupeP] ASC, [CleSI] ASC)
);

