CREATE TABLE [SA_TMPI].[SAV_Trp_Pnt_PrfContrainte] (
    [CleProfil]        SMALLINT      NOT NULL,
    [ClePrfContrainte] INT           IDENTITY (1, 1) NOT NULL,
    [TypContrainte]    TINYINT       NOT NULL,
    [TypDate]          TINYINT       NOT NULL,
    [NumJour]          TINYINT       NOT NULL,
    [NumMois]          TINYINT       NOT NULL,
    [DatDebut]         SMALLDATETIME NULL,
    [DatFin]           DATETIME      NULL,
    [TypHeure]         TINYINT       NOT NULL,
    [HeuDebut]         SMALLINT      NULL,
    [HeuFin]           SMALLINT      NULL
);

