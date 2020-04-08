show databases;
use note_management;

//user table

create table user(
user_id varchar(30) not null,
user_name varchar(30) default null,
user_added_date date not null,
user_password  varchar(30) not null,
user_mobile int(11) not null,
primary key(user_id));

//note table

create table note(
note_id varchar(30) not null,
note_title varchar(100) default null,
user_content  varchar(100) not null,
note_status varchar(11) not null,
note_creation_date date not null,
primary key(note_id));

//category table

create table category(
category_id varchar(20) not null,
category_name varchar(20) not null,
category_descr varchar(100) not null,
category_creation_date date not null,
category_creator varchar(30) not null,
primary key(category_id),
foreign key(category_creator) references user(user_id));



//reminder table
create table reminder(
 reminder_id varchar(20) not null,
 reminder_name varchar(20) not null,
 reminder_descr varchar(100) not null,
 reminder_type varchar(100) not null,
 reminder_creation_date date not null,
 reminder_creator varchar(30) not null,
primary key( reminder_id),
foreign key(reminder_creator) references user(user_id));


//notecategory table

create table notecategory(
 notecategory_id varchar(20) not null,
 note_id varchar(20) not null,
 category_id varchar(100) not null,
 primary key( notecategory_id),
foreign key(note_id) references note (note_id),
foreign key(category_id) references category (category_id)
);

//notereminder table
create table notereminder(
 notereminder_id varchar(20) not null,
 note_id varchar(30) not null,
 reminder_id varchar(20) not null,
 primary key( notereminder_id),
foreign key(note_id) references note (note_id),
foreign key(reminder_id) references reminder(reminder_id)
);

##usernote table

create table usernote(
 usernote_id varchar(20) not null,
 user_id varchar(30) not null,
 note_id varchar(30) not null,
 primary key( usernote_id),
foreign key(note_id) references note (note_id),
foreign key(user_id) references user(user_id)
);



select *
from user
where user_id='u1' and  user_password='anjana';


select *
from note
where note_creation_date='2008-11-19';




select category_name
from category
where category_creation_date='2008-11-10';


select note_id
from usernote
where user_id='u2';

update note
set note_title='medicine'
where note_id='7';

select note_title
from note
where note_id in (
select note_id
from usernote
where user_id='u2');

select note_content
from note
where note_id in (
select note_id
from notecategory
where category_id='c2');


select reminder_name
from reminder
where reminder_id in (
select reminder_id
from notereminder
where note_id='6');

select *
from reminder
where reminder_id='r6';




insert into note
values('8','meet ram','meeting with ram at tues','N','2008-12-01');

insert into usernote
values('un8','u6','8');





insert into note
values('9','meet raghu','meeting with raghu at tues','N','2008-12-03');

insert into category
values('c8','official','this category includes official matters','2008-12-03','u2');

insert into reminder values
('r7','meeting with ram','had a meeting with ram at tue 9','official','2008-12-03','u2');
select *
from usernote;
insert into notereminder values('nr7','9','r7');


££££££££££
delete from note
where note_id  in(
select note_id
from usernote
where note.note_id=usernote.note_id and user_id='u1');

delete from note
where note_id  in(
select note_id
from notecategory
where note.note_id=notecategory.note_id and category_id='c1');


delete from usernote
where note_id='4';
delete from notereminder
where note_id='4';
delete from notecategory
where note_id='4';
delete from note
where note_id='4';

delete from NoteCategory where category_id='c2' AND note_id=6;
delete from Notereminder where note_id=6;
delete from UserNote where note_id=6;
delete from Note where note_id=6;