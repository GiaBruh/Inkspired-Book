-- -- Address
-- INSERT INTO public.address (street_name, ward, district, city, province, postal_code)
-- VALUES ('Đinh Tiên Hoàng', 'Vĩnh Thanh Vân', 'NaN', 'Rạch Giá', 'Kiên Giang', '920000'),
--        ('Nguyễn Văn Cừ', 'An Khánh', 'NaN', 'Cần Thơ', 'NaN', '270000'),
--        ('Ngô Gia Tự', '5', 'NaN', 'Cà Mau', 'Cà Mau', '970000'),
--        ('Lộ Vòng Cung', 'An Khánh', 'Phong Điền', 'Cần Thơ', 'NaN', '270000');

-- Users
INSERT INTO public."user" ( username, password, email_address, full_name, gender, birthdate, phone_number
                          , user_image
                          , user_status)
VALUES ('nta', '202cb962ac59075b964b07152d234b70', 'nta@gmail.com', 'Nguyễn Thị A', 'female', '1991-02-02',
        0912345678, '/', true), -- 202cb962ac59075b964b07152d234b70 = 123
       ('Hoai_N_V', 'caf1a3dfb505ffed0d024130f58c5cfa', 'nvh@gmail.com', 'Nguyễn Văn Hoài', 'male', '1998-10-19',
        0841298550, '/', true), -- caf1a3dfb505ffed0d024130f58c5cfa = 321
       ('dio', 'ed20a959d410ccd843d9e1dfcee04228', 'kratos@gmail.com', 'Huỳnh Đại Tính', 'male', '1991-03-01',
        0830987675, '/', true), -- ed20a959d410ccd843d9e1dfcee04228 = a12
       ('Dai_Gia_Ngheo', '1406f37190e825427440bc020919218a', 'javan@gmail.com', 'Đỗ Đại Học', 'female', '2005-12-04',
        0830987675, '/', true);
-- 1406f37190e825427440bc020919218a = gogo
-- Admin
INSERT INTO public."admin" (username, password, email_address, full_name)
VALUES ('admin', '0192023a7bbd73250516f069df18b500', 'admin@gmail.com', 'Nguyễn Văn Admin');
-- 0192023a7bbd73250516f069df18b500 = admin123

-- Publisher
INSERT INTO public.publisher(publisher_name)
VALUES ('Pan Books'),
       ('Trẻ'),
       ('Văn Học'),
       ('Hội Nhà Văn'),
       ('Kim Đồng');

-- Author
INSERT INTO public.author (author_fullname, author_description, author_image)
VALUES ('Douglas Adams',
        'Douglas Noël Adams (11 March 1952 – 11 May 2001) was an English author, humorist, and screenwriter, ' ||
        'best known for The Hitchhiker''s Guide to the Galaxy. Originally a 1978 BBC radio comedy, ' ||
        'The Hitchhiker''s Guide to the Galaxy developed into a "trilogy" of five books that sold more than 15 million copies in his lifetime.',
        './uploadphotos/authorphotos/Douglas_adams_portrait_cropped.jpg'),
       ('Nguyễn Nhật Ánh',
        'Nguyễn Nhật Ánh (born May 7, 1955) is a Vietnamese author who writes for teenagers and adults. ' ||
        'He also works as a teacher, poet and correspondent. His works include approximately 30 novels, ' ||
        '4 essays, 2 series and some collections of poems. He is regarded as one of Vietnam''s most successful writers. ' ||
        'His best-known series, Kinh Vạn Hoa (Kaleidoscope), which contains 54 volumes, has been made into 3 drama series of the same name.',
        './uploadphotos/authorphotos/tacgia-NNA.jpg'),
       ('Nam Cao',
        'Trần Hữu Tri (1915—1951), commonly known by his pseudonym Nam Cao, was a Vietnamese short story writer and novelist. ' ||
        'His works generally received high acclaim from critics for their thoughtful description and veracious reflection of the society in the 1945 era. ',
        './uploadphotos/authorphotos/Nha-van-Nam-Cao.p'),
       ('Tô Hoài',
        'Tô Hoài (Birth name: Nguyễn Sen; September 27, 1920 – July 6, 2014)[1] was a Vietnamese writer, playwright, screenwriter, journalist and correspondent. ' ||
        'The pen name Tô Hoài is derived from the names of Tô Lịch River and Hoài Đức district, which are landmarks of his hometown. ' ||
        'Among his works are the best - seller books Dế mèn phiêu lưu ký (Diary of a cricket) (1941), Truyện Tây Bắc (Stories of North West region) (1958), ' ||
        'Quê nhà (Home town) (1970), Ba người khác (Three Others) (1991). Some of his works have been translated into foreign languages. ' ||
        'He won the Ho Chi Minh Prize for Literature in 1996.',
        './uploadphotos/authorphotos/TH.jpg');

-- Book
INSERT INTO public.book (title, publication_date, quantity, price, publisher_id,
                         book_description, book_image, is_available)
