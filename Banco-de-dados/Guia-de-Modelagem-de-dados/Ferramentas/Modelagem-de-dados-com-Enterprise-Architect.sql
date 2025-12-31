Resumo – Modelagem de Dados com Enterprise Architect (EA)

O Enterprise Architect (EA) é uma ferramenta CASE usada para criar, manter e documentar modelos de dados, auxiliando analistas de sistemas e administradores de dados (DBAs). O artigo apresenta seus conceitos básicos, exemplos práticos e recursos como modelagem física, engenharia reversa, geração de scripts DDL, comparação de modelos e documentação.

Contexto e Importância

Com a evolução dos sistemas de informação (como ERP e CRM), a documentação tornou-se essencial para garantir entendimento, manutenção e evolução dos sistemas. Ferramentas CASE como o EA ajudam a:

Representar corretamente o banco de dados;

Padronizar modelos;

Facilitar manutenção e comunicação entre equipes.

Introdução ao Enterprise Architect

Pode ser usado em ambiente corporativo via servidor de licenças.

Modelos podem ser armazenados em banco de dados ou versionados via SVN.

O arquivo do projeto (.eap) organiza-se em projeto → pastas → modelos.

Um mesmo projeto pode conter vários modelos de dados.

Vantagem importante:
Uma tabela criada no projeto pode ser reutilizada em diferentes diagramas, permitindo múltiplas visões (ex.: compras e vendas).

Criação do Modelo Físico (DTR)

O modelo físico (Diagrama de Tabela Relacional) representa exatamente as tabelas e relacionamentos do banco real.

Passos principais:

Criar tabelas;

Definir atributos (tipo, chave primária, nulidade);

Criar relacionamentos entre tabelas.

Exemplo prático

Sistema acadêmico:

Aluno (dados pessoais);

Histórico (notas, turma, matrícula).

Relacionamento 1:N:

Um aluno pode ter vários registros de histórico.

O EA usa a notação Crow’s Foot (“pé de galinha”) para representar cardinalidade.

Criação de Relacionamentos

Para criar um relacionamento:

Arrasta-se de uma tabela para outra;

Define-se o tipo (ex.: Association);

Configura-se a Foreign Key, ligando a chave estrangeira à Primary Key;

É possível definir on Delete e on Update para integridade referencial.

Geração de Script DDL

O EA gera automaticamente o script SQL a partir do modelo criado.

Compatível com vários SGBDs (ex.: SQL Server).

Cria:

Tabelas;

Chaves primárias;

Chaves estrangeiras;

Restrições.

Benefício:
Reduz erros manuais e acelera a criação do banco físico.

Engenharia Reversa

A engenharia reversa permite:

Criar um modelo gráfico a partir de um banco já existente;

Importar estrutura via ODBC ou script SQL.

Exemplo:

Banco AdventureWorks (SQL Server).

O EA importa tabelas, chaves e relacionamentos automaticamente.

Utilidade:
Entender bancos legados e documentar sistemas já em produção.

Comparação de Modelos

Recurso essencial para:

Comparar modelo × banco físico;

Comparar modelo × modelo;

Comparar banco × banco.

Ajuda a:

Identificar diferenças;

Evitar redundância;

Sincronizar ambientes (homologação × produção).

Geração de Documentação

A documentação traduz o modelo técnico para uma forma compreensível.

Formatos disponíveis:

PDF (RTF convertido);

HTML (ideal para intranet).

Pode-se:

Usar templates;

Inserir identidade visual;

Padronizar documentos da empresa.

Dicas Úteis no Enterprise Architect

Para melhorar a visualização e organização do modelo:

Organizar automaticamente o diagrama (Diagram Layout);

Localizar tabelas rapidamente no modelo;

Ocultar detalhes de relacionamentos e constraints;

Redimensionar tabelas automaticamente;

Alinhar relacionamentos (Auto Routing).

Esses recursos deixam o modelo mais limpo e fácil de entender.

Conclusão

O Enterprise Architect é uma ferramenta poderosa e acessível para:

Modelar bancos de dados;

Gerar scripts;

Realizar engenharia reversa;

Comparar modelos;

Criar documentação técnica.

Além da modelagem de dados, o EA pode ser usado em outras áreas da engenharia de software, tornando-se uma solução versátil. Com prática e estudo, qualquer analista pode utilizá-lo de forma eficiente.