CREATE TABLE [SA_TMPI].[Edi_ExpDemande] (
    [CleDemande]      INT           IDENTITY (1, 1) NOT NULL,
    [CleExport]       SMALLINT      NOT NULL,
    [CleObjet]        INT           NOT NULL,
    [CleDestinataire] INT           NULL,
    [DatCreation]     SMALLDATETIME NOT NULL,
    CONSTRAINT [PK_Edi_ExpDemande] PRIMARY KEY CLUSTERED ([CleDemande] ASC),
    CONSTRAINT [FK1_Edi_ExpDemande] FOREIGN KEY ([CleExport]) REFERENCES [SA_TMPI].[EdiP_ExpExport] ([CleExport])
);

