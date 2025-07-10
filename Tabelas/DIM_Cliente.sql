CREATE TABLE [dbo].[DIM_Cliente]
(
	[id] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    [created_at] DATETIME NULL, 
    [first_name] NVARCHAR(255) NULL, 
    [last_name] NVARCHAR(255) NULL, 
    [email] NVARCHAR(255) NULL, 
    [cell_phone] NVARCHAR(50) NULL, 
    [country] NVARCHAR(255) NULL, 
    [state] NVARCHAR(255) NULL,
    [street] NVARCHAR(255) NULL, 
    [number] NVARCHAR(50) NULL, 
    [additionals] NVARCHAR(50) NULL, 
    -- CONSTRAINT [FK_DIM_Cliente_FATO_Ordem] FOREIGN KEY (id) REFERENCES [FATO_Ordem] ([id])
)
