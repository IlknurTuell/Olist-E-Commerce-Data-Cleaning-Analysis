
--CUSTOMERS DATASET ÝÇÝN NULL DEÐERLERÝNE BAKALIM:

SELECT 
'customer_id' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_customers_dataset 
where customer_id is null 
-- 0 tane null deðerim varmýþ, yani tüm satýrlarým dolu.

SELECT 
'customer_unique_id' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_customers_dataset 
where customer_unique_id is null
-- burada da hiç boþ deðer yok.

SELECT 
'customer_zip_code_prefix' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_customers_dataset 
where customer_zip_code_prefix is null -- boþ deðer yok.


SELECT 
'customer_city' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_customers_dataset 
where customer_city is null -- boþ deðer yok.

SELECT 
'customer_state' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_customers_dataset 
where customer_state is null -- boþ deðer yok.

select
customer_city, customer_id, customer_state, customer_unique_id, customer_zip_code_prefix, 
count(*) as number_of_duplicates
from olist_customers_dataset
group by customer_city, customer_id, customer_state, customer_unique_id, customer_zip_code_prefix
having count(*)>1 
ORDER BY number_of_duplicates
-- bu sorgu ile bir kaydýn, bir müþterinin yanlýþlýkla birden fazla kez girilip girilmediðini kontrol ediyoruz.


--GEOLOCATÝON DATASET ÝÇÝN NULL DEÐERLERÝNE BAKALIM:

SELECT 
'geolocation_zip_code_prefix' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_geolocation_dataset
where geolocation_zip_code_prefix is null -- boþ deðer yok

SELECT 
'geolocation_lat' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_geolocation_dataset
where geolocation_lat is null

SELECT 
'geolocation_city' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_geolocation_dataset
where geolocation_city is null

SELECT 
'geolocation_state' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_geolocation_dataset
where geolocation_state is null

select
geolocation_city, geolocation_lat, geolocation_lng, geolocation_state, geolocation_zip_code_prefix,
count(*) as number_of_duplicates
from olist_geolocation_dataset
group by geolocation_city, geolocation_lat, geolocation_lng, geolocation_state, geolocation_zip_code_prefix
having count(*)>1 
ORDER BY number_of_duplicates
-- örneðin bir posta kodu birden fazla eyalet ile eþleþmiþ bu sebeple bu kayýtlarý temizleyeceðiz.
--Kalýcý olarak silmek yerine bu sorgu süresince kullanabileceðimiz geçici bir sanal tablo oluþturacaðýz.

WITH new_geolocation AS
(
SELECT DISTINCT geolocation_zip_code_prefix, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state
FROM olist_geolocation_dataset

)

SELECT * FROM new_geolocation
order by geolocation_zip_code_prefix
-- GEÇÝCÝ TABLO OLUÞTURDUK.


-- SELLERS DATASET ÝÇÝN NULL DEÐERLERÝNE BAKALIM:


SELECT 
'seller_id' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_sellers_dataset
where seller_id is null


SELECT 
'seller_zip_code_prefix' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_sellers_dataset
where seller_zip_code_prefix is null


SELECT 
'seller_city' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_sellers_dataset
where seller_city is null


SELECT 
'seller_state' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_sellers_dataset
where seller_state is null

select seller_id, seller_city, seller_state, seller_zip_code_prefix,
count(*) as number_of_duplicates
from olist_sellers_dataset
group by seller_id, seller_city, seller_state, seller_zip_code_prefix
having count(*)>1
ORDER BY number_of_duplicates

-- PRODUCTS DATASET ÝÇÝN NULL DEÐERLERÝ:

SELECT 
'product_id' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_products_dataset
where product_id is null

SELECT 
'product_category_name' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_products_dataset
where product_category_name is null
-- 32951 ürünün  610'unda kategori yok.

SELECT 
'product_name_lenght' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_products_dataset
where product_name_lenght is null

SELECT 
'product_description_lenght' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_products_dataset
where product_description_lenght is null

SELECT 
'product_photos_qty' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_products_dataset
where product_photos_qty is null

SELECT 
'product_weight_g' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_products_dataset
where product_weight_g is null

SELECT 
'product_length_cm' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_products_dataset
where product_length_cm is null

SELECT 
'product_height_cm' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_products_dataset
where product_height_cm is null

