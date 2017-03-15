/* Java race database tables */
/* grant all privileges on *.* to 'scott'@'localhost' identified by 'tiger'; */

drop database if exists javarace;
create database javarace
use javarace

drop table if exists Gambler;
drop table if exists Race;
drop table if exists Car;
drop table if exists GamblerRaceResult;
drop table if exists GamblerCarRace;
drop table if exists CarRaceResult;

create table Gambler (id integer not null unique, name varchar(10) not null unique, password varchar(10) not null, balance integer, isOnline bit, constraint pkId primary key (id));
create table Race (number integer not null unique, raceDate date, state integer, totalBets integer, constraint pkNumber primary key (number));
create table Car (name varchar(10) not null unique, make varchar(10) not null, size varchar(10) not null, color varchar(10) not null, type varchar(10) not null);
create table GamblerRaceResult(raceNumber integer not null, gamblerId integer not null, revenue integer, constraint fkRaceNumber foreign key (raceNumber) referencees Race(number), constraint fkGamblerId foreign key (gamblerId) references Gambler(id));
create table GamblerCarRace(gamblerId integer not null, raceNumber integer not null, carName varchar(10) not null, bet integer, constraint fkGamblerId foreign key (gamblerId) referencees Gambler(id), constraint fkRaceNumber foreign key (raceNumber) referencees Race(number), constraint fkCarName foreign key (carName) references Car(name));
create table CarRaceResult(raceNumber integer not null, carName varchar(10) not null, position integer not null, constraint fkRaceNumber foreign key (raceNumber) references Race(number), constraint fkCarName foreign key (carName) references Car(name));