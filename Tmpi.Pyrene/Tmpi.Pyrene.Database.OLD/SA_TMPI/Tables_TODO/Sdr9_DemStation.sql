CREATE TABLE [SA_TMPI].[Sdr9_DemStation] (
    [CleDemStation]          INT           NOT NULL,
    [CleStationS]            INT           NOT NULL,
    [CleStationT]            INT           NOT NULL,
    [LibStation]             VARCHAR (255) NOT NULL,
    [CodTypIdent]            VARCHAR (25)  NOT NULL,
    [NumTypIdent]            VARCHAR (50)  NOT NULL,
    [CleDemande]             INT           NOT NULL,
    [TypeStationPrelevement] VARCHAR (50)  NULL,
    CONSTRAINT [PK_Sdr9_DemStation] PRIMARY KEY CLUSTERED ([CleDemStation] ASC)
);

