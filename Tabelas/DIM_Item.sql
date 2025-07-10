CREATE TABLE [dbo].[DIM_Item]
(
    [id] NVARCHAR(50) NOT NULL PRIMARY KEY,
    [order_id] NVARCHAR(50) NULL,
    [product_id] NVARCHAR(50) NULL,
    [quantity] INT NULL,
    [total_price] MONEY NULL,
    CONSTRAINT [FK_DIM_Item_FATO_Ordem] FOREIGN KEY ([order_id]) REFERENCES [FATO_Ordem] ([id]),
    CONSTRAINT [FK_DIM_Item_DIM_Produto] FOREIGN KEY ([product_id]) REFERENCES [DIM_Produto] ([id])
);