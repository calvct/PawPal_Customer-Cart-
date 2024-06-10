drop database if exists OLTP_ANGEL;
create database if not exists OLTP_ANGEL;
use OLTP_ANGEL;

-- drop table if exists CATEGORY;
-- drop table if exists DETAIL_TRANSACTIONS;
-- drop table if exists PRODUK;
-- drop table if exists TRANSACTIONS;
-- drop table if exists USERS;
-- drop table if exists WISHLIST;


create table if not exists USERS 
(
   USER_ID              varchar(6)    primary key,
   USER_USERNAME        varchar(20)                    not null,
   USER_NAME            varchar(50)                    not null,
   USER_EMAIL           varchar(30)                    not null,
   USER_PASSWORD        varchar(255)                   not null,
   USER_ADMIN			boolean						   not null,
   STATUS_DEL           char(1)                        not null
);

create table TRANSACTIONS 
(
   TRANS_ID             varchar(10)                    primary key,
   USER_ID              varchar(6)                     not null,
   TRANS_DATE           timestamp                      not null,
   TRANS_TOTAL          integer                        not null,
   TRANS_QTY            integer                        not null,
   TRANS_ADDRESS        varchar(100)                   not null,
   TRANS_PHONE     		varchar(12)                    not null,
   NAMA_PENERIMA        varchar(100)                   not null,
   foreign key (USER_ID) references USERS(USER_ID)
);

create table CATEGORY 
(
   CATEGORY_ID          varchar(5)                     primary key,
   CATEGORY_NAME        varchar(50)                    not null,
   CATEGORY_ANIMAL      varchar(50)                    not null,
   STATUS_DEL           char(1)                        not null
);

create table PRODUK 
(
   PRODUCT_ID           varchar(5)                     primary key,
   CATEGORY_ID          varchar(5)                     not null,
   PRODUCT_NAME         varchar(100)                    not null,
   PRODUCT_SIZE         varchar(10)                    ,
   PRODUCT_PRICE        integer                        not null,
   PRODUCT_STOCK        integer                        not null,
   PRODUCT_DESC         text                           not null,
   STATUS_DEL           char(1)                        not null,
   foreign key (CATEGORY_ID) references CATEGORY(CATEGORY_ID)
);



create table WISHLIST 
(
   USER_ID              varchar(6)                     not null,
   PRODUCT_ID           varchar(5)                     not null,
   STATUS_DEL           char(1)                        not null,
   PRIMARY KEY (USER_ID, PRODUCT_ID),
   foreign key (USER_ID) references USERS(USER_ID),
   foreign key (PRODUCT_ID) REFERENCES PRODUK(PRODUCT_ID)
);

create table CART 
(
   CART_ID              integer	                       primary key,
   USER_ID              varchar(6)                     not null,
   PRODUCT_ID			varchar(10)					   not null,
   CART_QTY				integer						   not null,
   STATUS_DEL           char(1)                        not null,
   foreign key (USER_ID) references USERS(USER_ID),
   foreign key (PRODUCT_ID) REFERENCES PRODUK(PRODUCT_ID)
);



create table DETAIL_TRANSACTIONS 
(
   DETAIL_TRANS_ID      integer                        primary key,
   PRODUCT_ID           varchar(5)                     not null,
   TRANS_ID             varchar(10)                    not null,
   QTY                  integer                        not null,
   ITEM_PRICE           integer                        not null,
   foreign key (PRODUCT_ID) references PRODUK(PRODUCT_ID),
   foreign key (TRANS_ID) REFERENCES TRANSACTIONS(TRANS_ID)
);
      
INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME, CATEGORY_ANIMAL, STATUS_DEL) VALUES
('CAT01', 'Food', 'Dog', '0'),
('CAT02', 'Treats', 'Dog', '0'),
('CAT03', 'Toys', 'Dog', '0'),
('CAT04', 'Supplies', 'Dog', '0'),
('CAT05', 'Food', 'Cat', '0'),
('CAT06', 'Treats', 'Cat', '0'),
('CAT07', 'Toys', 'Cat', '0'),
('CAT08', 'Supplies', 'Cat', '0');


