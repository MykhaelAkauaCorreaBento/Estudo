Resumo – CA ERWin Data Modeler: Modelagem de Dados com ERWin

A modelagem de dados é a base de qualquer sistema que utilize banco de dados, pois define como as informações do negócio serão organizadas, armazenadas e acessadas. Um modelo mal construído compromete todo o sistema; um bom modelo garante consistência, desempenho e facilidade de evolução.

O artigo apresenta o processo de modelagem de dados, desde a fase conceitual até a física, utilizando a ferramenta CA ERWin Data Modeler, um CASE amplamente usado no mercado.

Importância da Modelagem de Dados

Organiza o pensamento sobre os dados do negócio.

Cria um elo entre necessidades dos usuários e a solução de software.

Reduz redundância, inconsistências e retrabalho.

Serve como documentação técnica do sistema.

A modelagem segue o Modelo Entidade-Relacionamento (MER), proposto por Peter Chen (1976), amplamente adotado em projetos de banco de dados.

Etapas de um Projeto de Sistema
1. Análise de Requisitos

Levantamento detalhado das necessidades do cliente.

Define funcionalidades e dados que o sistema deve armazenar.

Deve ser documentada e validada pelo usuário.

2. Modelo Conceitual (Independente de SGBD)

Representa o negócio de forma abstrata.

Define entidades, atributos e relacionamentos.

Não depende do banco de dados escolhido.

3. Modelo Físico (Dependente de SGBD)

Considera regras específicas do banco (Oracle, DB2, SQL Server etc.).

Define tipos de dados, tamanhos, chaves, armazenamento e restrições.

Pode ser gerado automaticamente pelo ERWin.

Modelo Conceitual: Conceitos Fundamentais
Entidades

São conjuntos de objetos do mundo real sobre os quais se deseja armazenar dados.

Exemplo:

EMPREGADO

DEPARTAMENTO

PROJETO

Atributos

São características das entidades.

Exemplo (EMPREGADO):

CPF

Nome

Idade

Salário

Status (ativo, demitido, férias)

Relacionamentos

Representam como as entidades se conectam, evitando duplicação de dados.

Exemplos:

EMPREGADO pertence a DEPARTAMENTO

DEPARTAMENTO possui vários PROJETOS

PROJETO envolve vários EMPREGADOS

Modelo Físico

Gerado a partir do modelo lógico.

Implementado por meio de scripts DDL (CREATE TABLE, PK, FK).

Deve respeitar as regras do SGBD escolhido.

Inclui:

Chaves primárias (unicidade)

Chaves estrangeiras (integridade referencial)

Restrições CHECK (domínio de valores)

Dica importante:
Escolher corretamente o banco de dados é essencial, pois volume de dados, número de transações e desempenho impactam diretamente o sistema.

ERWin Data Modeler

O ERWin é uma ferramenta gráfica que:

Permite criar modelos lógicos e físicos.

Gera scripts para diversos bancos de dados.

Suporta engenharia reversa (modelo a partir de um banco existente).

Facilita colaboração entre áreas técnicas e administrativas.

Principais recursos:

Visualização clara das estruturas de dados.

Geração automática de tabelas e relacionamentos.

Comparação entre modelo e banco.

Suporte a múltiplos SGBDs (Oracle, DB2, MySQL, SQL Server, etc.).

Criação automática de tabelas associativas (N:N).

Estudo de Caso (Exemplo Prático)

O artigo apresenta um sistema fictício para definir a melhor combinação entre:

Hardware

Sistema Operacional

Banco de Dados

Projetos

Requisitos:

Cadastros de SO, BD, fabricantes, máquinas e projetos.

Relatórios e consultas online.

Avaliação de custo, desempenho e escalabilidade.

Modelo Lógico

Entidades principais:

FABRICANTE

SISTEMA_OPERACIONAL

BANCO_DADOS

MAQUINA

PROJETO

Relacionamentos:

Fabricantes produzem hardware e software.

Projetos são executados em máquinas.

Máquinas possuem SO e banco de dados.

Geração do Modelo Físico

ERWin converte o modelo lógico para físico com base no banco escolhido.

Permite mudar o banco alvo (ex.: Oracle → DB2).

Gera scripts automaticamente (Forward Engineering).

Boas práticas antes da geração:

Planejar espaço de armazenamento.

Criar usuários e permissões.

Verificar rede, segurança e performance.

Garantir atualizações do sistema e do banco.

Considerações Finais

Uma boa modelagem reduz a complexidade do sistema.

Evita manutenções caras após a entrada em produção.

Facilita migração entre bancos de dados.

Tem papel estratégico na governança de dados e na tomada de decisão gerencial.

Conclusão:
Modelar dados corretamente não é apenas uma etapa técnica, mas uma atividade essencial para a sustentabilidade, qualidade e sucesso dos sistemas de informação dentro de uma organização.