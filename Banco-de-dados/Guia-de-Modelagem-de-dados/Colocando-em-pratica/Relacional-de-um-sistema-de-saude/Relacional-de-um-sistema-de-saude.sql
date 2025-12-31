O artigo demonstra na prática como aplicar a modelagem relacional no desenvolvimento de um sistema de saúde, destacando:

Importância da modelagem de dados

Uso do Modelo Entidade-Relacionamento (ER)

Definição correta de chaves primárias e estrangeiras

Geração automática do script SQL a partir do DER usando o MySQL Workbench

Importância da Modelagem de Dados

A modelagem de dados é a primeira e uma das mais importantes etapas de um projeto de banco de dados, pois:

Representa formalmente a estrutura do banco

Identifica entidades, atributos e relacionamentos

Reduz erros futuros e retrabalho

Garante integridade, confiabilidade e qualidade dos dados

⚠️ Dica importante:
Ignorar ou apressar a modelagem pode comprometer todo o sistema, especialmente em domínios complexos como saúde.

Modelo Utilizado

Modelo Entidade-Relacionamento (ER)

Representado graficamente pelo Diagrama Entidade-Relacionamento (DER)

Independente da tecnologia (modelagem conceitual)

A modelagem é:

Iterativa

Evolui conforme o entendimento do domínio cresce

Facilita comunicação entre analistas, desenvolvedores e usuários

Estudo de Caso: Sistema de Saúde (Ambulatorial)
Escopo

Interação entre paciente e médico em atendimentos ambulatoriais, incluindo:

Diagnósticos

Prescrições

Exames

Medicamentos

Procedimentos

Protocolos clínicos

Principais Entidades do Sistema
Pessoa (Entidade Genérica)

Criada para evitar redundância, pois paciente e médico compartilham muitos atributos.

Atributos principais:

Nome

Data de nascimento

CPF / RG

Sexo

Estado civil

Tipo sanguíneo

Pai e mãe (autorrelacionamento)

Status ativo

📌 Boa prática: uso de especialização (Pessoa → Paciente / Médico).

Paciente

Código SUS

Indicador de doador

Relacionamento 1:1 com Pessoa

Médico

Código do conselho

Data de início de contrato

Pode ter várias especialidades

Relacionamento 1:1 com Pessoa

Especialidade

Descrição

Data de cadastro

Indicador ativo

Relacionamento N:N com Médico → tabela intermediária especialidade_medico.

Atendimento

Representa a consulta médica:

Unidade de atendimento

Médico

Paciente

Diagnóstico

Data

Descrição

Indicação de retorno

Atendimento pai (autorrelacionamento)

📌 Regras importantes:

Todo atendimento tem um paciente

Todo atendimento tem um médico

Todo atendimento tem um diagnóstico

Unidade de Atendimento

Nome

CEP

Diagnóstico

Descrição

Relacionamento N:N com CID

CID (Classificação Internacional de Doenças)

Código único mundial

Descrição

Pode estar associado a um protocolo

Protocolo

Conjunto de itens de prescrição sugeridos

Pode estar ligado a vários CIDs

Relacionamento N:N com itens de prescrição

Prescrição e Itens de Prescrição
Prescrição

Pertence a um atendimento

Data de criação

Observações

Pode ter vários itens

Item de Prescrição

Pode ser:

Medicamento

Exame

Procedimento

Possui status ativo/inativo

Usa chave composta

Relacionado a tipo_item_prescricao

⚠️ Observação importante:
Essa diferenciação é uma integridade semântica, não totalmente representável no DER.

Medicamento

Nome

Substância

Indicação se é genérico

Exame

Nome

Orientações

Procedimento

Nome

Pode depender de outro procedimento (autorrelacionamento)

Relacionamentos Importantes

Pessoa → Sexo (N:1)

Pessoa → Estado Civil (N:1)

Pessoa → Pessoa (pai/mãe) — autorrelacionamento

Médico ↔ Especialidade (N:N)

Atendimento → Médico / Paciente / Diagnóstico / Unidade

Diagnóstico ↔ CID (N:N)

Prescrição ↔ Item Prescrição (N:N)

Protocolo ↔ Item Prescrição (N:N)

Chaves no Modelo Relacional
Chave Primária

Identifica unicamente cada registro

Pode ser:

Simples (1 atributo)

Composta (2 ou mais atributos)

Chave Estrangeira

Implementa relacionamentos

Garante integridade referencial

Regras da integridade referencial:

Mesmo domínio da PK referenciada

Valor existente na tabela pai ou nulo

Script SQL
Estratégia adotada

Script gerado automaticamente pelo MySQL Workbench 6

Chaves estrangeiras criadas ao final, garantindo:

Melhor organização

Evita referências a tabelas inexistentes

Exemplo (Pessoa)
CREATE TABLE pessoa (
 cod_pessoa INT PRIMARY KEY,
 desc_pessoa VARCHAR(100),
 data_nascimento DATETIME,
 cod_sexo INT,
 cod_estado_civil INT,
 cod_pessoa_pai INT,
 cod_pessoa_mae INT
);

Exemplo de chave estrangeira
ALTER TABLE pessoa
ADD CONSTRAINT fk_pessoa_sexo
FOREIGN KEY (cod_sexo)
REFERENCES sexo (cod_sexo);

Diagrama Entidade-Relacionamento (DER)

Representa visualmente:

Entidades

Relacionamentos

Cardinalidades

Facilita entendimento e manutenção

Gera automaticamente o SQL

📌 Ferramenta utilizada: MySQL Workbench 6.0

Conclusão

Uma modelagem de dados bem feita:

Reduz custos futuros

Aumenta a confiabilidade do sistema

Evita inconsistências

Facilita evolução do projeto

Apesar dos conceitos parecerem simples, aplicá-los corretamente exige profundo entendimento do domínio, especialmente em sistemas críticos como os de saúde.