INSERT INTO PRODUK (PRODUCT_ID, CATEGORY_ID, PRODUCT_NAME, PRODUCT_SIZE, PRODUCT_PRICE, PRODUCT_STOCK, PRODUCT_DESC, STATUS_DEL) VALUES
('P0001', 'CAT01', 'Pedigree Adult Lamb & Vegetables', '1.5 kg', 73000, 5, 'Pedigree Dewasa Nutrisi Lengkap untuk Anjing telah dirumuskan untuk memberikan anjing dewasa semua energi dan nutrisi yang mereka butuhkan untuk terus menjalani hidup sepenuh-penuhnya. Ini dikemas dengan vitamin, seng dan Omega 6 untuk membantu menjaga anjing dewasa tampak seperti pemenang terbaik-di-show, dan telah memimpin tingkat Vitamin E untuk menjaga sistem kekebalan tubuh muda di jantung. Bersama-sama dengan campuran khusus serat yang mempromosikan pencernaan yang sehat, dan kibbles perawatan mulut untuk membersihkan gigi.', 0),
('P0002', 'CAT01', 'Pedigree Adult Lamb & Vegetables', '500 gr', 26000, 10, 'Pedigree Dewasa Nutrisi Lengkap untuk Anjing telah dirumuskan untuk memberikan anjing dewasa semua energi dan nutrisi yang mereka butuhkan untuk terus menjalani hidup sepenuh-penuhnya. Ini dikemas dengan vitamin, seng dan Omega 6 untuk membantu menjaga anjing dewasa tampak seperti pemenang terbaik-di-show, dan telah memimpin tingkat Vitamin E untuk menjaga sistem kekebalan tubuh muda di jantung. Bersama-sama dengan campuran khusus serat yang mempromosikan pencernaan yang sehat, dan kibbles perawatan mulut untuk membersihkan gigi.', 0),
('P0003', 'CAT01', 'Royal Canin Golden Retriever Adult', '12 kg', 1179000, 3, 'GOLDEN RETRIEVER DEWASA membantu mendukung “penghalang” peran kulit (kompleks eksklusif) dan menjaga kulit & mantel kesehatan (EPA & DHA). Diperkaya dengan minyak borage. Formula ini mengandung nutrisi khusus untuk membantu mendukung fungsi jantung yang baik, Enrichedwith taurin dan EPA-DHA, membantu menjaga berat badan ideal orang dewasa Golden Retriever ini berkat kandungan kalori disesuaikan. KOMPOSISI: dehidrasi protein unggas, jagung, beras, gandum, lemak hewan, nabati protein isolat *, dihidrolisis protein hewani, serat nabati, bubur bit, minyak ikan, mineral, minyak kedelai, tomat dehidrasi, sekam psyllium dan biji, sakarida fructo-oligo , krustasea dihidrolisis (sumber glucosamine), minyak borage (0,1%), teh dan anggur hijau ekstrak (sumber polifenol), ekstrak marigold (sumber lutein), tulang rawan terhidrolisis (sumber chondroitin).', 0),
('P0004', 'CAT02', 'Gnawlers Calcium Milk Bone Dental Snack', 'Small', 25000, 5, 'Snack Anjing Gnawlers Calcium Milk Bone small isi 7 pcs 60 gr Membantu membersihkan gigi dan menyegarkan bau mulut 100 % tanpa daging, mengandung kalsium & susu Ingredients: Milk powder, Sodium caseinate, Calciumcarbonate, Cereal cellulose, Gelatin YuccaI, MO Natural flavor, Rosemary extraction. Scientifically engineered with all food grade raw materials and no artificial flavours or colors with reasonable level of calcium. It is easily digestible, cleans teeth and freshens breath', 0),
('P0005', 'CAT02', 'Gnawlers Calcium Milk Bone Dental Snack', 'Medium', 29900, 5, 'Snack Anjing Gnawlers Calcium Milk Bone medium isi 4 pcs 90 gr Membantu membersihkan gigi dan menyegarkan bau mulut 100 % tanpa daging, mengandung kalsium & susu Ingredients: Milk powder, Sodium caseinate, Calciumcarbonate, Cereal cellulose, Gelatin YuccaI, MO Natural flavor, Rosemary extraction. Scientifically engineered with all food grade raw materials and no artificial flavours or colors with reasonable level of calcium. It is easily digestible, cleans teeth and freshens breath', 0),
('P0006', 'CAT02', 'Gnawlers Calcium Milk Bone Dental Snack', 'Large', 33900, 5, 'Snack Anjing Gnawlers Calcium Milk Bone large isi 2 pcs 110 gr Membantu membersihkan gigi dan menyegarkan bau mulut 100 % tanpa daging, mengandung kalsium & susu Ingredients: Milk powder, Sodium caseinate, Calciumcarbonate, Cereal cellulose, Gelatin YuccaI, MO Natural flavor, Rosemary extraction. Scientifically engineered with all food grade raw materials and no artificial flavours or colors with reasonable level of calcium. It is easily digestible, cleans teeth and freshens breath', 0),
('P0007', 'CAT03', 'Non-Toxic Rubber Chew Bone Toy', '6 inch', 32000, 3, "Very safe and non-toxic Because they are constructed of sturdy natural rubber, these rubber dog chew toys are completely safe for your pets. Unlike noisy or soft toys that are quickly damaged, these extremely sturdy and long-lasting dog toys will keep your dog entertained for hours. The surface\'s gentle grooves or spikes aid in massaging and cleansing the gums, which reduces plaque and tartar buildup. Dogs have a natural drive to chew, and they can chew for hours. This medication helps dogs feel less anxious and prevents them from chewing on furniture and personal items. Ideal for All-sized dog breeds, our rubber dog chew toys will keep them occupied when you aren\'t around and will also give comfort when they feel uneasy.", 0),
('P0008', 'CAT04', 'Tempat Tidur Anjing Soft Warm Dog Bed Grey', NULL, 64900, 2, 'Tempat tidur untuk hewan peliharaan ini sangat cocok digunakan untuk hewan peliharaan seperti anjing ataupun kucing kesayangan Anda. Istirahat mereka akan lebih nyaman serta hangat sehingga mereka lebih bahagia dan tidak mudah stress. Material Berkualitas Kasur ini terbuat dari materiak oxford dan katun. Bahan oxford terkenal tahan lama dan tidak mudah rusak. Sementara bahan katun memiliki tekstur yang halus dan lembut sehingga hewan peliharaan Anda dapat berlama-lama istirahat di kasur ini. Desain dan tampilan yang menarik membuat kasur tidur ini juga menambah dekorasi di rumah Anda.. Rincian yang Anda dapatkan untuk pembelian produk ini: 1 x Kasur Tempat Tidur Anjing Soft Warm Dog Bed Size M Material Oxford dan Katun Dimensi 60 x 38 x 11 cm', 0),
('P0009', 'CAT05', 'Whiskas Makanan Kucing Kering Junior Mackerel', '1.1 kg', 79900, 2, 'Whiskas junior mackerel merupakan makanan kucing kering yang diracik khusus untuk memenuhi kebutuhan kucing Anda pada tahap kehidupan mereka. Rasa ikan mackerel renyah di bagian luar dengan tekstur creamy lezat di tengah. Lengkungan Whiskas dry akan membantu merawat kesehatan mulut dan gigi kucing. Diperkaya dengan kalsium dan fosfor, termasuk vitamin D untuk pertumbuhan tulang serta tubuh yang sehat. Mengandung antioksidan alami berdasarkan vitamin E untuk sistem kekebalan tubuh. Protein dan lemak berkualitas terpilih untuk menyediakan energi untuk bermain. Ideal untuk anak kucing usia 2-12 bulan.', 0),
('P0010', 'CAT05', 'Whiskas Makanan Kucing Kering Junior Mackerel', '450 gr', 33900, 1, 'Whiskas junior mackerel merupakan makanan kucing kering yang diracik khusus untuk memenuhi kebutuhan kucing Anda pada tahap kehidupan mereka. Rasa ikan mackerel renyah di bagian luar dengan tekstur creamy lezat di tengah. Lengkungan Whiskas dry akan membantu merawat kesehatan mulut dan gigi kucing. Diperkaya dengan kalsium dan fosfor, termasuk vitamin D untuk pertumbuhan tulang serta tubuh yang sehat. Mengandung antioksidan alami berdasarkan vitamin E untuk sistem kekebalan tubuh. Protein dan lemak berkualitas terpilih untuk menyediakan energi untuk bermain. Ideal untuk anak kucing usia 2-12 bulan.', 0),
('P0011', 'CAT05', 'IAMS Proactive Health Premium Cat Food – Cat Dry Food in Tuna and Salmon Meal Flavor', '1 kg', 123690, 4, 'IAMS Proactive Healthy Cat Food with Tuna and Salmon is a great way to provide your cat with all the nutrients they need in one tasty package. With delicious chicken cats love, this nutritious dry food for cat can help support their overall health and keep them happy. - Developed formula with VETERINARIANS - IAMS cat food contains PREMIUM TAILORED NUTRITION with 0% fillers - HEALTHY SKIN AND COAT – This IAMS cat dry food is formulated with Omega 6 and 3 fatty acids, which help your cat have healthy skin and coat - This cat food dry is scientifically proven for HEALTHY NATURAL DEFENSE with Vitamin-E - HEALTHY DIGESTION – Your cat will love the added benefits of prebiotics and beet pulp in this cat food dry food, which help support their digestive system - STRONG MUSCLES – Made with high-quality protein sources, this IAMS salmon cat food helps cats maintain their muscle strength - HEALTHY TEETH – This tuna cat food contains crunchy kibbles that help reduce plaque and tartar build-up, which can lead to bad breath', 0),
('P0012', 'CAT06', 'Me-O Creamy Treats Salmon', '60 gr', 21900, 5, 'Snack Kucing MEO Creamy (isi 15 gr x 4) Manfaat : 1. Taurin untuk kesehatan mata dan mempertajam penglihatan kucing 2. Vitamin C meningkatkan sistem kekebalan tubuh dan membantu mengurangi stress terhadap lingkungan 3. Kalsium, Fosfor dan Vitamin D membantu memperkuat tulang dan gigi 4. Formula ini dikembangkan untuk mencegah risiko penyakit kucing pada saluran bawah kemih dan batu ginjal 5. Omega 3 dan Omega 6 untuk membantu melembutkan kulit dan bulu kucing 6. Formula rendah sodium membantu menurunkan risiko tekanan darah tinggi, penyakit ginjal, dan jantung pada kucing', 0),
('P0013', 'CAT06', 'Snack Kucing SHEBA Melty Tuna & Seafood', '60 gr', 30000, 2, 'Snack Kucing SHEBA Melty (isi 15 gr x 4) Manfaat : 1. Mengandung Kalsium untuk membantu memperkuat tulang dan gigi 2. Mengandung Vitamin untuk meningkatkan sistem kekebalan tubuh 3. Membantu mengurangi stress terhadap lingkungan 4. Mengandung Taurin untuk kesehatan mata dan mempertajam penglihatan kucing 5. Dapat merangsang nafsu makan kucing', 0),
('P0014', 'CAT07', 'Cat Scratching Post and Activity Tree Natural Sisal Tower with Round Perch and Plush Ball Furniture', NULL, 40000, 1, 'Cats have a natural impulse to sharpen and condition their nails through scratching and removing dead layers ,so they like to scratch the floor, sofa, furniture etc. If you are looking for a safe, durable, and stylish play toy for your cat, our cat scratching post maybe a good choice This cat scratcher will inspire your cat to scratch, pounce, and play without harming itself or any of your possessions at home. Our scratching post made with natural Sisal rope materials ，which is health and environmental protection .The base and upper-deck is covered in soft plush fabric,providing a healthy and comfortable way for your cat to scratch and play ,help keep your cat from damaging carpets, furniture, curtains, and more,Protect your furniture and home', 0),
('P0015', 'CAT08', 'Tempat Makan Kucing 2 in 1 Double Pet Food Bowl Import', NULL, 14800, 4, 'Tempat makan anjing dan kucing. Terbuat dengan plastik yang tebal, dijamin awet untuk pemakaian lama. Material: Plastik Tebal Ukuran: ± 23*12*4Cm', 0);