SELECT 
'product_width_cm' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_products_dataset
where product_width_cm is null


SELECT 
product_category_name, product_description_lenght, product_height_cm, product_id, product_length_cm, product_name_lenght, product_photos_qty, product_weight_g, product_width_cm,
count(*) number_of_duplicates
FROM olist_products_dataset
group by product_category_name, product_description_lenght, product_height_cm, product_id, product_length_cm, product_name_lenght, product_photos_qty, product_weight_g, product_width_cm
having count(*)>1
ORDER BY number_of_duplicates

-- ORDERS DATASET ÝÇÝN NULL DEÐERLERÝNE BAKALIM:

SELECT 
'order_id' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_orders_dataset
where order_id is null


SELECT 
'customer_id' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_orders_dataset
where customer_id is null


SELECT 
'order_status' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_orders_dataset
where order_status is null


SELECT 
'order_purchase_timestamp' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_orders_dataset
where order_purchase_timestamp is null

SELECT 
'order_approved_at' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_orders_dataset
where order_approved_at is null

SELECT 
'order_delivered_carrier_date' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_orders_dataset
where order_delivered_carrier_date is null

SELECT 
'order_delivered_customer_date' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_orders_dataset
where order_delivered_customer_date is null

SELECT 
'order_estimated_delivery_date' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_orders_dataset
where order_estimated_delivery_date is null

-- Lojistik ve teslimat ile ilgili anlamlý miktarda null deðerler var. Bunlar ya sipariþlerin henüz teslim edilmediðini ya iptal edildiðini ya da bir nedenden dolayý tamamlanmadýðýný belirtir.
-- Eðer ortalama bir deðer hesaplamak istersen bu null deðerlerini filtrelemek gerekir. Aksi halde ortalama bozulabilir..


SELECT order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_delivered_customer_date, order_estimated_delivery_date,
count(*) number_of_duplicates
FROM olist_orders_dataset
group by order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_delivered_customer_date, order_estimated_delivery_date
having count(*)>1
ORDER BY number_of_duplicates

-- ITEMS DATASET ÝÇÝN NULL DEÐERLERÝNE BAKALIM:

SELECT 
'order_id' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_order_items_dataset
where order_id is null

SELECT 
'order_item_id' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_order_items_dataset
where order_item_id is null

SELECT 
'product_id' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_order_items_dataset
where product_id is null

SELECT 
'seller_id' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_order_items_dataset
where seller_id is null

SELECT 
'shipping_limit_date' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_order_items_dataset
where shipping_limit_date is null

SELECT 
'price' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_order_items_dataset
where price is null

SELECT 
'freight_value' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_order_items_dataset
where freight_value is null


SELECT order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value,
count(*) number_of_duplicates
FROM olist_order_items_dataset
group by order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value
having count(*)>1
ORDER BY number_of_duplicates -- her bir satýrýmýzýn benzersiz olduðunu gördük

-- ORDER PAYMENTS DATASET ÝÇÝN NULL DEÐERLERÝNE BAKALIM:

SELECT 
'order_id' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_order_payments_dataset
where order_id is null

SELECT 
'payment_sequential' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_order_payments_dataset
where payment_sequential is null

SELECT 
'payment_type' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_order_payments_dataset
where payment_type is null

SELECT 
'payment_installments' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_order_payments_dataset
where payment_installments is null

SELECT 
'payment_value' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_order_payments_dataset
where payment_value is null  


SELECT order_id, payment_installments, payment_sequential, payment_type, payment_value,
COUNT(*) AS number_of_duplicates
FROM olist_order_payments_dataset
GROUP BY order_id, payment_installments, payment_sequential, payment_type, payment_value
having count(*)>1
ORDER BY number_of_duplicates

-- REVIEWS DATASET NULL DEÐERLERÝNE BAKALIM:

SELECT 
'review_id' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_order_reviews_dataset
where review_id is null

SELECT 
'order_id' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_order_reviews_dataset
where order_id is null

SELECT 
'review_score' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_order_reviews_dataset
where review_score is null

SELECT 
'review_comment_title' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_order_reviews_dataset
where review_comment_title is null

SELECT 
'review_comment_message' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_order_reviews_dataset
where review_comment_message is null  

SELECT 
'review_creation_date' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_order_reviews_dataset
where review_creation_date is null

