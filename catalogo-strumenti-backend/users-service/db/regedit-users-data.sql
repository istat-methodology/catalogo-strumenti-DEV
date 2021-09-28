INSERT INTO `catalog`.`wp1_user_roles` VALUES (1, 'ROLE_ADMIN');
INSERT INTO `catalog`.`wp1_user_roles` VALUES (2, 'ROLE_SUPERVISOR');
INSERT INTO `catalog`.`wp1_user_roles` VALUES (3, 'ROLE_REVIEWER');


INSERT INTO `catalog`.`wp1_users` VALUES (1, 'admin@is2.it', 'Administrator', 'Workbench', '$2a$10$VB7y/I.oD16QBVaExgH1K.VEuBUKRyXcCUVweUGhs1vDl0waTQPmC', 1);
INSERT INTO `catalog`.`wp1_users` VALUES (2, 'user1@is2.it', 'User', 'Workbench', '$2a$10$yK1pW21E8nlZd/YcOt6uB.n8l36a33RP3/hehbWFAcBsFJhVKlZ82', 3);
INSERT INTO `catalog`.`wp1_users` VALUES (3, 'user2@is2.it', 'User', 'Workbench', '$2a$10$yK1pW21E8nlZd/YcOt6uB.n8l36a33RP3/hehbWFAcBsFJhVKlZ82', 3);
INSERT INTO `catalog`.`wp1_users` VALUES (4, 'user3@is2.it', 'User', 'Workbench', '$2a$10$yK1pW21E8nlZd/YcOt6uB.n8l36a33RP3/hehbWFAcBsFJhVKlZ82', 3);
INSERT INTO `catalog`.`wp1_users` VALUES (5, 'super@is2.it', 'Super visore', 'super', '$2a$10$VB7y/I.oD16QBVaExgH1K.VEuBUKRyXcCUVweUGhs1vDl0waTQPmC', 2);
INSERT INTO `catalog`.`wp1_users` VALUES (6, 'fra@fra.it', 'Francesco Amato', 'fra', '$2a$10$DIcyvIFwhDkEOT9nBugTleDM73OkZffZUdfmvjMCEXdJr3PZP8Kxm', 2);
