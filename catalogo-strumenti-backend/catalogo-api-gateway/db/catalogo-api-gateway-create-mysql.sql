CREATE SCHEMA IF NOT EXISTS `catalog` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;

use `catalog`;
CREATE TABLE catalog_gateway_jwttoken (
    token character varying(200)
);