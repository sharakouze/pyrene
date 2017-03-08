CREATE TABLE [SA_TMPI].[Trn_MobLicence] (
    [CleLicence]  INT           IDENTITY (1, 1) NOT NULL,
    [NumDeviceId] VARCHAR (100) NOT NULL,
    [LibDevice]   VARCHAR (200) NULL,
    [EstActif]    BIT           NOT NULL,
    [DatCreation] DATETIME      NOT NULL,
    [DatModif]    DATETIME      NULL,
    CONSTRAINT [PK_Trn_MobLicence] PRIMARY KEY CLUSTERED ([CleLicence] ASC)
);

