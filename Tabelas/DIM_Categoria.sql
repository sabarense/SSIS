CREATE TABLE [dbo].[DIM_Categoria]
(
	[id] NVARCHAR(50) NOT NULL PRIMARY KEY,
    [name] NVARCHAR(255) NULL
	-- CONSTRAINT [FK_DIM_Categoria_DIM_Produto] FOREIGN KEY (id) REFERENCES [DIM_Produto] ([id])
)
