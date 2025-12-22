Linguagem SQL: torne seu código SQL mais legível
Este artigo mostra algumas técnicas para tornar o código armazenado em scripts SQL mais “polido”, ou seja, mais adequado para receber modificações no futuro.
Suporte ao aluno
Anotações
Favoritar
Concluído
40
Gostei
Compartilhar
40
Artigos
Banco de Dados
Linguagem SQL: torne seu código SQL mais legível
Artigo no estilo Mentoring
Mentoring:Fazer manutenção em código é essencial nos dias de hoje, devido à política de reaproveitamento de código. É necessário compreender a importância de tornar mais legível o código SQL armazenado dentro de scripts, evidenciando e incentivando a necessidade de implementação de técnicas para que profissionais consigam lidar com código legado que será executado no banco de dados. Este artigo é útil porque mostra algumas técnicas para tornar o código armazenado em scripts SQL mais “polido”, ou seja, mais adequado para receber modificações no futuro. A partir da aplicação das técnicas apresentadas nesse artigo, é possível lidar com aspectos não funcionais, tais como formatação, comentários, testes, organização e controle de modificações e versões de scripts SQL, de modo que a maneira de tratar esse importante artefato de software seja adequada.
Sempre houve a preocupação com diversos aspectos relacionados ao código fonte, desde a sua eficácia e eficiência até questões não técnicas. Entretanto, nos últimos anos a questão da manutenibilidade do código vem sendo tratada com mais cuidado. Modificações não funcionais podem ser aplicadas a códigos fonte para torná-los mais “polidos”, ou seja, bem apresentáveis. Esse polimento possui diversas vantagens, principalmente quando é necessário realizar modificações futuras que necessitam de compreensão profunda do que o código representa do ponto de vista de funcionalidades implementadas.

A partir desse contexto, esse artigo apresentará recomendações, sugestões e melhores práticas para tornar o código contendo instruções SQL mais simples e fácil de ser compreendido. A escolha da linguagem SQL se deve ao fato de que ela é o recurso computacional mais empregado para lidar com dados.

O foco desse artigo é apresentar técnicas e práticas para tornar mais fácil a compreensão do conteúdo de scripts que contêm comandos SQL, um dos artefatos mais comuns para quem trabalha com banco de dados no dia a dia. A partir da colocação em prática das técnicas apresentadas é possível melhorar e aprimorar tanto as habilidades necessárias para lidar com dados quanto a capacidade de compreender o código fonte armazenado dentro de um script SQL.

Formatação de texto SQL

Um script SQL geralmente contém instruções SQL, comandos condicionais, variáveis, comentários, palavras-chave e outros elementos textuais importantes para lidar com dados e representar a lógica de algum algoritmo. Contudo, muitas vezes nos deparamos com instruções complexas que ocupam muitas linhas e manipulam diversos objetos ao mesmo tempo.

Nesses casos é comum encontrar instruções SQL dentro do script que possuem várias cláusulas, opções e detalhes sem nenhum tipo de formatação. Essa falta de formatação torna difícil a compreensão e manutenção da instrução, pois é necessário esforço mental adicional para organizar os elementos em linhas e colunas diferentes antes de analisar o que realmente a instrução faz. Por exemplo, a instrução SELECT parcial da Listagem 1 contém várias cláusulas sem nenhum tipo de formatação, o que torna sua compreensão mais difícil, apesar da colorização de certos elementos sintáticos feita por alguma ferramenta IDE de edição de scripts, tal como o Management Studio fornecido com o SQL Server.

Listagem 1.Parte de uma instrução SELECT complexa e sem nenhuma formatação.

SELECT d2_grupo GRUPO, Cast(Sum(d2_total) AS NUMERIC(10,2))TOTAL, pa1_tbtrat TIPO FROM sd2tb0 D2, se1tb0 E1, pa1tb0   PA1 WHERE d2_emissao >= '20060201'      AND d2_emissao <= '20060228' AND D2.d_e_l_e_t_ <> '*' AND   PA1.d_e_l_e_t_ <> '*' AND E1.d_e_l_e_t_ <> '*' AND d2_cliente >= '      ' AND d2_cliente <= 'zzzzzz' AND Substring(e1_tipo, 1, 2) = 'NF' AND ei_contr <> '' AND d2_loja >= '   '   AND d2_loja <= '   ' AND e1_emissao = d2_emissao AND e1_parcela IN ('','A') AND e1_naturez NOT IN ('COFINS', 'PIS', 'CSLL', 'INSS') AND       e1_num = d2_doc AND e1_contr <> '' AND pa1_contr = e1_contr AND d2_filial = 'EC' AND e1_contr >= '        ' AND e1_contr <= 'zzzzzzzz' AND sa1 -> a1_regiao >= '1 ' AND sa1 -> a1_regiao <= '1 ' GROUP BY pa1_tptrat, ...
Atualmente existem diversas ferramentas de terceiros que permitem a formatação de scripts e instruções SQL para torná-las mais fáceis de serem compreendidas e manipuladas. Essas ferramentas são chamadas de embelezadores de código (code beautifiers) e possuem como objetivo formatar o código fonte de modo a deixá-lo mais legível e de claro entendimento sem modifica-lo sintaticamente e semanticamente.

