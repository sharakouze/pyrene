CREATE TABLE [SA_TMPI].[LmsP_Vld_Competence] (
    [CleCompetence]   SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CodCompetence]   VARCHAR (50)   NOT NULL,
    [LibCompetence]   VARCHAR (200)  NOT NULL,
    [TxtCompetence]   VARCHAR (2000) NULL,
    [DatCreation]     SMALLDATETIME  NULL,
    [CleCreateur]     SMALLINT       NULL,
    [DatModification] SMALLDATETIME  NULL,
    [CleOperateur]    SMALLINT       NULL,
    [DatValidation]   SMALLDATETIME  NULL,
    [CleValideureur]  SMALLINT       NULL
);

