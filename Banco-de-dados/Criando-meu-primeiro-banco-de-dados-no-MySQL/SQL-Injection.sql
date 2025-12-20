Resumo – SQL Injection

SQL Injection é uma técnica de ataque em que o invasor insere ou manipula comandos SQL enviados pela aplicação ao banco de dados. Isso acontece porque a aplicação confia nos dados digitados pelo usuário e, muitas vezes, se conecta ao banco usando usuários com privilégios elevados.

Essa vulnerabilidade afeta sistemas que utilizam SQL padrão (ANSI), como SQL Server, Oracle, MySQL, entre outros.

O que é SQL Injection e por que funciona?

O SQL Injection funciona principalmente por dois motivos:

Falta de validação dos dados de entrada (inputs do usuário);

Conexão com o banco usando usuários com muitos privilégios.

Com isso, comandos SQL maliciosos podem ser executados diretamente no banco.

Exemplo clássico: ataque na tela de login

Uma aplicação monta a consulta SQL assim:

SELECT * FROM users 
WHERE username = 'usuario' 
AND password = 'senha';


Como não há validação, o invasor pode digitar:

Exemplo 1 – Login sem senha

Username: admin'--
Password:


O -- transforma o resto da consulta em comentário, ignorando a senha.

Exemplo 2 – Login sem saber usuário

Username: ' OR 1=1--
Password:


Como 1=1 é sempre verdadeiro, a consulta retorna todos os usuários, autenticando o primeiro.

Exemplo 3 – Ataque destrutivo

Username: '; DELETE FROM users--
Password:


Esse comando pode apagar todos os usuários da tabela.

Ataques usando mensagens de erro

Quando a aplicação retorna erros detalhados do banco, o atacante pode:

Descobrir nomes de tabelas e colunas;

Identificar tipos de dados;

Obter usuários, senhas e privilégios;

Descobrir a versão do banco e do sistema operacional.

Exemplo

Usando erros com HAVING, GROUP BY e UNION, o invasor consegue mapear toda a estrutura da tabela USERS e até extrair dados como:

Usuários: admin, guest, chris, fred

Senhas: r00tr0x!, guest, password, sesame

Escalada de ataques (controle do servidor)

Após dominar o banco, o atacante pode:

Executar comandos do sistema operacional com XP_CMDSHELL;

Ler ou alterar o registro do Windows com XP_REGREAD;

Iniciar/parar serviços (XP_SERVICECONTROL);

Criar arquivos no servidor (BCP);

Ler arquivos do servidor (BULK INSERT);

Criar scripts ActiveX com sp_OACreate.

👉 Isso pode levar ao controle total do servidor.

Como prevenir SQL Injection (dicas essenciais)
1. Valide sempre os dados do usuário

Prefira aceitar apenas dados conhecidos como válidos.

Exemplo: permitir apenas letras e números em campos como usuário.

2. Use usuários com permissões mínimas

Nunca conectar com usuário administrador ou dono do banco.

3. Nunca exiba mensagens de erro do banco

Erros revelam informações críticas para ataques.

4. Remova recursos desnecessários

Desabilite ou remova extended stored procedures que não são usadas.

Remova bancos de exemplo como PUBS e NORTHWIND.

5. Habilite e monitore logs de segurança

Analise tentativas de login e atividades suspeitas.

Conclusão

O SQL Injection é uma vulnerabilidade poderosa e perigosa.
Os principais causadores são:

Falta de validação dos dados de entrada;

Uso de usuários com privilégios excessivos.

Com boas práticas de validação, controle de permissões e tratamento correto de erros, é possível reduzir drasticamente o risco desse tipo de ataque e tornar a aplicação muito mais segura.