CREATE TABLE IF NOT EXISTS `test`.`product` (
  `id` varchar(5) NOT NULL UNIQUE,
  `name` varchar(45) NOT NULL,
  `image` varchar(100) NOT NULL,
  `price`	decimal(19,4) NOT NULL,
  PRIMARY KEY (`id`)
)

CREATE TABLE IF NOT EXISTS CREATE TABLE `test`.`commerceitem` (
  `id` varchar(5) NOT NULL UNIQUE,
  `product_id` varchar(5) NOT NULL,
  `quantity` integer NOT NULL,
  `amount`	decimal(19,4) NOT NULL,
  PRIMARY KEY (`id`), 
  FOREIGN KEY (`product_id`) REFERENCES test.product (`id`)

);

INSERT INTO `test`.`product` (`id`, 
`name`, 
`image`, 
`price`) 
VALUES 
('A1234', 
'Headphone dobrável MDR-ZX110', 
'http://brsonyb2c.vteximg.com.br/arquivos/ids/197011-1000-1000/91d8515874842cc62f6b8b43f3f7f160.png', 
119.99);


INSERT INTO `test`.`product`
(`id`,
`name`,
`image`,
`price`)
VALUES
('A5678',
'Carregador CP-E6 USB',
'http://brsonyb2c.vteximg.com.br/arquivos/ids/203158-1000-1000/36a6319f1691e2f02d327b86cfdf5bde.jpg',
139.99);

INSERT INTO `test`.`product`
(`id`,
`name`,
`image`,
`price`)
VALUES
('A9012',
'Carregador de bateria BC-TRW',
'http://brsonyb2c.vteximg.com.br/arquivos/ids/199278-510-510/6cf9e067a0a8e043524e0e0f1bd802b6.png',
221.74);