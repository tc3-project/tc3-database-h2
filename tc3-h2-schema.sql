-- tc3-h2-schema.sql
-- Copyright © 2019 NextStep IT Training. All rights reserved.
--
-- The is the database schema used for creating the in-memory database for integration tests.
--

drop table if exists sales_order_items;
drop table if exists sales_orders;
drop table if exists employees;
drop table if exists employee_types;
drop table if exists products;
drop table if exists product_types;
drop table if exists customers;

create table customers (
    customer_id bigint not null generated always as identity (start with 1 increment by 1),
    email varchar(128) not null,
    password varchar(128) not null,
    first_name varchar(40) not null,
    last_name varchar(40) not null,
    constraint pk_customers primary key(customer_id)
);

create unique index idx_customers_email on customers(email);
create index idx_customers_last_name on customers(last_name);

create table employee_types (
    employee_type_id bigint not null generated always as identity (start with 1 increment by 1),
    description varchar(32) not null,
    constraint pk_employee_types primary key(employee_type_id)
);

-- Employee Types
--    Employee types and how they are managed are defined by the government. The types
--    in the database are fixed against the application code. The different types map to
--    the logic which manages each of them. These types should be added manually if
--    new types are supported by the application.

insert into employee_types (employee_type_id, description) values (1, 'Salary');
insert into employee_types (employee_type_id, description) values (2, 'Hourly');

create table employees (
    employee_id varchar(32) not null,
    employee_type_id integer not null,
    login varchar(32) unique not null,
    password varchar(128) not null,
    hire_date date not null,
    first_name varchar(32) not null,
    last_name varchar(32) not null,
    pay_rate decimal(10, 2) not null,
    constraint pk_employees primary key (employee_id),
    constraint fk_employees_employee_types foreign key (employee_type_id) references employee_types (employee_type_id) 
);

create unique index idx_employees_login on employees(login);
create index idx_employees_last_name on employees(last_name);

create table product_types (
    product_type_id bigint not null generated always as identity (start with 1 increment by 1),
    name varchar(20) not null,
    constraint pk_product_types primary key(product_type_id)
);

create table products (
    product_id bigint not null generated always as identity (start with 1 increment by 1),
    product_type_id bigint not null,
    name varchar(255) not null,
    price decimal(10, 2) not null,
    constraint pk_products primary key(product_id),
    constraint fk_products_product_types foreign key(product_type_id) references product_types(product_type_id)
);

create index idx_products_name on products(name);

create table sales_orders (
    sales_order_id bigint not null generated always as identity (start with 1 increment by 1),
    order_date timestamp not null,
    customer_id bigint not null,
    total decimal(10, 2),
    card_number varchar(20),
    card_expires date,
    card_authorized varchar(128),
    filled timestamp,
    constraint pk_sales_orders primary key(sales_order_id),
    constraint fk_sales_orders_customers foreign key(customer_id) references customers(customer_id)
);

create table sales_order_items (
    sales_order_item_id bigint not null generated always as identity (start with 1 increment by 1),
    sales_order_id bigint not null,
    product_id bigint not null,
    name varchar(255) not null,
    quantity bigint not null,
    price decimal(10, 2) not null,
    constraint pk_sales_order_items primary key(sales_order_item_id),
    constraint fk_sales_order_items_sales_orders foreign key(sales_order_id) references sales_orders(sales_order_id),
    constraint fk_sales_order_items_products foreign key(product_id) references products(product_id)
);