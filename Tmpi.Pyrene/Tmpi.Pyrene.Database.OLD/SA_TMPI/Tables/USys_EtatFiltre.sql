CREATE TABLE [SA_TMPI].[USys_EtatFiltre] (
    [CleEtat]   SMALLINT      NOT NULL,
    [NumOrdre]  TINYINT       NOT NULL,
    [CleFiltre] SMALLINT      NOT NULL,
    [LibFiltre] VARCHAR (50)  NOT NULL,
    [TypFiltre] TINYINT       NOT NULL,
    [TxtFiltre] VARCHAR (255) NOT NULL,
    [TxtSelect] VARCHAR (255) NULL,
    CONSTRAINT [PK_USys_EtatFiltre] PRIMARY KEY CLUSTERED ([CleEtat] ASC, [NumOrdre] ASC)
);

