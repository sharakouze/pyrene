CREATE TABLE [SA_TMPI].[Lms_DosSpcParametre] (
    [CleDosParametre]   INT             NOT NULL,
    [ValCoefficient]    INT             NULL,
    [ValOperateur1]     VARCHAR (2)     NOT NULL,
    [ValBorne1]         DECIMAL (15, 3) NOT NULL,
    [ValOperateur2]     VARCHAR (2)     NULL,
    [ValBorne2]         DECIMAL (15, 3) NULL,
    [ValOperateur3]     VARCHAR (2)     NULL,
    [ValBorne3]         DECIMAL (15, 3) NULL,
    [CleInterpretation] SMALLINT        NOT NULL,
    [ValC]              TINYINT         NULL,
    [ValN]              TINYINT         NULL,
    CONSTRAINT [PK_Lms_DosSpcParametre] PRIMARY KEY CLUSTERED ([CleDosParametre] ASC)
);

