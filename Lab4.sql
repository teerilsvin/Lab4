--Q1
select city
from agents
where aid in (select aid
	      from orders
	      where cid in (select cid
			    from customers
			    where name = 'Basics'))
order by city asc

--Q2 *wrong
select distinct pid
from orders
where aid in (select aid
		from orders
		where cid in (select cid
				from customers
				where city = 'Kyoto'))
order by pid

--Q3
select distinct cid, name
from customers
where cid in (select cid
	      from orders
	      where aid in (select distinct aid
			    from orders
			    where aid != 'a03'))
order by cid asc

--Q4
select cid, name
from customers
where cid in (select cid
		from orders
		where pid = 'p01'
		and cid in (select cid
				from orders
				where pid = 'p07'))
order by cid

--Q5
select distinct pid
from orders
where cid in (select cid
		from orders
		where aid = 'a03')
order by pid

--Q6
select name, discount
from customers
where cid in (select cid
	      from orders
	      where aid in (select aid
			    from agents
			    where city = 'Dallas'
			       or city = 'Duluth'))
order by name asc

--Q7
select *
from customers
where discount in (select discount
		   from customers
		   where city = 'Dallas'
		       or city = 'Kyoto')
and city != 'Dallas'
and city != 'Kyoto'