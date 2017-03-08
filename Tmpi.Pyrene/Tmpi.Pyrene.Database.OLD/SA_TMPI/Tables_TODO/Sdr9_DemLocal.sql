CREATE TABLE [SA_TMPI].[Sdr9_DemLocal] (
    [CleDemLocal] INT           NOT NULL,
    [CleLocalS]   INT           NOT NULL,
    [CleLocalT]   INT           NOT NULL,
    [LibLocal]    VARCHAR (255) NOT NULL,
    [CodTypIdent] VARCHAR (25)  NOT NULL,
    [NumTypIdent] VARCHAR (50)  NOT NULL,
    [CleDemande]  INT           NOT NULL,
    CONSTRAINT [PK_Sdr9_DemLocal] PRIMARY KEY CLUSTERED ([CleDemLocal] ASC)
);

