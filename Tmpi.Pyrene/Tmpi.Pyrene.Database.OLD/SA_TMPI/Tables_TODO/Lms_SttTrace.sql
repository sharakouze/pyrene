CREATE TABLE [SA_TMPI].[Lms_SttTrace] (
    [CleTrace]       INT            IDENTITY (1, 1) NOT NULL,
    [TxtRequete]     VARCHAR (8000) NULL,
    [DatCreation]    SMALLDATETIME  DEFAULT (getdate()) NOT NULL,
    [NbrDossier]     INT            NULL,
    [NbrEchantillon] INT            NULL,
    [CleProfil]      INT            NOT NULL
);

