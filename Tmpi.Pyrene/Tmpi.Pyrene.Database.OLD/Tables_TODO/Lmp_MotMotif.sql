﻿CREATE TABLE [SA_TMPI].[Lmp_MotMotif] (
    [CleSecteur]         SMALLINT       NULL,
    [CleMotif]           SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleMotif_C]         SMALLINT       NULL,
    [CleMotif_H]         SMALLINT       NOT NULL,
    [CodMotif]           VARCHAR (100)  NOT NULL,
    [LibMotif]           VARCHAR (100)  NOT NULL,
    [TxtMotif]           VARCHAR (255)  NULL,
    [EstActif]           BIT            CONSTRAINT [DF_Lmp_MotMotif_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]        SMALLDATETIME  CONSTRAINT [DF_Lmp_MotMotif_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]        SMALLINT       CONSTRAINT [DF_Lmp_MotMotif_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]           SMALLDATETIME  NULL,
    [CleOperateur]       SMALLINT       NULL,
    [DatValidation]      DATETIME       NULL,
    [CleValideur]        SMALLINT       NULL,
    [CleExterne]         INT            NULL,
    [CleOrigine]         INT            NULL,
    [CleService]         SMALLINT       NULL,
    [CleMNumero_D]       SMALLINT       NULL,
    [CleMNumero_E]       SMALLINT       NULL,
    [CleReferentiel]     SMALLINT       NULL,
    [CleMValidation]     SMALLINT       NULL,
    [CleTarifReference]  SMALLINT       NULL,
    [CleTarifMetier]     SMALLINT       NULL,
    [CleSpecification]   SMALLINT       NULL,
    [TauTVAReference]    DECIMAL (5, 2) CONSTRAINT [DF_Lmp_MotMotif_TauTva] DEFAULT ((0)) NULL,
    [EstImpressionAuto]  BIT            CONSTRAINT [DF_Lmp_MotMotif_EstImpressionAuto] DEFAULT ((1)) NOT NULL,
    [EstFacturationAuto] BIT            CONSTRAINT [DF_Lmp_MotMotif_EstFacturationAuto] DEFAULT ((1)) NOT NULL,
    [TypValidation]      SMALLINT       NULL,
    [TypInterpretation]  SMALLINT       NULL,
    CONSTRAINT [PK_Lmp_MotMotif] PRIMARY KEY CLUSTERED ([CleMotif] ASC),
    CONSTRAINT [FK1_Lmp_SpcSpecification] FOREIGN KEY ([CleSecteur]) REFERENCES [SA_TMPI].[Gen_SocSecteur] ([CleSecteur]),
    CONSTRAINT [FK2_Lmp_SpcSpecification] FOREIGN KEY ([CleService]) REFERENCES [SA_TMPI].[Gen_SocService] ([CleService]),
    CONSTRAINT [FK3_LmP_MotMotif] FOREIGN KEY ([CleMNumero_D]) REFERENCES [SA_TMPI].[Gen_Cpt_MNumero] ([CleMNumero]),
    CONSTRAINT [FK3_Lmp_SpcSpecification] FOREIGN KEY ([CleSpecification]) REFERENCES [SA_TMPI].[Lmp_SpcSpecification] ([CleSpecification]),
    CONSTRAINT [FK4_LmP_MotMotif] FOREIGN KEY ([CleMNumero_E]) REFERENCES [SA_TMPI].[Gen_Cpt_MNumero] ([CleMNumero]),
    CONSTRAINT [UN_Lmp_MotMotif] UNIQUE NONCLUSTERED ([CodMotif] ASC)
);

