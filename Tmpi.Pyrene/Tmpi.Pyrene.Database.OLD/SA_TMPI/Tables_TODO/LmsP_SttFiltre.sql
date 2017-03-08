CREATE TABLE [SA_TMPI].[LmsP_SttFiltre] (
    [CleMStats]    INT           NULL,
    [NumOrdre]     TINYINT       NULL,
    [CleFiltre]    INT           IDENTITY (1, 1) NOT NULL,
    [LibFiltre]    VARCHAR (100) NULL,
    [TypFiltre]    TINYINT       NULL,
    [FrmFiltre]    TINYINT       NULL,
    [CleCritere]   INT           NULL,
    [ValOperateur] VARCHAR (50)  NULL,
    [TxtFiltre]    VARCHAR (50)  NULL,
    [TxtSelect]    VARCHAR (255) NULL,
    [IndCache]     BIT           CONSTRAINT [DF_LmsP_SttFiltre_IndCache] DEFAULT ((0)) NOT NULL,
    [ValFiltre1]   VARCHAR (255) NULL,
    [ValFiltre2]   VARCHAR (255) NULL
);

