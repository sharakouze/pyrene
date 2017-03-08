CREATE TABLE [SA_TMPI].[Sdr9_DemEchant] (
    [CleEchant]        INT            NOT NULL,
    [CleDemEchantLims] INT            NULL,
    [CodEchant]        VARCHAR (100)  NULL,
    [CodEchantPrel]    VARCHAR (100)  NULL,
    [CodEchantLabo]    VARCHAR (100)  NULL,
    [TxtEchant]        VARCHAR (2000) NULL,
    [EstComplet]       BIT            NULL,
    [EstAccept]        BIT            NULL,
    [DatRecept]        SMALLDATETIME  NULL,
    [HeuRecept]        SMALLDATETIME  NULL,
    [CleDemande]       INT            NULL,
    [CleLabo]          SMALLINT       NULL,
    [CleLaboT]         SMALLINT       NULL,
    [CodMethodeTrans]  VARCHAR (50)   NULL,
    [CleMethodeTransS] SMALLINT       NULL,
    [CleMethodeTransT] SMALLINT       NULL,
    [ClePayeur]        SMALLINT       NULL,
    [ClePrelev]        INT            NULL,
    [Echant_Id]        INT            NULL,
    CONSTRAINT [PK_Sdr9_DemEchant] PRIMARY KEY CLUSTERED ([CleEchant] ASC),
    CONSTRAINT [UN_Sdr9_DemEchant] UNIQUE NONCLUSTERED ([CleEchant] ASC, [CodEchant] ASC)
);

