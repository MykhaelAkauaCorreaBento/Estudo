Resumo – “Desnormalizar para Otimizar” (SQL Magazine 99)

O artigo discute a desnormalização como uma estratégia de projeto físico para melhorar o desempenho de consultas SQL, destacando seus benefícios, limitações e efeitos colaterais. O foco é mostrar que desnormalizar pode trazer ganhos relevantes de performance, mas exige avaliação cuidadosa e trade-offs conscientes.

Importância do modelo de dados

Os dados são ativos estratégicos das organizações, mas sua qualidade depende diretamente de um bom modelo de dados. Ter um SGBD relacional não garante, por si só, um modelo consistente e eficiente: isso é resultado de um projeto bem feito e bem evoluído.

O projeto de banco de dados envolve três níveis:

Conceitual

Lógico

Físico

Esses níveis buscam equilibrar duas perspectivas:

Qualidade semântica (significado correto dos dados)

Qualidade estrutural (desempenho, organização e eficiência)

A desnormalização atua principalmente sobre a qualidade estrutural, visando melhorar a performance das consultas.

Normalização (base para entender a desnormalização)

A normalização organiza os dados para:

Eliminar redundâncias

Evitar inconsistências

Facilitar manutenção e integridade

Ela é aplicada por meio das Formas Normais (1FN a 5FN e BCNF), que tratam dependências funcionais, parciais, transitivas e multivaloradas.

Benefícios da normalização

Evita:

Anomalias de inserção

Anomalias de atualização

Anomalias de exclusão

Reduz desperdício de espaço

Facilita manutenção e evolução do sistema

Exemplo prático

No artigo, um relatório de projetos e funcionários inicialmente poderia ser modelado em uma única tabela, mas isso causaria:

Dados repetidos

Consultas lentas

Problemas de integridade

Ao normalizar até a 3FN, os dados são distribuídos em tabelas como Projeto, Empregado e Alocação, eliminando redundâncias e anomalias.

O problema: desempenho em consultas

Embora a normalização seja excelente para transações (OLTP), ela pode ser ineficiente para consultas complexas, pois exige muitas junções (JOINs).

👉 É nesse ponto que surge a desnormalização.

Desnormalização: conceito e objetivo

A desnormalização consiste em reduzir o grau de normalização do modelo, aceitando redundância controlada para:

Diminuir o número de JOINs

Acelerar consultas críticas

Melhorar o tempo de resposta

⚠️ Em contrapartida, ela:

Reintroduz anomalias

Aumenta o uso de espaço

Exige código adicional para manter a consistência

Padrões comuns de desnormalização (com exemplos)

Agregação
Criação de dados sumarizados (ex: totais, médias).
👉 Muito usado em Data Warehouses.

Coluna derivada
Armazena resultados de cálculos para evitar processamento em tempo de consulta.

Coluna redundante
Repete uma coluna de outra tabela para evitar JOINs frequentes.
Exemplo: copiar nome do funcionário para a tabela de alocação.

Combinação de tabelas 1:1
Une duas tabelas quando ambas são obrigatórias.

Combinação em relacionamentos N:N
Une uma tabela à tabela associativa para reduzir junções.

Divisão de tabelas

Horizontal (por linhas)

Vertical (por colunas)

Grupos de repetição
Dados passam a ser colunas em vez de linhas.

Processo de avaliação da desnormalização

Antes de desnormalizar, o artigo propõe um processo em três etapas:

🔹 Etapa 1 – Identificar consultas críticas

Avaliar:

Tempo máximo aceitável

Número de JOINs

Frequência de execução

Volume de dados

🔹 Etapa 2 – Avaliar alternativas

Comparar:

Modelo normalizado

Modelo desnormalizado

Outras opções (visões materializadas, particionamento, hints)

Analisar:

Tempo de consulta

Espaço ocupado

Impacto nas atualizações

Integridade dos dados

🔹 Etapa 3 – Aplicar a solução

Implementar a desnormalização escolhida.

Exemplo comparativo (normalizado x desnormalizado)

Uma consulta envolvendo Projeto, Empregado e Alocação apresentou:

Modelo normalizado

Tempo: 12,4 segundos

Menor espaço

Consistência garantida pelo SGBD

Modelo desnormalizado

Tempo: 2,7 segundos

Mais espaço em disco

Consistência garantida por código (triggers)

👉 Resultado: grande ganho de desempenho, com custo maior de manutenção.

Implementação com refatoração

Para aplicar a desnormalização em sistemas já em produção, o artigo recomenda o uso de refatorações de banco de dados, como:

Criar colunas redundantes

Popular essas colunas

Criar triggers para manter os dados sincronizados

Isso permite uma transição gradual, sem quebrar aplicações existentes.

Dicas importantes

✔️ Desnormalize apenas consultas críticas

✔️ Sempre compare com outras estratégias de otimização

⚠️ Avalie impacto em atualizações e manutenção

⚠️ Lembre-se: consistência passará a depender de código

⚖️ Decida onde “pagar o preço”: na consulta ou na atualização

Conclusão

A desnormalização é uma poderosa estratégia para otimizar consultas SQL, mas não deve ser usada isoladamente. Ela melhora o desempenho às custas de maior complexidade, menor flexibilidade e mais responsabilidade sobre a integridade dos dados.

Um bom projetista:

Analisa o contexto do negócio

Avalia alternativas

Combina estratégias

E aplica a desnormalização com critério e consciência dos impactos