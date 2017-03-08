CREATE TABLE [SA_TMPI].[u_CompteurVal] (
    [CleExercice] TINYINT  NOT NULL,
    [CleCompteur] SMALLINT NOT NULL,
    [ValCompteur] INT      NOT NULL,
    CONSTRAINT [PK_CompteurVal] PRIMARY KEY CLUSTERED ([CleCompteur] ASC, [CleExercice] ASC)
);

