Introdução

No curso anterior vimos como utilizar o props para enviar alguns dados a outros componentes.
O props permite enviar dados do tipo string, number, boolean etc.

Um recurso interessante é que, com o uso do props, podemos também enviar um state ou até funções
JavaScript para outros componentes.

Enviar um state através de props, em algumas situações, nos permitir fragmentar mais o nosso
código em componentes menores - o que é desejável na programação com React.

Neste curso veremos como utilizar o props + useState para enviar dados a outros componentes.
Contudo, vejamos antes uma breve revisão sobre os conteúdos de useState e props.



useState

Revisando o conteúdo sobre useState

Nos cursos anteriores vimos a criação de variáveis de estado através do Hook useState.
A ideia do useState é: todos os componentes que fazem uso da variável de estado são atualizados
automaticamente quando seu valor é alterado.


Veja no exemplo abaixo como a variável de estado (state) é utilizada:

exemplo_1


Revisando o conteúdo sobre props

Nos cursos anteriores vimos como enviar dados entre componentes com o uso do props.
A ideia do props é: enviar dados em forma de propriedades de um componente para outro para
facilitar a componentização do código React.

Veja no exemplo abaixo como o props é utilizado:

exemplo_2

O propósito desse novo curso é entender que podemos utilizar o useState + props para
enviar um state entre componentes.

Esse conhecimento nos permite componentizar (dividir) ainda mais o nosso código React.
Veremos mais exemplos nas próximas aulas.

Com o uso do props, podemos também enviar um state ou até funções JavaScript para outros componentes