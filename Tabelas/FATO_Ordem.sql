CREATE TABLE [dbo].[FATO_Ordem]
(
    [id] NVARCHAR(50) NOT NULL PRIMARY KEY,
    [created_at] DATETIME NULL,
    [customer_id] NVARCHAR(50) NULL,
    [status] NVARCHAR(255) NULL,
    CONSTRAINT [FK_FATO_Ordem_DIM_Cliente] FOREIGN KEY ([customer_id]) REFERENCES [DIM_Cliente] ([id])
);