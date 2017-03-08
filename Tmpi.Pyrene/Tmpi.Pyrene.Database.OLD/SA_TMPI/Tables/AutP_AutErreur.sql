CREATE TABLE [SA_TMPI].[AutP_AutErreur] (
    [CleAutomate]     SMALLINT      NOT NULL,
    [CleAutErreur]    INT           IDENTITY (1, 1) NOT NULL,
    [CodErreur]       VARCHAR (50)  NOT NULL,
    [LibErreur]       VARCHAR (200) NOT NULL,
    [NivGravite]      TINYINT       CONSTRAINT [DF_AutP_AutErreur_NivGravite] DEFAULT ((0)) NOT NULL,
    [CleCauseNA_LIMS] SMALLINT      NULL,
    CONSTRAINT [PK_AutP_AutErreur] PRIMARY KEY CLUSTERED ([CleAutErreur] ASC),
    CONSTRAINT [UN_AutP_AutErreur] UNIQUE NONCLUSTERED ([CleAutomate] ASC, [CodErreur] ASC)
);