INSERT INTO USERS (USER_ID, USER_USERNAME, USER_NAME, USER_EMAIL, USER_PASSWORD, USER_ADMIN, STATUS_DEL)
VALUES 
('UV0001', 'johndoee', 'Danny Beth', 'danny@beth.com', '6125b57daf881440ae02b4ec9b25b0159355d7355eedb4104b4fa14201e71177', TRUE, 0), -- b1nt4nG
('UV0002', 'marysmith', 'Mary Smith', 'mary@smith.com', '562692d6571815eeda3806b25c35d7fbc7396953b1efa49e0818d6695d454083', FALSE, 0), -- pA55w0rd
('UV0003', 'robertbrown', 'Robert Brown', 'robert@brown.com', '191fb4e0acd8556db580475b2fcf5f45d27d27bd6447b9f1a154e265cbea59cc', FALSE, 0), -- secr3tP@
('UV0004', 'angelawhite', 'Angela White', 'angela@white.com', 'e9ca332a97b926e851a8705c2c2e44d5e00bc851de225065cf067afbec08803b', FALSE, 0), -- @ng3l1ca
('UV0005', 'davidlee11', 'David Lee', 'david@lee.com', 'f5702e804d257914a70402d4fce2963ddba06e6be03a00e1542cf2b66865062f', FALSE, 0), -- daV1dRul3s
('UV0006', 'sophiatan', 'Sophia Tan', 'sophia@tan.com', '0797e9fe7972512dbf07b77634c1205056bebdec4b5890b3d41f73f8422ac9bf', FALSE, 0), -- T@nSoph1@
('UV0007', 'kevinblack', 'Kevin Black', 'kevin@black.com', '396aa17c4d931eed85c5d5600c0b8c0c0ad62c54f4ce30c10ecdcff29850c766', FALSE, 0), -- bl@ckK3v1n
('UV0008', 'ameliawong', 'Amelia Wong', 'amelia@wong.com', '16eb793d7746e25e7a02bbf788010f0c13b9d051c4ffd1c6387ec663a277467e', FALSE, 0), -- w0ngAm3li@
('UV0009', 'charlesgreen', 'Charles Green', 'charles@green.com', '01d7519ff142568fbfb4b2657136aba46b2c4138125278da8a9cc5ef9ced89cf', FALSE, 0), -- Gr33nCh@rl3s
('UV0010', 'olivialim', 'Olivia Lim', 'olivia@lim.com', 'f03814691978d1b6032d1e9a39e5f4d6bdb8514b8103e63bf360ddaa7e1e9257', FALSE, 0), -- l1mOl1v1@
('UV0011', 'ryanng', 'Ryan Ng', 'ryan@ng.com', 'd5bc90b3ea99549425d30ea999f5fdcf1297014218f40215f2edd8ab8efb3ead', FALSE, 0),  -- rY@nN9uYwn
('UV0012', 'jessicachan', 'Jessica Chan', 'jessica@chan.com', '08ffd2ad33d5d4893e90a5c7f1dc2d969d929b73700772e9685a967ff028aeea', FALSE, 0), -- ch@nJ355
('UV0013', 'andrewloh', 'Andrew Loh', 'andrew@loh.com', '1b873f1647e7869453bf1dcd43ff593c1a8c64fd41016d6a1a6fc7ff81512ecb', FALSE, 0), -- l0h@ndr3w
('UV0014', 'susanli', 'Susan Li', 'susan@li.com', '76d60489edb12263ea918671cdc1fcade8a1333bb9df531edcad72e57db01cd9', FALSE, 0), -- L1Suz4n
('UV0015', 'michaeltang', 'Michael Tang', 'michael@tang.com', 'dc2437652aa5ea48a7c9bdb78f0cd68a2a275755edb63e863e6a9a782c9c8184', FALSE, 0); -- T@ngM1ch43l
-- c668dedfc65650fb8b4c86b304a4d899043f3473f8f51f98d208dadceab2076f angelie

