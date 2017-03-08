CREATE TABLE [SA_TMPI].[Edi_ImpResultat] (
    [CleImport]      INT           NOT NULL,
    [CleLigne]       INT           NOT NULL,
    [NomChamp]       VARCHAR (100) NOT NULL,
    [ValChamp_A]     VARCHAR (255) NULL,
    [ValChamp_D]     DATETIME      NULL,
    [CleObjet1_LIMS] INT           NULL,
    [CleObjet2_LIMS] INT           NULL,
    CONSTRAINT [UN_Edi_ImpResultat] PRIMARY KEY CLUSTERED ([CleLigne] ASC, [NomChamp] ASC),
    CONSTRAINT [FK1_Edi_ImpResultat] FOREIGN KEY ([CleImport]) REFERENCES [SA_TMPI].[Edi_ImpImport] ([CleImport])
);

