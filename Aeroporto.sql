create table companhia (
codc 	integer not null,
nomec 	varchar(30) not null,
pais 	varchar(15),
primary key (codc));

create table piloto (
codp 	integer not null,
nomep 	varchar(30) not null,
salario 	real not null,
gratificacoes 	real,
anoingresso 	integer,
pais 	varchar(15),
codc 	integer not null,
primary key (codp),
foreign key (codc) references companhia);

create table aeroporto (
coda 	varchar(3) not null,
nomea 	varchar(30) not null,
cidade 	varchar(20),
pais 	varchar(15),
primary key (coda));

create table voo (
codv 	varchar(6) not null,
origem 	varchar(3) not null,
dest 	varchar(3) not null,
hora 	time,
primary key (codv),
foreign key (origem) references aeroporto,
foreign key (dest) references aeroporto);

create table escala (
codv 	varchar(6) not null,
data 	date not null,
codp 	integer not null,
aviao 	varchar(15),
primary key (codv, data),
foreign key (codv) references voo,
foreign key (codp) references piloto);


insert into companhia values (1, 'TAM', 'Brasil');
insert into companhia values (2, 'Varig', 'Brasil');
insert into companhia values (3, 'GOL', 'Brasil');
insert into companhia values (4, 'American Airlines', 'Estados Unidos');
insert into companhia values (5, 'Air France', 'França');
insert into companhia values (6, 'Lufthansa', 'Alemanha');
insert into companhia values (7, 'TAP', 'Portugal');

insert into piloto values (1, 'Pedro', 12000, 2000, 1990, 'Brasil', 2);
insert into piloto values (2, 'Franz', 15000, 1000, 2000, 'Alemanha', 6);
insert into piloto values (3, 'Alex', 8000, NULL, 2007, 'Brasil', 3);
insert into piloto values (4, 'Jean', 12450, 500, 2005, 'França', 5);
insert into piloto values (5, 'Eric', 9000, NULL, 2005, 'Brasil', 3);
insert into piloto values (6, 'Daniel', 7000, NULL, 2008, 'Brasil', 2);
insert into piloto values (7, 'Manuel', 13250, 1500, 1995, 'Portugal', 7);
insert into piloto values (8, 'Tom', 18000, 3000, 1995, 'Estados Unidos', 4);
insert into piloto values (9, 'Osama', 11000, 1200, 2001, 'Iraque', 1);
insert into piloto values (10, 'Yuri', 10000, 950, 2002, 'Rússia', 5);

insert into aeroporto values ('TXL', 'Tegel', 'Berlim', 'Alemanha');
insert into aeroporto values ('EZE', 'Ezeiza', 'Buenos Aires', 'Argentina');
insert into aeroporto values ('JFK', 'Kennedy International', 'Nova Iorque', 'Estados Unidos');
insert into aeroporto values ('FCO', 'Leonardo da Vinci', 'Roma', 'Itália');
insert into aeroporto values ('MVD', 'Aeroporto Carrasco', 'Montevidéo', 'Uruguai');
insert into aeroporto values ('POA', 'Salgado Filho', 'Porto Alegre', 'Brasil');
insert into aeroporto values ('GIG', 'Tom Jobim', 'Rio de Janeiro', 'Brasil');
insert into aeroporto values ('GRU', 'Guarulhos', 'São Paulo', 'Brasil');
insert into aeroporto values ('BSB', 'Brasília', 'Brasília', 'Brasil');
insert into aeroporto values ('SDU', 'Santos Dumont', 'Rio de Janeiro', 'Brasil');
insert into aeroporto values ('CGH', 'Congonhas', 'São Paulo', 'Brasil');

