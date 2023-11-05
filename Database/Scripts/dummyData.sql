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
VALUES ('nta', '202cb962ac59075b964b07152d234b70', 'hngiabao11122003v3@gmail.com', 'Nguyen Thi A', 'female',
        '1991-02-02',
        '0912345678', 'https://dummyimage.com/100x100/000/fff', true), -- 202cb962ac59075b964b07152d234b70 = 123
       ('Hoai_N_V', 'caf1a3dfb505ffed0d024130f58c5cfa', 'nvh@gmail.com', 'Nguyen Van Hoai', 'male', '1998-10-19',
        '0841298550', 'https://dummyimage.com/100x100/000/fff', true), -- caf1a3dfb505ffed0d024130f58c5cfa = 321
       ('dio', 'ed20a959d410ccd843d9e1dfcee04228', 'kratos@gmail.com', 'Huynh Dai Tinh', 'male', '1991-03-01',
        '0830987675', 'https://dummyimage.com/100x100/000/fff', true), -- ed20a959d410ccd843d9e1dfcee04228 = a12
       ('Dai_Gia_Ngheo', '1406f37190e825427440bc020919218a', 'javan@gmail.com', 'Do Dai Hoc', 'female', '2005-12-04',
        '0830987675', 'https://dummyimage.com/100x100/000/fff', true);
-- 1406f37190e825427440bc020919218a = gogo
-- Add a test user for forgot password
-- Do not uncomment below user data. Uncomment it will cause bug
--        ('IuseArch', 'a1f26721ed609e446e95f43a51951b49', 'dthai1345@gmail.com', 'Người Dùng Arch', 'male', '2003-11-10',
--         0346281383, '/', true); -- a1f26721 ed609e446e95f43a51951b49 = btw


-- Shopping_cart
INSERT INTO public.shopping_cart
VALUES (1, 2),
       (2, 0),
       (3, 1),
       (4, 0);

-- Admin
INSERT INTO public."admin" (username, password, email_address, full_name)
VALUES ('admin', '0192023a7bbd73250516f069df18b500', 'admin@gmail.com', 'Nguyen Van Admin');
-- 0192023a7bbd73250516f069df18b500 = admin123

