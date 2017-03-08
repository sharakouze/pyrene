CREATE TABLE [SA_TMPI].[Equ_EquAffect] (
    [CleEquip]   INT            NOT NULL,
    [CleService] SMALLINT       NOT NULL,
    [TauAffect]  DECIMAL (5, 2) CONSTRAINT [DF_Equ_EquAffect_TauAffect] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Equ_EquAffect] PRIMARY KEY CLUSTERED ([CleEquip] ASC, [CleService] ASC),
    CONSTRAINT [FK1_Equ_EquAffect] FOREIGN KEY ([CleEquip]) REFERENCES [SA_TMPI].[t_Equip] ([CleEquip]),
    CONSTRAINT [FK2_Equ_EquAffect] FOREIGN KEY ([CleService]) REFERENCES [SA_TMPI].[Gen_SocService] ([CleService])
);

