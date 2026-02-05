USE `Òptica`;

-- ============================================================
-- 1. Insertar DIRECCIONES (Necesarias para los Proveedores)
-- ============================================================
INSERT INTO Address (street, street_number, floor, door, city, postal_code, country) VALUES 
('Carrer Major', '10', '1', 'A', 'Barcelona', '08001', 'España'),      -- ID 1
('Av. Diagonal', '500', 'Baj', 'Local', 'Barcelona', '08006', 'España'), -- ID 2
('Gran Via', '33', '2', 'B', 'Madrid', '28001', 'España');              -- ID 3

-- ============================================================
-- 2. Insertar PROVEEDORES (Suppliers)
-- Vinculados a las direcciones 1, 2 y 3
-- ============================================================
INSERT INTO Supplier (name, numberPhone, fax, nif, address_id) VALUES 
('GafasWorld S.L.', '931112233', '931112234', 'B12345678', 1), -- ID 1
('Lentes Opticas SA', '912223344', '912223345', 'A98765432', 2), -- ID 2
('Vision Pro', '933334455', '933334456', 'B11223344', 3);      -- ID 3

-- ============================================================
-- 3. Insertar MARCAS (Brands)
-- Vinculadas a los proveedores
-- ============================================================
INSERT INTO Brand (name, Supplier_id) VALUES 
('Ray-Ban', 1),   -- ID 1 (De GafasWorld)
('Oakley', 1),    -- ID 2 (De GafasWorld)
('Vogue', 2),     -- ID 3 (De Lentes Opticas)
('Carrera', 3);   -- ID 4 (De Vision Pro)

-- ============================================================
-- 4. Insertar EMPLEADOS (Employee)
-- ============================================================
INSERT INTO Employee (name) VALUES 
('Marta Garcia'), -- ID 1
('Jordi Soler'),  -- ID 2
('Laura Vidal');  -- ID 3

-- ============================================================
-- 5. Insertar CLIENTES (Customer)
-- Probamos la recursividad: Ana recomendada por Pepito
-- ============================================================
INSERT INTO Customer (name, postal_address, phone_number, email, registration_date, recommended_by) VALUES 
('Pepito Grillo', 'C/ Falsa 123', '666777888', 'pepito@email.com', '2023-01-10', NULL),  -- ID 1
('Ana Lopez', 'Av. Roma 45', '600500400', 'ana@email.com', '2023-03-20', 1),             -- ID 2 (Recomendada por Pepito)
('Carlos Ruiz', 'Plaza España 5', '611222333', 'carlos@email.com', '2024-01-05', NULL);  -- ID 3

-- ============================================================
-- 6. Insertar GAFAS / VENTAS (Glasses)
-- Ahora SÍ incluimos 'sale_date' para poder filtrar por fechas.
-- ============================================================

INSERT INTO Glasses 
(brand_id, graduation_eye_L, graduation_eye_R, frame_type, frame_color, lens_color_R, lens_color_L, price, Customer_id, Employee_id, sale_date) 
VALUES 
-- Venta 1: Pepito compra unas Ray-Ban en FEBRERO 2023 (Vendida por Marta)
(1, 1.50, 1.50, 'pasta', 'Negro', 'Transparente', 'Transparente', 150.00, 1, 1, '2023-02-15'),

-- Venta 2: Pepito compra unas Vogue en MAYO 2023 (Vendida por Jordi)
(3, 0.00, 0.00, 'metalica', 'Dorado', 'Marrón', 'Marrón', 200.50, 1, 2, '2023-05-20'),

-- Venta 3: Pepito compra unas Carrera en ENERO 2024 (Vendida por Laura) -> ¡Otro año!
(4, 0.50, 0.50, 'pasta', 'Rojo', 'Transparente', 'Transparente', 120.00, 1, 3, '2024-01-10'),

-- Venta 4: Ana compra unas Oakley en MARZO 2023 (Vendida por Marta)
(2, 2.00, 2.25, 'flotant', 'Azul', 'Gris', 'Gris', 180.00, 2, 1, '2023-03-10'),

-- Venta 5: Carlos compra unas Ray-Ban en FEBRERO 2024 (Vendida por Jordi)
(1, 0.00, 0.00, 'metalica', 'Plata', 'Verde', 'Verde', 140.00, 3, 2, '2024-02-01');