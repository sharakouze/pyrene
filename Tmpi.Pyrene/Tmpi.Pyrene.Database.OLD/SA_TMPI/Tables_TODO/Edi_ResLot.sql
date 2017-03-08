CREATE TABLE [SA_TMPI].[Edi_ResLot] (
    [CleDossier]            INT      NOT NULL,
    [CleGroupeP]            INT      NOT NULL,
    [NumLot]                SMALLINT NOT NULL,
    [CleInterpretation]     INT      NULL,
    [CleInterpretation_Ref] INT      NULL,
    CONSTRAINT [PK_Edi_ResLot] PRIMARY KEY CLUSTERED ([CleDossier] ASC, [CleGroupeP] ASC, [NumLot] ASC)
);

