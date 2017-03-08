CREATE TABLE [SA_TMPI].[Edi9_ExpDemande] (
    [CleDemande]      INT           NOT NULL,
    [CleLot]          SMALLINT      NOT NULL,
    [CleObjet]        INT           NOT NULL,
    [CleDestinataire] INT           NULL,
    [DatCreation]     SMALLDATETIME NOT NULL,
    CONSTRAINT [PK_Edi9_ExpDemande] PRIMARY KEY CLUSTERED ([CleDemande] ASC),
    CONSTRAINT [FK1_Edi9_ExpDemande] FOREIGN KEY ([CleLot]) REFERENCES [SA_TMPI].[Edi9_ExpLot] ([CleLot])
);