INSERT INTO TRANSACTIONS (TRANS_ID, USER_ID, TRANS_DATE, TRANS_TOTAL, TRANS_QTY, TRANS_ADDRESS, TRANS_PHONE, NAMA_PENERIMA)
VALUES 
('V240511001', 'UV0002', '2024-05-11', 146000, 2, 'Jl. Mawar 10', '084038573964', 'Mary Smith'),
('V240511002', 'UV0002', '2024-05-11', 52000, 2, 'Jl. Melati 15', '082574391028', 'Martin Smith'),
('V240512001', 'UV0002', '2024-05-12', 2358000, 2, 'Jl. Mawar 10', '084038573964', 'Mary Smith'),
('V240512002', 'UV0003', '2024-05-12', 75000, 3, 'Jl. Mangga 5', '081369524087', 'Robert Brown'),
('V240512003', 'UV0004', '2024-05-12', 59800, 2, 'Jl. Kenanga 12', '081823750964', 'Andrew White'),
('V240514001', 'UV0005', '2024-05-14', 33900, 2, 'Jl. Rambutan 8', '083847201593', 'David Lee'),
('V240515001', 'UV0006', '2024-05-15', 32000, 2, 'Jl. Salak 25', '085730261948', 'Sophie'),
('V240515002', 'UV0007', '2024-05-15', 64900, 2, 'Jl. Durian 6', '083190572846', 'Kevin B'),
('V240515003', 'UV0008', '2024-05-15', 79900, 2, 'Jl. Alpukat 17', '087846291035', 'Amelia'),
('V240515004', 'UV0009', '2024-05-15', 33900, 2, 'Jl. Jambu 14', '081947360285', 'Charles Green'),
('V240515005', 'UV0010', '2024-05-15', 123690, 2, 'Jl. Pisang 30', '085630271938', 'Olive'),
('V240515006', 'UV0011', '2024-05-15', 21900, 2, 'Jl. Jeruk 18', '083740592167', 'Ryan Nguyen'),
('V240516001', 'UV0012', '2024-05-16', 30000, 2, 'Jl. Semangka 22', '081239564027', 'Jessica Chan'),
('V240516002', 'UV0013', '2024-05-16', 40000, 2, 'Jl. Terong 16', '083857291036', 'Andrew Loh'),
('V240516003', 'UV0014', '2024-05-16', 14800, 2, 'Jl. Belimbing 11', '081347250938', 'Susan'),
('V240517001', 'UV0015', '2024-05-17', 73000, 1, 'Jl. Buah Naga 12', '081346284543', 'Mike Tang'),
('V240518001', 'UV0015', '2024-05-18', 26000, 1, 'Jl. Melon 13', '088764765986', 'Mike Tang'),
('V240518002', 'UV0014', '2024-05-18', 1179000, 1, 'Jl. Bintoro 14', '087487205969', 'Suzie Li'),
('V240518003', 'UV0012', '2024-05-18', 25000, 1, 'Jl. Donat 15', '087059675745', 'Jesslyn Chang'),
('V240518004', 'UV0009', '2024-05-18', 29900, 1, 'Jl. Paus 16', '087657287650', 'Charles'),
('V240518005', 'UV0003', '2024-05-18', 33900, 1, 'Jl. Imam Bonjol 17', '085294085976', 'Robert Brown'),
('V240519001', 'UV0005', '2024-05-19', 32000, 1, 'Jl. A. Yani 18', '08122345686', 'David Lee'),
('V240520001', 'UV0012', '2024-05-20', 64900, 1, 'Jl. Soekarno 19', '08345689631', 'Jessica Chan'),
('V240520002', 'UV0008', '2024-05-20', 79900, 1, 'Jl. Lontar 20', '08177345790', 'Amelia'),
('V240520003', 'UV0007', '2024-05-20', 33900, 1, 'Jl. Darmo 21', '085627467284', 'Kevin B');