SELECT 
'review_answer_timestamp' as column_name,
COUNT(*) AS number_of_nulls
FROM olist_order_reviews_dataset
where review_answer_timestamp is null

SELECT review_id, order_id, review_score,review_comment_title, review_comment_message, review_creation_date, review_answer_timestamp, 
COUNT(*) AS number_of_duplicates
FROM olist_order_reviews_dataset
GROUP BY review_id, order_id, review_score,review_comment_title, review_comment_message, review_creation_date, review_answer_timestamp
having count(*)>1
ORDER BY number_of_duplicates
-- Duplicate review yok: tüm review'ler benzersiz.

-- PRODUCT CATEGORY NAME DATASET ÝÇÝN NULL DEÐERLERÝNE BAKALIM:

SELECT 
'product_category_name' as column_name,
COUNT(*) AS number_of_nulls
FROM product_category_name_translation
where product_category_name is null

SELECT 
'product_category_name_english' as column_name,
COUNT(*) AS number_of_nulls
FROM product_category_name_translation
where product_category_name_english is null

SELECT product_category_name, product_category_name_english,
COUNT(*) AS number_of_duplicates
FROM product_category_name_translation
GROUP BY product_category_name, product_category_name_english 
having count(*)>1
ORDER BY number_of_duplicates --tüm deðerler benzersiz.

----------------------------------------------------------------------------------
-- VERÝ KÜMESÝNÝ TEMÝZLEME
-- Brezilya geolocation_city sütununda bazý özel alfabe karakterlerini tespit ettim: ã, ç, í, ó, ú, ê, â, é, .. gibi
-- Bunlar, müþteri ve satýcý þehir sütunlarýnda tutarlýlýk için deðiþtirilmelidir.
-- Özel alfabe karakterlerini deðiþtirmek için geolocation_city sütununu düzenlemek üzere geçici bir tablo oluþturacaðýz.
-- =========================================================
-- GEOLOCATION TABLOSU TEMÝZLEME
-- =========================================================

DROP TABLE IF EXISTS real_geolocation_cleaned;

SELECT DISTINCT
    geolocation_zip_code_prefix,
    geolocation_lat,
    geolocation_lng,
    LTRIM(RTRIM(
        REPLACE(
            REPLACE(
                REPLACE(
                    TRANSLATE(
                        LOWER(geolocation_city),
                        'áéíóúâêôãõàç',
                        'aeiouaeoaoac'
                    ),
                    '-', ' '
                ),
                '.', ' '
            ),
            ',', ' '
        )
    )) AS geolocation_city,
    geolocation_state
INTO real_geolocation_cleaned
FROM olist_geolocation_dataset;

-- özel karakter var mý kontrol
SELECT *
FROM real_geolocation_cleaned
WHERE PATINDEX('%[^a-z ]%', geolocation_city) > 0;

-- eyalet kýsaltmalarýný city'ye yaz
UPDATE real_geolocation_cleaned
SET geolocation_city = 'sao paulo'
WHERE geolocation_city = 'sp';

UPDATE real_geolocation_cleaned
SET geolocation_city = 'rio de janeiro'
WHERE geolocation_city = 'rj';

UPDATE real_geolocation_cleaned
SET geolocation_city = 'belo horizonte'
WHERE geolocation_city = 'bh';

-- "d + kelime" düzeltmeleri
UPDATE real_geolocation_cleaned
SET geolocation_city =
    LTRIM(RTRIM(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(geolocation_city, 'd oeste', 'doeste'),
                    'd agua', 'dagua'
                ),
                'd arco', 'darco'
            ),
            'd alianca', 'dalianca'
        )
    ))
WHERE geolocation_city LIKE '%d %';

-- son trim
UPDATE real_geolocation_cleaned
SET geolocation_city = LTRIM(RTRIM(geolocation_city))
WHERE geolocation_city <> LTRIM(RTRIM(geolocation_city));


-- =========================================================
-- SELLERS TABLOSU TEMÝZLEME
-- =========================================================

DROP TABLE IF EXISTS sellers_clean;

SELECT
    seller_id,
    seller_zip_code_prefix,
    LTRIM(RTRIM(
        REPLACE(
            REPLACE(
                REPLACE(
                    TRANSLATE(
                        LOWER(seller_city),
                        'áéíóúâêôãõàç',
                        'aeiouaeoaoac'
                    ),
                    '-', ' '
                ),
                '.', ' '
            ),
            ',', ' '
        )
    )) AS seller_city,
    seller_state
