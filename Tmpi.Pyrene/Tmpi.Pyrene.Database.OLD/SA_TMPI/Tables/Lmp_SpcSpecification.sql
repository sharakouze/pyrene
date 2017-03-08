CREATE TABLE [SA_TMPI].[Lmp_SpcSpecification] (
    [CleSociete]         SMALLINT       CONSTRAINT [DF_Lmp_SpcSpecification_CleSociete] DEFAULT ((0)) NULL,
    [CleSecteur]         SMALLINT       NULL,
    [CleService]         SMALLINT       NULL,
    [CleSpecification]   SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleSpecification_C] SMALLINT       NULL,
    [CleSpecification_H] SMALLINT       NOT NULL,
    [CodSpecification]   VARCHAR (100)  NOT NULL,
    [LibSpecification]   VARCHAR (200)  NOT NULL,
    [TxtSpecification]   VARCHAR (1000) NULL,
    [EstActif]           BIT            CONSTRAINT [DF_Lmp_SpcSpecification_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]        SMALLDATETIME  CONSTRAINT [DF_Lmp_SpcSpecification_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]        SMALLINT       CONSTRAINT [DF_Lmp_SpcSpecification_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]           SMALLDATETIME  NULL,
    [CleOperateur]       SMALLINT       NULL,
    [DatValidation]      SMALLDATETIME  NULL,
    [CleValideur]        SMALLINT       NULL,
    [CleOrigine]         TINYINT        NULL,
    [CleExterne]         INT            NULL,
    CONSTRAINT [PK_Lmp_SpcSpecification] PRIMARY KEY CLUSTERED ([CleSpecification] ASC),
    CONSTRAINT [UN_Lmp_SpcSpecification] UNIQUE NONCLUSTERED ([CodSpecification] ASC)
);

