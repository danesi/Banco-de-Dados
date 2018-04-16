create table clube (
codclube integer not null,
nome char(40),
dirigente char(40),
primary key (codclube));

create table jogador (
codjogador integer not null,
nome char(40),
datanasc date,
primary key (codjogador));


create table patrocinador (
codpatroc integer not null,
nome char(40),
primary key (codpatroc));

create table joga (
codclube integer not null,
codjogador integer not null,
datainicial date,
datafinal date,
posicao char(15),
salario integer,
primary key (codclube, codjogador),
foreign key (codclube) references clube,
foreign key (codjogador) references jogador);

create table jogo (
codclubecasa integer not null,
codclubevisit integer not null,
datajogo date,
golsclubecasa integer,
golsclubevisit integer,
primary key (codclubecasa, codclubevisit, datajogo),
foreign key (codclubecasa) references clube,
foreign key (codclubevisit) references clube);


create table patrocclube (
codpatroc integer not null,
codclube integer not null,
primary key (codpatroc, codclube),
foreign key (codpatroc) references patrocinador,
foreign key (codclube) references clube);


insert into clube values (01, 'Grêmio', 'Paulo Odone');
insert into clube values (02, 'Internacional', 'Fernando Carvalho');
insert into clube values (03, 'Corinthians', 'Roque Citadini');
insert into clube values (04, 'Flamengo', 'Cléber Leite');
insert into clube values (05, 'Palmeiras', 'Juvenal Juvêncio');

insert into jogador values (01, 'Lucas', '12/02/1982');
insert into jogador values (02, 'Galatto', '28/09/1984');
insert into jogador values (03, 'Tinga', '21/10/1978');
insert into jogador values (04, 'Clemer', '14/06/1972');
insert into jogador values (05, 'Tevez', '02/04/1980');
insert into jogador values (06, 'Marcos', '05/05/1976');
insert into jogador values (07, 'Fabiano Eller', '07/12/1975');
insert into jogador values (08, 'José', '08/04/1977');

insert into patrocinador values (01, 'Tim');
insert into patrocinador values (02, 'Banrisul');
insert into patrocinador values (03, 'Panasonic');
insert into patrocinador values (04, 'Siemens');
insert into patrocinador values (05, 'Philips');

insert into joga values (01, 01, '01/01/2005', null, 'Volante', 30000);
insert into joga values (01, 02, '01/01/2005', null, 'Goleiro', 25000);
insert into joga values (01, 03, '01/01/2001', '31/12/2003', 'Volante', 40000);
insert into joga values (02, 03, '01/01/2004', null, 'Volante', 45000);
insert into joga values (04, 04, '01/01/1998', '31/12/2001', 'Goleiro', 30500);
insert into joga values (02, 04, '01/01/2002', null, 'Goleiro', 35000);
insert into joga values (03, 05, '01/01/2004', null, 'Atacante', 100000);
insert into joga values (01, 06, '01/01/1997', '31/12/1998', 'Goleiro', 50000);
insert into joga values (05, 06, '01/01/1999', null, 'Goleiro', 70000);
insert into joga values (02, 07, '01/01/2005', null, 'Zagueiro', 40000);
insert into joga values (04, 07, '01/01/1999', '31/12/2003', 'Zagueiro', 30000);
insert into joga values (03, 08, '01/01/1995', '31/12/1997', 'Atacante', 20000);
insert into joga values (05, 08, '01/01/1998', '31/12/2000', 'Atacante', 30000);
insert into joga values (01, 08, '01/01/2001', '31/12/2004', 'Atacante', 40000);
insert into joga values (02, 08, '01/01/2006', null, 'Atacante', 50000);

insert into jogo values (01, 02, '08/09/2000', 0, 0);
insert into jogo values (01, 03, '04/02/2003', 2, 1);
insert into jogo values (04, 02, '03/01/2002', 3, 2);
insert into jogo values (05, 01, '02/12/2005', 1, 1);
insert into jogo values (02, 01, '23/10/2001', 0, 1);
insert into jogo values (03, 05, '21/08/2001', 3, 0);
insert into jogo values (01, 04, '29/11/2004', 4, 1);
insert into jogo values (03, 02, '11/04/2006', 1, 3);