INTO sellers_clean
FROM olist_sellers_dataset;

-- özel karakter var mý kontrol
SELECT *
FROM sellers_clean
WHERE PATINDEX('%[^a-z ]%', seller_city) > 0;

-- eyalet kýsaltmalarýný city'ye yaz
UPDATE sellers_clean
SET seller_city = 'sao paulo'
WHERE seller_state = 'SP'
  AND seller_city IN ('sp','sao paulo sp','saopaulo');

UPDATE sellers_clean
SET seller_city = 'rio de janeiro'
WHERE seller_city = '04482255';

-- "d + kelime" düzeltmeleri
UPDATE sellers_clean
SET seller_city =
    LTRIM(RTRIM(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(LOWER(seller_city), 'd oeste', 'doeste'),
                    'd arco', 'darco'
                ),
                'd agua', 'dagua'
            ),
            'd alianca', 'dalianca'
        )
    ))
WHERE seller_city LIKE '%d %';

-- çift boþluklarý teke indir + trim
UPDATE sellers_clean
SET seller_city = LTRIM(RTRIM(REPLACE(REPLACE(seller_city,'  ',' '),'   ',' ')))
WHERE seller_city LIKE '%  %';



-- =========================================================
-- CUSTOMERS TABLOSU TEMÝZLEME
-- =========================================================

DROP TABLE IF EXISTS customers_clean;

SELECT
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    LTRIM(RTRIM(
        REPLACE(
            REPLACE(
                REPLACE(
                    TRANSLATE(
                        LOWER(customer_city),
                        'áéíóúâêôãõàç',
                        'aeiouaeoaoac'
                    ),
                    '-', ' '
                ),
                '.', ' '
            ),
            ',', ' '
        )
    )) AS customer_city,
    customer_state
INTO customers_clean
FROM olist_customers_dataset;

-- özel karakter var mý kontrol
SELECT *
FROM customers_clean
WHERE PATINDEX('%[^a-z ]%', customer_city) > 0;

-- özel city düzeltmeleri
UPDATE customers_clean
SET customer_city = 'mutum'
WHERE customer_city = 'quilometro 14 do mutum' AND customer_state = 'ES';

-- çift boþluklarý teke indir + trim
UPDATE customers_clean
SET customer_city = LTRIM(RTRIM(REPLACE(REPLACE(customer_city,'  ',' '),'   ',' ')))
WHERE customer_city LIKE '%  %';

------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
-- EN ÇOK SÝPARÝÞE SAHÝP ÝLK 5 MÜÞTERÝ EYALETÝ 

SELECT TOP 5 c.customer_state,
COUNT(*) AS number_of_orders
FROM customers_clean AS c 
JOIN olist_orders_dataset AS o ON 
o.customer_id = c.customer_id --her iki tabloyu customer_id üzerinden baðladým
GROUP BY c.customer_state
ORDER BY number_of_orders DESC
-- 

-- EN AZ SÝPARÝÞE SAHÝP ÝLK 5 MÜÞTERÝ EYALETÝ
SELECT TOP 5 c.customer_state,
COUNT(*) AS number_of_orders
FROM customers_clean AS c 
JOIN olist_orders_dataset AS o ON 
o.customer_id = c.customer_id 
GROUP BY c.customer_state
ORDER BY number_of_orders ASC

-- EN ÇOK SÝPARÝÞE SAHÝP ÝLK 10 MÜÞTERÝ ÞEHRÝ
SELECT TOP 10
customer_city,
COUNT(*) AS number_of_orders
from customers_clean AS c
JOIN olist_orders_dataset o ON
o.customer_id = c.customer_id 
GROUP BY c.customer_city
ORDER BY number_of_orders DESC

-- SÝPARÝÞ SAYISI 500'DEN AZ OLAN ÞEHÝRLER
SELECT
customer_city,
COUNT(*) AS number_of_orders
from customers_clean AS c
JOIN olist_orders_dataset o ON
o.customer_id = c.customer_id 
GROUP BY c.customer_city
HAVING COUNT(*) < 500 
ORDER BY number_of_orders desc --4117 þehrin 4095' i 500'ün altýndaymýþ.