insert into voo values ('VG001', 'BSB', 'POA', '13:00');
insert into voo values ('TM123', 'GRU', 'EZE', '08:00');
insert into voo values ('GL456', 'SDU', 'CGH', '15:00');
insert into voo values ('AF441', 'GIG', 'FCO', '22:00');
insert into voo values ('TP678', 'FCO', 'GRU', '06:00');
insert into voo values ('LF098', 'TXL', 'EZE', '06:00');
insert into voo values ('AA765', 'MVD', 'JFK', '17:00');
insert into voo values ('TM432', 'CGH', 'GIG', '02:00');
insert into voo values ('GL111', 'EZE', 'POA', '12:00');
insert into voo values ('VG230', 'EZE', 'POA', '08:00');
insert into voo values ('VG333', 'POA', 'MVD', '10:00');
insert into voo values ('AF777', 'JFK', 'FCO', '09:00');
insert into voo values ('TM999', 'GRU', 'TXL', '20:00');

insert into escala values ('VG001', '2008-04-13', 1, 'Boeing 737');
insert into escala values ('TM123', '2008-04-14', 9, 'Airbus A320');
insert into escala values ('GL456', '2008-04-13', 3, 'Boeing 737');
insert into escala values ('AF441', '2008-04-15', 4, 'Boeing 747');
insert into escala values ('TP678', '2008-04-15', 7, 'Airbus A330');
insert into escala values ('LF098', '2008-04-14', 2, 'Airbus A330');
insert into escala values ('AA765', '2008-04-16', 8, 'MD11');
insert into escala values ('TM432', '2008-04-16', 9, 'Fokker 100');
insert into escala values ('GL111', '2008-04-15', 3, 'Boeing 737');
insert into escala values ('VG230', '2008-04-15', 1, 'MD11');
insert into escala values ('VG333', '2008-04-13', 6, 'MD11');
insert into escala values ('AF777', '2008-04-13', 10, 'Boeing 747');
insert into escala values ('TM999', '2008-04-17', 9, 'Airbus A320');
insert into escala values ('VG001', '2008-04-20', 6, 'MD11');
insert into escala values ('TM123', '2008-04-19', 9, 'Boeing 737');
insert into escala values ('GL456', '2008-04-18', 5, 'Boeing 737');
insert into escala values ('AF441', '2008-04-20', 10, 'Airbus A330');
insert into escala values ('TP678', '2008-04-18', 7, 'Boeing 747');
insert into escala values ('LF098', '2008-04-17', 2, 'Boeing 747');
insert into escala values ('AA765', '2008-04-20', 8, 'Boeing 787');
insert into escala values ('TM432', '2008-04-17', 9, 'Fokker 100');
insert into escala values ('GL111', '2008-04-18', 5, 'Fokker 100');
insert into escala values ('VG230', '2008-04-19', 6, 'Boeing 707');
insert into escala values ('VG333', '2008-04-19', 6, 'Boeing 737');
insert into escala values ('AF777', '2008-04-16', 4, 'Airbus A340');
insert into escala values ('TM999', '2008-04-16', 9, 'Airbus A320');

======================================================================================================
select * from companhia;
select * from piloto;
select * from aeroporto;
select * from voo;
select * from escala;

--7. Caso os valores da coluna GRATIFICACOES da tabela PILOTO tenham sido inseridos com NULL,
--escreva um comando para atualizar (UPDATE) tais valores para 0 (zero).
update piloto
set gratificacoes = 0
where gratificacoes is null;

--a) Os dados de todos os pilotos de companhias brasileiras.
SELECT * 
FROM piloto
WHERE piloto.codc in
	(select companhia.codc 
	from companhia
	where companhia.pais = 'Brasil');

--b) O nome de todos os pilotos da Varig.
SELECT nomep
FROM piloto
WHERE piloto.codc in
	(select companhia.codc 
	from companhia
	where companhia.nomec = 'Varig');

--c) O nome de todos os pilotos, junto com seu salário e gratificação.
select nomep, salario, gratificacoes
from piloto;

--d) O nome de todos os pilotos, junto com o total de seus vencimentos, para todos os pilotos que
--voam há pelo menos 5 anos.
select nomep,(salario + gratificacoes) AS "Vencimentos"
from piloto
where anoingresso < 2003;

--e) O nome da cidade e país de destino do voo VG230.
select aeroporto.cidade, aeroporto.pais
from voo, aeroporto
where voo.dest = aeroporto.coda and codv = 'VG230';

