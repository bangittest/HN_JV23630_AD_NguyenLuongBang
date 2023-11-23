create database QUANLYBANHANG;
use QUANLYBANHANG;

create table CUSTOMERS(
	customer_id varchar(4) primary key not null,
    name varchar(100) not null,
    email varchar(100) not null,
    phone varchar(25) not null,
    address varchar(255) not null
);

create table orders(
	order_id varchar(4) primary key not null,
    customer_id varchar(4) not null,
    foreign key(customer_id) references CUSTOMERS(customer_id),
    order_date date not null,
    total_amount double not null
);


create table products(
	product_id varchar(4) primary key not null,
    name varchar(255) not null,
    description text,
    price double not null,
    status bit(1) not null default(1)
);


create table orders_details(
	order_id varchar(4) not null,
    foreign key(order_id)references orders(order_id),
    product_id varchar(4) not null,
    foreign key(product_id)references products(product_id),
    quantity int(11) not null,
	price double not null,
    primary key(order_id,product_id)
);


insert into CUSTOMERS(customer_id,name,email,phone,address)
values('C001','Nguyễn Trung Mạnh','manhnt@gmail.com','984756322','Cầu Giấy,Hà Nội');
insert into CUSTOMERS(customer_id,name,email,phone,address)
values('C002','Hồ Hải Nam','namhh@gmail.com','984875926','Ba Vì,Hà Nội');
insert into CUSTOMERS(customer_id,name,email,phone,address)
values('C003','Tô Ngọc Vũ','vutn@gmail.com','904725784','Mộc Châu,Sơn La');
insert into CUSTOMERS(customer_id,name,email,phone,address)
values('C004','Phạm Ngọc Anh','anhpn@gmail.com','984635365','Vinh,Nghệ An');
insert into CUSTOMERS(customer_id,name,email,phone,address)
values('C005','Trương Minh Cường','cuongtm@gmail.com','989735624','Hai Bà Trưng,Hà Nội');


insert into products(product_id,name,description,price)
values('P001','Iphone 13 ProMax','Bản 512 GB,xanh lá','22999999');
insert into products(product_id,name,description,price)
values('P002','Dell Vostro V3510','Core i5 ,RAM 8GB','14999999');
insert into products(product_id,name,description,price)
values('P003','Macbook Pro M2','8CPU 10GPU 8GB 256GB','28999999');
insert into products(product_id,name,description,price)
values('P004','Apple Watch Ultra','Titanium Alpine Lôp Small','18999999');
insert into products(product_id,name,description,price)
values('P005','Airpods 2 2022','Spatial Audio','4090000');



INSERT INTO orders (order_id,customer_id,total_amount,order_date) VALUES('H001','C001',52999997,'2023/2/22');
INSERT INTO orders (order_id,customer_id,total_amount,order_date) VALUES('H002','C001',80999997,'2023/3/11');
INSERT INTO orders (order_id,customer_id,total_amount,order_date) VALUES('H003','C002',54359998,'2023/1/22');
INSERT INTO orders (order_id,customer_id,total_amount,order_date) VALUES('H004','C003',102999995,'2023/3/14');
INSERT INTO orders (order_id,customer_id,total_amount,order_date) VALUES('H005','C003',80999997,'2022/3/12');
INSERT INTO orders (order_id,customer_id,total_amount,order_date) VALUES('H006','C004',110449994,'2023/2/1');
INSERT INTO orders (order_id,customer_id,total_amount,order_date) VALUES('H007','C004',79999996,'2023/3/29');
INSERT INTO orders (order_id,customer_id,total_amount,order_date) VALUES('H008','C005',29999998,'2023/2/14');
INSERT INTO orders (order_id,customer_id,total_amount,order_date) VALUES('H009','C005',28999999,'2023/1/10');
INSERT INTO orders (order_id,customer_id,total_amount,order_date) VALUES('H010','C005',149999994,'2023/4/1');
    
    


