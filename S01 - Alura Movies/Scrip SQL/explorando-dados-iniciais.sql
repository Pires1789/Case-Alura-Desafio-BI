# Criando database
create database Alura;
use Alura;

# Filmes mais votados
select Noofvotes, Series_Title from alura.filmes
group by 1,2;

# Explorando IMDB, Score e Número de votos
select
	Series_Title,
    IMDB_Rating,
    Meta_Score,
    Noofvotes
from filmes
group by 1,2,3,4;

# Avaliando o percentual dos gêneros mais explorados nos filmes
select
	Genre,
    count(Genre),
    count(Genre) OVER () as total_filmes,
    round((count(genre) / count(Genre) OVER ()) *100,2) as porcentagem_participacao
from filmes
group by Genre

# Criando um case com o nome dos filmes
