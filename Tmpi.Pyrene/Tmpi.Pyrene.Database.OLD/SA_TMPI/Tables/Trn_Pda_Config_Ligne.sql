CREATE TABLE [SA_TMPI].[Trn_Pda_Config_Ligne] (
    [CleConfig]         INT            NULL,
    [CleConfigLigne]    INT            IDENTITY (1, 1) NOT NULL,
    [CodParametre]      NVARCHAR (50)  NOT NULL,
    [LibParametre]      NVARCHAR (100) NOT NULL,
    [TxtParametre]      NVARCHAR (255) NULL,
    [IndActif]          BIT            NULL,
    [NumOrdre]          INT            NULL,
    [CleTypDonnee]      INT            NULL,
    [LibFrmSaisie]      VARCHAR (50)   NULL,
    [IndEstObligatoire] BIT            NULL,
    [DatModif]          DATETIME       NOT NULL,
    [CleOperateur]      INT            NULL,
    [DatValidation]     DATETIME       NULL,
    [CleValideur]       INT            NULL
);

