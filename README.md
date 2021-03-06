# Criação e versionamento de Databases SQL Server no VS 2017

Database Change Tracking With Visual Studio and Git

Normalmente, quando se trata de banco de dados SQL Server e desenvolvimento .NET, é comum se utilizar de algum ORM, tal como Entity Framework para mapear as entidades em alguma camada, ou até mesmo utilizar o Migrations em uma estratégia de Code First. Nesse cenário, qualquer alteração efetuada no banco de dados, digamos que por um DBA ou alguém da equipe, não será refletido automaticamente no seu código fonte, levando a erros.

Uma alternativa muito interessante e recomendada em alguns projetos, seria criar um projeto de banco de dados dentro da própria solução do projeto e gerenciar os objetos e suas alterações pela IDE, fazendo uso da feature Schema Compare.

## Benefícios e cenários para utilizar essa abordagem

- É possível criar ou atualizar os objetos do banco (tabelas, views, schemas, etc) diretamente do projeto
- É possível versionar o seu banco de dados como parte integral da sua solução
- É possível identificar rapidamente as alterações efetuadas no banco de dados, sabendo quem o fez e quando o fez
- É rápido para subir uma cópia da estrutura da sua base de dados em qualquer outro local

## O que é necessário para criar um Database Project no Visual Studio 2017

Além do Visual Studio 2017 instalado (podendo ser até a versão Community), será necessário instalar o SQL Server Data Tools para Visual Studio. Na referência do artigo, você pode encontrar o link. Efetue a instalação e depois reinicie sua máquina.


## Criando o projeto

Após instalação do SQL Server Data Tools para criar o projeto, abra o Visual Studio, selecione ```File > New > Projec```.

Existe uma categoria de instalação chamada “SQL Server” e uma opção de ```SQL Server Database Project```.


![](data/01-1.jpg)

Para efeito de testes, utilizando o SQL Server Management Studio, crie um database de demo com uma única tabela.

![](data/02-2.jpg)

No Visual Studio, abra a “Solution Explore” e clique com o botão direito do mouse em cima do projeto. Selecione a opção “Schema Compare”.

![](data/03-1.jpg)

O **Schema Compare** é responsável por analisar o que você tem de objetos na sua solução e comparar com o que existe na base de dados. Nesse primeiro cenário, vamos analisar da base de dados para o nosso projeto local.

Do lado esquerdo temos o projeto local e ao lado direito, temos que selecionar um “Target”, ou seja, qual é a instância e banco de dados que vamos analisar.

![](data/RD.jpg)

Clique em “Select Connection”.

![](data/screenshot-005.jpg)

Em seguida, informe “Server Name”, o tipo de autenticação (usuário e senha ou Windows Authentication), senha (se houver) e qual a base de dados.

![](data/sas-1.jpg)

Agora, analise que temos ao lado esquerdo o caminho do nosso projeto; ao lado direito a configuração de qual database faremos conexão e comparação; no meio, o botão “Switch” que serve para trocar o tipo de visuação (Database > Fonte ou Fonte > Database). Clique no botão “Switch” para inverter a ordem. Nós olharemos do Database para o Fonte.

E o botão sinalizado em amarelo, é o botão que fará a comparação. Clique nele em seguida.

![](data/07.jpg)

Ao realizar o “Compare” é exibida uma lista com quais objetos existem no banco de dados e não estão presentes em nosso projeto.

![](data/08.jpg)

Para atualizar e sincronizar, clique em “Update” (sinalizado em amarelo). Agora temos a tabela “Usuario” representada em arquivo SQL em nosso projeto.

![](data/09.jpg)

### Alterando a entidade e refletindo no banco de dados

Clicando no arquivo “Usuario.sql” você poderá editar, tanto por SQL ou pela IDE as características do objeto.

![](data/TEM.jpg)

Nesse caso, acrescentaremos mais uma coluna.

![](data/11.jpg)

No Schema Compare, vamos solicitar que ele visualize do arquivo local do projeto para a base de dados.

![](data/12.jpg)

Efetue o “Compare” e podemos ver que localmente temos diferenças mas ainda não aplicamos na base de dados.

![](data/13.jpg)

Para isso, clique em “Update” e veja a alteração no Visual Studio:

![](data/rered.jpg)

E também no SQL Server Management Studio:

![](data/BLUEE.jpg)

## Referências

Instalação do SQL Server Data Tools para Visual Studio:

- https://www.visualstudio.com/pt-br/vs/features/ssdt/
- https://imasters.com.br/desenvolvimento/criacao-e-versionamento-de-databases-sql-server-no-vs-2017
- https://microsoft.github.io/PartsUnlimited/db/200.6x-Database-SetupSSDTanddbwithVSandVSTS.html
- https://www.c-sharpcorner.com/article/create-sql-server-database-project-with-visual-studio/

Video passo-a-passo mostrando a solução:

- https://www.youtube.com/watch?v=mSMd-CQ6i5M




