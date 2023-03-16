use sakila;

# 1.Write a query to display for each store its store ID, city, and country.

select store.store_id,city.city,country.country
from store
join address
on address.address_id=store.address_id
join city
on city.city_id=address.city_id
join country
on country.country_id=city.country_id;

# 2.Write a query to display how much business, in dollars, each store brought in.
 
select store.store_id,sum(payment.amount) as total_payment
from store
join staff
on staff.store_id=store.store_id
join payment
on payment.staff_id=staff.staff_id
group by store.store_id;

# 3.What is the average running time of films by category?

select round(avg(length)) as avg_length,category.name
from film
join film_category
on film_category.film_id=film.film_id
join category
on category.category_id=film_category.category_id
group by category.name
order by round(avg(length)) desc;
 
# 4. Which film categories are longest?

select sum(film.length),category.name
from film
join film_category
on film_category.film_id=film.film_id
join category
on category.category_id=film_category.category_id
group by category.name;

# 5.Display the most frequently rented movies in descending order.

select film.title,count(rental.rental_id) as rental_count
from film
join inventory
on inventory.film_id=film.film_id
join rental
on rental.inventory_id=inventory.inventory_id
group by film.title
order by count(rental.rental_id) desc;

# 6.List the top five genres in gross revenue in descending order.
select category.name,sum(payment.amount) as total_amount
from category
join film_category
on film_category.category_id=category.category_id
join film
on film.film_id=film_category.film_id
join inventory
on inventory.film_id=film.film_id
join rental
on rental.inventory_id=inventory.inventory_id
join payment
on payment.rental_id=rental.rental_id
group by category.name
order by total_amount desc;

# 7.Is "Academy Dinosaur" available for rent from Store 1?
select film.title,store.store_id
from film
join inventory
on inventory.film_id=film.film_id
join store
on store.store_id=inventory.store_id
where film.title="Academy Dinosaur"
group by store_id;