-- Publisher
INSERT INTO public.publisher(publisher_name)
VALUES ('Pan Books'),
       ('Trẻ'),
       ('Văn Học'),
       ('Hội Nhà Văn'),
       ('Kim Đồng'),
       ('Penguin Books'),
       ('Grantham Book Services'),
       ('Tổng Hợp TPHCM'),
       ('Bách Việt'),
       ('Hồng Đức'),
       ('Hà Nội'),
       ('Page Street Publishing'),
       ('Thế Giới'),
       ('Thanh Hóa');

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
        'His best-known series, Kính Vạn Hoa (Kaleidoscope), which contains 54 volumes, has been made into 3 drama series of the same name.',
        './uploadphotos/authorphotos/tacgia-NNA.jpg'),
       ('Nam Cao',
        'Trần Hữu Trí (1915—1951), commonly known by his pseudonym Nam Cao, was a Vietnamese short story writer and novelist. ' ||
        'His works generally received high acclaim from critics for their thoughtful description and veracious reflection of the society in the 1945 era. ',
        './uploadphotos/authorphotos/Nha-van-Nam-Cao.png'),
       ('To Hoai',
        'To Hoai (Birth name: Nguyen Sen; September 27, 1920 – July 6, 2014)[1] was a Vietnamese writer, playwright, screenwriter, journalist and correspondent. ' ||
        'The pen name To Hoai is derived from the names of To Lich River and Hoai Duc district, which are landmarks of his hometown. ' ||
        'Among his works are the best - seller books De Men Phieu luu Ky (Diary of a cricket) (1941), Truyen Tay Bac (Stories of North West region) (1958), ' ||
        'Que nha (Home town) (1970), Ba nguoi khac (Three Others) (1991). Some of his works have been translated into foreign languages. ' ||
        'He won the Ho Chi Minh Prize for Literature in 1996.',
        './uploadphotos/authorphotos/TH.jpg'),
       ('Tara Westover',
        'Tara Westover (born September 27, 1986) is an American memoirist, essayist and historian. Her memoir Educated (2018) debuted at No. 1 ' ||
        'on The New York Times bestseller list and was a finalist for a number of national awards, including the LA Times Book Prize, PEN America''s Jean Stein Book Award, ' ||
        'and two awards from the National Book Critics Circle Award. The New York Times ranked Educated as one of the 10 Best Books of 2018. ' ||
        'Westover was chosen by Time magazine as one of the 100 most influential people of 2019.',
        './uploadphotos/authorphotos/Tara-Westover.jpg'),
       ('Ashlee Vance',
        'Ashlee Vance (born 1977) is an American reporter, writer and filmmaker. His biography of Elon Musk, titled Elon Musk: ' ||
        'Tesla, SpaceX, and the Quest for a Fantastic Future, was released on May 19, 2015.',
        './uploadphotos/authorphotos/Ashlee_Vance.jpg'),
       ('Giovanna Fletcher',
        'Giovanna Fletcher (née Falcone, born 29 January 1985) is an English blogger, podcaster, author, actress, and presenter. ' ||
        'Since 2019, she has presented the CBeebies series The Baby Club. She won series 20 of I''m a Celebrity...Get Me Out of Here!.',
        './uploadphotos/authorphotos/Giovanna-Fletcher.jpg'),
       ('Lê Đỗ Quỳnh Phương',
        'Quỳnh Phương used to be the MC of ''Thay lời muốn nói'' - one of the oldest recurring music programs on television in Vietnam for the past 19 years. ' ||
        'Master of musicology, author, and also an inspirational speaker with the desire to bring positive energy and spread love to the community.',
        './uploadphotos/authorphotos/LeDoQuynhPhuong.png'),
       ('Tào Đình', null, null),
       ('Tâm Phạm', null, null),
       ('Otsuichi', null, null),
       ('Seiichi Makino', null, null),
       ('Michio Tsutsui', null, null),
       ('Mei Hachimoku',
        'Mei Hachimoku debuted as an author at the 13th Shogakukan Light Novel Competition, where he won the Gagaga Award and the Judge’s Special Award for “The Tunnel to Summer, ' ||
        'The Exit of Goodbyes.” He also wrote “Wait for Me Yesterday in Spring” and “Amber Autumn, Zero Second Journey” as part of the same “Time and Four Seasons” series, ' ||
        'as well as “Mimosa’s Confession.”',
        './uploadphotos/authorphotos/MeiHachimoku.png'),
       ('Kukka', null, null),
       ('Rebecca Lindamood',
        '"I grew up cooking alongside my mother, Cathy,  in the commercial kitchens of the camps and retreat centers my father, Jim, managed and went on to cook in various food service venues including a deli, ' ||
        'a bistro, and a corporate chain restaurant that shall remain unnamed. I credit my mother, Cathy,  with igniting my passion for adventuring with my food."',
        './uploadphotos/authorphotos/Rebecca_Lindamood.jpg'),
       ('Andrew Roberts',
        'Andrew Roberts, Baron Roberts of Belgravia, FRSL FRHistS (born 13 January 1963), is a British popular historian, journalist and member of the House of Lords. ' ||
        'He is the Roger and Martha Mertz Visiting Research Fellow at the Hoover Institution at Stanford University and a Lehrman Institute Distinguished Lecturer at' ||
        ' the New-York Historical Society. He served as a trustee of the National Portrait Gallery from 2013 to 2021.',
        './uploadphotos/authorphotos/Andrew_Roberts.jpg'),
       ('Various Artist', null, null);

-- Book
INSERT INTO public.book (title, publication_date, quantity, price, publisher_id,
                         book_description, book_image, is_available)
