
CREATE TABLE catalog.wp1_user_roles (
    id integer NOT NULL,
    role character varying(50) DEFAULT NULL::character varying
);

CREATE TABLE catalog.wp1_users (
    id integer NOT NULL,
    email character varying(255),
    name character varying(100),
    surname character varying(100),
    password character varying(500),
    role_id integer NOT NULL
);
