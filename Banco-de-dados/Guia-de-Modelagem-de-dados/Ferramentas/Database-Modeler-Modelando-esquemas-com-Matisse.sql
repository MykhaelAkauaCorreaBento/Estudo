Resumo – Database Modeler: Modelando Esquemas com Matisse

O Matisse Database Modeler é uma ferramenta gráfica utilizada para modelagem de esquemas do Banco de Dados Matisse, um SGBD orientado a objetos. O artigo demonstra como criar modelagens simples usando UML (Diagrama de Classes), apresentando conceitos, exemplos práticos e recursos importantes da ferramenta.

Visão Geral da Ferramenta

Utiliza UML – Diagrama de Classes para modelagem.

Exige conhecimentos básicos de Orientação a Objetos.

Permite gerar código para várias linguagens:

Java, C#, VB.NET, C++, PHP, Python, Eiffel.

A modelagem gráfica pode ser automaticamente refletida no banco Matisse.

Exemplo Prático: Instituição de Ensino

O exemplo modela uma instituição de ensino superior, que precisa armazenar dados de:

Professores

Técnicos administrativos

Alunos

Departamentos

Cursos, disciplinas e turmas

Endereços

Regras do negócio destacadas:

Professores pertencem a apenas um departamento de ensino.

Técnicos administrativos pertencem a um departamento administrativo ou de ensino.

Alunos podem estar matriculados em várias turmas de diferentes cursos.

Turmas dependem de cursos, que dependem de disciplinas, que dependem de departamentos.

Criação do Esquema no Banco Matisse

Antes da modelagem:

Criar o esquema no Matisse Enterprise Manager.

Definir o nome do banco.

Iniciar o banco (start).

Abrir o Matisse Database Modeler e recarregar os esquemas ativos.

O esquema possui duas partes:

Schema: onde ocorre a modelagem.

Meta Schema: valida a modelagem conforme a UML.

Modelagem com UML
Criação de Classes

As entidades Professores, Técnicos Administrativos e Alunos possuem dados comuns. Para evitar repetição, cria-se a superclasse:

Classe Pessoa (superclasse)

Atributos:

Matricula (integer)

Nome (string)

RG (integer)

CPF (integer)

DataNascimento (date)

Dica importante:

A ferramenta não aceita acentos nem nomes iniciados com números.

Índices e Chaves

Índices são usados para definir chaves primárias.

Um índice pode conter um ou mais atributos.

Pode-se definir ordenação ASC ou DESC.

Exemplo: índice PMatricula como chave primária.

Dicionário de Dados

Estrutura semelhante a vetores ou mapas.

Usado para representar chaves compostas ou estruturas relacionais.

Opcional no exemplo, mas útil em modelos mais complexos.

Métodos

Classes podem possuir métodos, semelhantes a procedures de banco de dados.

Estrutura:

Nome

Parâmetros

Tipo de retorno

Bloco BEGIN–END

Métodos reduzem transações entre aplicação e banco, melhorando desempenho.

Herança

As classes:

Professores

Tec_Adms

Alunos

herdam atributos e métodos da classe Pessoa por meio do relacionamento Generalization.

Exemplo:

Professores: Cargo, Formação, Titulação.

Técnicos administrativos: Cargo, Formação.

Alunos: matrícula própria.

Outras Classes Modeladas

Enderecos

Dep_Ensinos

Dep_Adms

Disciplinas

Cursos

Turmas

Cada classe possui seus atributos e chaves primárias bem definidas.

Relacionamentos UML
Tipos utilizados:

Associação: relacionamento simples.

Agregação: dependência parcial (objetos existem separadamente).

Composição: dependência total (objeto não existe sem o outro).

Exemplos do modelo:

Alunos → Turmas (Composição)

Turmas → Cursos (Composição)

Cursos → Disciplinas (Composição)

Disciplinas → Departamentos de Ensino (Composição)

Professores → Departamentos de Ensino (Composição)

Técnicos Administrativos → Departamentos (Agregação)

As cardinalidades são definidas conforme as regras do negócio (1..*, 0..1, etc.).

Comentários e Validação

A ferramenta permite adicionar comentários ao modelo.

Ao salvar, o Matisse:

Valida automaticamente a notação UML;

Gera a estrutura do banco no Matisse Enterprise Manager;

Permite exportar o modelo como imagem ou imprimir;

Gera código para aplicações.

Conclusão

O Matisse Database Modeler facilita a criação de esquemas orientados a objetos, garantindo:

Organização do modelo;

Redução de redundâncias;

Validação automática;

Integração direta com o banco Matisse;

Apoio ao desenvolvimento de aplicações.

A ferramenta é indicada para quem trabalha com bancos orientados a objetos e deseja alinhar a arquitetura do banco à arquitetura do sistema.