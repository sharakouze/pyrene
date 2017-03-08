CREATE TABLE [SA_TMPI].[Sdr9_DemGroupe] (
    [CleDemGroupe]     INT          NOT NULL,
    [CleGroupe]        INT          NOT NULL,
    [CleEchant]        INT          NOT NULL,
    [CleDemGroupeLims] INT          NULL,
    [CodGroupe]        VARCHAR (50) NOT NULL,
    [CleGroupeS]       INT          NOT NULL,
    [CleGroupeT]       INT          NOT NULL,
    [CleDemande]       INT          NULL,
    CONSTRAINT [PK_Sdr9_DemGroupe] PRIMARY KEY CLUSTERED ([CleDemGroupe] ASC),
    CONSTRAINT [UN_Sdr9_DemGroupe] UNIQUE NONCLUSTERED ([CleEchant] ASC, [CleGroupe] ASC)
);