Por exemplo, o Instant SQL Formatter permite separar em linhas e colunas os elementos de uma instrução SELECT para facilitar a visualização. De fato, uma vez que se experimenta o uso em larga escala da formatação de SQL fica muito mais fácil compreender instruções SQL complexas. Por exemplo, essa ferramenta faz a formatação de instruções SELECT colocando colunas, tabelas e expressões da cláusula WHERE em linhas separadas, o que simplifica o processo de entendimento de quais objetos estão sendo utilizados. A Listagem 2 mostra como parte da instrução SQL da Listagem 1 ficaria após a formatação.

Listagem 2.Instrução SELECT daListagem 1formatada para facilitar a compreensão.

SELECT d2_grupo                       GRUPO,
      Cast(Sum(d2_total) AS NUMERIC(10,2))TOTAL,
      pa1_tbtrat               TIPO
FROM  sd2tb0 D2,
      se1tb0 E1,
      pa1tb0 PA1
WHERE d2_emissao >= '20060201'
      AND   d2_emissao <= '20060228'
      AND   D2.d_e_l_e_t_ <> '*'
      AND   PA1.d_e_l_e_t_ <> '*'
      AND   E1.d_e_l_e_t_ <> '*'
      AND   d2_cliente >= '      '
      AND   d2_cliente <= 'zzzzzz'
      AND   Substring(e1_tipo, 1, 2) = 'NF'
      AND   ei_contr <> ''
      AND   d2_loja >= '   '
      AND   d2_loja <= '   '
      AND   e1_emissao = d2_emissao
      AND   e1_parcela IN ('','A')
      AND   e1_naturez NOT IN ('COFINS', 'PIS', 'CSLL', 'INSS')
      AND   e1_num = d2_doc
      AND   e1_contr <> ''
      AND   pa1_contr = e1_contr
      AND   d2_filial = 'EC'
      AND   e1_contr >= '        '
      AND   e1_contr <= 'zzzzzzzz'
      AND   sa1 -> a1_regiao >= '1 '
      AND   sa1 -> a1_regiao <= '1 '
GROUP BY pa1_tptrat,
            ...
Outro aspecto importante relacionado à formatação que muitas vezes é negligenciado é o uso de caracteres especiais, tais como acentos. Infelizmente, muitos modelos de dados contam com nomes de colunas e tabelas que contêm acentos. Em ambientes profissionais essa prática não é recomendada, pois é possível que durante a geração de um script possa haver algum problema na conversão de caracteres. Por exemplo, o trecho de uma instrução SELECT da Listagem 3 mostra como o texto pode ficar quando existem certos acentos em nomes de objetos que não são apresentados corretamente.

Listagem 3. Acentos em nomes de colunas não convertidos.

