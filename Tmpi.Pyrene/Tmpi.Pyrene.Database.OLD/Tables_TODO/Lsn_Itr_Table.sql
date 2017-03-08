CREATE TABLE [SA_TMPI].[Lsn_Itr_Table] (
    [CleTable]      SMALLINT NOT NULL,
    [EstImportable] BIT      CONSTRAINT [DF_Lsn_Itr_Table_EstImportable] DEFAULT ((0)) NOT NULL,
    [CleModele_I]   SMALLINT NULL,
    [EstExportable] BIT      CONSTRAINT [DF_Lsn_Itr_Table_EstExportable] DEFAULT ((0)) NOT NULL,
    [CleModele_E]   SMALLINT NULL,
    [EstActif]      BIT      CONSTRAINT [DF_Lsn_Itr_Table_EstActif] DEFAULT ((1)) NOT NULL
);

