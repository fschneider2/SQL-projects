-- Criação das tabelas:

-- Fiz em inglês, pois estou utilizando esse metodo para estudar o idioma, tanto nos exercicios, quanto nas entregas trascrevo para inglês.

CREATE TABLE students ( 
	 registration int,  
	 "name" varchar(100) not null,
	 phone varchar(11) not null,
	 birth_date date not null,
	 "height" int not null,  
	 weight int not null,
	 date_last_average_evaluation date not null,
	 note varchar(150),  
	 adress varchar(100) not null,   
	 constraint pk_students primary key (registration)
); 

CREATE TABLE teachers ( 
	 id int,  
	 CPF varchar(11) unique not null,  
	 "name" varchar(100) not null,  
	 birth_date date not null,  
	 principal_phone varchar(11) not null,  
	 contact_phones varchar(100),  
	 professional_rg varchar(12) unique not null,  
	 titration varchar(50) not null,  
	 constraint pk_teacher primary key(id)
);

CREATE TABLE classes (
	 id int,  
	 class_duration int not null,  
	 class_time time not null,  
	 initial_date date not null,  
	 final_date date not null,  
	 number_students int not null,  
	 type_activity varchar(100) not null,  
	 id_teacher int not null,  
	 monitor_registration int unique not null,
	 constraint pk_classes primary key(id),
	 constraint fk_id_teacher foreign key (id_teacher) references teachers (id),
	 constraint fk_monitor foreign key (monitor_registration) references students(registration) 
	); 

-- Na tabela classes, inclui todas as informações que julguei necessarias para composição da turma, após, criei uma tabela chamada lesson(aula) cuja intenção é matricular os alunos nas turmas. 
-- cada Linha da tabela lesson é referente a um aluno matriculado em uma classes(turma).

CREATE TABLE lesson ( 
	 id int,  
	 student_registration int not null,  
	 class_id int not null, 
	 constraint pk_lesson primary key (id),
	 constraint fk_student_registration foreign key(student_registration) references students (registration),
	 constraint fk_class_id foreign key(class_id) references classes (id)
); 

--Após criado a tabela lesson, criei a tabela present, para que seja possivel computar as presenças em aula, procurei fazer da forma mais enxuta.
-- Sendo assim, sabendo que cada ID ou cada linha, da tabela lesson, representa um aluno matriculado em uma turma,
-- para a tabela present, so pego o id da tabela lesson, a data e se o aluno compareceu a aula, ficando as informações de 
-- aluno e turma para serem consultadas a partir da tabela lesson.

CREATE TABLE present ( 
	 id_lesson int not null,  
	 "date" date not null,  
	 present bool not null,
	 constraint fk_id_lesson foreign key (id_lesson) references lesson (id)
); 

-- Incluindo informações nas tabelas, em ordem de criação.

insert into students 
values
(1,'Carlos','51999999999','1990/02/14',185,90,'2021/11/11','Deseja aumentar massa muscular','Rua x, numero 25, Campo Bom'),
(2,'Lucas','51999999999','1993/07/22',170,90,'2021/12/08','Deseja perder peso','Rua y, numero 32, Novo Hamburgo'),
(3,'Rita','51999999999','1987/06/30',172,73,'2022/03/15','Tem problema de coração','Rua kk, numero 125, Campo Bom'),
(4,'Carol','51999999999','1993/02/19',155,98,'2020/10/25','seja melhorar saúde','Rua p, numero 25, Campo Bom'),
(5,'Miguel','51999999999','1999/01/17',183,65,'2022/08/11','Deseja aumentar massa muscular','Rua 3l, numero	32 Sapiranga'),
(6,'Bruna','51999999999','1999/02/19',160,55,'2020/10/25','Deseja melhorar saúde','Rua p, numero 25, Campo Bom'),
(7,'Fernando','51999999999','1995/01/17',210,110,'2022/08/11','Deseja aumentar massa muscular','Rua 3l, numero 2 Sapiranga');