VALUES ('The Hitchhiker''s Guide to the Galaxy', '1979-10-12', 10, 10000, 1,
        'The Hitchhiker''s Guide to the Galaxy is the first book in the Hitchhiker''s Guide to the Galaxy comedy science fiction "trilogy of five books" by Douglas Adams, ' ||
        'with a sixth book written by Eoin Colfer. The novel is an adaptation of the first four parts of Adams''s radio series of the same name, ' ||
        'centering on the adventures of the only man to survive the destruction of Earth.',
        './uploadphotos/bookphotos/TheHitchhikersGuideToTheGalaxy.jpg', TRUE),
       ('The Restaurant at the End of the Universe', '1980-10-02', 10, 20000, 1,
        'The Restaurant at the End of the Universe is the second book in the Hitchhiker''s Guide to the Galaxy comedy science fiction "trilogy" by Douglas Adams, and is a sequel. ' ||
        'It was originally published by Pan Books as a paperback in 1980. The book was inspired by the song "Grand Hotel" by British rock band Procol Harum.' ||
        ' The book title refers to Milliways, the Restaurant at the End of the Universe, one of the settings of the book. ' ||
        'Elements of it are adapted from the radio series, primarily the Secondary Phase, although Milliways itself, ' ||
        'Arthur and Ford''s final fate come from Fits the Fifth and Sixth of the Primary Phase.',
        './uploadphotos/bookphotos/RestaurantAtTheEndOfTheUniverse.jpg', TRUE),
       ('Life, the Universe and Everything', '1982-10-14', 10, 30000, 1,
        'Life, the Universe and Everything (1982, ISBN 0-345-39182-9) is the third book in the six-volume Hitchhiker''s Guide to the Galaxy science fiction "trilogy of five books" ' ||
        'by British writer Douglas Adams. The title refers to the Answer to Life, the Universe, and Everything.',
        './uploadphotos/bookphotos/Life,_The_Universe_and_Everything_cover.jpg', TRUE),
       ('Mùa Hè Không Tên', '2023-09-22', 20, 109000, 2,
        'Mùa Hè Không Tên is the latest long story by writer Nguyễn Nhật Ánh, with childhood stories filled with countless mischief, thrilling moments and countless memories. ' ||
        'Then, as the innocent days of friendship gradually passed, the children in each simple family grew up witnessing the touching moments of a close love story, ' ||
        'the longing for peaceful happiness, and the confusion of each step. When we grow up, love comes with many obstacles.',
        './uploadphotos/bookphotos/mua-he-khong-ten.jpg', TRUE),
       ('Những Người Hàng Xóm', '2022-12-01', 20, 78000, 2,
        'The story follows the story of a guy who just got married, is getting ready to go to work, and is interested in writing. ' ||
        'He loves his wife in his own way, praises and worships his lover in his own way, but looks at life the way his neighbors live. ' ||
        'Living in the love of your wife is full of fragrance and sweetness. Witness the policeman''s love for his medical girlfriend; ' ||
        'The second love of a kind woman and a sign language announcer. ' ||
        'And contemplate the passionate love every day of the old painter who misses his beautiful wife - his model, his muse.',
        './uploadphotos/bookphotos/NhungNguoiHangXom.jpg', TRUE),
       ('Những Cánh Hoa Tàn', '2023-06-01', 10, 32100, 3,
        null,
        './uploadphotos/bookphotos/NhungCanhHoaTan.jpg', TRUE),
       ('Sống Mòn', '2022-03-01', 10, 81100, 3,
        'Although the manuscript Song Mon was completed by writer Nam Cao before the Revolution, ' ||
        'it was not until after peace was restored in the North that the novel first appeared to readers.',
        './uploadphotos/bookphotos/SongMon.jpg', TRUE),
       ('Dế Mèn Phiêu Lưu Ký', '2019-01-01', 35, 50000, 5,
        'For more than half a century since it was first introduced to readers in 1941, "Dế Mèn Phiêu Lưu Ký" has been one of writer Tô Hoài''s most beloved works.
The work has been reprinted many times and translated into more than 20 languages around the world and is always welcomed by generations of young readers.
The work has been published in many different forms.',
        './uploadphotos/bookphotos/de-men-phieu-luu-ky.jpg', TRUE),
       ('Educated: A Memoir', '2018-02-18', 10, 175000, 6,
        'Born to survivalists in the mountains of Idaho, Tara Westover was seventeen the first time she set foot in a classroom. ' ||
        'Her family was so isolated from mainstream society that there was no one to ensure the children received an education, ' ||
        'and no one to intervene when one of Tara''s older brothers became violent. When another brother got himself into college, Tara decided to try a new kind of life. ' ||
        'Her quest for knowledge transformed her, taking her over oceans and across continents, to Harvard and to Cambridge University. ' ||
        'Only then would she wonder if she''d traveled too far, if there was still a way home.',
        './uploadphotos/bookphotos/Educated.jpg', TRUE),
       ('Elon Musk: How the Billionaire CEO of SpaceX and Tesla is Shaping our Future', '2015-05-19', 10, 200000, 7,
        'In the spirit of Steve Jobs and Moneyball, Elon Musk is both an illuminating and authorized look at the extraordinary life of one of Silicon Valley''s most exciting, ' ||
        'eccentric, and ambitious entrepreneurs--a real-life Tony Stark--and a fascinating exploration of the renewal of American invention and its new "makers."',
        './uploadphotos/bookphotos/elon_musk_intl_tesla__spacex__and_the_quest_for_a_fantastic_future.jpg', TRUE),
       ('Some Kind of Wonderful', '2017-01-01', 10, 188100, 6,
        'When the love of your life says you''re not The One, what next? ' ||
        'After celebrating a decade together, everyone thinks Lizzy and Ian are about to get engaged. ' ||
        'Instead, a romantic escape to Dubai leaves Lizzy with no ring, no fiancé and no future. ' ||
        'Lizzy is heartbroken - but through the tears, she sees an opportunity. This is her moment to discover what she''s been missing while playing Ian''s ''better half''. ' ||
        'But how much has Ian changed her, and who is she without him? Lizzy sets out to rediscover the girl she was before - and, in the meantime, have a little fun . . .',
        './uploadphotos/bookphotos/SomeKindofWonderful.jpeg', TRUE),
       ('Thay Đổi Cuộc Sống Với Thần Số Học', '2020-10-01', 10, 178600, 8,
        'In every human''s life, we often have to explore and find our own path without knowing for sure whether that path is right for us or not. ' ||
        'Sometimes, we have to stumble, stumble and even get lost to learn experiences and lessons. If we understand Numerology, ' ||
        'and through certain knowledge about the meaning and combination of numbers, we can chart out for ourselves a relatively specific direction, minimizing the times " trial and error", ' ||
        'thereby finding more joy, happiness, and meaning in life.',
        './uploadphotos/bookphotos/ThayDoiCuocSongVoiThanSoHoc.jpg', TRUE),
       ('Yêu Anh Hơn Cả Tử Thần', '2019-01-01', 20, 66300, 9,
        null,
        './uploadphotos/bookphotos/YeuAnhHonCaTuThan.jpg', TRUE),
       ('Vẽ Em Bằng Màu Nỗi Nhớ', '2022-01-01', 20, 108800, 9,
        'Painting You with the Color of Nostalgia is a true love story that has touched the hearts of many readers. The story is the memoir of character Khanh during his return to Vietnam, ' ||
        'interwoven with memories of the previous 6 years. Khanh returned to his hometown when so many things had changed, only the feelings of relatives and old friends remained unchanged. ' ||
        'In Saigon, Khanh met Linh again - the girl from the old memories, and Miu - a girl who seemed strange but was very familiar. Can he forget Linh - the girl he once loved passionately? ' ||
        'And will he recognize Miu - the little girl with an erratic mood? The story revolves around the daily lives of young and dynamic young people, ' ||
        'where there is not only love between couples, but also friendship, teacher love, family love, and compatriot love. children living far away from home... ' ||
        'It all brings so many emotions, from humor to curiosity, sometimes even emotional tears.',
        './uploadphotos/bookphotos/VeEmBangMauNoiNho.jpeg', TRUE),
       ('Lời Nguyền Shiraisan', '2022-10-09', 15, 95000, 10,
        'Before they died, these people had all heard a horror story, called The Curse of Shiraisan. In the story, there is a soul-stealing curse. ' ||
        'Whether intentionally searching or accidentally surfing the internet and reading it, already knowing the story''s content and characters, ' ||
        'people will surely explode and die, and then it is concluded that it is due to heart failure.
   Such acts of widespread destruction are often associated with a sense of revenge against society, stemming from the perpetrator''s unfortunate past. ' ||
        'However, the past here is difficult to verify, the witnesses who come forward are unreliable, we only know that each person''s life after reading/' ||
        'listening to the story will be a series of days imprisoned by terror, paranoia and ended in tragedy.',
        './uploadphotos/bookphotos/LoiNguyenShiraisan.jpg', TRUE),
       ('Từ Điển Ngữ Pháp Tiếng Nhật Sơ Cấp', '2021-10-23', 20, 195000, 10,
        null,
        './uploadphotos/bookphotos/TuDienNguPhapTiengNhatSoCap.png', TRUE),
       ('Đường Hầm Tới Mùa Hạ - Lối Thoát Của Biệt Ly', '2022-5-17', 20, 119000, 11,
        '“Do you know the Urashima tunnel? I heard that once you step inside, all your wishes will come true, but at the cost of age..."

   High school student Tono Kaoru accidentally heard about that urban legend. That same night, he accidentally found a tunnel with similarities...

   Entering the tunnel, he may not be able to bring back his sister who passed away five years ago.

   After class, Kaoru investigated this tunnel, but unexpectedly was discovered by her friend Hanashiro Anzu - a new transfer student.

   The two of them work together to achieve both of their dreams... The start of a summer full of exciting surprises that no one has ever known.

   Tunnel to Summer - The way out of separation, a meaningful story about family affection and love, is a farewell to the joys and sorrows of the past, finding what has been lost to be able to move forward. to the future.',
        'uploadphotos/bookphotos/bia_duong_ham_toi_mua_ha_3.jpg', TRUE),
       ('The Ultimate Guide To Vegetable Side Dishes', '2022-01-01', 30, 436000, 12,
        'The Ultimate Guide to Vegetable Side Dishes is a collection of 100 recipes for side dishes to accompany any main course.',
        './uploadphotos/bookphotos/TheUltimateGuideToVegetableSideDishses.jpg', TRUE),
       ('Napoleon Đại Đế', '2021-8-23', 25, 529000, 13,
        'Napoleon is an especially great and fascinating figure in French history as well as world history. His life, career, views, and talents have been the subject of thousands ' ||
        'of books over the past two centuries, and will probably continue to be studied for many more centuries to come.

   In the context that the books translated into Vietnamese about him as well as about the post-French Revolution period in Vietnam are still counted on the fingers of one hand, ' ||
        'few in both number and stature, the book Napoleon the Great can be considered a A phenomenon whose size, scale, and rich historical nature have created the ' ||
        'special value of the work.',
        './uploadphotos/bookphotos/Napoleon_dai_de.png', TRUE),
    ('1000 Hợp Âm Cho Đàn Guitare', '2022-12-31', 50, 85000, 14,
     'The book 1000 GUITARE CHORDS talks about how chords (scales) for the guitar are as important as the notes of a melody. It''s impossible to play guitar without knowing chords.

The book introduces 100 finger positions for the most commonly used chords. Each chord has 4 different finger positions on the fretboard, except for some major chords and 7th chords which have 8 finger positions.

Serious training is the key to all success. Please practice the piano for 10 minutes every day to conquer each chord, then you can change the scale and start creating your favorite music!',
     './uploadphotos/bookphotos/1000Chords.jpg', TRUE);

