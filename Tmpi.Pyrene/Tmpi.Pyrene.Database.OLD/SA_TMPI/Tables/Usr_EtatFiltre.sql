CREATE TABLE [SA_TMPI].[Usr_EtatFiltre] (
    [CleOperateur] SMALLINT      NOT NULL,
    [CleEtat]      SMALLINT      NOT NULL,
    [CleFiltre]    SMALLINT      NOT NULL,
    [ValFiltre1]   VARCHAR (255) NULL
);


GO
CREATE NONCLUSTERED INDEX [ID1_Usr_EtatFiltre]
    ON [SA_TMPI].[Usr_EtatFiltre]([CleOperateur] ASC, [CleEtat] ASC);

