CREATE TABLE [SA_TMPI].[USys_Lms_SttCritere] (
    [TypMStats]  TINYINT       NOT NULL,
    [TypCritere] TINYINT       NOT NULL,
    [CleCritere] SMALLINT      NOT NULL,
    [CodCritere] VARCHAR (50)  NOT NULL,
    [LibCritere] VARCHAR (100) NOT NULL,
    [FrmCritere] TINYINT       NOT NULL,
    [TxtFiltre]  VARCHAR (255) NOT NULL,
    [TxtSelect]  VARCHAR (255) NULL,
    [NivStat]    TINYINT       NOT NULL
);

