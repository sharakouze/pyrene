CREATE TABLE [SA_TMPI].[SAV_Lmp_PrlContrainte] (
    [ClePreleveur]     SMALLINT      NOT NULL,
    [ClePrlContrainte] INT           IDENTITY (1, 1) NOT NULL,
    [TypContrainte]    TINYINT       NOT NULL,
    [TypDate]          TINYINT       NOT NULL,
    [NumJour]          TINYINT       NOT NULL,
    [DatDebut]         SMALLDATETIME NULL,
    [DatFin]           DATETIME      NULL,
    [TypHeure]         TINYINT       NOT NULL,
    [HeuDebut]         SMALLINT      NULL,
    [HeuFin]           SMALLINT      NULL
);