SELECT `dados conint`.superintendencia AS 'SUP',
         `dados conint`.malha            AS 'MALHA',
         `dados conint`.gerencia_sd      AS 'GERÊNCIA',
         `dados conint`.polo             AS 'PÓLO',
         Max(`dados conint`.municipio) AS 'Max CIDADE',
        `dados conint`.`n doc`         AS  'N CONDIS',
         `dados conint`.`n int`        AS 'N CONINT',
         `dados conint`.inicio         AS 'DT INÍCIO',
         `dados conint`.termino        AS 'DT TÉRMINO',
         1                             AS 'INT TOTAL',
         Max(Ccur(duracao / 60))       AS 'Max DURAÇÃO',
         Abs(duracao < 420)            AS 'INT < 7H',
         Ccur(( Abs(duracao < 420) ) * duracao / 60) AS 'TA < 7H',
         Abs(( duracao >= 420 ) <> ( ( Datevalue(termino) > Datevalue(inicio) AND Hour(inicio) < 19
Além do uso de acentos e caracteres especiais nos nomes de objetos do banco de dados, deve-se também evitar utilizar tais elementos dentro de um script. Por exemplo, se uma instrução condicional IF comparava uma variável com uma string literal que contém o caractere cedilha (ç), é possível que essa comparação não retorne o resultado correto, pois esse caractere pode ser interpretado de forma diferente dependendo de características da ferramenta (e até do sistema operacional) onde o script vai ser aberto e executado.

Para evitar problemas como esse, recomenda-se utilizar funções que transformam números da tabela ASCII em caracteres, pois dessa forma o script fica independente de aspectos de formatação. No exemplo citado, a string ‘caçamba’ pode ser transformada em algo como ‘ca’ + CHAR(231) + ‘amba’ em uma comparação, considerando que a função CHAR(231) retorna o caractere ç diretamente da tabela ASCII.

Refatoração de código

A refatoração de código fonte é uma técnica de programação disciplinada para reestruturar o código. Em termos práticos, refatorar o código quer dizer modificá-lo para fins que não afetem os aspectos funcionais. Traduzindo essa definição de outra forma, pode-se dizer que após a aplicação da refatoração o artefato em questão vai continuar fazendo o que ele faz, porém de forma melhor, sendo que esse “melhor” pode ser relacionado a diversos aspectos, tais como a manutenibilidade.

Existem diversas formas de aplicar a refatoração em banco de dados, incluindo modificações em modelos, definições de objetos, características dos bancos de dados e outros. Para facilitar o entendimento das diferentes formas de aplicação da refatoração em banco de dados, assim como aspectos processuais e de adoção, recomenda-se a referência clássica dessa área: o livro Refactoring Databases escrito por Scott W. Ambler e Pramod J. Sadalage. Além disso, o acervo da revista SQL Magazine conta com alguns artigos muito bons falando sobre aspectos gerais de refatoração e banco de dados. Dentre esses destacam-se os artigos “Refatoração de Banco de Dados” (publicado na edição 84) e “O processo de refatoração de banco de dados” (publicado na edição 86). Ambos se concentram em aspectos gerais, porém não se aprofundam muito em detalhes de refatoração no conteúdo de scripts SQL.

Muitas das técnicas clássicas de refatoração de código fonte aplicadas no que foi construído utilizando linguagens como Java, C# ou PHP podem ser facilmente aproveitadas em script SQL, tais como remoção/movimentação de métodos, decomposição de comandos condicionais, renomeação objetos e outras. Contudo, quando lidamos com um script baseado em comandos SQL que manipulam dados, geralmente aspectos de design não estão presentes nesse contexto, o que torna a aplicação de algumas refatorações inviáveis, especialmente aquelas que sugerem o uso de recursos de orientação a objeto.

Além das clássicas técnicas de refatoração, também é importante aplicar alguns dos princípios de ‘código limpo’, nem que esse código seja apenas um conjunto de instruções SQL armazenadas em um script. A referência clássica quando se fala de código limpo é o livro homônimo escrito por Robert C. Martin. Assim como as técnicas de refatoração, muito do que é apresentado nesse livro somente faz sentido em linguagens onde o paradigma de orientação a objeto é muito importante. Contudo, existem diversas práticas contidas nessa referência que podem ser aplicadas no mundo SQL, com destaque para a importância de critérios para nomes de variáveis/objetos, definições de parâmetros, tratamento de exceções, detalhamento do retorno de funções e aplicabilidade de comentários.

Geralmente a aplicação das técnicas de refatoração e outras práticas que permitem “polir” um código SQL devem ser acompanhadas de algum tipo de discussão relacionada a como acomodar, justificar e executar essas atividades dentro de um processo, seja ele relacionado ao desenvolvimento de uma aplicação ou não. Isso quer dizer que o DBA deve evitar “agir por conta própria” e sair aplicando modificações em script sem conhecimento de superiores. No mínimo, a prática de “polir” o código deve ser comunicada e respaldada por algum supervisor (coordenador, gerente, líder técnico) para que haja a compreensão e justificativa do esforço necessário para melhorar o código fonte do ponto de vista de manutenibilidade.

Rejuvenescimento

O rejuvenescimento de código (code rejuvenation) se refere à transformação de código existente através da substituição de recursos depreciados (deprecated) e expressões idiomáticas por algo mais moderno.

O código marcado como depreciado já é indicado em muitos IDEs, documentações e também por mensagens de compiladores. No que diz respeito ao SQL, pode-se destacar um exemplo clássico de rejuvenescimento de código quando nos depararmos com a sintaxe *= e =* para a realização de left outer join e right outer join, respectivamente, adotada inicialmente na versão 6.0 do SQL Server. Essa sintaxe foi marcada como depreciada na versão 2000 e posteriormente removida da linguagem no SQL Server 2005, ou seja, qualquer script que contivesse *= ou =* geraria um erro de sintaxe ao ser executado.

Esse tipo de comportamento, marcar um recurso como depreciado em uma versão e depois removê-lo em versões futuras, é muito comum nos softwares voltados para desenvolvedores, incluindo banco de dados. Portanto, aplicar periodicamente a técnica de rejuvenescimento de código logo que uma funcionalidade é marcada como depreciada auxilia a tornar o script SQL mais polido e ainda incentiva os profissionais a se atualizarem no que diz respeito às mudanças da sintaxe da linguagem.

Informações e formatos de comentários

O uso de comentários em scripts SQL pode ser um recurso muito importante para ajudar a compreensão do código. Assim como em outras linguagens de programação, é possível colocar comentários em linhas existentes de código ou comentar por completo várias linhas de uma só vez. Os tipos de comentário (por linha ou por bloco de linhas) são definidos a partir do uso de caracteres especiais, porém é praticamente um padrão em scripts SQL aceitos por diversos bancos de dados utilizar duas barras (//) para indicar comentários em linha e os caracteres barra e asterisco (/*) e asterisco barra (*/) para delimitar o início e o fim de um bloco de comentários, respectivamente.

Dois aspectos importantes em relação a comentários são o formato e o conteúdo. Isto é, como colocar informação dentro dos comentários e a maneira de fazê-lo visando comunicar claramente as informações ali contidas. Por exemplo, é comum encontrar scripts SQL onde as primeiras linhas do arquivo contêm informações indicando seu conteúdo, quem foi o autor, a descrição do objetivo e a data da última modificação. As Listagens 4, 5 e 6 mostram exemplos de comentário colocados na parte inicial de scripts SQL.

Listagem 4. Exemplo de comentário de início de script SQL com informações gerais do script.

-- -----------------------------------------------------------------------------------
  -- File Name    : https://oracle-base.com/dba/10g/session_waits.sql
  -- Author       : Tim Hall
  -- Description  : Displays information on all database session waits.
  -- Requirements : Access to the V$ views.
  -- Call Syntax  : @session_waits
  -- Last Modified: 11/03/2005
  -- -----------------------------------------------------------------------------------
Listagem 5. Exemplo de comentário com informações de histórico de modificações.

-------------------------------------------------------------------------------
  -- Author       name
  -- Created      date
  -- Purpose      description of the business/technical purpose
  --              using multiple lines as needed
  -- Copyright © yyyy, Company Name, All Rights Reserved
  -------------------------------------------------------------------------------
  -- Modification History
  --
  -- 01/01/0000  developer full name
  --      A comprehensive description of the changes. The description may use as
  --      many lines as needed.
  -------------------------------------------------------------------------------
Listagem 6. Exemplo de comentário com informações adicionais sobre uso e propósito.

/*
  ##########################################################################
  -- Name : Template.sql
  -- Date             : (sysdate)
  -- Author           :   Duncan van der Zalm - dvdzalm
  -- Company          :   stanDaarD-Z.nl
  -- Purpose          :
  -- Usage        sqlplus
  -- Impact   :
  -- Required grants  :   sel on A, upd on B, drop on C
  -- Called by        :   some other process
  ##########################################################################
  -- ver  user    date        change
  -- 1.0  DDZ 20110622    initial
  ##########################################################################
  */
Além dos comentários colocados no início do script, também é comum utilizar comentários para separar áreas importantes do código. Essa prática é facilitada por recursos automáticos de ferramentas editoras de texto que já separam, por exemplo, onde começa e termina uma stored procedure. Dessa forma é possível “compactar” ou “expandir” o código para facilitar a visualização e localização de elementos dentro do mesmo.

Em ferramentas que não possuem esses recursos, pode-se empregar comentários para separar áreas de código e facilitar a localização destas áreas rapidamente. Por exemplo, em um script SQL grande é interessante colocar blocos de comentários com várias linhas e diversos caracteres especiais que chamem a atenção visualmente. Desse modo, quando for necessário abrir o script e navegar rapidamente pelo seu conteúdo com as teclas Page Down/Page Up ou pelo scroll da barra de navegação, fica fácil encontrar a região ‘crítica’ contendo partes importantes do código.

Em relação ao conteúdo, existem algumas recomendações importantes de elementos que podem ser colocados no código SQL para facilitar seu entendimento. Os parágrafos a seguir apresentam alguns itens que podem facilitar a compreensão do que está dentro de um script SQL, potencialmente sendo útil no momento que certas regiões do código estiverem sendo lidas.

É uma boa prática utilizar comentários para identificar se certos trechos do script SQL requerem que alguma opção específica do banco de dados esteja habilitada ou desabilitada. Por exemplo, no SQL Server o comando que faz um de backup de log irá falhar se o recovery model do banco de dados estiver configurado como simple. Apesar do conhecimento dessa característica ser básico para qualquer DBA, é útil indicar essa regra de backup em scripts, especialmente se houverem programadores ou DBAs de nível júnior que ainda estejam aprendendo a lidar com os conceitos de backup e restore.

Em scripts onde vários objetos são criados é interessante indicar em comentários qual é a ordem de criação dos mesmos. Essa indicação pode ser colocada logo antes da criação do objeto B, por exemplo, deixando claro que ele deve ser criado somente após a criação do objeto A. É possível, inclusive, obter a ordem necessária de criação de objetos por meio de funções e stored procedures, porém já deixar a indicação dessa ordem em comentários poupa tempo de quem está se familiarizando com a lógica de criação dos objetos do banco de dados.

Em algumas situações, a maneira como a qual certos comandos do script vão se comportar vai depender de alguma configuração particular por seção/conexão com o banco de dados ou até de configurações da ferramenta que permitem a edição ou execução do script. Nesses casos é muito útil indicar essa configuração em comentários. Por exemplo, o trecho de código T-SQL da Listagem 7 indica que a conversão de dadas somente será possível se o formato da data estiver configurado de uma maneira específica para a sessão que executar os comandos.

Muitos scripts SQL são criados para serem executados diretamente por uma ferramenta de linha de comando, como o SQL*Plus do Oracle por exemplo. É comum que esses scripts recebam algum parâmetro cujo valor é indicado na linha de comando da ferramenta de forma que esse valor seja utilizado dentro do script. Nesse caso, vale a pena comentar o script e colocar um exemplo de como seria a chamada do mesmo com os parâmetros, pois assim quem for utilizar a ferramenta de linha de comando já sabe mais ou menos como utilizá-la para executar o script. A Listagem 8 mostra o conteúdo do arquivo test.sql contendo um exemplo de como receber dois parâmetros na linha de comando com a ferramenta SQL*Plus do Oracle. A Listagem 9 mostra um exemplo de uso de um parâmetro com a ferramenta sqlcmd do SQL Server através do script armazenado no arquivo testscript.sql.

Listagem 7. Exemplo de comentário avisando sobre formato de data específico.

/*
  NOTA: O código abaixo só funciona corretamente se a
  conexão estiver configurada para o formato de data dmy
  setado com o comando SET DATEFORMAT dmy;
  */
  GO
  DECLARE @datevar datetime2 = '31/12/2008 09:01:01.1234567';
  SELECT @datevar;
  GO
Listagem 8. Script test.sql do Oracle que lida com parâmetros enviados pelo console.

/* Aqui &1 contém o valor do primeiro parâmetro enviando pelo console e &2 o segundo.
  Um exemplo de chamada deste script pelo console
  com “Hello” como primeiro parâmetro e “Word” como segundo ficaria
  como mostrado abaixo:

  $ sqlplus login/pw @test Hello World!
  */EXEC dbms_output.put_line('&1 &2');
Listagem 9. Script do SQL Server recebendo o valor “PersonID” para o parâmetro ColumnName.

/* Neste script ColumnName receberá como parâmetro o nome da coluna
  Um exemplo de chamada deste script pelo console seria assim:

  > sqlcmd -v ColumnName ="PersonID" -i c:\testscript.sql
  */
  USE AdventureWorks2012;

  SELECT x.$(ColumnName)

  FROM Person.Person x

  WHERE x.BusinessEntityID < 5;
Scripts contendo comandos SQL geralmente são “avulsos”, ou seja, eles podem ser manipulados de forma independente em qualquer editor de texto. Apesar dessa flexibilidade, muitas vezes precisamos contar com algum tipo de pré-requisito, dependência ou componente para executar o script com sucesso. Isso quer dizer que se o script faz uso de alguma função importante fornecida por uma biblioteca de funções ou stored procedures, não existe nenhuma maneira automática para obter e instalar essa dependência. Por outro lado, ferramentas gerenciadoras de pacotes e dependências como o ANT, o Gradle e o PyPI (Python Package Index) ajudam programas e aplicações escritas em Java e Python a lidar com suas dependências.

Devido a essa falta de gerenciador de dependências, recomenda-se colocar em comentários links, requisitos e informações sobre componentes, frameworks, bibliotecas e outras dependências externas necessárias para a execução do script SQL. Desta forma, quem for lidar com o script ao menos vai ter algum ponto de partida para obter o que é necessário para a sua execução com sucesso. Em geral, scripts de bancos de dados não possuem muitas dependências externas, porém existem casos onde bibliotecas com código fonte aberto ou fechado são requeridas.

Por exemplo, quem utiliza o SQL Server pode contar com a grande quantidade de funções utilitárias da biblioteca SQLsharp (veja o link na sessão de referências) que contém mais de 270 funções que expandem as funcionalidades do SQL Server para lidar com expressões regulares, funções estatísticas avançadas, manipulação de mensagens do Twitter e outros recursos. Contudo, a instalação dessa biblioteca requer alguns passos que devem ser tomados. Portanto, faz sentido incluir nos comentários dos scripts que utilizam as funções dessa biblioteca detalhes de como obtê-la, realizar sua instalação e configuração de seus parâmetros para que ela possa ser utilizada sem problemas.

Outro tipo interessante de comentário que ajuda muito quem está lidando com scripts SQL é aquele que possui informações sobre desempenho. Uma vez que o processo de tuning de banco de dados pode levar a modificações nas configurações do banco, criação de objetos e outras técnicas, vale a pena investir em comentários que expliquem quais foram as modificações para que uma determinada consulta seja executada mais rapidamente. A propósito, incluir nos comentários tempos de execução de antes e depois das otimizações realizadas também ajuda a fornecer um contexto melhor para quem está analisando o script e não esteve envolvido diretamente no processo de implementação das otimizações.

Por fim, é importante mencionar que quando se fala em comentários dentro de scripts SQL, é preciso tomar alguns cuidados especiais. Dentre os mais importantes destaca-se a recomendação para não escrever em comentários informações sensíveis como senhas, números seriais, dados monetários sigilosos, segredos de mercado e outro tipo de dado que se ‘vazado’ para pessoas mal-intencionadas podem levar a diversos problemas. Outra recomendação relevante é evitar ser muito prolixo e divagar no texto, uma vez que programadores e DBAs querem ir direto ao ponto e não apreciam rodeios em comentários quando estão trabalhando no código fonte.

Separação de objetos

Um banco de dados armazena diversos objetos necessários para lidar com os dados, incluindo tabelas, stored procedures, funções, constraints, logins e outros. Contudo, antes desses objetos serem armazenados no banco de dados, eles geralmente são criados e armazenados em scripts que contêm a definição dos objetos. Portanto, os objetos em si são armazenados em dois locais: o banco de dados e os arquivos texto que contêm os comandos que definem o objeto.

Como boa prática recomenda-se que cada objeto do banco de dados seja armazenado em um script separado. O motivo para esta recomendação é que, dessa maneira, pode-se organizar melhor a unidade que contém a definição de cada objeto, seja através da organização em pastas ou mesmo em um sistema de controle de versão como o GitHub. Além disso, armazenar os scripts separados por objetos facilita o processo de documentação da base de dados e auxilia a tarefa de recriar o banco em outro ambiente que não seja o oficial sem a necessidade do uso de ferramentas para engenharia reversa de banco de dados.

Cabe aqui ressaltar que tão importante quanto guardar a definição de cada objeto em um arquivo próprio é garantir a atualização do script, ou seja, ter certeza de que a definição do objeto que está armazenada no script é a mesma que está criada no banco de dados, seja ele um banco de desenvolvimento, homologação ou do ambiente de produção.

Os bancos de dados atuais possuem ferramentas e recursos para gerar scripts individuais de objetos, o que facilita a tarefa de atualizar, sincronizar e organizar a definição dos mesmos. Além disso, também é possível exportar dados de tabelas para arquivos texto, tipicamente no formato CSV (Comma-Separated Values). Essa exportação é interessante para guardar certos dados em arquivos que devem sempre estar disponíveis sem que seja necessário se conectar no banco de dados. Como exemplo, podemos citar dados de configurações de parâmetros de sistema que são muito utilizados para montar ambientes novos do zero. Outro cenário que se beneficia de alguns poucos dados de tabelas em arquivos texto acontece quando algum processo de build automático da plataforma ou aplicação precisa realizar testes unitários que requerem dados sem precisar da conexão com o banco.

Os objetos de banco de dados são muito importantes e existem diversas recomendações de design para sua definição. Em relação ao aspecto de nomenclatura, vale a pena destacar que já existem regras, recomendações, padrões e sugestões prontos que podem ser seguidos para garantir que nomes adequados sejam atribuídos aos objetos. Novamente, as referências clássicas de refatoração e de código limpo são muito úteis para auxiliar a criação de uma política de nomenclatura de elementos envolvidos em scripts SQL, tais como variáveis, parâmetros, funções, constantes e outros.

Em relação a recomendações específicas para a nomenclatura de objetos de banco de dados pode-se citar o artigo “Padronização de nomenclatura” publicado na edição número 100 da revista SQL Magazine. Esse conteúdo discute o tópico sob o ponto de visa de modelagem e apresenta diversos exemplos práticos de regras de nomenclatura. Por outro lado, o artigo “Análise do modelo de dados do WordPress, Joomla, Drupal e Magento” publicado na edição número 86 da revista SQL Magazine faz críticas aos nomes de objetos e de outros aspectos dos modelos de bancos de dados de aplicações empregadas para a gestão de conteúdo dinâmico em páginas web.

Controle de modificações e versionamento

Uma vez que os scripts com as definições dos objetos dos bancos de dados estão separados por objetos, recomenda-se utilizar alguma ferramenta para o controle de modificações e versionamento. Em geral, esse tipo de ferramenta lida com arquivos texto de modo a permitir o armazenamento, organização e rastreamento do histórico das versões.

Ferramentas como o GitHub, CVS, Team Server e outras são muito úteis para o controle de modificações e versionamento de arquivos texto que contém o código fonte. Contudo, o principal foco dessas ferramentas é lidar com arquivos texto de código fonte de aplicações escrito em linguagens de programação tais como C#, Java, JavaScript, C, PHP, Python e outras. Devido a esse foco, infelizmente a maioria das ferramentas não possui nenhum tipo de recurso adicional voltado para banco de dados.

Geralmente as ferramentas de controle de versão não possuem recursos para garantir que o objeto criado no banco de dados contém exatamente o objeto cuja definição está no script. Além disso, geralmente não há suporte para indicar diferenças nas configurações de bancos de dados entre ambientes, algo muito útil para quem lida com ambientes heterogêneos (diferentes bancos de dados em diferentes plataformas) e precisa saber as diferenças de configurações de servidor e de banco de dados antes de realizar uma migração.

Atualmente já existem ferramentas de controle de versão específicas para a gestão de mudanças e configurações de banco de dados, cujas funcionalidades atendem às necessidades não supridas pelas ferramentas tradicionais e comuns de controle de versão. Por exemplo, a Liquibase suporta diferentes bancos de dados, gera documentação de modificações em formatos XML, YAML, JSON e SQL, pode ser integrada com processo de build e também possui recursos para revisão de código SQL.

Outra ferramenta específica para o gerenciamento de modificações de banco de dados é o Sqitch. O funcionamento desse software é um pouco diferente do Liquibase, pois é necessário escrever alguns scripts para cada funcionalidade implementada. Por exemplo, vamos supor que desejamos criar um novo usuário no MySQL. Para lidar com esse novo objeto no banco de dados utilizando o Sqitch é necessário escrever ao menos três scripts para: 1) Criar o usuário; 2) Reverter a criação com usuário; e 3) Verificar se o usuário foi criado. As Listagens 10, 11 e 12 apresentam como seriam esses scripts considerando um banco de dados do MySQL que já possua a ferramenta Sqitch instalada.

Listagem 10. Script de criação do usuário flipr no MySQL com o Sqitch.

-- Primeiro Deploy: criando o usuário flipr no MySQL

  BEGIN;

    CREATE USER flipr;

  COMMIT;
Listagem 11. Script para reverter a criação do usuário flipr.

-- Primeiro Deploy: revertendo a criação do usuário flipr no MySQL.

  BEGIN;

   DROP USER flipr;

  COMMIT;
Listagem 12. Script para verificar a presença do usuário flipr.

-- Primeiro Deploy: verificando a presença usuário flipr no MySQL.

  SELECT sqitch.checkit(COUNT(*), 'User "flipr" does not exist')
   FROM mysql.user WHERE user = 'flipr';
A partir dos scripts para criar, reverter e verificar funcionalidades e objetos de banco de dados é possível utilizar a ferramenta de linha de comando sqitch com parâmetros como status, revert, log e verify para controlar cada modificação durante o processo de build e deploy de uma aplicação. Dessa forma é possível integrar a gestão de mudanças e configurações no banco de dados com processos de build automáticos e também ferramentas de controle de versão.

Do ponto de vista gerencial, investir em recursos específicos para a gestão de configurações e mudanças no banco de dados é muito importante para implementar a integração contínua, além de fornecer diversas estatísticas e relatórios relacionados a funcionalidades e mudanças associadas com o banco de dados.

Testes

Quando se discute aspectos de refatoração e mudanças em código fonte, é praticamente certo que também haverá uma discussão sobre testes. De fato, essa associação entre refatoração/mudanças com testes é muito importante, pois é através desse último que haverá a garantia de que o funcionamento do código vai ser mantido após as modificações de “polimento” serem implementas.

Assim como em outros aspectos relacionados ao gerenciamento de código fonte SQL, existem poucos recursos para a implementação de testes no banco de dados. Todavia, existem soluções para implementar técnicas de validação de banco de dados e TDD (Test Drive Development) de scripts SQL.

Um dos recursos já comentados que se destaca para auxiliar a validação é a ferramenta Sqitch, pois pela necessidade de se escrever scripts para reverter e validar objetos e propriedades do banco de dados, já é possível obter um controle melhor da validação de requisitos associadas a modificações no banco de dados. Outra ferramenta interessante e muito útil para migrar, limpar, validar, criar um baseline e reparar bancos de dados é a Flyway. Contudo, o Flyway se concentra apenas nos objetos do esquema do banco de dados e não em configurações gerais.

A implementação de TDD em banco de dados pode ser feita de várias formas, inclusive de forma manual e sem o auxílio de nenhum tipo de ferramenta. De fato, a técnica TDD propõem escritas de testes independente de tecnologia, plataforma ou mesmo ambiente de programação. Contudo, atualmente já existem alguns recursos interessantes que auxiliam a implementação de TDD no banco de dados com objetivo de automatizar a verificação de cada teste unitário escrito.

Um desses recursos é o framework TSQLUnit. Essa suíte para testes unitários é baseada no formato “xUnit”, ou seja, a maneira de lidar com testes unitários popularizada devido a ferramentas com o JUnit para Java. O TSQLUnit contém recursos para auxiliar a verificação de testes em stored procedures escritas em TSQL, a linguagem de programação do SQL Server.

Utilizando o JUnit no Java, podemos utilizar anotações prefixadas pelo caractere @ para indicar que um método faz parte de um teste. Com o TSQLUnit essa indicação é feita pelo nome do objeto: todas as stored procedures que começarem com o prefixo ‘ut_’ são consideradas testes. O TSQLUnit possui algumas stored procedures para executar e verificar os resultados dos testes, tais como tsu_runTests e tsu_Describe.

Como exemplo, vamos supor que precisamos implementar uma stored procedure simples que calcula a média de preços. Seguindo a linha do TDD, primeiro vamos criar um teste que irá falhar porque ainda não criamos a stored procedure que calcula a média.

O teste que vamos criar irá seguir a sequência de passos indicada pela sigla SEAT (Setup, Exercise, Assert, Teardown). Esses passos indicam que precisamos preparar a condição de testes pela manipulação de objetos (Setup), fazer a chamada do código de produção (Exercise), checar se o resultado desejado é igual ao resultado esperado (Assert) e retornar o ambiente para o estado antes do teste (Teardown).

No TSQLUnit precisamos fazer os passos do SEAT manualmente e também utilizar a stored procedure tsu_Failure somente se o teste unitário falhar. A stored procedure que fará o cálculo da média ainda não foi criada e se chamará st_calcula_media. Já o teste unitário simples para esse objeto receberá o nome de ut_st_calcula_media e seu código fonte é apresentado na Listagem 13. O leitor deve notar que antes de criar essa stored procedure é preciso instalar corretamente o framework TSQLUnit.

Listagem 13. Stored procedure com o teste unitário para checar o cálculo da média.

CREATE PROC dbo.ut_st_calcula_media
  AS
   SET NOCOUNT ON

   -- Setup: incluindo dados de teste
  INSERT INTO dbo. TABELA_PRECOS VALUES (10.0)
  INSERT INTO dbo. TABELA_PRECOS VALUES (8.5)
  INSERT INTO dbo. TABELA_PRECOS VALUES (3.9)
  INSERT INTO dbo. TABELA_PRECOS VALUES (2.6)

  -- Exercise: chamando a procedure e obtendo o resultado
   DECLARE @PrecoMedioObtido MONEY
   EXEC dbo. st_calcula_media @PrecoMedioObtido OUT

   -- Assert: verificando o resultado
   DECLARE @PrecoMedioEsperado MONEY
   SET @ PrecoMedioEsperado = 6.25 --(10.0+8.5+3.9+2.6)/4 = 6.25
   IF (@PrecoMedioEsperado!= @ PrecoMedioObtido)
      EXEC dbo.tsu_Failure ' st_calcula_media falhou no teste.'

  -- Teardown: feito de forma implícita por um ROLLBACK TRAN
  GO
Para verificar o resultado do teste unitário implementado na stored procedure ut_st_calcula_media, basta chamar tsu_runTests, que se encarrega de chamar todas as stored procedures do banco de dados que iniciam pelo prefixo ut_. A execução de tsu_runTests automaticamente cria uma transação, faz a chamada de ut_st_calcula_media, retorna um erro porque ainda não foi criada a stored procedure st_calcula_media e faz um rollback automaticamente.

Uma vez que o teste já foi criado, testado e uma falha foi gerada, podemos criar a stored procedure que faz o cálculo da média. O código fonte de st_calcula_media é simples, pois ele basicamente contém uma instrução SELECT com a função de agregação AVG para o cálculo da média. É importante destacar que a stored procedure deve retornar um valor como parâmetro de output para que ela possa ser utilizada com o framework TSQLUnit. A Listagem 14 apresenta o código fonte de st_calcula_media.

Listagem 14. Procedure st_calcula_media que calcula a média de preços.

CREATE PROCEDURE dbo.st_calcula_media
  @PrecoMedio MONEY OUT
  AS
  BEGIN
       SELECT @PrecoMedio  = AVG(PRECO)
       FROM TABELA_PRECOS
  END
A partir do momento que st_calcula_media possui seu teste unitário, podemos começar a implementar refatorações e técnicas de polimento de código nesta procedure. Dessa forma, estamos protegidos da possibilidade de alguma mudança no código alterar o comportamento, pois caso isso ocorra existe um teste unitário que verificará se o cálculo da média continua a ser feito corretamente.

Existem outros recursos do framework TSQLUnit tal como a possibilidade de agrupamento de testes, execução independente e compartilhamento de código para os passos de Setup e Teardown, porém fica a cargo do leitor explorar esses recursos em seu ambiente de desenvolvimento.

A necessidade de trabalhar com banco de dados requer a organização e aprimoramento contínuo do código fonte que manipula dados. Esse código fonte geralmente contém instruções SQL e outros elementos de programação, tais como variáveis, estruturas condicionais, loops, funções e outros.

Assim como o código fonte escrito em linguagens de programação que dá origem a sistemas e aplicações, o código SQL contido dentro de scripts também sofre alterações realizadas por diversos profissionais ao longo do tempo. Sendo assim, recomenda-se o uso de técnicas que aumentem a manutenibilidade do código para que seja mais simples e fácil lidar com ele no futuro.

Esse artigo apresentou técnicas para formatação de texto, refatoração e rejuvenescimento de código, formatação de comentários, separação de objetos, controle de modificações e testes focando em código fonte que é executado dentro de um banco de dados. Apesar dos recursos existentes incentivarem o uso dessas técnicas apenas durante a programação tradicional, o conteúdo desse artigo mostrou que também é possível aplicá-las no contexto de banco de dados.

A partir do que foi apresentado, pode-se concluir que existem diversos recursos, práticas, técnicas e recomendações para transformar o código que vai ser executado no contexto de banco de dados em algo mais “polido”, ou seja, mais apresentável, para que futuras modificações possam ser realizadas. Portanto, o leitor que seguir o que foi apresentado se prepará para lidar de forma mais profissional com o código fonte, além de potencialmente aumentar suas habilidades para lidar com instruções e comandos que manipulam dados de forma funcional e estética, futuramente auxiliando outros profissionais e a si mesmo.

Links Úteis
http://www.dpriver.com/pp/sqlformat.htm
http://www.ambysoft.com/books/refactoringDatabases.html#HowToObtain
http://www.sqlsharp.com/
http://www.liquibase.org/
http://sqitch.org/
https://flywaydb.org/
http://sourceforge.net/projects/tsqlunit/
Saiba mais sobre a Linguagem SQL ;)
Guia de Referência Linguagem SQL (DML)
Primeiros passos com a linguagem SQL