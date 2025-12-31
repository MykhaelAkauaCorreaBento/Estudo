O artigo apresenta uma estratégia de modelagem de dados incremental, alinhada a metodologias ágeis, usando como estudo de caso um Sistema de Gerenciamento de Grupo de Karatê (SGGK).
A ideia central é não modelar todo o banco de dados de uma vez, mas evoluí-lo a cada iteração, conforme novos requisitos surgem ou mudam.

Essa abordagem reduz riscos, permite feedback constante dos usuários e evita desperdício de esforço com funcionalidades que talvez nunca sejam usadas.

Quando a modelagem incremental é útil

Sistemas complexos, com muitos dados

Projetos com requisitos instáveis

Desenvolvimento ágil / iterativo

Necessidade de entregas parciais

Ambientes onde mudanças são inevitáveis

Dica-chave: mudanças de requisitos afetam diretamente o banco de dados, não apenas o código.

Desenvolvimento Incremental × Iterativo
Incremental

Divide o sistema em partes funcionais

Cada incremento adiciona novas funcionalidades

Pode existir sem iteração

Iterativo

Envolve revisão e refinamento

Feedback de uma versão influencia as próximas

Funciona muito bem junto com o incremental

📌 Figura 1 (conceito)
Mostra o sistema crescendo a cada iteração, com mais funcionalidades sendo agregadas progressivamente.

Estudo de caso: Escola de Karatê (SGGK)
Objetivo do sistema

Gerenciar:

Alunos

Pagamentos

Graduações (faixas)

Produtos

Eventos

Estilos de luta

O desenvolvimento foi dividido em iterações curtas, cada uma com estórias de usuário priorizadas.

Requisitos iniciais (Iterações planejadas)
Exemplo – Iteração 1

Manter informações de alunos

Matricular alunos

Excluir alunos

Registrar pagamento

📌 Tabela de estórias (Tabela 1)
Relaciona estórias do usuário às iterações 1 a 6.

Modelagem Inicial do Domínio (Modelo Conceitual)

📌 Figura 2 – Modelo de Domínio Inicial (UML)

Modelo enxuto

Apenas entidades principais

Sem atributos detalhados

Boas práticas destacadas:

Não detalhar atributos cedo demais

Usar o modelo como guia visual

Pode ser feito até em um quadro branco

Iteração 1 – Primeiro Modelo Físico

📌 Figura 3 – Modelo Físico da Iteração 1

Foco

Alunos

Pagamentos (mensalidade)

Decisão de projeto importante

Não armazenar estado (UF)
→ Assume-se que todos vivem no mesmo estado

Dica: decisões de simplificação fazem parte da modelagem incremental.

Prática essencial

Alterações no banco em paralelo ao código

Necessidade de teste de regressão

Iteração 2 – Graduação e Comunicação

📌 Figura 4 – Modelo Físico da Iteração 2

Alterações no banco

Nova tabela Faixa

Coluna Aluno.idFaixa

Coluna Pessoa.Email

Coluna Aluno.DataGraduacao

Decisão importante

O e-mail foi colocado em Pessoa, não em Aluno:

Evita redundância

Reflete melhor o domínio

⚠️ Limitação aceita:
Só armazena a faixa atual, não o histórico completo.

Iteração 3 – Inativação e Graduação

📌 Figura 5 – Modelo Físico da Iteração 3

Novas tabelas

MembroInativo → pausa de mensalidade

Graduacao

TentativaFaixa

Regra de negócio

Alunos podem ficar inativos temporariamente

Planos de mensalidade variam (3, 6, 12 meses)

Mudanças de Requisitos (Ponto-chave do artigo)

Após usar o sistema em produção:

Torneios não eram vantajosos

Surgiram:

Eventos especiais

Planos familiares

Alunos crianças

Novos estilos (Tai Chi, Kickboxing)

📌 Tabela 2 – Estórias atualizadas

Expande o sistema até a Iteração 8

💡 Insight central:

Entregas parciais ajudam usuários a entender o que realmente precisam.

Modelo de Domínio Atualizado

📌 Figura 6 – Modelo de Domínio Atualizado

Mudanças:

Torneio → EventoEspecial

Relacionamento com Aluno

Nova entidade Estilo

Nova entidade Família

Iteração 4 – Crianças e Plano Família

📌 Figura 7 – Modelo Físico da Iteração 4

Alterações:

Faixas infantis (mais numerosas e coloridas)

Coluna AlunoCrianca em:

Faixa

Aluno

Nova tabela Familia

Aluno.idFamilia (FK opcional)

📌 Decisão importante

Idade não define se é criança → maturidade sim

Iteração 5 – Múltiplos Estilos

📌 Figura 8 – Modelo Físico da Iteração 5

Novidades:

Tabela Estilo

Faixa.idEstilo

Tabela associativa Aluno_Faixa (N:N)

Migração de dados

Necessária ao evoluir esquemas existentes

É inevitável em bancos evolutivos

Dica prática: aceitar mudanças e planejar boas migrações.

Iteração 6 – Produtos

📌 Figura 9 – Modelo Físico da Iteração 6

Tabelas adicionadas:

Item

Compra

ItemCompra

Modelo propositalmente simples:

Sem controle de estoque

Sem fornecedores

Sobre pular o modelo lógico

O artigo defende que é válido ir do modelo conceitual direto ao físico, dependendo do contexto.

Vantagens

Menos divergência entre código e banco

Antecipação de requisitos futuros

Menor esforço inicial

Linguagem de negócio unificada

Desvantagens

Pequeno impacto de desempenho (ex: tabela Pessoa)

Tempo inicial para criar o modelo de domínio

Conclusão

O artigo demonstra que:

A modelagem de dados pode (e deve) ser incremental

O banco evolui junto com o sistema

Mudanças são inevitáveis

Planejar versões futuras reduz retrabalho

Mensagem final:
Modelar dados incrementalmente é alinhar o banco à realidade viva do negócio.