--f) As companhias dos vôos escalados para 13/04/2008.
select nomec
from companhia
where codc in
	(select codc
	from piloto
	where codp in
		(select codp
		from escala
		where data = '2008/04/13'));
		

--g) O código de todos os vôos que iniciam por VG ou TM, junto com a respectiva companhia.
(select v.codv, c.nomec 
from companhia c, piloto p, escala e, voo v
where c.codc = p.codc and p.codp = e.codp and e.codv = v.codv and v.codv like 'VG%')
union
(select v.codv, c.nomec 
from companhia c, piloto p, escala e, voo v
where c.codc = p.codc and p.codp = e.codp and e.codv = v.codv and v.codv like 'TM%');

--h) O código de todos os vôos, nome dos pilotos escalados para os mesmos, e respectivos tipo de
--avião e companhia.
select distinct v.codv, p.nomep, c.nomec, e.aviao
from companhia c, piloto p, escala e, voo v
where c.codc = p.codc and p.codp = e.codp and e.codv = v.codv;


--i) O código de todos os vôos e hora de saída, junto com o nome dos pilotos escalados para os
--mesmos, e respectivos tipo de avião e companhia, para todos os vôos de companhias
--estrangeiras.
select v.codv, p.nomep, c.nomec, e.aviao
from companhia c, piloto p, escala e, voo v
where c.codc = p.codc and p.codp = e.codp and e.codv = v.codv and c.pais <> 'Brasil';


--j) O código de todos os vôos para a Alemanha ou Itália, com as respectivas data e hora de saída.
(select distinct v.codv, e.data, v.hora
from escala e, aeroporto a, voo v
where a.coda = v.origem and v.codv = e.codv and a.pais = 'Alemanha')
union
(select distinct v.codv, e.data, v.hora
from escala e, aeroporto a, voo v
where a.coda = v.dest and v.codv = e.codv and a.pais = 'Itália');

--k) A companhia dos pilotos que voam para o Brasil.
select distinct c.nomec
from piloto p, companhia c
where p.codc = c.codc and p.codp in
	(select codp
	from escala
	where codv in
		(select codv
		from voo
		where dest in
			(select coda
			from aeroporto
			where pais = 'Brasil')));

--l) O destino (nome do aeroporto, cidade e país) de todos os vôos da Varig.
select nomea, cidade, pais
from aeroporto
where coda in
	(select dest
	from voo
	where codv in
		(select codv
		from escala
		where codp in
			(select codp
			from piloto
			where codc in
				(select codc
				from companhia 
				where nomec = 'Varig'))));

--m) O nome dos aeroportos de origem e de destino de todos os vôos marcados para o dia
--15/04/2008.
select a.nomea as "Origem", b.nomea as "Destino"
from voo v, aeroporto a, escala e, aeroporto b
where v.origem = a.coda and v.dest = b.coda and v.codv = e.codv and e.data = '2008/04/15';

--n) Os aeroportos de destino (nome, cidade) para todos os vôos da Varig em MD11.
select nomea, cidade
from aeroporto
where coda in
	(select dest
	from voo
	where codv in
	        (select codv
		from escala
		where aviao = 'MD11' and codp in
			(select codp
			from piloto
			where codc in
				(select codc
				from companhia
				where nomec = 'Varig'))));









--o) O código e horario dos vôos internos de todos os países.
duplicar o aeroporto

--p) O código de todos os vôos internacionais da varig.
--Dica: Todas as companhias só podem operar a partir de seu próprio país, ou retornar a este.


--q) O nome de todos os aeroportos onde a Varig opera.


--r) O código de todos os vôos internacionais que as companhias fazem a partir de aeroportos em
--seus próprios países.


--s) O nome dos pilotos que voam de MD11 para o seu próprio país.



********************************************************************************************
********************************************************************************************
********************************************************************************************

Desenvolva as seguintes consultas em SQL, mostrando o resultado final, de acordo com as
informações inseridas (mostrar a consulta também):