insert into teachers 
values
(1,'03115969764','Paulo','1991/05/28','51999999999','51999999999,51999999999','01234-G/RS','Bacharel'),
(2,'03115969765','Ramon','1990/07/20','51999999999','51999999999','01235-G/RS','Bacharel'),
(3,'03115969766','Cilda','1989/01/15','51999999999',null,'01244-G/RS','Bacharel'),
(4,'03115969767','Carol','1979/05/23','51999999999','51999999999,51999999999,51999999999','01534-G/RS','Licenciatura'),
(5,'03115969768','Renato','1993/11/25','51999999999','51999999999','06234-G/RS','Licenciatura');

insert into classes 
values
(1, 50, '18:30', '2022/08/25', '2023/08/25', 25,'Musculação',1,1),
(2, 60, '19:45', '2022/08/25', '2023/08/25', 50,'Ginástica',1,2),
(3, 90, '21:00', '2022/08/25', '2023/05/25', 15,'Dança',3,3),
(4, 50,	'16:00', '2022/08/25', '2023/08/25', 8,'Artes Marciais',4,4),
(5, 50, '15:00', '2022/08/25', '2023/03/25', 30, 'Musculação',1,5),
(6, 30,	'12:00', '2022/08/25', '2023/08/25', 12,'Artes Marciais',2,6),
(7, 45, '10:00', '2022/08/25', '2023/03/25', 24, 'Dança',5,7);

insert into lesson 
values
(12,5,1),
(11,4,1),
(1,1,1),
(2,3,1),
(3,2,2),
(4,3,2),
(5,3,3),
(6,2,3),
(7,4,4),
(8,1,4),
(9,5,5),
(10,4,5);

insert into present
values
(1,'2022/08/25',true),
(2,'2022/08/25',true),
(3,'2022/08/25',true),
(4,'2022/08/25',false),
(5,'2022/08/25',false),
(6,'2022/08/25',true),
(7,'2022/08/25',true),
(8,'2022/08/25',false),
(9,'2022/08/25',true),
(10,'2022/08/25',true),
(11,'2022/08/25',True),
(12,'2022/08/25',false);


-- Realizando os comandos de consulta

--Para visualização das tabelas 
select * from students s 
select * from teachers t 
select * from classes c 
select * from lesson l 
select * from present p 

-- 1) Deve ser Possível consultar os dados de cada aluno matriculado na academia e as modalidades em que estão matriculados:

select
	c.type_activity,
	c.id as class_id,
	s.*
from 
	lesson l
join classes c on
	l.class_id = c.id
join students s on
	l.student_registration = s.registration 
--where 
-- Caso queira, descomente o where e um aluno para consultar.
--	s.name = 'Carlos'
--	s.name = 'Rita'
--	s.name = 'Carol'
--	s.name = 'Lucas'
--	s.name = 'Miguel'

-- 2) Deve ser possível consultar os dados de cada instrutor da academia, e os horarios de suas turmas:

select
	t.*,
	c.type_activity,
	c.class_time
from 
	teachers t,
	classes c
where 
	c.id_teacher = t.id
--and 
--	t.name = 'Paulo'
-- Caso queira pesquisar um professor em especifico, é so desmarcar o código.
	
	
-- 3) Deve ser possível consultar o horário de aula de um aluno específico:
select
	s.name,
	c.class_time,
	c.type_activity,
	l.class_id
from
	lesson l
join classes c on
	l.class_id = c.id
join students s on
	l.student_registration = s.registration
where
-- descomente o aluno que deseja consultar.
--	s.name = 'Carlos'
--	s.name = 'Rita'
--	s.name = 'Carol'
--	s.name = 'Lucas'
--	s.name = 'Miguel'

	
-- 4) Deve ser possível consultar as faltas de um aluno específico, com base nas turmas que ele está matriculado

select
	s.name,
	s.registration,
	p.present,
	p.date,
	l.class_id,
	c.class_time
from
	present p
join lesson l on
	p.id_lesson = l.id
join classes c on
	c.id = l.class_id
join students s on
	l.student_registration = s.registration
where
	p.present = false and
-- descomente o aluno que deseja consultar.
--	s.name = 'Carlos'
--	s.name = 'Rita'
--	s.name = 'Carol'
--	s.name = 'Lucas'
--	s.name = 'Miguel'
--Caso queira Consultar tudo(Presença e falta), é so comentar a primeira linha do where.


