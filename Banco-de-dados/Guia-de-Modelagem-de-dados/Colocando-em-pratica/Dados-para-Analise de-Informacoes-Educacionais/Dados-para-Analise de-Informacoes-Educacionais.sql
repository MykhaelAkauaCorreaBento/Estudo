O artigo propõe um modelo de dados educacional voltado à mineração de dados educacionais, com foco especial em estudos sobre evasão de estudantes.

🎯 O modelo busca:

Padronizar dados educacionais;

Facilitar análises comparativas entre instituições;

Aumentar a produtividade na seleção de dados;

Apoiar decisões acadêmicas e administrativas.

📌 Ponto-chave:
O modelo não é transacional, mas sim analítico, pensado para consultas complexas (data sets e data warehouses).

Por que modelar dados educacionais é difícil?

Dados incompletos ou inconsistentes;

Falta de padronização entre instituições;

Grande diversidade de contextos educacionais;

Necessidade de analisar fatores acadêmicos, sociais, financeiros e institucionais ao mesmo tempo.

📌 Dica do artigo:
Antes de modelar, é essencial definir qual problema será analisado (ex.: evasão, desempenho, inadimplência).

Foco Analítico do Modelo

O modelo organiza dados para analisar:

Perfil do estudante antes do ingresso

Comprometimento com o curso

Esforço acadêmico

Experiência institucional

Resultados de aprendizagem

Grupos de Atributos do Modelo
1️⃣ Atributos de Ingresso

Pouco explorados em pesquisas, mas altamente relevantes.

Incluem:

Tipo de ingresso (Vestibular, ENEM, Transferência, Diploma);

Nota obtida (em percentual);

Período de ingresso;

Antecipação da matrícula (em dias).

📌 Exemplo importante:

Antecipação = Data limite da matrícula – Data real da matrícula


Valor positivo → aluno motivado

Valor negativo → matrícula fora do prazo

2️⃣ Atributos Socioeconômicos

Usados para traçar perfis comportamentais.

Incluem:

Sexo, idade, estado civil;

Escolaridade;

Origem escolar (pública ou privada);

Renda familiar (em faixas de salários mínimos);

Situação laboral;

Localização residencial e profissional.

📌 Boa prática:
Usar valores pré-definidos (domínios) para evitar inconsistência nos dados.

3️⃣ Atributos Financeiros

Pouco explorados em estudos acadêmicos, mas muito relevantes para gestores.

Incluem:

Tipo de vínculo financeiro:

Pagante

Bolsista (PROUNI, FIES, institucional)

Média de antecipação no pagamento;

Quantidade de mensalidades em atraso;

Percentual de endividamento.

📌 Insight do artigo:
Endividamento pode impactar diretamente o desempenho acadêmico e a evasão.

4️⃣ Atributos Acadêmicos

Base da maioria dos estudos educacionais.

Incluem:

Situação acadêmica (matriculado, trancado, cancelado, abandono);

Tipo de curso (bacharelado, licenciatura, tecnológico);

Modalidade (presencial ou EAD);

Área do conhecimento (CAPES);

Quantidade de disciplinas cursadas;

Disciplinas pendentes;

Períodos concluídos;

Maior e menor frequência;

Maior e menor nota global.

Visão Geral do Modelo (DER)

📊 Figura 1 – Diagrama Entidade-Relacionamento

🔹 O modelo possui 9 entidades principais
🔹 A entidade MATRICULA é o núcleo central

Entidades:

Instituicao

Instalacao

Curso

CursoOfertado

Estudante

Periodo

Matricula

Mensalidade

Disciplina

DisciplinaCursada

📌 Decisão importante:
O modelo é intencionalmente não normalizado para:

Melhor desempenho em consultas;

Menor complexidade analítica;

Uso em mineração de dados, não em sistemas operacionais.

Entidades Principais (Resumo)
🏫 Instituicao

Representa a IES.