VALUES ('The Hitchhiker''s Guide to the Galaxy', '1979-10-12', 10, 10000, 1,
        'The Hitchhiker''s Guide to the Galaxy is the first book in the Hitchhiker''s Guide to the Galaxy comedy science fiction "trilogy of five books" by Douglas Adams, ' ||
        'with a sixth book written by Eoin Colfer. The novel is an adaptation of the first four parts of Adams''s radio series of the same name, ' ||
        'centering on the adventures of the only man to survive the destruction of Earth.',
        './uploadphotos/bookphotos/TheHitchhikersGuideToTheGalaxy.jpg', TRUE),
       ('The Restaurant at the End of the Universe', '1980-10-02', 5, 20000, 1,
        'The Restaurant at the End of the Universe is the second book in the Hitchhiker''s Guide to the Galaxy comedy science fiction "trilogy" by Douglas Adams, and is a sequel. ' ||
        'It was originally published by Pan Books as a paperback in 1980. The book was inspired by the song "Grand Hotel" by British rock band Procol Harum.' ||
        ' The book title refers to Milliways, the Restaurant at the End of the Universe, one of the settings of the book. ' ||
        'Elements of it are adapted from the radio series, primarily the Secondary Phase, although Milliways itself, ' ||
        'Arthur and Ford''s final fate come from Fits the Fifth and Sixth of the Primary Phase.',
        './uploadphotos/bookphotos/RestaurantAtTheEndOfTheUniverse.jpg', TRUE),
       ('Life, the Universe and Everything', '1982-10-14', 3, 30000, 1,
        'Life, the Universe and Everything (1982, ISBN 0-345-39182-9) is the third book in the six-volume Hitchhiker''s Guide to the Galaxy science fiction "trilogy of five books" ' ||
        'by British writer Douglas Adams. The title refers to the Answer to Life, the Universe, and Everything.',
        './uploadphotos/bookphotos/Life,_The_Universe_and_Everything_cover.jpg', TRUE),
       ('Mùa Hè Không Tên', '2023-09-22', 10, 109000, 2,
        'Mùa Hè Không Tên is the latest long story by writer Nguyen Nhat Anh, with childhood stories filled with countless mischief, thrilling moments and countless memories. ' ||
        'Then, as the innocent days of friendship gradually passed, the children in each simple family grew up witnessing the touching moments of a close love story, ' ||
        'the longing for peaceful happiness, and the confusion of each step. When we grow up, love comes with many obstacles.',
        './uploadphotos/bookphotos/mua-he-khong-ten.jpg', TRUE),
       ('Những Người Hàng Xóm', '2022-12-01', 10, 78000, 2,
        'The story follows the story of a guy who just got married, is getting ready to go to work, and is interested in writing. ' ||
        'He loves his wife in his own way, praises and worships his lover in his own way, but looks at life the way his neighbors live. ' ||
        'Living in the love of your wife is full of fragrance and sweetness. Witness the policeman''s love for his medical girlfriend; ' ||
        'The second love of a kind woman and a sign language announcer. ' ||
        'And contemplate the passionate love every day of the old painter who misses his beautiful wife - his model, his muse.',
        './uploadphotos/bookphotos/NhungNguoiHangXom.jpg', TRUE),
       ('Những Cánh Hoa Tàn', '2023-06-01', 10, 32100, 3,
        'NaN',
        './uploadphotos/bookphotos/NhungCanhHoaTan.jpg', TRUE),
       ('Sống Mòn', '2022-03-01', 10, 81100, 3,
        'Although the manuscript Sống Mòn was completed by writer Nam Cao before the Revolution, ' ||
        'it was not until after peace was restored in the North that the novel first appeared to readers.',
        './uploadphotos/bookphotos/SongMon.jpg', TRUE),
       ('Dế Mèn Phiêu Lưu Ký', '2019-01-01', 5, 50000, 5,
        'For more than half a century since it was first introduced to readers in 1941, "Dế Mèn Phiêu Lưu Ký" has been one of writer Tô Hoài''s most beloved works.
The work has been reprinted many times and translated into more than 20 languages around the world and is always welcomed by generations of young readers.
The work has been published in many different forms.',
        './uploadphotos/bookphotos/de-men-phieu-luu-ky.jpg', TRUE);

-- Author_book
INSERT INTO public.author_book (author_id, book_id)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (2, 4),
       (2, 5),
       (3, 6),
       (3, 7),
       (4, 8);

-- Category
INSERT INTO public.category (category_name)
VALUES ('Non-fiction'),
       ('Fiction'),
       ('Science Fiction'),
       ('Fantasy'),
       ('Mystery'),
       ('Romance'),
       ('Thriller'),
       ('Horror'),
       ('Children'),
       ('Young Adult'),
       ('Poetry'),
       ('Comics'),
       ('Art'),
       ('Biography'),
       ('History'),
       ('Cooking'),
       ('Health'),
       ('Business'),
       ('Travel'),
       ('Self-help'),
       ('Religion'),
       ('Comedy'),
       ('Crime'),
       ('Drama'),
       ('Action'),
       ('Adventure'),
       ('Politics'),
       ('Philosophy'),
       ('Science'),
       ('Sports'),
       ('Music'),
       ('Literature'),
       ('Novels'),
       ('Short Stories'),
       ('Other');

-- Category_book
INSERT INTO public.category_book (category_id, book_id)
VALUES (3, 1),
       (22, 1),
       (3, 2),
       (22, 2),
       (3, 3),
       (22, 3),
       (32, 4),
       (33, 4),
       (32, 5),
       (33, 5),
       (32, 6),
       (34, 6),
       (32, 7),
       (33, 7),
       (9, 8),
       (12, 8);


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