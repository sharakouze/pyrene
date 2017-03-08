CREATE TABLE [SA_TMPI].[Gen_Trc_Objet] (
    [TypObjet] SMALLINT      NOT NULL,
    [CleObjet] INT           NOT NULL,
    [NumObjet] VARCHAR (50)  NOT NULL,
    [LibObjet] VARCHAR (400) NULL,
    CONSTRAINT [PK_Gen_Trc_Objet] PRIMARY KEY CLUSTERED ([TypObjet] ASC, [CleObjet] ASC),
    CONSTRAINT [UN_Gen_Trc_Objet] UNIQUE NONCLUSTERED ([TypObjet] ASC, [NumObjet] ASC)
);

