CREATE TABLE [SA_TMPI].[Bud_EngageLig] (
    [CleEngage]     INT             NOT NULL,
    [CleEngageLig]  INT             IDENTITY (1, 1) NOT NULL,
    [CleImput]      SMALLINT        NULL,
    [CleNomenc]     SMALLINT        NULL,
    [TauTVA]        DECIMAL (5, 2)  NOT NULL,
    [MntPrevu]      DECIMAL (15, 2) NOT NULL,
    [MntRealise]    DECIMAL (15, 2) NOT NULL,
    [MntFacture]    DECIMAL (15, 2) NOT NULL,
    [MntHT]         DECIMAL (15, 2) NOT NULL,
    [MntTTC]        DECIMAL (15, 2) NOT NULL,
    [TauRecup]      DECIMAL (5, 2)  NOT NULL,
    [MntRealise_HT] DECIMAL (15, 2) NULL,
    CONSTRAINT [PK_Bud_EngageLig] PRIMARY KEY CLUSTERED ([CleEngageLig] ASC),
    CONSTRAINT [FK1_Bud_EngageLig] FOREIGN KEY ([CleEngage]) REFERENCES [SA_TMPI].[t_Engage] ([CleEngage]),
    CONSTRAINT [UN1_Bud_EngageLig] UNIQUE NONCLUSTERED ([CleEngage] ASC, [CleImput] ASC, [CleNomenc] ASC, [TauTVA] ASC)
);

