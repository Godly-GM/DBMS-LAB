CREATE DEFINER=`root`@`localhost` PROCEDURE `newcursor`(inout namelist varchar(100))
begin
   declare is_done int default 0;
   declare b_name varchar (20) default " ";
   
   declare libcursor cursor for select bookname from bookdetails;
   declare continue handler for not found  set is_done = 1;
   open libcursor;
   getdata: loop
      fetch libcursor into b_name;
      if is_done =1 then
          leave getdata;
	  end if;
      set namelist =  concat(b_name,' ',namelist);
   end loop;
   close libcursor;
   end