O que é Modelagem Conceitual

A modelagem conceitual descreve quais informações o sistema irá gerenciar, sendo um artefato do domínio do problema, e não do domínio da solução.

📌 Ponto-chave:
Ela responde ao “o que precisa ser feito”, e não ao “como será implementado”.

❌ Não deve ser confundida com:

Arquitetura de software

Modelo de dados

Implementação técnica

O Problema do Gap Semântico

O gap semântico é a distância entre o que o usuário solicita e o que o analista entende.

Por que ele acontece?

Usuários dominam o negócio, mas não tecnologia

Analistas dominam tecnologia, mas não o negócio

Linguagens diferentes

Visões parciais do sistema

Mudanças constantes nos requisitos

📌 Consequência:
Grande parte dos fracassos em projetos de software ocorre por falhas na compreensão dos requisitos.

Exemplo clássico: “Balanço Ecológico”

O usuário descreve um problema

Dois analistas diferentes criam modelos conceituais distintos

Nenhum deles representa exatamente o que o usuário esperava

👉 Isso ilustra como a interpretação humana influencia diretamente o resultado.

📊 Diagramas do artigo:

Figura 1: O problema descrito pelo usuário

Figuras 2 e 3: Modelos diferentes vs. expectativa real do usuário

Usuário x Analista de Sistemas
Usuário (Ator Principal)	Analista de Sistemas
Domina regras de negócio	Domina tecnologia
Sabe o que precisa	Não conhece o processo a fundo
Não conhece TI	Depende do usuário

📌 O gap nasce no diálogo entre esses dois mundos.

Como reduzir o Gap Semântico

Comunicação clara

Uso de diagramas

Participação ativa do usuário

Uso de modelagem conceitual

Paradigma orientado a objetos

UML como linguagem comum

📉 Quanto menor o gap, maior a chance de sucesso do projeto.

Domínio do Problema × Domínio da Solução

Domínio do problema: o que deve ser feito

Domínio da solução: como será feito

📌 A modelagem conceitual pertence exclusivamente ao domínio do problema.

Stakeholders

Stakeholders são todos os envolvidos direta ou indiretamente no sistema:

Usuários

Gerentes

Clientes

Donos do negócio

Financiadores

📌 O modelo conceitual deve ser compreensível para todos eles.

Etapas da Modelagem Conceitual (Larman)

(Figura 5)

Conceito do domínio

Visualização do conceito do domínio

Representação em linguagem de programação

1️⃣ Conceito de Domínio

Objetivo:

Entender o problema sem pensar em implementação

📌 Analogia:

Planta de uma casa sem definir materiais ou métodos de construção.

Ferramenta recomendada:

Casos de Uso (UML)

2️⃣ Visualização do Conceito de Domínio

Consiste em abstrair e representar graficamente os conceitos do domínio.

Técnica prática (dica importante):

Ler o caso de uso expandido

Identificar:

Substantivos → possíveis entidades (Cliente, Pagamento)

Verbos → possíveis conceitos (Pagar → Pagamento)

📌 Nem tudo entra no modelo:
O analista filtra o que é relevante para o sistema.

Processo de identificação (Wazlawick)

Identificar conceitos importantes no texto

Agrupar sinônimos

Separar:

Conceitos complexos (entidades)

Atributos simples (nome, data, valor, código)

Classes

Uma classe representa um tipo de objeto do mundo real.

📊 UML:

Retângulo dividido em:

Nome da classe

Atributos

Métodos

(Figuras 6 e 7 mostram a classe Cliente)

Atributos

Variáveis que armazenam dados do objeto

Exemplos:

nome

telefone

dataNascimento

email

Métodos

Representam comportamentos

Operam sobre os atributos

Tornam o objeto dinâmico

Exemplos:

getNome()

setTelefone()

validarCliente()

3️⃣ Representação em Linguagem de Programação

A modelagem conceitual não obriga o uso de uma linguagem OO, mas:

📌 Linguagens orientadas a objetos reduzem o gap semântico, pois:

São mais próximas do modelo conceitual

Facilitam manutenção

Permitem engenharia reversa

Ferramentas citadas:

Rational Rose

JUDE

Umbrello

Exemplo de Código (Java)

(Listagem 1)

A classe Cliente em Java reflete diretamente o modelo conceitual:

public class Cliente {
    String nome;
    int telefone;
    String email;
    Calendar dtNascimento;
    boolean statusCliente = true;

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }
}


📌 Dica importante:
Quanto mais fiel o código for ao modelo conceitual, menor será o gap semântico.

Gap Semântico ao Longo do Projeto

O gap pode surgir:

Durante manutenção

Com novos requisitos

Entre membros da própria equipe

📌 Por isso, a comunicação e a modelagem devem ser contínuas.

Conclusões

Uma boa modelagem depende de bom entendimento do problema

A modelagem conceitual:

Reduz falhas

Melhora comunicação

Aumenta satisfação do cliente

UML e OO ajudam a alinhar:

Usuário

Analista

Sistema final

🎯 Mensagem final:
Reduzir o gap semântico é essencial para o sucesso de qualquer projeto de software.