INSERT INTO DETAIL_TRANSACTIONS (DETAIL_TRANS_ID, PRODUCT_ID, TRANS_ID, QTY, ITEM_PRICE)
VALUES
(1, 'P0001', 'V240511001', 2, 73000),
(2, 'P0002', 'V240511002', 2, 26000),
(3, 'P0003', 'V240512001', 2, 1179000),
(4, 'P0004', 'V240512002', 3, 25000),
(5, 'P0005', 'V240512003', 2, 29900),
(6, 'P0006', 'V240514001', 2, 33900),
(7, 'P0007', 'V240515001', 2, 32000),
(8, 'P0008', 'V240515002', 2, 64900),
(9, 'P0009', 'V240515003', 2, 79900),
(10, 'P0010', 'V240515004', 2, 33900),
(11, 'P0011', 'V240515005', 2, 123690),
(12, 'P0012', 'V240515006', 2, 21900),
(13, 'P0013', 'V240516001', 2, 30000),
(14, 'P0014', 'V240516002', 2, 40000),
(15, 'P0015', 'V240516003', 2, 14800),
(16, 'P0001', 'V240517001', 1, 73000),
(17, 'P0002', 'V240518001', 1, 26000),
(18, 'P0003', 'V240518002', 1, 1179000),
(19, 'P0004', 'V240518003', 1, 25000),
(20, 'P0005', 'V240518004', 1, 29900),
(21, 'P0006', 'V240518005', 1, 33900),
(22, 'P0007', 'V240519001', 1, 32000),
(23, 'P0008', 'V240520001', 1, 64900),
(24, 'P0009', 'V240520002', 1, 79900),
(25, 'P0010', 'V240520003', 1, 33900);

