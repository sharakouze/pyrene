CREATE TABLE [SA_TMPI].[LmsP_TbxTable] (
    [CleTable]        SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CodTable]        VARCHAR (50)   NOT NULL,
    [LibTable]        VARCHAR (200)  NOT NULL,
    [TxtTable]        VARCHAR (200)  NULL,
    [NomTable]        VARCHAR (50)   NOT NULL,
    [DatCreation]     SMALLDATETIME  NULL,
    [CleCreateur]     SMALLINT       NULL,
    [DatModification] SMALLDATETIME  NULL,
    [CleOperateur]    SMALLINT       NULL,
    [DatValidation]   SMALLDATETIME  NULL,
    [CleValideur]     SMALLINT       NULL,
    [CleExterne]      SMALLINT       NULL,
    [NomFichier]      VARCHAR (200)  NULL,
    [NomIndex]        VARCHAR (50)   NULL,
    [TypTable]        TINYINT        NULL,
    [TxtRequete]      VARCHAR (2000) NULL,
    CONSTRAINT [PK_LmsP_TbxTable] PRIMARY KEY CLUSTERED ([CleTable] ASC),
    CONSTRAINT [UN_LmsP_TbxTable] UNIQUE NONCLUSTERED ([CodTable] ASC)
);

