show tables;

select * from hoewon;

desc hoewon;

insert into hoewon (name) values ('씨톰');
insert into hoewon (name) values ('디톰');

update hoewon set address = '서울' where idx = 8;

delete from hoewon where idx = 9;
delete from hoewon where idx > 10;
