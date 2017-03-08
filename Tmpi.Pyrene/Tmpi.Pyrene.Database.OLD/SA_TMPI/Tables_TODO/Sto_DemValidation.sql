CREATE TABLE [SA_TMPI].[Sto_DemValidation] (
    [CleDemande]    INT            NOT NULL,
    [CleMandat]     INT            NOT NULL,
    [NumMandataire] TINYINT        NULL,
    [CleMandataire] INT            NULL,
    [TxtMandataire] VARCHAR (4000) NULL,
    [DatValiDation] SMALLDATETIME  NULL
);


GO
CREATE NONCLUSTERED INDEX [ID1_Sto_DemValidation]
    ON [SA_TMPI].[Sto_DemValidation]([CleDemande] ASC);

