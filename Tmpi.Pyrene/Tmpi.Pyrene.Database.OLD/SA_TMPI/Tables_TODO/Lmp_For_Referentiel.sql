CREATE TABLE [SA_TMPI].[Lmp_For_Referentiel] (
    [CleReferentiel]   SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleReferentiel_C] SMALLINT       NULL,
    [CleReferentiel_H] SMALLINT       NOT NULL,
    [CodReferentiel]   VARCHAR (50)   NOT NULL,
    [LibReferentiel]   VARCHAR (200)  NOT NULL,
    [TxtReferentiel]   VARCHAR (1000) NULL,
    [EstActif]         BIT            CONSTRAINT [DF_Lmp_For_Referentiel_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]      SMALLDATETIME  CONSTRAINT [DF_Lmp_For_Referentiel_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]      SMALLINT       CONSTRAINT [DF_Lmp_For_Referentiel_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]         SMALLDATETIME  NULL,
    [CleOperateur]     SMALLINT       NULL,
    [DatValidation]    SMALLDATETIME  NULL,
    [CleValideur]      SMALLINT       NULL,
    [CleOrigine]       TINYINT        NULL,
    [CleExterne]       INT            NULL,
    CONSTRAINT [PK_Lmp_For_Referentiel] PRIMARY KEY CLUSTERED ([CleReferentiel] ASC),
    CONSTRAINT [UN_Lmp_For_Referentiel] UNIQUE NONCLUSTERED ([CleReferentiel_H] ASC, [CodReferentiel] ASC)
);

