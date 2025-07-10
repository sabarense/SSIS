# E-commerce Data Warehouse

Um projeto completo de Data Warehouse para análise de dados de E-commerce, implementado com SQL Server Database Project e SSIS (SQL Server Integration Services).

## 📋 Visão Geral

Este projeto implementa uma solução de Data Warehouse para análise de dados de e-commerce, utilizando uma arquitetura dimensional (Star Schema) para otimizar consultas analíticas e relatórios de Business Intelligence.

## 🏗️ Arquitetura

### Modelo Dimensional (Star Schema)

O data warehouse foi projetado seguindo o modelo dimensional com as seguintes tabelas:

#### 📊 Tabela Fato
- **FATO_Ordem**: Tabela central contendo as transações/pedidos
  - `id`: Identificador único da ordem
  - `created_at`: Data/hora de criação
  - `customer_id`: Chave estrangeira para cliente
  - `status`: Status do pedido

#### 📈 Tabelas Dimensão
- **DIM_Cliente**: Informações dos clientes
  - Dados pessoais (nome, email, telefone)
  - Endereço completo (país, estado, rua, número)
  
- **DIM_Produto**: Catálogo de produtos
  - Nome do produto
  - Preço
  - Categoria associada
  
- **DIM_Categoria**: Categorias de produtos
  
- **DIM_Item**: Itens dos pedidos

## 🛠️ Tecnologias Utilizadas

- **SQL Server Database Project**: Controle de versão e deploy do schema
- **SSIS (SQL Server Integration Services)**: ETL para carga de dados
- **SQL Server**: Sistema de gerenciamento de banco de dados
- **Visual Studio**: IDE para desenvolvimento

## 📁 Estrutura do Projeto

```
E-commerce/
├── 📄 E-commerce.sqlproj          # Projeto SQL Server Database
├── 📁 Tabelas/                    # Scripts de criação das tabelas
│   ├── DIM_Cliente.sql
│   ├── DIM_Produto.sql
│   ├── DIM_Categoria.sql
│   ├── DIM_Item.sql
│   └── FATO_Ordem.sql
├── 📁 Carga/                      # Arquivos de dados para importação
│   ├── Clientes.csv
│   ├── Produto.xlsx
│   ├── Categoria.xlsx
│   ├── items.xlsx
│   └── Ordens.xlsx
├── 📁 Carga das tabelas de E-Commerce/  # Projeto SSIS
│   ├── Package.dtsx
│   └── Carga das tabelas de E-Commerce.dtproj
└── 📁 bin/                        # Arquivos de build e deploy
```

## 🚀 Como Usar

### Pré-requisitos

- SQL Server (2016 ou superior)
- SQL Server Data Tools (SSDT)
- SQL Server Integration Services (SSIS)
- Visual Studio 2019/2022

### 1. Deploy do Database

1. Abra o projeto `E-commerce.sqlproj` no Visual Studio
2. Configure a string de conexão no arquivo de publicação
3. Execute o build do projeto
4. Realize o deploy para o servidor SQL Server

```bash
# Via linha de comando (opcional)
SqlPackage.exe /Action:Publish /SourceFile:"bin\Debug\E-commerce.dacpac" /TargetConnectionString:"Server=<servidor>;Database=E-commerce;Integrated Security=true;"
```

### 2. Execução do ETL (SSIS)

1. Abra o projeto SSIS: `Carga das tabelas de E-Commerce.dtproj`
2. Configure as conexões com:
   - Banco de dados de destino
   - Arquivos de origem na pasta `Carga/`
3. Execute o package `Package.dtsx`

### 3. Dados de Exemplo

O projeto inclui arquivos de exemplo na pasta `Carga/`:
- **Clientes.csv**: Base de clientes
- **Produto.xlsx**: Catálogo de produtos
- **Categoria.xlsx**: Categorias dos produtos
- **items.xlsx**: Itens dos pedidos
- **Ordens.xlsx**: Pedidos realizados

## 📊 Análises Possíveis

Com este data warehouse, você pode realizar análises como:

- **Vendas por período**: Análise temporal das vendas
- **Produtos mais vendidos**: Ranking de produtos
- **Análise geográfica**: Vendas por região/estado
- **Comportamento do cliente**: Padrões de compra
- **Performance de categorias**: Análise por categoria de produto
- **Status de pedidos**: Acompanhamento do funil de vendas

## 📈 Consultas de Exemplo

```sql
-- Vendas por mês
SELECT 
    YEAR(fo.created_at) as Ano,
    MONTH(fo.created_at) as Mes,
    COUNT(*) as TotalPedidos
FROM FATO_Ordem fo
GROUP BY YEAR(fo.created_at), MONTH(fo.created_at)
ORDER BY Ano, Mes;

-- Top 10 produtos mais vendidos
SELECT TOP 10
    p.name as Produto,
    COUNT(i.id) as QuantidadeVendida
FROM DIM_Produto p
INNER JOIN DIM_Item i ON p.id = i.product_id
GROUP BY p.name
ORDER BY QuantidadeVendida DESC;

-- Vendas por estado
SELECT 
    c.state as Estado,
    COUNT(fo.id) as TotalPedidos
FROM FATO_Ordem fo
INNER JOIN DIM_Cliente c ON fo.customer_id = c.id
GROUP BY c.state
ORDER BY TotalPedidos DESC;
```

## 🔧 Manutenção

### Backup
- Configure backups regulares do banco de dados
- Mantenha versionamento dos arquivos de dados

### Monitoramento
- Monitore a execução dos packages SSIS
- Acompanhe o crescimento das tabelas
- Verifique a integridade referencial regularmente

## 📝 Próximos Passos

- [ ] Implementar procedures para cálculos agregados
- [ ] Criar views para consultas frequentes
- [ ] Adicionar índices para otimização
- [ ] Implementar particionamento por data
- [ ] Criar dashboard com Power BI/Tableau

## 🤝 Contribuições

Para contribuir com o projeto:

1. Faça um fork do repositório
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença [MIT](LICENSE).
