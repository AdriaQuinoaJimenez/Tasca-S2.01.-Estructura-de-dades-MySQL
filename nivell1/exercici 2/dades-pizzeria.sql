USE `Pizzeria`;

-- 1. Insertar PROVINCIAS
INSERT INTO Province (name) VALUES 
('Barcelona'),
('Girona');

-- 2. Insertar CIUDADES (Localidades)
-- Vinculamos con Province_id = 1 (Barcelona)
INSERT INTO City (name, Province_id) VALUES 
('Barcelona', 1),  -- ID 1
('Mataró', 1),     -- ID 2
('Badalona', 1);   -- ID 3

-- 3. Insertar TIENDAS (Stores)
-- Creamos una tienda en Barcelona (City_id 1)
INSERT INTO Store (address, postal_code, City_id, Province_id) VALUES 
('Carrer de Sants 50', '08014', 1, 1),      -- ID 1 (Tienda Barcelona)
('Av. Puig i Cadafalch 10', '08303', 2, 1); -- ID 2 (Tienda Mataró)

-- 4. Insertar EMPLEADOS
-- Un cocinero y un repartidor para la Tienda 1
INSERT INTO Employee (name, surname, nif, phone, job_position, Store_id) VALUES 
('Jordi', 'Roca', '12345678A', '600111222', 'Cuiner', 1),      -- ID 1
('Marc', 'Marquez', '87654321B', '600333444', 'Repartidor', 1), -- ID 2 (Nuestro repartidor estrella)
('Anna', 'Simó', '11223344C', '600555666', 'Repartidor', 2);    -- ID 3 (Repartidora otra tienda)

-- 5. Insertar CLIENTES
INSERT INTO Customer (name, surname, address, postal_code, phone, Province_id, City_id) VALUES 
('Maria', 'Vila', 'Gran Via 100', '08015', '933333333', 1, 1),
('Pere', 'Pi', 'Rambla 20', '08302', '934444444', 1, 2);

-- 6. Insertar CATEGORIAS (Solo para Pizzas según tu esquema)
INSERT INTO Category (name) VALUES 
('Clàssiques'),
('Premium');

-- 7. Insertar PRODUCTOS (Aquí definimos qué es Beguda y qué es Pizza)
INSERT INTO Product (name, Description, Image, Price, type) VALUES 
('Coca-Cola', 'Llauna 33cl', 'img_coke.jpg', 2.50, 'Beguda'),       -- ID 1
('Fanta Taronja', 'Llauna 33cl', 'img_fanta.jpg', 2.50, 'Beguda'),  -- ID 2
('Pizza Margarita', 'Tomàquet i formatge', 'img_marg.jpg', 12.00, 'Pizza'), -- ID 3
('Hamburguesa Completa', 'Amb tot', 'img_burger.jpg', 9.50, 'Hamburguesa'); -- ID 4

-- 8. Vincular PIZZAS a CATEGORIAS (Tabla Pizza)
INSERT INTO Pizza (Category_id, Product_id) VALUES 
(1, 3); -- La Margarita (ID 3) es Clásica (ID 1)

-- 9. Insertar PEDIDOS (Orders)
-- Pedido 1: En Barcelona, A domicilio
INSERT INTO Orders (date, order_type, total_price, Customer_id, Store_id) VALUES 
('2023-10-25 20:30:00', 'A domicili', 14.50, 1, 1), -- ID 1 (Tienda BCN)
('2023-10-26 21:00:00', 'A domicili', 25.00, 1, 1), -- ID 2 (Tienda BCN)
('2023-10-27 14:00:00', 'Recollir en botiga', 12.00, 2, 2); -- ID 3 (Tienda Mataró)

-- 10. DETALLES DE PEDIDO (Qué comieron)
-- Aquí es donde ponemos las BEBIDAS para la consulta 1
INSERT INTO Order_details (quantity, Orders_idOrders, Product_Product_id) VALUES 
(2, 1, 1), -- En el Pedido 1: 2 Coca-Colas (Producto 1) -> Total 2 bebidas
(1, 1, 3), -- En el Pedido 1: 1 Pizza
(3, 2, 2), -- En el Pedido 2: 3 Fantas (Producto 2) -> Total 3 bebidas
(1, 2, 4); -- En el Pedido 2: 1 Hamburguesa

-- 11. DETALLES DE REPARTO (Order_type_details)
-- Asignamos los pedidos a domicilio al repartidor MARC (ID 2)
INSERT INTO Order_type_details (delivered_at, Orders_id, Employee_id) VALUES 
('2023-10-25 21:00:00', 1, 2), -- Pedido 1 entregado por Marc
('2023-10-26 21:30:00', 2, 2); -- Pedido 2 entregado por Marc