﻿CREATE TABLE [SA_TMPI].[Lmp_SpcParametre] (
    [CleSpcParametre]   INT             IDENTITY (1, 1) NOT NULL,
    [CleSpecification]  SMALLINT        NULL,
    [CleGroupeP]        SMALLINT        NULL,
    [CleMatrice]        SMALLINT        NULL,
    [CleParametre]      INT             NOT NULL,
    [ValCoefficient]    INT             NULL,
    [TxtLimite]         VARCHAR (255)   NULL,
    [ValOperateur1]     VARCHAR (2)     NULL,
    [ValBorne1]         DECIMAL (15, 3) NULL,
    [ValOperateur2]     VARCHAR (2)     NULL,
    [ValBorne2]         DECIMAL (15, 3) NULL,
    [ValOperateur3]     VARCHAR (2)     NULL,
    [ValBorne3]         DECIMAL (15, 3) NULL,
    [CleInterpretation] SMALLINT        NULL,
    [EstACompiler]      BIT             CONSTRAINT [DF_Lmp_SpcParametre_EstACompiler] DEFAULT ((1)) NOT NULL,
    [TypLecture]        SMALLINT        NULL,
    [ValC]              TINYINT         NULL,
    [ValN]              TINYINT         NULL,
    CONSTRAINT [PK_Lmp_SpcParametre] PRIMARY KEY CLUSTERED ([CleSpcParametre] ASC),
    CONSTRAINT [FK1_Lmp_SpcParametre] FOREIGN KEY ([CleSpecification]) REFERENCES [SA_TMPI].[Lmp_SpcSpecification] ([CleSpecification]),
    CONSTRAINT [FK2_Lmp_SpcParametre] FOREIGN KEY ([CleGroupeP]) REFERENCES [SA_TMPI].[Lmp_GrpGroupeP] ([CleGroupeP]),
    CONSTRAINT [FK3_Lmp_SpcParametre] FOREIGN KEY ([CleMatrice]) REFERENCES [SA_TMPI].[Lmp_MatMatrice] ([CleMatrice]),
    CONSTRAINT [FK4_Lmp_SpcParametre] FOREIGN KEY ([CleParametre]) REFERENCES [SA_TMPI].[Lmp_ParParametre] ([CleParametre]),
    CONSTRAINT [FK5_Lmp_SpcParametre] FOREIGN KEY ([CleInterpretation]) REFERENCES [SA_TMPI].[Lmp_Spc_Interpretation] ([CleInterpretation]),
    CONSTRAINT [UN_Lmp_SpcParametre] UNIQUE NONCLUSTERED ([CleSpecification] ASC, [CleGroupeP] ASC, [CleMatrice] ASC, [CleParametre] ASC)
);

