# Estudos de caso: Alura Challenge BI - #2 Edição.

## Introdução

Bem vindo!
Neste repositório estarão meus insights de acordo com o [Desafio Alura de BI](https://www.alura.com.br/challenges/bi-2/), desenvolvido em Março de 2022. O Alura Challenge é uma maneira de complementar os treinamentos da Alura que, em sua maioria, são muito mais expositivos. Portanto, durante essas semanas de imersão podemos colocar em prática tudo o que foi aprendido nos muitos cursos da plataforma.

Três empresas nos contrataram para entender suas bases de dados e exibir informações relevantes com o objetivo de auxiliar suas tomada de decisões.

- A primeira empresa, **Alura Films**, necessita analisar dados sobre o [**IMDB**](https://www.imdb.com/) dos filmes e suas informações.
- A segunda empresa, **Alura Food**, precisa de um dashboard para analisar o **mercado de restaurantes** na **Índia**.
- A terceira empresa, **Alura Skimo**, precisa analisar as métricas de suas **vendas**.

## Alura Filmes
### Contexto do negócio
[Clique aqui para ir ao dashboard](https://app.powerbi.com/groups/me/reports/277c173f-f08d-41c8-8a67-501bc36664ba/ReportSection)

A **Alura Films** objetiva identificar a **seleção ideal** de elenco e produção.
Como perguntas de negócio, foram elencadas as seguintes problemáticas:

- Filmes mais votados
- Gêneros mais rentáveis 
- Estrelas que mais aparecem nos filmes
- Explorar meta score, IMDB e número de votos
- O percentual dos (n) gêneros mais explorados nos filmes

Particularmente eu acho interessante dashboards que são elaborados em *one page* quando possível. Analisando as perguntas feitas pelos stakeholders, busquei um layout que permitisse que todos os insights estivem disponíveis em uma única tela.

![dashboard-img1](https://user-images.githubusercontent.com/81444128/156164692-dd8677c7-b4f2-4af3-b2f0-dd7627e438a2.png)

### Composição do Dashboard

Podemos dividir o dashboard nas seguintes partes:
- **Big Numbers**: nossa proposta é trazer informações mais gerais e rápidas para os tomadores de decisão, criando um onverview do negócio;
- **Incidência de astros**: exploramos os astros que são comumente escalados. Como podemos ver, o campeão de escalações (e arrecadação) é Tom Hanks;
- **Principais gêneros**: os filmes podem ter várias classificações e, por isso, optamos por permanecer com a estrutura do dataset. No gráfico,observamos que os gêneros mais rentáveis são os de "Ação, Aventura e Fantasia", seguido por "Ação, Aventura e Sci-Fi";
- **Análise de Gross (faturamento)**: o dataset segmenta os astros por estrelas e, ao cruzar essas informações com o faturamento, podemos ver quais atores/atrizes tiveram maior arrecadação.

### Explorando os dados

Considerando esta primeira semana, entendemos que não é exatamente necessária a elaboração de querys e ETL em SQL ou Python. Porém, utilizamos um pouco de SQL para explorar os dados e conhecer o dataset que estávamos trabalhando.

<details><summary>SQL</summary>

```sql

-- Filmes mais votados

select 
	Noofvotes as Votos, 
    Series_Title as Titulos
from alura.filmes
group by 1,2;

-- Explorando IMDB, Score e Número de votos

select
	Series_Title as Titulos,
    IMDB_Rating as Classificao_IMDB,
    Meta_Score as Meta_Score,
    Noofvotes as Votos
from alura.filmes
group by 1,2,3,4;

-- Avaliando o percentual dos gêneros mais explorados nos filmes

select
	Genre as Genero,
    count(Genre) as n,
    count(Genre) OVER () as total_filmes,
    round((count(genre) / count(Genre) OVER ()) *100,2) as porcentagem_participacao
from alura.filmes
group by 1

```
</details>