INSERT INTO CART (CART_ID, PRODUCT_ID, CART_QTY, USER_ID, STATUS_DEL)
VALUES
(1, 'P0001', 2, 'UV0003', 0),
(2, 'P0002', 1, 'UV0003', 0),
(3, 'P0003', 1, 'UV0004', 0),
(4, 'P0006', 6, 'UV0005', 0),
(5, 'P0011', 2, 'UV0006', 0),
(6, 'P0013', 1, 'UV0007', 0),
(7, 'P0002', 2, 'UV0008', 0),
(8, 'P0007', 1, 'UV0009', 0),
(9, 'P0008', 2, 'UV0010', 0),
(10, 'P0004', 1, 'UV0011', 0),
(11, 'P0015', 4, 'UV0012', 0),
(12, 'P0009', 2, 'UV0013', 0),
(13, 'P0012', 1, 'UV0014', 0),
(14, 'P0015', 1, 'UV0015', 0),
(15, 'P0010', 1, 'UV0003', 0),
(16, 'P0009', 2, 'UV0004', 0),
(17, 'P0012', 1, 'UV0005', 0),
(18, 'P0015', 3, 'UV0006', 0),
(19, 'P0010', 1, 'UV0007', 0),
(20, 'P0006', 3, 'UV0008', 0),
(21, 'P0014', 1, 'UV0009', 0),
(22, 'P0001', 6, 'UV0010', 0),
(23, 'P0013', 4, 'UV0012', 0),
(24, 'P0005', 1, 'UV0007', 0),
(25, 'P0006', 1, 'UV0004', 0);


