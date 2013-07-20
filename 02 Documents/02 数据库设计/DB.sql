drop database if exists rst;
create database rst;
use rst;

drop table if exists ajx_user;
drop table if exists ajx_role;
drop table if exists ajx_user_role;
drop table if exists ajx_comment;
drop table if exists ajx_cuisine_style;
drop table if exists ajx_cuisine;
drop table if exists ajx_meeting_area;
drop table if exists ajx_hotnews;
drop table if exists ajx_aboutus;
drop table if exists ajx_order;
drop table if exists ajx_order_menu;
drop table if exists ajx_weather;

##user table
create table ajx_user (
	id bigint auto_increment,
	user_name varchar(128) not null unique,
	password varchar(128) not null unique,
	description varchar(255),
	createby bigint not null,
	createtime timestamp not null default 0,
	updateby bigint,
	updatetime timestamp,
    primary key (id)
) engine=InnoDB;

create table ajx_role (
	id bigint auto_increment,
	role_name varchar(128) not null,
	description varchar(255),
	createby bigint not null,
	createtime timestamp not null default 0,
	updateby bigint,
	updatetime timestamp,
    primary key (id)
) engine=InnoDB;

create table ajx_user_role (
	id bigint auto_increment,
	user_id bigint not null,
	role_id bigint not null,
	role_name varchar(128) not null,
	description varchar(255),
    primary key (id)
) engine=InnoDB;

create table ajx_comment (
	id bigint auto_increment,
	comment_person bigint not null,  ##user_id
	contact_type varchar(10),
	tel_number varchar(20),
	comment_type varchar(10),
	score varchar(10),
	description varchar(255),
	need_reply varchar(10),
	reply_status varchar(10),
	reply_content varchar(255),
	replytime timestamp,
	reply_person bigint, ##user_id
	createby bigint not null,
	createtime timestamp not null default 0,
	updateby bigint,
	updatetime timestamp,
    primary key (id)
) engine=InnoDB;

##菜系
create table ajx_cuisine_style (
	id bigint auto_increment,
	style_code varchar(10),
	style_name varchar(20),
	cuisine_number bigint,
	description varchar(1000),
	image_url varchar(255),
	createby bigint not null,
	createtime timestamp not null default 0,
	updateby bigint,
	updatetime timestamp,
    primary key (id)
) engine=InnoDB;

##菜品
create table ajx_cuisine (
	id bigint auto_increment,
	cuisine_style_id bigint not null,  ##style_id
	cuisine_code varchar(10),
	cuisine_name varchar(20),
	price bigint not null default 0,
	description varchar(1000),
	image_url varchar(255),
	is_recommend varchar(10), ##是否推荐
	recommend_no bigint not null default 0, ##推荐序号
	createby bigint not null,
	createtime timestamp not null default 0,
	updateby bigint,
	updatetime timestamp,
    primary key (id)
) engine=InnoDB;

##宴会厅
create table ajx_meeting_area (
	id bigint auto_increment,
	area_name varchar(10),
	description varchar(255),
	createby bigint not null,
	createtime timestamp not null default 0,
	updateby bigint,
	updatetime timestamp,
    primary key (id)
) engine=InnoDB; 

create table ajx_hotnews (
	id bigint auto_increment,
	title varchar(64) not null,
	content varchar(1000) not null,
	description varchar(255),
	starttime timestamp not null default 0,
	endtime timestamp not null default 0,
	image_url varchar(255),
	createby bigint not null,
	createtime timestamp not null default 0,
	updateby bigint,
	updatetime timestamp,
    primary key (id)
) engine=InnoDB; 

create table ajx_aboutus (
	id bigint auto_increment,
	title varchar(64) not null,
	content varchar(1000) not null,
	address varchar(255) not null,
	tel_number varchar(20),
	description varchar(255),
	image_url varchar(255),
	createby bigint not null,
	createtime timestamp not null default 0,
	updateby bigint,
	updatetime timestamp,
    primary key (id)
) engine=InnoDB; 

 create table ajx_order (
	id bigint auto_increment,
	order_type varchar(10) not null, ##婚宴or聚餐
	order_no bigint not null,##订单号
	customer_name varchar(255) not null,##客户姓名
	customer_number bigint not null default 0,##人数
	tel_number varchar(20),
	description varchar(255),##备注
	meeting_area bigint not null,##宴会厅id
	room_type varchar(10), ##大厅or包厢
	room_number varchar(10),##包厢号or大厅桌号
	bookingtime_start timestamp not null default 0,
	bookingtime_end timestamp not null default 0,
	order_status varchar(10),##订单状态(受理or未受理)
	createby bigint not null,
	createtime timestamp not null default 0,
	updateby bigint,
	updatetime timestamp,
    primary key (id)
) engine=InnoDB; 

 create table ajx_order_menu (
	id bigint auto_increment,
	order_id bigint not null,
	cuisine_id bigint not null,
	description varchar(255),
    primary key (id)
) engine=InnoDB; 

 create table ajx_weather (
	id bigint auto_increment,
	city varchar(64),
	weather_date timestamp not null default 0,
	weather_status varchar(64),
	warm_tips varchar(64),
	description varchar(255),##备注
	createby bigint not null,
	createtime timestamp not null default 0,
	updateby bigint,
	updatetime timestamp,
    primary key (id)
) engine=InnoDB; 