-- Author_book
INSERT INTO public.author_book (author_id, book_id)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (2, 1),
       (2, 4),
       (2, 5),
       (3, 6),
       (3, 7),
       (4, 8),
       (5, 9),
       (6, 10),
       (7, 11),
       (8, 12),
       (9, 13),
       (10, 14),
       (11, 15),
       (12, 16),
       (13, 16),
       (14, 17),
       (15, 17),
       (16, 18),
       (17, 19),
       (18, 20);

-- Category
INSERT INTO public.category (category_name)
VALUES ('Foreign book'),
       ('Romance'),
       ('Technology'),
       ('Fantasy, Fiction & Science fiction'),
       ('Thrillers & Horror'),
       ('Self-help'),
       ('Biographies, memoirs & autobiography'),
       ('Short Stories'),
       ('Cookbooks'),
       ('Politics'),
       ('Education'),
       ('Novel'),
       ('Light novel'),
       ('Comic'),
       ('Dictionary'),
       ('Economics'),
       ('Children book'),
       ('Non-fiction'),
       ('Comedy'),
       ('Other');

-- Category_book
INSERT INTO public.category_book (category_id, book_id)
VALUES (1, 1),
       (4, 1),
       (12, 1),
       (19, 1),
       (1, 2),
       (4, 2),
       (12, 2),
       (19, 2),
       (1, 3),
       (4, 3),
       (12, 3),
       (19, 3),
       (12, 4),
       (12, 5),
       (8, 6),
       (12, 7),
       (14, 8),
       (17, 8),
       (1, 9),
       (7, 9),
       (1, 10),
       (3, 10),
       (7, 10),
       (16, 10),
       (1, 11),
       (2, 11),
       (6, 12),
       (2, 13),
       (2, 14),
       (5, 15),
       (18, 15),
       (11, 16),
       (15, 16),
       (13, 17),
       (1, 18),
       (9, 18),
       (10, 19),
       (20, 20);

