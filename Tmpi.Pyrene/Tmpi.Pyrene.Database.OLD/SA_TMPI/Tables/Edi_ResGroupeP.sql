CREATE TABLE [SA_TMPI].[Edi_ResGroupeP] (
    [CleDossier]            INT      NOT NULL,
    [CleDosEchantillon]     INT      NOT NULL,
    [CleGroupeP]            SMALLINT NOT NULL,
    [CleGroupeP_Ref]        INT      NULL,
    [CleInterpretation]     SMALLINT NULL,
    [CleInterpretation_Ref] INT      NULL,
    [EstComplet]            BIT      NOT NULL,
    CONSTRAINT [PK_Edi_ResGroupeP] PRIMARY KEY CLUSTERED ([CleDossier] ASC, [CleDosEchantillon] ASC, [CleGroupeP] ASC)
);

