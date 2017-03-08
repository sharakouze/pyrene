CREATE TABLE [SA_TMPI].[Sdr9_DemInterv] (
    [CleDemInterv]    INT           NOT NULL,
    [CleIntervS]      INT           NOT NULL,
    [CleIntervT]      INT           NOT NULL,
    [CodInterv]       VARCHAR (50)  NOT NULL,
    [LibInterv]       VARCHAR (255) NOT NULL,
    [CodTypIdent]     VARCHAR (25)  NOT NULL,
    [NumTypIdent]     VARCHAR (50)  NOT NULL,
    [CleDemande]      INT           NOT NULL,
    [EstDestinataire] BIT           NULL,
    CONSTRAINT [PK_Sdr9_DemInterv] PRIMARY KEY CLUSTERED ([CleDemInterv] ASC)
);

