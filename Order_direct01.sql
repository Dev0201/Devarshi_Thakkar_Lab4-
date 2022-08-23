select count(t2.cus_gender) as NoOfCustomers, t2.cus_gender from
(select t1.cus_id, t1.cus_gender, t1.ord_amount, t1.cus_name from
(select `order`.*, customer.cus_gender, customer.cus_name from `order` inner join customer where `order`.cus_id=customer.cus_id having
`order`.ord_amount>3000)
as t1 group by t1.cus_id) as t2 group by t2.cus_gender;


select product.pro_name, `order`.* from `order`, supplier_pricing,product
where `order`.cus_id = 2 and `order`.pricing_id = supplier_pricing.pricing_id and Supplier_pricing.pro_id = product.pro_id;


select supplier. * from supplier where supplier.supp_id in
(select supp_id from supplier_pricing group by supp_id having
count(supp_id)>1)
group by supplier.supp_id;

select * from supplier

select * from supplier_pricing

select * from product


select category.cat_id,category.cat_name, min(t3.min_price) as Min_price from category inner join
(select product.cat_id, product.pro_name, t2.* from product inner join
(select pro_id, min(supp_price) as Min_price from supplier_pricing group by pro_id)
as t2 where t2.pro_id = product.pro_id)
as t3 where t3.cat_id = category.cat_id group by t3.cat_id;


select product.pro_id,product.pro_name from `order` inner join supplier_pricing.pricing_id=`order`.pricing_id inner join
on product.pro_id=supplier_pricing.pro_id where `order`.ord_date>"2021-10-05";

select customer.cus_name,customer.cus_gender from customer where customer.cus_name like 'A%' or customer.cus_name like '%A';