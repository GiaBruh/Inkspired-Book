-- Users
INSERT INTO public."user" (id, email_address, password, full_name, birthday, phone_number)
VALUES
(1, 'john.doe@example.com', 'password123', 'John Doe', '1990-01-01', 1234567890),
(2, 'jane.doe@example.com', 'password456', 'Jane Doe', '1991-02-02', 9876543210);

-- Addresses
INSERT INTO public.address (address_id, street_number, street_name, district, city, postal_code)
VALUES
(1, '123 Main Street', 'Anytown', 'CA', '91234', 12345);

-- User Addresses
INSERT INTO public.user_address (user_id, address_id, is_default)
VALUES
(1, 1, TRUE),
(2, 1, FALSE);

-- Roles
INSERT INTO public.role (role_id, type)
VALUES
(1, 'admin'),
(2, 'customer');

-- User Roles
INSERT INTO public.user_role (user_id, role_id, is_default)
VALUES
(1, 1, TRUE),
(2, 2, TRUE);

-- Payment Types
INSERT INTO public.payment_type (payment_type_id, type)
VALUES
(1, 'credit_card'),
(2, 'debit_card'),
(3, 'paypal');

-- Payment Methods
INSERT INTO public.payment_method (payment_method_id, user_id, payment_type_id, provider, account_number, expiry_date, is_default)
VALUES
(1, 1, 1, 'Visa', 1234567890123456, '2023-12-31', TRUE),
(2, 2, 2, 'MasterCard', 9876543210987654, '2024-01-31', FALSE);

-- Shipping Methods
INSERT INTO public.shipping_method (shipping_method_id, name, price)
VALUES
(1, 'Standard Shipping', 5000),
(2, 'Expedited Shipping', 10000);

-- Order Statuses
INSERT INTO public.order_status (order_status_id, status)
VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Delivered');

-- Orders
INSERT INTO public."order" (order_id, user_id, order_date, payment_method_id, shipping_address_id, shipping_method, order_total, order_status)
VALUES
(1, 1, '2023-09-27', 1, 1, 1, 10000, 1),
(2, 2, '2023-09-28', 2, 1, 2, 20000, 2);

-- Order Details
INSERT INTO public.order_detail (order_detail_id, book_id, order_id, quantity)
VALUES
(1, 1, 1, 1),
(2, 2, 1, 2),
(3, 3, 2, 3);

-- Books
INSERT INTO public.book (book_id, title, publication_date, edition, quantity, price, author, publisher, is_available)
VALUES
(1, 'The Hitchhiker\'s Guide to the Galaxy', '1979-10-12', 6, 10, 10000, 1, 1, TRUE),
(2, 'The Restaurant at the End of the Universe', '1980-10-02', 5, 5, 20000, 1, 1, TRUE),
(3, 'Life, the Universe and Everything', '1982-10-14', 4, 3, 30000, 1, 1, TRUE);

-- Authors
INSERT INTO public.author (author_id, author_fullname, team)
VALUES
(1, 'Douglas Adams', 'Hitchhiker\'s Guide
