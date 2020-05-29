drop table if exists test1 purge;
create table test1 (a int, b string);
insert into test1 (a,b) values (1, 'foo');
insert into test1 (a,b) values (2, 'bar');