Atributos:

Tipo (faculdade, centro universitário, universidade);

Natureza (pública ou privada);

Localização (estado, cidade, bairro).

🏢 Instalacao

Unidades físicas da instituição.

Relacionamento:

1 Instituição → N Instalações

Inclui:

Natureza (campus, polo EAD);

Administração (própria ou terceirizada);

Localização.

📘 Curso

Define o curso em si.

Inclui:

Tipo (bacharelado, licenciatura, tecnológico);

Área e subárea (CAPES).

📚 CursoOfertado

Define como o curso é oferecido.

Inclui:

Modalidade (presencial/EAD);

Duração;

Periodicidade;

Instituição responsável.

📌 Um mesmo curso pode ser ofertado várias vezes.

👤 Estudante

Perfil individual do aluno.

Inclui:

Dados pessoais;

Dados socioeconômicos;

Histórico escolar;

Renda familiar;

Situação laboral.

🗓️ Periodo

Marca o tempo acadêmico.

Inclui:

Ano;

Sequencial (semestre, trimestre);

Datas de início e fim.

📌 Permite comparar alunos em diferentes estruturas curriculares.

📝 Matricula (Entidade Central)

Relaciona:

Estudante

Curso ofertado

Instalação

Período de ingresso

Inclui:

Tipo de ingresso;

Nota no processo seletivo;

Antecipação da matrícula;

Situação acadêmica;

Vínculo financeiro;

Indicadores consolidados acadêmicos e financeiros.

📌 Principal entidade para mineração de dados.

💰 Mensalidade

Registra eventos financeiros mensais.

Relaciona:

Matrícula

Período

Inclui:

Valor cobrado;

Valor pago;

Datas de vencimento e pagamento.

📖 Disciplina

Representa a matriz curricular.

Inclui:

Curso associado;

Período do curso em que ocorre.

📊 DisciplinaCursada

Relaciona:

Matrícula

Disciplina

Período

Inclui:

Frequência;

Nota global;

Situação (concluída, reprovada, dispensada, em curso).

📌 Permite:

Reprovações;

Repetições de disciplina;

Análises de desempenho.

Exemplos de Código SQL (Ilustrativos)
Tabela Estudante
CREATE TABLE Estudante (
  EstudanteId INT PRIMARY KEY AUTO_INCREMENT,
  DataNascimento DATE,
  Sexo VARCHAR(10),
  EstadoCivil VARCHAR(20),
  Escolaridade VARCHAR(50),
  RendaFamiliar VARCHAR(20)
);

Tabela Matricula
CREATE TABLE Matricula (
  MatriculaId INT PRIMARY KEY AUTO_INCREMENT,
  EstudanteId INT,
  CursoOfertadoId INT,
  InstalacaoId INT,
  TipoIngresso VARCHAR(30),
  NotaIngresso DECIMAL(5,2),
  AntecipacaoMatricula INT,
  SituacaoMatricula VARCHAR(20),
  FOREIGN KEY (EstudanteId) REFERENCES Estudante(EstudanteId)
);

Tabela DisciplinaCursada
CREATE TABLE DisciplinaCursada (
  DisciplinaCursadaId INT PRIMARY KEY AUTO_INCREMENT,
  MatriculaId INT,
  DisciplinaId INT,
  PeriodoId INT,
  Frequencia DECIMAL(5,2),
  NotaGlobal DECIMAL(5,2),
  Situacao VARCHAR(20)
);

Conclusão

O artigo demonstra que:

Mineração de dados educacionais exige estrutura padronizada;

Dados acadêmicos, financeiros e sociais devem ser analisados juntos;

Modelos analíticos não precisam ser totalmente normalizados;

A entidade MATRICULA centraliza os fatores mais relevantes.

📌 Mensagem final:
Um bom modelo de dados educacionais transforma informações dispersas em conhecimento estratégico para reduzir evasão e melhorar a qualidade do ensino.