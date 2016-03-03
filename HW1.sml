(*
	this is the homework assignment 1 for 
	date is a tuple int*int*int *)
fun is_older (year1: int*int*int, year2: int*int*int) =
	if (#1 year1) <> (#1 year2) then (#1 year1) < (#1 year2)
	else 
		if (#2 year1 <> #2 year2) then (#2 year1) < (#2 year2)
		else
			if (#3 year1 <> #3 year2) then (#3 year1) < (#3 year2)
			else false

fun same_date (year1: int*int*int, year2: int*int*int)=



fun number_in_month (dates : (int*int*int) list, month: int) =
	if null dates then 0
	else 
		let val cnt = number_in_month((tl dates), month) 
		in 
			if  then 1 + cnt
			else cnt
		end


