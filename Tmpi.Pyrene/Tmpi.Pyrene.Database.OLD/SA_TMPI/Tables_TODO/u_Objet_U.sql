CREATE TABLE [SA_TMPI].[u_Objet_U] (
    [CleLogiciel]     SMALLINT      NOT NULL,
    [CleObjet_U]      INT           IDENTITY (1, 1) NOT NULL,
    [CodObjet]        VARCHAR (50)  NOT NULL,
    [LibObjet]        VARCHAR (100) NOT NULL,
    [CleObjet_TMPI]   INT           NULL,
    [IndCommun]       BIT           CONSTRAINT [DF_u_Objet_U_IndCommun] DEFAULT ((0)) NOT NULL,
    [TypListe]        TINYINT       NULL,
    [DatModif]        DATETIME      NOT NULL,
    [CleOperateur]    SMALLINT      NOT NULL,
    [DatSauveg]       DATETIME      NULL,
    [NumVersion]      TINYINT       CONSTRAINT [DF1_u_Objet_U_NumVersion] DEFAULT ((0)) NOT NULL,
    [EstRequeteActif] BIT           CONSTRAINT [DF_u_Objet_U_EstRequeteActif] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_u_Objet_U] PRIMARY KEY CLUSTERED ([CleObjet_U] ASC),
    CONSTRAINT [UN_Objet_U] UNIQUE NONCLUSTERED ([CodObjet] ASC)
);

