CREATE TABLE [SA_TMPI].[Sdr_Lms_DosEchant] (
    [CleDosEchant]     INT           IDENTITY (1, 1) NOT NULL,
    [NumDossier]       VARCHAR (100) NOT NULL,
    [NumPrelevement]   VARCHAR (25)  NOT NULL,
    [NumOrdre]         SMALLINT      NOT NULL,
    [NumEchantInt]     VARCHAR (50)  NOT NULL,
    [NumEtiquette]     VARCHAR (50)  NULL,
    [TxtEchant]        VARCHAR (255) NULL,
    [CompletEchant]    TINYINT       NOT NULL,
    [TypIdentPointP]   VARCHAR (10)  NULL,
    [NumPointP]        VARCHAR (25)  NULL,
    [NomPointP]        VARCHAR (100) NULL,
    [TypIdentPointS]   VARCHAR (10)  NULL,
    [NumPointS]        VARCHAR (25)  NULL,
    [NomPointS]        VARCHAR (100) NULL,
    [DatPrelevement]   SMALLDATETIME NOT NULL,
    [CodMatricePrelev] VARCHAR (50)  NULL,
    [CodNature]        VARCHAR (50)  NULL,
    [CodUsage]         VARCHAR (50)  NULL,
    [CodNorme]         VARCHAR (50)  NULL,
    [CleExterne]       INT           NULL,
    [CleOrigine]       INT           NULL
);

