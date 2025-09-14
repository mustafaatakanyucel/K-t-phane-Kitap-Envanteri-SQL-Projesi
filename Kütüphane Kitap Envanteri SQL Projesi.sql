-- Kütüphane Kitap Envanteri SQL Projesi
-- İsim: Mustafa Atakan Yücel

-- 1. Tablo Yapısının Oluşturulması
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    price DECIMAL(10,2) CHECK (price >= 0),
    stock_qty INT CHECK (stock_qty >= 0),
    published_year INT CHECK (published_year BETWEEN 1800 AND 2025),
    added_at DATE
);

-- 2. Veri Ekleme İşlemleri
INSERT INTO books (book_id, title, author, genre, price, stock_qty, published_year, added_at) VALUES
(1, 'Kayıp Zamanın İzinde', 'M. Proust', 'roman', 129.90, 25, 1913, '2025-08-20'),
(2, 'Simyacı', 'P. Coelho', 'roman', 89.50, 40, 1988, '2025-08-21'),
(3, 'Sapiens', 'Y. N. Harari', 'tarih', 159.00, 18, 2011, '2025-08-25'),
(4, 'İnce Memed', 'Y. Kemal', 'roman', 99.90, 12, 1955, '2025-08-22'),
(5, 'Körlük', 'J. Saramago', 'roman', 119.00, 7, 1995, '2025-08-28'),
(6, 'Dune', 'F. Herbert', 'bilim', 149.00, 30, 1965, '2025-09-01'),
(7, 'Hayvan Çiftliği', 'G. Orwell', 'roman', 79.90, 55, 1945, '2025-08-23'),
(8, '1984', 'G. Orwell', 'roman', 99.00, 35, 1949, '2025-08-24'),
(9, 'Nutuk', 'M. K. Atatürk', 'tarih', 139.00, 20, 1927, '2025-08-27'),
(10, 'Küçük Prens', 'A. de Saint-Exupéry', 'çocuk', 69.90, 80, 1943, '2025-08-26'),
(11, 'Başlangıç', 'D. Brown', 'roman', 109.00, 22, 2017, '2025-09-02'),
(12, 'Atomik Alışkanlıklar', 'J. Clear', 'kişisel gelişim', 129.00, 28, 2018, '2025-09-03'),
(13, 'Zamanın Kısa Tarihi', 'S. Hawking', 'bilim', 119.50, 16, 1988, '2025-08-29'),
(14, 'Şeker Portakalı', 'J. M. de Vasconcelos', 'roman', 84.90, 45, 1968, '2025-08-30'),
(15, 'Bir İdam Mahkûmunun Son Günü', 'V. Hugo', 'roman', 74.90, 26, 1829, '2025-08-31');

-- 3. İSTENEN SORGULAR

-- Sorgu 1
SELECT title, author, price 
FROM books 
ORDER BY price ASC;

-- Sorgu 2
SELECT * 
FROM books 
WHERE genre = 'roman' 
ORDER BY title ASC;

-- Sorgu 3
SELECT * 
FROM books 
WHERE price BETWEEN 80 AND 120;

-- Sorgu 4
SELECT title, stock_qty 
FROM books 
WHERE stock_qty < 20;

-- Sorgu 5
SELECT * 
FROM books 
WHERE title LIKE '%zaman%' OR title LIKE '%Zaman%';

-- Sorgu 6
SELECT * 
FROM books 
WHERE genre IN ('roman', 'bilim');

-- Sorgu 7
SELECT * 
FROM books 
WHERE published_year >= 2000 
ORDER BY published_year DESC;

-- Sorgu 8
SELECT *
FROM books
WHERE added_at >= DATEADD(day, -10, GETDATE());

-- Sorgu 9
SELECT TOP 5 *
FROM books
ORDER BY price DESC;

-- Sorgu 10
SELECT * 
FROM books 
WHERE stock_qty BETWEEN 30 AND 60 
ORDER BY price ASC;

-- Ek Kontrol Sorguları
-- Toplam kitap sayısını görme
SELECT COUNT(*) as toplam_kitap_sayisi FROM books;

-- Tüm türleri listeleme
SELECT DISTINCT genre FROM books;

-- Ortalama fiyat hesaplama
SELECT AVG(price) as ortalama_fiyat FROM books;