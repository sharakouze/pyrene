CREATE TABLE [SA_TMPI].[Gen_DivExercice] (
    [CleExercice]   SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleExercice_C] TINYINT       NULL,
    [CleExercice_H] TINYINT       NOT NULL,
    [CodExercice]   VARCHAR (50)  NOT NULL,
    [LibExercice]   VARCHAR (100) NOT NULL,
    [TxtExercice]   VARCHAR (255) NULL,
    [DatDebut]      SMALLDATETIME NOT NULL,
    [DatFin]        SMALLDATETIME NOT NULL,
    [NivExercice]   TINYINT       CONSTRAINT [DF_Gen_DivExercice_NivExercice] DEFAULT ((9)) NOT NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Gen_DivExercice_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Gen_DivExercice_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      CONSTRAINT [DF_Gen_DivExercice_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    [CleExterne]    INT           NULL,
    [CleOrigine]    TINYINT       NULL,
    CONSTRAINT [PK_Gen_DivExercice] PRIMARY KEY CLUSTERED ([CleExercice] ASC),
    CONSTRAINT [UN1_Gen_DivExercice] UNIQUE NONCLUSTERED ([CodExercice] ASC, [CleExercice_H] ASC)
);