INSERT INTO ORDERS_DETAILS (order_id,product_id,price,quantity) VALUES('H001','P002',14999999,1);
INSERT INTO ORDERS_DETAILS (order_id,product_id,price,quantity) VALUES('H001','P004',18999999,2);
INSERT INTO ORDERS_DETAILS (order_id,product_id,price,quantity) VALUES('H002','P001',22999999,1);
INSERT INTO ORDERS_DETAILS (order_id,product_id,price,quantity) VALUES('H002','P003',28999999,2);
INSERT INTO ORDERS_DETAILS (order_id,product_id,price,quantity) VALUES('H003','P004',18999999,2);
INSERT INTO ORDERS_DETAILS (order_id,product_id,price,quantity) VALUES('H003','P005',4090000,4);
INSERT INTO ORDERS_DETAILS (order_id,product_id,price,quantity) VALUES('H004','P002',14999999,3);
INSERT INTO ORDERS_DETAILS (order_id,product_id,price,quantity) VALUES('H004','P003',28999999,2);
INSERT INTO ORDERS_DETAILS (order_id,product_id,price,quantity) VALUES('H005','P001',22999999,1);
INSERT INTO ORDERS_DETAILS (order_id,product_id,price,quantity) VALUES('H005','P003',28999999,2);
INSERT INTO ORDERS_DETAILS (order_id,product_id,price,quantity) VALUES('H006','P005',4090000,5);
INSERT INTO ORDERS_DETAILS (order_id,product_id,price,quantity) VALUES('H006','P002',14999999,6);
INSERT INTO ORDERS_DETAILS (order_id,product_id,price,quantity) VALUES('H007','P004',18999999,3);
INSERT INTO ORDERS_DETAILS (order_id,product_id,price,quantity) VALUES('H007','P001',22999999,1);
INSERT INTO ORDERS_DETAILS (order_id,product_id,price,quantity) VALUES('H008','P002',14999999,2);
INSERT INTO ORDERS_DETAILS (order_id,product_id,price,quantity) VALUES('H009','P003',28999999,1);
INSERT INTO ORDERS_DETAILS (order_id,product_id,price,quantity) VALUES('H010','P003',28999999,2);
INSERT INTO ORDERS_DETAILS (order_id,product_id,price,quantity) VALUES('H010','P001',22999999,4);

-- Bài 3: Truy vấn dữ liệu [30 điểm]:
-- 1. Lấy ra tất cả thông tin gồm: tên, email, số điện thoại và địa chỉ trong bảng Customers .
-- [4 điểm]
select * from CUSTOMERS;
-- 2. Thống kê những khách hàng mua hàng trong tháng 3/2023 (thông tin bao gồm tên, số điện
-- thoại và địa chỉ khách hàng). [4 điểm]
SELECT name, phone, address
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
    WHERE MONTH(order_date) = 3 AND YEAR(order_date) = 2023
);


-- 3. Thống kê doanh thua theo từng tháng của cửa hàng trong năm 2023 (thông tin bao gồm
-- tháng và tổng doanh thu ). [4 điểm]
SELECT MONTH(order_date) AS tháng, SUM(total_amount) AS tổng_doanh_thu
FROM Orders
WHERE YEAR(order_date) = 2023
GROUP BY MONTH(order_date);

-- 4. Thống kê những người dùng không mua hàng trong tháng 2/2023 (thông tin gồm tên khách
-- hàng, địa chỉ , email và số điên thoại). [4 điểm]
SELECT name, address, email, phone
FROM Customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM Orders
    WHERE MONTH(order_date) = 2 AND YEAR(order_date) = 2023
);

-- 5. Thống kê số lượng từng sản phẩm được bán ra trong tháng 3/2023 (thông tin bao gồm mã
-- sản phẩm, tên sản phẩm và số lượng bán ra). [4 điểm]
SELECT p.product_id, p.name, SUM(quantity) AS số_lượng_bán_ra
FROM ORDERS_DETAILS od
JOIN Products p ON p.product_id = od.product_id
WHERE od.order_id IN (
    SELECT order_id
    FROM Orders
    WHERE MONTH(order_date) = 3 AND YEAR(order_date) = 2023
)
GROUP BY p.product_id, p.name;


-- 6. Thống kê tổng chi tiêu của từng khách hàng trong năm 2023 sắp xếp giảm dần theo mức chi
-- tiêu (thông tin bao gồm mã khách hàng, tên khách hàng và mức chi tiêu). [5 điểm]

SELECT c.customer_id, c.name, SUM(o.total_amount) AS mức_chi_tiêu
FROM Orders o
JOIN customers c 
ON o.customer_id = c.customer_id
WHERE YEAR(order_date) = 2023
GROUP BY c.customer_id, c.name
ORDER BY mức_chi_tiêu DESC;

-- 7. Thống kê những đơn hàng mà tổng số lượng sản phẩm mua từ 5 trở lên (thông tin bao gồm
-- tên người mua, tổng tiền , ngày tạo hoá đơn, tổng số lượng sản phẩm) . [5 điểm]

SELECT c.name, o.total_amount, o.order_date, SUM(od.quantity) AS tổng_số_lượng_sản_phẩm
FROM Orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN ORDERS_DETAILS od ON o.order_id = od.order_id
GROUP BY o.order_id
HAVING tổng_số_lượng_sản_phẩm >= 5;




-- Bài 4: Tạo View, Procedure [30 điểm]:
-- 1. Tạo VIEW lấy các thông tin hoá đơn bao gồm : Tên khách hàng, số điện thoại, địa chỉ, tổng
-- tiền và ngày tạo hoá đơn . [3 điểm]
CREATE VIEW show_customer AS
SELECT c.name, c.phone, c.address, o.total_amount, o.order_date
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;

