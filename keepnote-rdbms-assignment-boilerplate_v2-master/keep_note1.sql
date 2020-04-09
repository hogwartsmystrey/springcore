DELIMITER /
 create trigger del
 before
 delete on note
 for each row
 begin
  delete from usernote
  where note_id=old.note_id;
  delete from notereminder
  where note_id=old.note_id;
  delete from notecategory
  where note_id=old.note_id;
 end
/
 DELIMITER ;
delete from note
 where note_id='1';

DELIMITER /
 create trigger del_user
 before
 delete on user
 for each row
 begin
 declare new_note varchar(30);
 select note_id into new_note
 from usernote
 where note_id=old.user_id;
  delete from usernote
  where note_id=new_note;
  delete from notereminder
  where note_id=new_note;
  delete from category
  where category_creator=old.user_id;
  delete from reminder
  where reminder_creator=old.user_id;
  delete from notecategory
  where note_id=new_note;
 end
/
 DELIMITER ;
delete from user
where user_id='u1';
