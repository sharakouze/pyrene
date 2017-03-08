CREATE TABLE [SA_TMPI].[Gen_SocSrvAffectation] (
    [CleService]     SMALLINT NOT NULL,
    [CleAffectation] SMALLINT NOT NULL,
    CONSTRAINT [PK_Gn_SocSrvAffectation] PRIMARY KEY CLUSTERED ([CleService] ASC, [CleAffectation] ASC),
    CONSTRAINT [FK1_Gn_SocSrvAffectation] FOREIGN KEY ([CleService]) REFERENCES [SA_TMPI].[Gen_SocService] ([CleService]),
    CONSTRAINT [FK2_Gn_SocSrvAffectation] FOREIGN KEY ([CleAffectation]) REFERENCES [SA_TMPI].[t_BudAffect] ([CleAffect])
);

