(*
	this is the homework assignment 1
	date is a tuple int*int*int *)
fun is_older (year1: int*int*int, year2: int*int*int) =
	if (#1 year1) <> (#1 year2) then (#1 year1) < (#1 year2)
	else 
		if (#2 year1 <> #2 year2) then (#2 year1) < (#2 year2)
		else
			if (#3 year1 <> #3 year2) then (#3 year1) < (#3 year2)
			else false

(* helper function to check dates equality*)
fun same_date (year1: int*int*int, year2: int*int*int)=
	if (#1 year1)=(#1 year2) andalso (#2 year1)=(#2 year2) andalso (#3 year1)=(#3 year2)
	then true
	else false


fun number_in_month (dates : (int*int*int) list, month: int) =
	if null dates then 0
	else 
		let val cnt = number_in_month((tl dates), month) 
		in 
			if (#2 (hd dates))=month then 1 + cnt
			else cnt
		end

fun number_in_months (dates: (int*int*int) list, months: int list)=
	if null months then 0
	else number_in_month(dates, hd months) + number_in_months(dates, tl months)

fun dates_in_month (dates : (int*int*int) list, month: int)=
	if null dates then []
	else
		let val next = dates_in_month(tl dates, month)
		in
			if (#2 (hd dates))=month
			then (hd dates)::next
			else next
		end

fun dates_in_months (dates: (int*int*int) list, months: int list) =
	if null months then []
	else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)




