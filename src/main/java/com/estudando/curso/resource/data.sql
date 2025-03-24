-- Inserir Usuários
INSERT INTO tb_user (name, email, phone, password)
VALUES
    ('Carlos Almeida', 'carlos.almeida@email.com', '11987651234', 'A@b123'),
    ('Mariana Souza', 'mariana.souza@email.com', '11976549876', 'M@r123'),
    ('Roberto Lima', 'roberto.lima@email.com', '11965438765', 'R0b@321'),
    ('Fernanda Castro', 'fernanda.castro@email.com', '11954327654', 'F@c123'),
    ('Eduardo Menezes', 'eduardo.menezes@email.com', '11943216543', 'E@m456');

INSERT INTO tb_category (name)
VALUES
    ('Roupas'),
    ('Eletrônicos'),
    ('Móveis'),
    ('Esportes'),
    ('Beleza'),
    ('Alimentos'),
    ('Automóveis');


-- Inserir produtos
INSERT INTO tb_product (name, description, price)
VALUES
    ('Camiseta Básica', 'Camiseta de algodão, confortável e durável.', 49.90),
    ('Calça Jeans', 'Calça jeans de corte reto e confortável.', 99.90),
    ('Tênis Esportivo', 'Tênis para caminhada com ótima aderência.', 179.90),
    ('Mochila de Couro', 'Mochila de couro legítimo, ideal para o trabalho ou estudos.', 299.90),
    ('Relógio de Pulso', 'Relógio analógico com design moderno.', 159.90),
    ('Fone de Ouvido Bluetooth', 'Fones de ouvido com cancelamento de ruído e excelente qualidade de som.', 299.90),
    ('Smartphone', 'Smartphone com câmera de alta resolução e grande capacidade de armazenamento.', 1999.90),
    ('Laptop Gamer', 'Laptop de alta performance, ideal para jogos.', 5000.00),
    ('Mesa de Escritório', 'Mesa ampla, ideal para home office.', 699.90),
    ('Cadeira Ergonômica', 'Cadeira ergonômica, ideal para longas horas de trabalho.', 399.90);

-- Associar produtos às categorias (tb_product_category)
-- A primeira coluna é o product_id e a segunda é o category_id

-- Camiseta Básica
INSERT INTO tb_product_category (product_id, category_id) VALUES (1, 1);  -- Roupas

-- Calça Jeans
INSERT INTO tb_product_category (product_id, category_id) VALUES (2, 1);  -- Roupas

-- Tênis Esportivo
INSERT INTO tb_product_category (product_id, category_id) VALUES (3, 4);  -- Esportes

-- Mochila de Couro
INSERT INTO tb_product_category (product_id, category_id) VALUES (4, 1);  -- Roupas

-- Relógio de Pulso
INSERT INTO tb_product_category (product_id, category_id) VALUES (5, 2);  -- Eletrônicos

-- Fone de Ouvido Bluetooth
INSERT INTO tb_product_category (product_id, category_id) VALUES (6, 2);  -- Eletrônicos

-- Smartphone
INSERT INTO tb_product_category (product_id, category_id) VALUES (7, 2);  -- Eletrônicos

-- Laptop Gamer
INSERT INTO tb_product_category (product_id, category_id) VALUES (8, 2);  -- Eletrônicos

-- Mesa de Escritório
INSERT INTO tb_product_category (product_id, category_id) VALUES (9, 3);  -- Móveis

-- Cadeira Ergonômica
INSERT INTO tb_product_category (product_id, category_id) VALUES (10, 3);  -- Móveis

-- Criar Pedido (Order)
INSERT INTO tb_order (moment, order_status, client_id) VALUES
                                                           ('2025-03-23T15:00:00Z', 0, 1), -- Pedido de Maria
                                                           ('2025-03-23T16:00:00Z', 1, 2); -- Pedido de João
-- Criar Pedido (Order)

-- Pedido 1 para Carlos Almeida
INSERT INTO tb_order (moment, order_status, client_id)
VALUES
    ('2025-03-23T15:00:00Z', 2, 1); -- Pedido de Carlos Almeida

-- Pedido 2 para Mariana Souza
INSERT INTO tb_order (moment, order_status, client_id)
VALUES
    ('2025-03-23T16:00:00Z', 2, 2); -- Pedido de Mariana Souza

-- Criar Pagamento (Payment)
-- Considerando que o pagamento é feito no mesmo momento que o pedido
-- Criamos um pagamento para cada pedido já inserido

-- Pagamento para o Pedido 1 (Carlos Almeida)
INSERT INTO tb_payment (moment, order_id)
VALUES
    ('2025-03-23T15:10:00Z', 1);  -- Pagamento de Carlos Almeida (pedido 1)

-- Pagamento para o Pedido 2 (Mariana Souza)
INSERT INTO tb_payment (moment, order_id)
VALUES
    ('2025-03-23T16:10:00Z', 2);  -- Pagamento de Mariana Souza (pedido 2)
