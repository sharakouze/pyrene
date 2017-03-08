CREATE TABLE [SA_TMPI].[Sdr9_DemMesureEnv] (
    [CleMesureEnv]  INT             NOT NULL,
    [CleMesureEnvT] INT             NOT NULL,
    [CleDemande]    INT             NULL,
    [ClePrelev]     INT             NULL,
    [CodUnite]      VARCHAR (50)    NULL,
    [CleUniteS]     SMALLINT        NOT NULL,
    [CleUniteT]     SMALLINT        NOT NULL,
    [CodParametre]  VARCHAR (50)    NULL,
    [CleParametreS] SMALLINT        NOT NULL,
    [CleParametreT] SMALLINT        NOT NULL,
    [CodMethode]    VARCHAR (50)    NULL,
    [CleMethodeS]   SMALLINT        NOT NULL,
    [CleMethodeT]   SMALLINT        NOT NULL,
    [ValResParEnv]  DECIMAL (15, 5) NULL,
    [DatParEnv]     SMALLDATETIME   NULL,
    CONSTRAINT [PK_Sdr9_DemMesureEnv] PRIMARY KEY CLUSTERED ([CleMesureEnv] ASC)
);

