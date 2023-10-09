-- This script was generated by the ERD tool in pgAdmin 4.7 v1.7
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.

-- DROP SCHEMA public CASCADE;
-- CREATE SCHEMA public;

CREATE TABLE IF NOT EXISTS public."user"
(
    id            integer                NOT NULL,
    email_address character varying(100) NOT NULL,
    username      character varying(100) NOT NULL,
    password      character varying(100) NOT NULL,
    full_name     character varying(100) NOT NULL,
    gender        character varying(10)  NOT NULL,
    birthdate     date,
    phone_number  character varying(15)  NOT NULL,
    address_id    integer                NOT NULL,
    user_image    character varying(250),
    user_status   boolean                NOT NULL DEFAULT true,
    PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS public.admin
(
    username      character varying(100) NOT NULL,
    password      character varying(100) NOT NULL,
    email_address character varying(100) NOT NULL,
    phone_number character varying(15) NOT NULL,
    full_name     character varying(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.address
(
    address_id  integer                NOT NULL,
    street_name character varying(100) NOT NULL,
    ward        character varying(50)  NOT NULL,
    district    character varying(50)  NOT NULL,
    city        character varying(50)  NOT NULL,
    province    character varying(50)  NOT NULL,
    postal_code character varying(50)  NOT NULL,
    PRIMARY KEY (address_id)
);

CREATE TABLE IF NOT EXISTS public.review
(
    review_id       integer NOT NULL,
    review_date     date    NOT NULL,
    user_id         integer NOT NULL,
    ordered_book_id integer NOT NULL,
    rating          integer NOT NULL,
    comment         text,
    PRIMARY KEY (review_id)
);



CREATE TABLE IF NOT EXISTS public."order"
(
    order_id            integer NOT NULL,
    user_id             integer NOT NULL,
    order_date          date    NOT NULL,
    shipping_address_id integer NOT NULL,
    order_total         bigint  NOT NULL,
    order_status        integer NOT NULL,
    PRIMARY KEY (order_id)
);


CREATE TABLE IF NOT EXISTS public.order_status
(
    order_status_id integer               NOT NULL,
    status          character varying(20) NOT NULL,
    PRIMARY KEY (order_status_id)
);



CREATE TABLE IF NOT EXISTS public.order_detail
(
    order_detail_id integer NOT NULL,
    book_id         integer NOT NULL,
    order_id        integer NOT NULL,
    quantity        integer NOT NULL,
    PRIMARY KEY (order_detail_id)
);

CREATE TABLE IF NOT EXISTS public.shopping_cart
(
    shopping_cart_id integer NOT NULL,
    user_id          integer NOT NULL,
    book_id          integer NOT NULL,
    quantity         integer NOT NULL,
    PRIMARY KEY (shopping_cart_id)
);

CREATE TABLE IF NOT EXISTS public.book
(
    book_id          integer                NOT NULL,
    title            character varying(100) NOT NULL,
    publication_date date                   NOT NULL,
    quantity         integer                NOT NULL,
    price            bigint                 NOT NULL,
    publisher_id     integer                NOT NULL,
    book_description text,
    book_image       character varying(250) NOT NULL,
    is_available     boolean                NOT NULL,
    PRIMARY KEY (book_id)
);

CREATE TABLE IF NOT EXISTS public.author
(
    author_id          integer                NOT NULL,
    author_fullname    character varying(100) NOT NULL,
    author_description text,
    author_image       character varying(250),
    PRIMARY KEY (author_id)
);

CREATE TABLE IF NOT EXISTS public.author_book
(
    book_id   integer NOT NULL,
    author_id integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public.category
(
    category_id   integer               NOT NULL,
    category_name character varying(50) NOT NULL,
    PRIMARY KEY (category_id)
);

CREATE TABLE IF NOT EXISTS public.category_book
(
    book_id     integer NOT NULL,
    category_id integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public.publisher
(
    publisher_id   integer                NOT NULL,
    publisher_name character varying(100) NOT NULL,
    PRIMARY KEY (publisher_id)
);

-- THE END OF CREATE TABLE

ALTER TABLE IF EXISTS public.user
    ADD CONSTRAINT address_id FOREIGN KEY (address_id)
        REFERENCES public."address" (address_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
;


ALTER TABLE IF EXISTS public.review
    ADD CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES public."user" (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
;


ALTER TABLE IF EXISTS public.review
    ADD FOREIGN KEY (ordered_book_id)
        REFERENCES public.order_detail (order_detail_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
;

ALTER TABLE IF EXISTS public."order"
    ADD CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES public."user" (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
;


ALTER TABLE IF EXISTS public."order"
    ADD CONSTRAINT shipping_address_id FOREIGN KEY (shipping_address_id)
        REFERENCES public.address (address_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
;


ALTER TABLE IF EXISTS public."order"
    ADD CONSTRAINT order_status_id FOREIGN KEY (order_status)
        REFERENCES public.order_status (order_status_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
;


ALTER TABLE IF EXISTS public.order_detail
    ADD FOREIGN KEY (order_id)
        REFERENCES public."order" (order_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
;


ALTER TABLE IF EXISTS public.order_detail
    ADD FOREIGN KEY (book_id)
        REFERENCES public.book (book_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
;


ALTER TABLE IF EXISTS public.shopping_cart
    ADD CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES public."user" (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
;


ALTER TABLE IF EXISTS public.shopping_cart
    ADD FOREIGN KEY (book_id)
        REFERENCES public.book (book_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
;


ALTER TABLE IF EXISTS public.author_book
    ADD FOREIGN KEY (book_id)
        REFERENCES public.book (book_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
;

ALTER TABLE IF EXISTS public.author_book
    ADD FOREIGN KEY (author_id)
        REFERENCES public.author (author_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
;



ALTER TABLE IF EXISTS public.category_book
    ADD FOREIGN KEY (book_id)
        REFERENCES public.book (book_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
;


ALTER TABLE IF EXISTS public.category_book
    ADD FOREIGN KEY (category_id)
        REFERENCES public.category (category_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
;


ALTER TABLE IF EXISTS public.book
    ADD FOREIGN KEY (publisher_id)
        REFERENCES public.publisher (publisher_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
;

-- THE END OF ALTER TABLE FOR USER