select * from companhia;
select * from piloto;
select * from aeroporto;
select * from voo;
select * from escala;

--1. O salário do piloto mais bem pago da Varig.
select max(salario)
from piloto
where codc in
	(select codc
	from companhia
	where nomec = 'Varig');
--2. O menor, maior, e média dos salários dos pilotos de companhias brasileiras.
select max(salario), min(salario), avg(salario)
from piloto
where codc in
	(select codc
	from companhia
	where pais = 'Brasil');
--3. O total da folha de pagamento da Varig.
select sum(salario + gratificacoes) as "TotalPag"
from piloto
where codc in
	(select codc
	from companhia
	where nomec = 'Varig');
--4. O número de escalas previstas para o vôo VG230.
select count(codv) as "Numeros de escalas"
from escala
where codv in
	(select codv
	from voo
	where codv = 'VG230');
--5. O número de pessoas envolvidas em escalas do vôo VG230.
select count(codp)
from piloto
where codp in
	(select codp
	from escala
	where codv in
		(select codv
		from voo
		where codv = 'VG230'));
--6. O número de aeroportos no Brasil.
select count (coda)
from aeroporto
where  pais = 'Brasil';
--7. O número de países e de cidades diferentes para as quais se destinam os vôos partindo de GRU.
select count(ao.coda) as "Países", count(a.coda) as "Cidades"
from aeroporto ao, aeroporto a, voo v
where v.origem = ao.coda and v.dest = a.coda and v.origem = 'GRU';
	
--8. O número de aeroportos diferentes de onde os pilotos da Varig partem.
select count(coda)
from aeroporto
where coda in
	(select origem
	from voo
	where codv in
		(select codv
		from escala
		where codp in
			(select codp
			from piloto
			where codc in
				(select codc
				from companhia
				where nomec = 'Varig'))));
--9. O número de diferentes vôos que a TAM oferece para São Paulo.
select count(coda)
from aeroporto
where cidade = 'São Paulo' and coda in
	(select dest
	from voo
	where codv in
		(select codv
		from escala
		where codp in
			(select codp
			from piloto
			where codc in 
				(select codc
				from companhia
				where nomec = 'GOL'))));
--10. O número de aeroportos diferentes que os pilotos da varig usam (para chegada ou partida).
select count(distinct a.coda)
from companhia c, piloto p, escala e, voo v, aeroporto a, aeroporto ae
where c.codc = p.codc 
and p.codp = e.codp 
and e.codv = v.codv 
and v.origem = a.coda
and v.dest = ae.coda
and c.nomec = 'Varig';
--11. Para cada companhia, o menor, maior salário, bem como a média.
select min(p.salario), max(p.salario), avg(p.salario)
from companhia c, piloto p
where c.codc = p.codc
group by p.codc
order by p.codc
--12. Para cada cidade do Brasil, o número de aeroportos que possui.
select cidade, count(coda) as "NumAeroportos"
from aeroporto 
where pais = 'Brasil'
group by cidade
--13. Para cada piloto, o número de escalas programadas para o dia 15/04/2008.
select nomep, count(p.codp)
from piloto p, escala e
where p.codp = e.codp and data = '15/04/2008'
group by p.codp 
	
--14. Para cada dia e hora, o número de vôos que partem pela manhã.
select e.data, v.hora, count(e.codv)
from escala e, voo v
where v.hora < '12:00' and v.hora > '6:00' and e.codv = v.codv
group by e.data, v.hora
--15. Para cada piloto de companhia estrangeira, o número de vôos que ele faz de ou para o Brasil.

--16. As companhias que pagam como salário mais alto a seus pilotos menos que 12000.

--17. As companhias brasileiras que pagam como salário mais alto a seus pilotos menos que 12000.

--18. As companhias estrangeiras que possuem pelo menos 2 pilotos.

--19. O número de escalas previstas em MD11 para cada piloto da Varig que possui pelo menos 2
--escalas neste tipo de avião.

--20. As companhias que só usam um tipo de avião. 




