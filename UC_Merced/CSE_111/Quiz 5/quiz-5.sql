PRAGMA foreign_keys = on;

select '1----------';
.headers on
create table classes (
    c_class         char(20) unique,
    c_type          char(5),
    c_country       char(25) not null,
    c_numGuns       decimal(2,0) not null,
    c_bore          decimal(3,1) not null,
    c_displacement  decimal(10,0) not null,
    primary key(c_class),
    check(c_type in('bb', 'bc'))
);
create table ships (
    s_name          char(25) unique,
    s_class         char(20) references classes(c_class) on update set null on delete set null,
    s_launched      decimal(10,0) not null,
    primary key(s_name)
);
create table battles (
    b_name          char(25) unique,
    b_date          date not null,
    primary key(b_name)
);
create table outcomes (
    o_ship          char(25) not null, 
    o_battle        char(25) not null,
    o_result        char(25) not null,
    foreign key(o_ship) references ships(s_name) on delete cascade,
    foreign key(o_battle) references battles(b_name) on delete cascade,
    foreign key(o_battle) references battles(b_name) on update cascade,
    check(o_result in('ok', 'sunk', 'damaged'))
);
;
.headers off

select '2----------';
.headers on

insert into classes values('Bismarck', 'bb', 'Germany', 8, 15, 42000);
insert into classes values('Iowa', 'bb', 'USA', 9, 16, 46000);
insert into classes values('Kongo', 'bc', 'Japan', 8, 14, 32000);
insert into classes values('North Carolina', 'bb', 'USA', 9, 16, 37000);
insert into classes values('Renown', 'bc', 'Britain', 6, 15, 32000);
insert into classes values('Revenge', 'bb', 'Britain', 8, 15, 29000);
insert into classes values('Tennessee', 'bb', 'USA', 12, 14, 32000);
insert into classes values('Yamato', 'bb', 'Japan', 9, 18, 65000);

insert into ships values('California', 'Tennessee', 1915);
insert into ships values('Haruna', 'Kongo', 1915);
insert into ships values('Hiei', 'Kongo', 1915);
insert into ships values('Iowa', 'Iowa', 1933);
insert into ships values('Kirishima', 'Kongo', 1915);
insert into ships values('Kongo', 'Kongo', 1913);
insert into ships values('Missouri', 'Iowa', 1935);
insert into ships values('Musashi', 'Yamato', 1942);
insert into ships values('New Jersey', 'Iowa', 1936);
insert into ships values('North Carolina', 'North Carolina', 1941);
insert into ships values('Ramillies', 'Revenge', 1917);
insert into ships values('Renown', 'Renown', 1916);
insert into ships values('Repulse', 'Renown', 1916);
insert into ships values('Resolution', 'Revenge', 1916);
insert into ships values('Revenge', 'Revenge', 1916);
insert into ships values('Royal Oak', 'Revenge', 1916);
insert into ships values('Royal Sovereign', 'Revenge', 1916);
insert into ships values('Tennessee', 'Tennessee', 1915);
insert into ships values('Washington', 'North Carolina', 1941);
insert into ships values('Wisconsin', 'Iowa', 1940);
insert into ships values('Yamato', 'Yamato', 1941);

insert into battles values('Denmark Strait', '1941-05-24');
insert into battles values('Guadalcanal', '1942-11-15');
insert into battles values('North Cape', '1943-12-26');
insert into battles values('Suriago Strait', '1944-10-25');

insert into outcomes values('California', 'Suriago Strait', 'ok');
insert into outcomes values('Kirishima', 'Guadalcanal', 'sunk');
insert into outcomes values('Resolution', 'Denmark Strait', 'ok');
insert into outcomes values('Wisconsin', 'Guadalcanal', 'damaged');
insert into outcomes values('Tennessee', 'Suriago Strait', 'ok');
insert into outcomes values('Washington', 'Guadalcanal', 'ok');
insert into outcomes values('New Jersey', 'Suriago Strait', 'ok');
insert into outcomes values('Yamato', 'Suriago Strait', 'sunk');
insert into outcomes values('Wisconsin', 'Suriago Strait', 'damaged');
;

select * from classes;
select char(13);
select * from ships;
select char(13);
select * from battles;
select char(13);
select * from outcomes;
select char(13);
.headers off

select '3----------';
.headers on
delete from classes
where c_displacement < 30000 or c_numGuns < 8;
;

select * from classes;
select char(13);
select * from ships;
select char(13);
.headers off

select '4----------';
.headers on
delete from battles
where b_name is 'Guadalcanal';
;

select * from battles;
select char(13);
select * from outcomes;
select char(13);
.headers off

select '5----------';
.headers on
update battles
set b_name = 'Strait Suriago'
where b_name = 'Suriago Strait';
;

select * from battles;
select char(13);
select * from outcomes;
select char(13);
.headers off

select '6----------';
.headers on
delete from ships
where s_class is null;
;

select * from ships;
select char(13);
select * from outcomes;
select char(13);
.headers off
