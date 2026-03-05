# Olist-E-Commerce-Data-Cleaning-Analysis
SQL ile Olist e-ticaret veri setlerini temizleme, eksik ve tekrar eden kayıtları tespit etme ve analiz etme projesi.

Bu proje, Olist e-ticaret veri setlerini temizleme ve analiz etme amacıyla hazırlanmıştır. Projenin temel hedefi, veri kalitesini artırmak, eksik ve tekrar eden kayıtları tespit etmek ve şehir/eyalet isimlerini standartlaştırmaktır. Temizlenen veri setleri, müşteri siparişleri, satıcılar, ürünler ve yorumlar hakkında detaylı analizler yapmak için kullanılabilir. 

Kullanılan veri seti: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce/data

❗Not: Bu proje öğrenme ve pratik amacıyla oluşturulmuştur.

📌 PROJE AMAÇLARI:
- Eksik değerleri (NULL) tespit etmek ve gerekli durumlarda filtrelemek.
- Tekrarlayan kayıtları (duplicate) belirleyip veri bütünlüğünü sağlamak.
- Şehir ve eyalet isimlerindeki özel karakterleri düzeltmek.
- Temizlenmiş veri setleri ile sipariş sayıları, müşteri ve ürün dağılımları gibi temel analizler yapmak.
- Gerçek e-ticaret verisi üzerinde çalışarak veri biliminde temel becerileri geliştirmek.

🛠️ Kullanılan Fonksiyonlar ve Amaçları:
| Konu / Amaç                                 | Kullanılan SQL Fonksiyonları / Yapıları                     | Açıklama                                                                                                   |
| ------------------------------------------- | ----------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| **Null Değer Kontrolü**                     | `SELECT`, `COUNT(*)`, `WHERE IS NULL`                       | Hangi sütunlarda eksik veri olduğunu tespit etmek.                                                         |
| **Duplicate Kontrolü**                      | `SELECT`, `COUNT(*)`, `GROUP BY`, `HAVING count(*)>1`       | Tekrarlayan kayıtları bulmak için.                                                                         |
| **Veri Temizleme – Özel Karakter Düzeltme** | `LOWER()`, `TRANSLATE()`, `REPLACE()`, `LTRIM()`, `RTRIM()` | Şehir ve eyalet isimlerini küçük harfe çevirme, özel karakterleri düzeltme, gereksiz boşlukları temizleme. |
| **Geçici / Temiz Tablo Oluşturma**          | `SELECT DISTINCT ... INTO`, `WITH ... AS`                   | Tekrar eden kayıtları temizleyerek yeni geçici tablo oluşturmak.                                           |
| **Veri Güncelleme / Düzenleme**             | `UPDATE ... SET ... WHERE ...`                              | Belirli şehir isimlerini standart hale getirmek ve “d + kelime” gibi özel durumları düzeltmek.             |
| **Tablo Sıralama**                          | `ORDER BY`                                                  | Analiz sonuçlarını sıralamak (en çok / en az sipariş gibi).                                                |
| **Tablo Birleştirme**                       | `JOIN ... ON`                                               | Müşteri ve sipariş gibi farklı tabloları ilişkili sütunlar üzerinden birleştirmek.                         |
| **Filtreleme / Koşullu Seçim**              | `HAVING`                                                    | Grup bazlı filtreleme yapmak (örneğin 500’den az sipariş olan şehirler).                                   |
| **Geçici Tablo Silme**                      | `DROP TABLE IF EXISTS`                                      | Önceden oluşturulmuş geçici tablonun var ise silinmesini sağlamak.   










|

