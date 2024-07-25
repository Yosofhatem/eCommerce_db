use eCommercestore;

ALTER TABLE OrderDetails 
ADD CONSTRAINT FK_Products
FOREIGN KEY (ProductID) REFERENCES Products(ProductID); 

ALTER TABLE OrderDetails 
ADD CONSTRAINT id_orderDetail_unique UNIQUE (OrderDetailID);


ALTER TABLE Products 
ADD CONSTRAINT chk_price CHECK (Price > 0);


ALTER TABLE Products 
ADD CONSTRAINT id_products_unique UNIQUE (ProductID);

CREATE INDEX idx_ProductName ON Products (ProductName); -- for faster search performance.

SHOW CREATE TABLE OrderDetails;
SHOW CREATE TABLE Products;

