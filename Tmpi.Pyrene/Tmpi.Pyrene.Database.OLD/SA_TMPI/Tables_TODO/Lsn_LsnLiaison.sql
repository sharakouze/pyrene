CREATE TABLE [SA_TMPI].[Lsn_LsnLiaison] (
    [CleLiaison]   SMALLINT IDENTITY (1, 1) NOT NULL,
    [CleMLiaison]  SMALLINT NOT NULL,
    [DatLiaison]   DATETIME CONSTRAINT [DF_Lsn_LsnLiaison_DatLiaison] DEFAULT (getdate()) NOT NULL,
    [NbrRelance]   TINYINT  CONSTRAINT [DF_Lsn_LsnLiaison_NbrRelance] DEFAULT ((0)) NOT NULL,
    [StaLiaison]   TINYINT  CONSTRAINT [DF_Lsn_LsnLiaison_StaLiaison] DEFAULT ((0)) NOT NULL,
    [CleOperateur] SMALLINT NOT NULL,
    CONSTRAINT [PK_Lsn_LsnLiaison] PRIMARY KEY CLUSTERED ([CleLiaison] ASC)
);

