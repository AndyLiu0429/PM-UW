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


fun get_nth(str_list: string list, n: int)=
	if n=1 then hd str_list else get_nth(tl str_list, n-1)

val MONTHS = ["January", "February", "March", "April",
"May", "June", "July", "August", "September", "October", "November", "December"]

fun date_to_string (date: int*int*int) =
	get_nth(MONTHS, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)

fun number_before_reaching_sum(sum: int, pos_nums: int list)=
	if sum < 0 then 0 else 1 + number_before_reaching_sum(sum - (hd pos_nums), tl pos_nums)

val MONTH_DAYS = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

fun what_month (day: int) =
	get_nth(MONTHS, number_before_reaching_sum(day, MONTH_DAYS))

fun month_range (day1: int, day2: int) =
	if day1=day2 then []
	else what_month::month_range(day1+1, day2)

fun oldest(dates:(int*int*int) list) =
	if null dates then NONE
	else 
		let val next = oldest(tl dates) 
		in 
			if isSome(next) andalso (#2 (hd dates)) > valOf(next) 
			then SOME(#2 (hd dates))
			else next
		end
