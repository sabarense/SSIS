CREATE TABLE [dbo].[DIM_Produto]
(
    [id] NVARCHAR(50) NOT NULL PRIMARY KEY,
    [name] NVARCHAR(255) NULL,
    [price] MONEY NULL,
    [id_category] NVARCHAR(50) NULL,
    CONSTRAINT [FK_DIM_Produto_DIM_Categoria] FOREIGN KEY ([id_category]) REFERENCES [DIM_Categoria] ([id])
);