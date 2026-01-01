🎯 Objetivo do artigo

Auxiliar desenvolvedores (mesmo não sendo DBAs ou analistas de dados) a modelar bancos de dados corretamente, evitando erros comuns que surgem por:

Falta de análise do escopo

Desconhecimento de normalização

Uso incorreto de relacionamentos e chaves

Ausência de integridade referencial

🧠 Modelagem Conceitual (entender o problema)

📌 Foco: o negócio, não a tecnologia.

Princípios básicos

Sempre faça modelagem → melhora entendimento e planejamento

Modelo conceitual define o problema, não a solução

Não pense em SGBD, chaves ou tipos de dados nessa etapa

Entidades e nomes

Use nomes no singular

Dê nomes claros e significativos

Padronize nomenclatura

Relacionamentos

Tipos comuns:

0:1, 0:N

1:1, 1:N

N:N

📌 Boas práticas:

Nomear relacionamentos facilita entendimento

Relacionamentos N:N ou com atributos → geram novas entidades

Evite redundância de dados (exceto chaves estrangeiras)

Dicas importantes

Evite entidades desconectadas sem justificativa

Cuidado com relacionamentos obrigatórios dos dois lados (podem impedir inserções iniciais)

Nomeie chaves com referência à entidade
✅ cod_cliente
❌ codigo

🧩 Modelagem Lógica (definir a solução)

📌 Foco: estrutura correta dos dados (ainda independente do SGBD).

Regras gerais

Toda entidade vira uma tabela

Cada atributo deve pertencer à tabela correta

Elimine colunas repetidas

Dimensione corretamente os tipos de dados

Defina obrigatoriedade (NOT NULL) com cuidado

Chaves

Toda tabela deve ter chave primária

Requisitos de uma boa PK:

Pequena

Única

Não nula

Preferencialmente numérica

📌 Chaves artificiais (surrogate/blind key)
Usadas quando não existe chave natural confiável
Ex: cod_dependente

Chaves estrangeiras

Representam relacionamentos

Devem referenciar uma PK válida ou ser nulas (se opcional)

🔗 Mapeamento de Relacionamentos
1:N

PK do lado “1” vira FK no lado “N”

N:N

Gera nova tabela associativa

PK = combinação das PKs originais

1:1

Pode virar:

1 tabela (mesma PK)

2 tabelas (FK no lado obrigatório)

3 tabelas (ambos opcionais)

Entidades fracas

PK composta pela PK da entidade forte + atributo próprio

Ao excluir a entidade forte, as fracas também são excluídas

Generalização / Especialização

Mesma PK em toda a hierarquia

Pode ser mapeada:

Em uma tabela

Em tabelas por especialização

Em tabelas separadas (mais normalizado)

🔍 Normalização (qualidade dos dados)

📌 Objetivo: eliminar redundâncias e anomalias

1ª Forma Normal (1FN)

Eliminar atributos compostos
Ex: Endereço → Rua, Número, Cidade…

Eliminar atributos multivalorados
Ex: Telefones → nova tabela

Definir chave primária

2ª Forma Normal (2FN)

Atributos não-chave devem depender da chave inteira

Aplica-se a tabelas com chave composta

📌 Evita:

Anomalias de inclusão

Anomalias de exclusão

Anomalias de alteração

3ª Forma Normal (3FN)

Atributos não-chave não devem depender de outros atributos não-chave

Ex: nome_departamento não deve depender de cod_departamento em Funcionário

⚖️ Desnormalização (quando usar)

📌 Exceção, não regra

Motivações válidas

Melhorar desempenho em consultas críticas

Criar históricos

Evitar cálculos repetitivos

Valores estáticos (ex: nome de grupo)

Exemplos comuns

Armazenar valor do pedido

Repetir preço do produto no item do pedido (histórico)

Agrupar atributos quando tipos são conhecidos (telefone fixo, celular)

⚠️ Riscos:

Anomalias

Maior custo de manutenção

Perda de integridade

🏗️ Projeto Físico (implementação real)

📌 Foco: desempenho e SGBD específico

Boas práticas:

Criar índices em FKs

Avaliar chaves artificiais

Validar modelo antes de gerar scripts

Ajustar configurações da ferramenta CASE

Evitar chaves primárias muito grandes

🌍 Fragmentação de Dados (bancos distribuídos)
Quando NÃO fragmentar

Sem necessidade de proximidade com usuário

Alto risco de inconsistência

Restrições tecnológicas

Dificuldade de sincronização

Quando fragmentar

Dados precisam estar próximos do usuário

Muitas transações concorrentes

Questões estratégicas ou de segurança

Tipos de fragmentação
📐 Vertical

Divide colunas

Cada fragmento mantém a chave

Útil quando sistemas usam conjuntos diferentes de atributos

📊 Horizontal

Divide registros

Ex: clientes por filial

Um registro pertence a apenas um fragmento

📌 Critérios:

Cardinalidade

Frequência de acesso

Volume de dados

Capacidade do servidor

Banda de rede

🛠️ Ferramentas CASE

📌 Essenciais para manter o modelo atualizado

Benefícios:

Engenharia direta e reversa

Sincronização modelo ↔ banco

Versionamento

Documentação automática

Exemplo citado:

DBDesigner 4 (gratuito, multiplataforma, suporta vários SGBDs)

✅ Conclusão

Modelagem de dados é responsabilidade de todos

Bons modelos evitam problemas futuros

Normalização garante qualidade

Desnormalização deve ser criteriosa

Ferramentas CASE são fundamentais

Um bom banco nasce de um bom modelo