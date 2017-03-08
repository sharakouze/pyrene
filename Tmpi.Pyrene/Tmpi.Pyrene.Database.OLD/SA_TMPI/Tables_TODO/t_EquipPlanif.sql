CREATE TABLE [SA_TMPI].[t_EquipPlanif] (
    [CleEquipPlanif] INT           IDENTITY (1, 1) NOT NULL,
    [DatSaisie]      DATETIME      NOT NULL,
    [CleOperateur]   SMALLINT      NOT NULL,
    [TxtPlanif]      VARCHAR (255) NULL
);