insert into patrocclube values (02, 01);
insert into patrocclube values (02, 02);
insert into patrocclube values (03, 02);
insert into patrocclube values (05, 01);
insert into patrocclube values (01, 04);
insert into patrocclube values (04, 05);
insert into patrocclube values (05, 03);
insert into patrocclube values (01, 05);

=========================================================================================================
SELECT
=========================================================================================================
select * from clube;
select * from jogador;
select * from patrocinador;
select * from joga;
select * from jogo;
select * from patrocclube;

--1. Obter todas as informações de jogadores que tenham nascido após ‘01/01/1976’
select * from jogador where datanasc > '01/01/1976';

--2. Obter o nome de todos os patrocinadores que tenham seu nome iniciado com a letra ‘P’.
select nome from patrocinador where nome like 'P%';

--3. Obter o nome do jogador e sua posição, para todos os jogadores do clube 01. Ordenar por nome de jogador.
select jogador.nome, joga.posicao from jogador, joga where jogador.codjogador = joga.codjogador and joga.codclube = 1 order by 1;

--4. Obter o nome do clube e a posição jogada, para todos os clubes em que o jogador de nome ‘Marcos’ jogou. 
--Ordenar o resultado por nome de clube. 
select clube.nome, joga.posicao from clube, joga, jogador where clube.codclube = joga.codclube and joga.codjogador = jogador.codjogador and jogador.nome = 'Marcos';

--5. Obter o nome do jogador, a data inicial e a posição, para todos os jogadores que jogam no clube
--de nome ‘Internacional’ desde ‘01/01/2000’. Ordenar pelo nome do jogador. 
select g.nome, j.datainicial, j.posicao from clube c, joga j, jogador g where c.codclube = j.codclube and j.codjogador = g.codjogador and c.nome = 'Internacional' and j.datainicial >= '01/01/2000';

--6. Obter o nome do clube visitante, os gols do clube da casa, os gols do clube visitante e a data do
--jogo, para todos os jogos do clube da casa de código 01, em que sua situação foi vitoriosa. 
select clube.nome, jogo.golsclubecasa, jogo.golsclubevisit, jogo.datajogo from jogo, clube  where clube.codclube = 1 and jogo.golsclubecasa > jogo.golsclubevisit;

--7. Obter o nome do clube e o número de patrocinadores por clube, para todos os clubes em que
--jogou o jogador de nome ‘José’. Ordenar o resultado pelo nome do clube 

--8. Obter o nome do clube, a quantidade de gols feitos e o número de jogos jogados, onde o clube
--em questão é o de código 02 e sua situação nos jogos é a de visitante. 


--9. Obter, para todos os jogadores, o nome do jogador, o número de clubes em que ele jogou e a
--média dos salários ganhos nos clubes. 

--10. Obter, para todos os jogos, o nome do clube da casa, o nome do clube visitante, a data do jogo,
--o número de gols do clube da casa e o número de gols do clube visitante. Ordenar pela data dos jogos. 

--11. faça uma consulta que retorne o nome do clube, bem como seus patrocinadores.
select c.nome AS "Nome Clube", t.nome AS "Nome Patrocinador" from clube c, patrocclube p, patrocinador t where c.codclube = p.codclube and p.codpatroc = t.codpatroc;

--12. faça uma consulta que retorne o nome dos clubes em que o jogador 'josé' jogou.
select c.nome from jogador j, joga g, clube c where j.codjogador = g.codjogador and g.codclube = c.codclube and j.nome = 'José';

================= SEM USAR PRODUTO CARTESIANO == ANINHADAS =========================================================
select nome
from clube
where codclube in
	(select codclube
	from joga
	where codjogador in
		(select codjogador
		 from jogador
		 where nome = 'José'));
=======================================================================================================================

--13. obtenha o nome dos jogadores que tiveram contrato como 'palmeiras'.
select nome
from jogador
where codjogador in
	(select codjogador
	from joga
	where codclube in
		(select codclube
		from clube
		where nome = 'Internacional'));


 VAI CAIR NA PROVA ==== VAI CAIR NA PROVA === VAI CAIR NA PROVA === VAI CAIR NA PROVA
 

		
--14. obtenha o nome dos jogadores que NUNCA tiveram contrato com o 'Internacional'.
select nome
from jogador
where codjogador not in
	(select codjogador
	from joga
	where codclube in
		(select codclube
		from clube
		where nome = 'Internacional'));