-- Order_status
INSERT INTO public.order_status
VALUES (0, 'Pending'),
       (1, 'Confirmed'),
       (2, 'Packaging'),
       (3, 'Delivering'),
       (4, 'Delivered'),
       (5, 'Cancelled'),
       (6, 'Cancel Pending');

-- Cart_book
INSERT INTO public.cart_book (shopping_cart_id, book_id)
VALUES (1, 7),
       (1, 4),
       (3, 8)
;

-- storage
INSERT INTO storage (storage_id, book_id, original_price, adding_date) VALUES
(1, 1, 100000, '2023-11-03'),
(2, 2, 150000, '2023-11-03'),
(3, 3, 200000, '2023-11-03'),
(4, 4, 60000, '2023-11-02'),
(5, 5, 70000, '2023-11-03'),
(6, 6, 120000, '2023-11-03'),
(7, 7, 30000, '2023-11-03'),
(8, 8, 80000, '2023-11-03'),
(9, 9, 220000, '2023-11-03'),
(10, 10, 180000, '2023-11-03'),
(11, 11, 50000, '2023-11-03'),
(12, 12, 70000, '2023-11-03'),
(13, 13, 40000, '2023-11-03'),
(14, 14, 90000, '2023-11-03'),
(15, 15, 95000, '2023-11-03')


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