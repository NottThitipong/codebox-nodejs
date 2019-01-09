//create database
CREATE DATABASE codebox CHARACTER SET utf8 COLLATE utf8_unicode_ci

//table customer
CREATE table customer_detail (
    customer_id int NOT NULL AUTO_INCREMENT,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    email varchar(255),
    mobile_no varchar(15),
    address_other varchar(255),
    province varchar(255),
    zipcode varchar(10),
    package_id int,
    subscription_id int,
    payment_status_id int,
    omi_token varchar(255),
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (customer_id)
)

//update table customer_detail
ALTER TABLE customer_detail
ADD COLUMN district VARCHAR(100) NULL DEFAULT NULL AFTER address_other,
CHANGE COLUMN payment_status_id customer_pay_status VARCHAR(10) NOT NULL COMMENT 'A = Active, I = Inactive';



//table package_detail
CREATE table package_detail (
    package_id int NOT NULL AUTO_INCREMENT,
    package_name varchar(255),
    package_description text,
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (package_id)
)

//Update tabale package_detail
ALTER TABLE package_detail 
ADD COLUMN package_start_date TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP AFTER package_description,
ADD COLUMN package_end_date TIMESTAMP NULL DEFAULT NULL AFTER package_start_date;

//table subscription
CREATE table subscription (
    sub_id int NOT NULL AUTO_INCREMENT,
    sub_name varchar(255),
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (sub_id)
)

//table active_course
CREATE table active_course(
    package_id int NOT NULL,
    sub_id int NOT NULL,
    plan_value int NOT NULL,
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (package_id, sub_id)
)

// Rename table active_course to package_plan
ALTER TABLE active_course 
RENAME TO package_plan ;

//table payment_detail
create table payment_detail(
    payment_id int NOT NULL AUTO_INCREMENT,
    customer_id int NOT NULL,
    package_id int NOT NULL,
    sub_id int NOT NULL,
    pay_value int NOT NULL,
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (payment_id)
)

//Update table payment_detail
ALTER TABLE payment_detail
ADD COLUMN payment_status VARCHAR(20) NOT NULL COMMENT 'S = SUCCESS, F = FAIL' AFTER create_date;


//table admin_user
create table admin_user (
    user_id int NOT NULL AUTO_INCREMENT,
    user_name varchar(255),
    user_password varchar(255),
    user_level int,
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id)
)