-- 2. Tạo VIEW hiển thị thông tin khách hàng gồm : tên khách hàng, địa chỉ, số điện thoại và tổng
-- số đơn đã đặt. [3 điểm]
CREATE VIEW show_customer_orders AS
SELECT c.name, c.address, c.phone, COUNT(o.order_id) AS tổng_số_đơn
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name, c.address, c.phone;

-- 3. Tạo VIEW hiển thị thông tin sản phẩm gồm: tên sản phẩm, mô tả, giá và tổng số lượng đã
-- bán ra của mỗi sản phẩm.[3 điểm]
CREATE VIEW product_info AS
SELECT p.name, p.description, p.price, SUM(od.quantity) AS tổng_số_lượng
FROM Products p
JOIN ORDERS_DETAILS od ON p.product_id = od.product_id
GROUP BY p.name, p.description, p.price;

-- 4. Đánh Index cho trường `phone` và `email` của bảng Customer. [3 điểm]
CREATE INDEX idx_phone ON Customers(phone);
CREATE INDEX idx_email ON Customers(email);

-- 5. Tạo PROCEDURE lấy tất cả thông tin của 1 khách hàng dựa trên mã số khách hàng.[3 điểm]
DELIMITER //
CREATE PROCEDURE show_customer(IN c_customer_id VARCHAR(4))
BEGIN
    SELECT *
    FROM CUSTOMERS
    WHERE customer_id = c_customer_id;
END;
//
DELIMITER ;

call show_customer('C001');


-- 6. Tạo PROCEDURE lấy thông tin của tất cả sản phẩm. [3 điểm]
DELIMITER //
CREATE PROCEDURE show_all_products()
BEGIN
    SELECT *
    FROM products;
END;
//
DELIMITER ;

call show_all_products;

-- 7. Tạo PROCEDURE hiển thị danh sách hoá đơn dựa trên mã người dùng. [3 điểm]
DELIMITER //
CREATE PROCEDURE show_order_customer_Id(IN c_customer_id VARCHAR(4))
BEGIN
    SELECT *
    FROM orders
    WHERE customer_id = c_customer_id;
END;
//
DELIMITER ;

call show_order_customer_Id('C001');



-- 8. Tạo PROCEDURE tạo mới một đơn hàng với các tham số là mã khách hàng, tổng
-- tiền và ngày tạo hoá đơn, và hiển thị ra mã hoá đơn vừa tạo. [3 điểm]
drop PROCEDURE create_new_order

DELIMITER //
CREATE PROCEDURE create_new_order(
    IN o_order_id VARCHAR(4),
     c_customer_id VARCHAR(4),
     o_total_amount DOUBLE,
     o_order_date DATE
)
BEGIN
    INSERT INTO orders (order_id, customer_id, order_date, total_amount)
    VALUES (o_order_id, c_customer_id, o_order_date, o_total_amount);
    SELECT o_order_id AS 'Mã đơn vừa tạo' FROM orders WHERE o_order_id = order_id;
END; 
//
call create_new_order('s198', 'C002',80999997, '2022-03-12');

-- 9. Tạo PROCEDURE thống kê số lượng bán ra của mỗi sản phẩm trong khoảng
-- thời gian cụ thể với 2 tham số là ngày bắt đầu và ngày kết thúc. [3 điểm]
DELIMITER //
CREATE PROCEDURE show_product_date(IN p_start_date DATE, IN p_end_date DATE)
BEGIN
    SELECT p.product_id, p.name, SUM(od.quantity) AS quantity_sold
    FROM products p
    JOIN orders_details od ON p.product_id = od.product_id
    JOIN orders o ON od.order_id = o.order_id
    WHERE o.order_date BETWEEN p_start_date AND p_end_date
    GROUP BY p.product_id, p.name;
END;
//
DELIMITER ;

call show_product_date('2023/2/22','2023/3/11');
-- 10. Tạo PROCEDURE thống kê số lượng của mỗi sản phẩm được bán ra theo thứ tự
-- giảm dần của tháng đó với tham số vào là tháng và năm cần thống kê. [3 điểm]
DELIMITER //
CREATE PROCEDURE show_product_month(IN p_month INT, IN p_year INT)
BEGIN
    SELECT p.product_id, p.name, SUM(od.quantity) AS quantity_sold
    FROM products p
    JOIN orders_details od ON p.product_id = od.product_id
    JOIN orders o ON od.order_id = o.order_id
    WHERE MONTH(o.order_date) = p_month AND YEAR(o.order_date) = p_year
    GROUP BY p.product_id, p.name
    ORDER BY quantity_sold DESC;
END;
//
DELIMITER ;

call show_product_month(1, 2023);

