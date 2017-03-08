CREATE TABLE [SA_TMPI].[Aup_AutAnalyse] (
    [CleAutomate]       SMALLINT      NOT NULL,
    [CleAutAnalyse]     SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodAnalyse]        VARCHAR (100) NOT NULL,
    [LibAnalyse]        VARCHAR (200) NOT NULL,
    [ValDilution]       INT           NULL,
    [QteMinimum]        INT           NULL,
    [QteMaximum]        INT           NULL,
    [ValResultatMin]    REAL          NULL,
    [ValResultatMax]    REAL          NULL,
    [EstActif]          BIT           NULL,
    [PrfPlaque]         VARCHAR (10)  NULL,
    [LstPosTemoin]      VARCHAR (25)  NULL,
    [NbrTemoin]         TINYINT       NULL,
    [LstParametre]      VARCHAR (200) NULL,
    [EstUneCombinaison] BIT           CONSTRAINT [DF_Aup_AutAnalyse_EstUneCombinaison] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_AuP_AutAnalyse] PRIMARY KEY CLUSTERED ([CleAutAnalyse] ASC),
    CONSTRAINT [FK1_AuP_AutAnalyse] FOREIGN KEY ([CleAutomate]) REFERENCES [SA_TMPI].[Aup_AutAutomate] ([CleAutomate])
);

