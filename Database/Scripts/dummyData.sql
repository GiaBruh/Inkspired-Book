-- Addresses
INSERT INTO public.address (address_id, street_name, ward, district, city, province, postal_code)
VALUES (1, 'AnyStreet', 'AnyWard', 'AnyDistrict', 'AnyCity', 'AnyProvince', 'XXXXXX');


-- Users
INSERT INTO public."user" ( id, username, password, email_address, full_name, gender, birthdate, phone_number
                          , address_id, user_image
                          , user_status)
VALUES (1, 'nta', '202cb962ac59075b964b07152d234b70', 'nta@gmail.com', 'Nguyen Thi A', 'female', '1991-02-02',
        0912345678, 1, '/', true);

-- Admin
INSERT INTO public."admin" (username, password, email_address, full_name)
VALUES ('admin', '202cb962ac59075b964b07152d234b70', 'nva@gmail.com', 'Nguyen van A');



-- -- Temporary unused dummy data
-- Payment Types
-- INSERT INTO public.payment_type (payment_type_id, type)
-- VALUES (1, 'credit_card'),
--        (2, 'debit_card'),
--        (3, 'paypal');
--
-- -- Payment Methods
-- INSERT INTO public.payment_method (payment_method_id, user_id, payment_type_id, provider, card_number, expiry_date,
--                                    card_owner)
-- VALUES (1, 1, 1, 'Visa', 1234567890123456, '2023-12-31', '/'),
--        (2, 2, 2, 'MasterCard', 9876543210987654, '2024-01-31', '/');

-- Shipping Methods
-- INSERT INTO public.shipping_method (shipping_method_id, name, price)
-- VALUES (1, 'Standard Shipping', 5000),
--        (2, 'Expedited Shipping', 10000);

-- Order Statuses
-- INSERT INTO public.order_status (order_status_id, status)
-- VALUES (1, 'Pending'),
--        (2, 'Processing'),
--        (3, 'Shipped'),
--        (4, 'Delivered');

-- Orders
-- INSERT INTO public."order" (order_id, user_id, order_date, payment_method_id, shipping_address_id, shipping_method,
--                             order_total, order_status)
-- VALUES (1, 2, '2023-09-27', 1, 1, 1, 10000, 1),
--        (2, 2, '2023-09-28', 2, 1, 2, 20000, 1);

-- Order Details
-- INSERT INTO public.order_detail (order_detail_id, book_id, order_id)
-- VALUES (1, 1, 1),
--        (2, 2, 1),
--        (3, 3, 2);

-- Publishers
INSERT INTO public.publisher(publisher_id, publisher_name)
VALUES (1, 'Unknown');

-- Authors
INSERT INTO public.author (author_id, author_fullname, author_description, author_image)
VALUES (1, 'Douglas Adams', 'Hitchhiker''s Guide', '/');

-- Books
INSERT INTO public.book (book_id, title, publication_date, quantity, price, publisher_id,
                         book_description, book_image, is_available)
VALUES (1, 'The Hitchhiker''s Guide to the Galaxy', '1979-10-12', 10, 10000, 1, '/', '/', TRUE),
       (2, 'The Restaurant at the End of the Universe', '1980-10-02', 5, 20000, 1, '/', '/', TRUE),
       (3, 'Life, the Universe and Everything', '1982-10-14', 3, 30000, 1, '/', '/', TRUE);



