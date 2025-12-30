Resumo – DBDesigner: Modelagem e Implementação de Banco de Dados
O que é o DBDesigner

O DBDesigner 4 é uma ferramenta CASE (Computer-Aided Software Engineering) gratuita, distribuída sob licença GPL, voltada para modelagem visual de bancos de dados. Ele permite criar, documentar, implementar e manter modelos de dados em um único ambiente, com forte foco em bancos como MySQL, Oracle, SQL Server e PostgreSQL.

Apesar de não receber atualizações frequentes, ainda é amplamente utilizado devido à sua simplicidade, boa documentação e grande base de usuários.

Principais funcionalidades

Modelagem gráfica de tabelas e relacionamentos

Geração automática de scripts SQL

Exportação do modelo como imagem

Sincronização do modelo com o banco de dados

Suporte a diferentes tipos de relacionamento (1:1, 1:N, N:M)

Definição visual de chaves primárias e estrangeiras

Instalação

Windows: instalação via assistente gráfico (escolha de idioma, licença GPL, diretório, atalhos).

Linux: basta descompactar o arquivo e executar o binário via terminal.

💡 Dica: no Linux, não há instalador gráfico — a execução é direta.

Conceitos de modelagem usados

O DBDesigner trabalha principalmente com Modelo Conceitual e Modelo Lógico:

Modelo Conceitual

Independente de SGBD

Focado no negócio

Usado para comunicação com clientes

Modelo Lógico

Considera chaves primárias, estrangeiras, normalização e integridade referencial

Serve como base para a implementação no banco

⚠️ Importante: o DBDesigner não normaliza automaticamente. O modelo conceitual já deve estar correto.

Derivação de relacionamentos (exemplos)

1:1 → chave primária de uma tabela vira chave estrangeira na outra

1:N → chave da tabela “1” vira chave estrangeira na tabela “N”

N:M → o DBDesigner cria automaticamente uma tabela associativa

Generalização/Especialização → relacionamento 1:N

Relacionamentos com atributos

1:1 e 1:N: atributos devem ser tratados antes

N:M: atributos podem ser adicionados diretamente

Uso da ferramenta (passo a passo resumido)

Criar tabelas pela paleta de ferramentas

Configurar:

Nome da tabela

Colunas e tipos de dados (INTEGER, VARCHAR, FLOAT, etc.)

Restrições:

NN (Not Null)

AI (Auto Increment)

Valor padrão e comentários

💡 Dica: a primeira coluna criada vira automaticamente a chave primária.

Relacionamentos

Criados visualmente (1:N, 1:1, N:M)

O DBDesigner exige nomear cada relacionamento

Em alguns casos, o tipo do relacionamento precisa ser ajustado manualmente no Relation Editor

⚠️ Atenção especial aos relacionamentos 1:1, pois o DBDesigner pode interpretá-los como 1:N.

Exportações disponíveis

Imagem do modelo (PNG ou BMP)

PNG: menor tamanho, sem perda de qualidade, suporta transparência

BMP: sem compressão, alta qualidade, arquivos grandes

Script SQL

Pode ser copiado ou salvo em arquivo

Permite criar o banco diretamente no SGBD

📌 Exemplo: criação automática de tabelas CLIENTE e EMPRESA com chave estrangeira.

Integração com MySQL

É possível:

Exportar o script SQL e executá-lo manualmente

Conectar diretamente ao banco via DBDesigner

Problema comum

O DBDesigner não é compatível nativamente com MySQL 5 ou superior, devido a mudanças no método de autenticação.

✅ Solução: redefinir a senha do usuário usando o método antigo (OLD_PASSWORD).

Conclusão

O DBDesigner é uma ferramenta poderosa para aprendizado e projetos de pequeno e médio porte, especialmente na fase de modelagem visual. Apesar das limitações com versões mais novas de bancos de dados, continua sendo útil para entender conceitos de modelagem conceitual, lógica e geração de SQL, além de facilitar a documentação do banco.