INSERT INTO WISHLIST (USER_ID, PRODUCT_ID, STATUS_DEL)
VALUES 
('UV0001', 'P0005', 0),
('UV0002', 'P0003', 0),
('UV0003', 'P0012', 0),
('UV0004', 'P0004', 0),
('UV0005', 'P0007', 0),
('UV0006', 'P0005', 0),
('UV0007', 'P0001', 0),
('UV0008', 'P0003', 0),
('UV0009', 'P0006', 0),
('UV0010', 'P0011', 0),
('UV0011', 'P0013', 0),
('UV0012', 'P0002', 0),
('UV0013', 'P0007', 0),
('UV0014', 'P0008', 0),
('UV0015', 'P0004', 0),
('UV0003', 'P0015', 0),
('UV0004', 'P0009', 0),
('UV0005', 'P0012', 0),
('UV0006', 'P0015', 0),
('UV0007', 'P0010', 0),
('UV0008', 'P0006', 0),
('UV0009', 'P0014', 0),
('UV0010', 'P0001', 0),
('UV0012', 'P0013', 0),
('UV0004', 'P0008', 0);

drop function if exists fOrder;
delimiter //
create function fOrder()
returns varchar(10)
deterministic
begin
	declare result varchar(10);
   SELECT CONCAT('V', DATE_FORMAT(NOW(), '%y%m%d'), LPAD(IFNULL(CONVERT(MAX(SUBSTR(trans_id, 8, 3)), UNSIGNED), 0) + 1, 3, '0')) INTO result
  FROM order_table
  WHERE SUBSTR(order_id, 2, 6) = DATE_FORMAT(NOW(), '%y%m%d');
  RETURN result;
end //
delimiter ;

delimiter //
create trigger torderid
before insert
on transactions
for each row
begin
	SET NEW.trans_id = fOrder();
end//
delimiter ;

