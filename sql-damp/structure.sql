-- Adminer 4.8.1 PostgreSQL 13.4 (Debian 13.4-1.pgdg100+1) dump

CREATE SEQUENCE cart_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."cart" (
    "id" integer DEFAULT nextval('cart_id_seq') NOT NULL,
    "active" boolean NOT NULL,
    "id_users" integer NOT NULL,
    CONSTRAINT "cart_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE "cart-dish_id_seq" INCREMENT  MINVALUE  MAXVALUE  CACHE ;

CREATE TABLE "public"."cart-dish" (
    "id" integer DEFAULT nextval('"cart-dish_id_seq"') NOT NULL,
    "id_dish" integer NOT NULL,
    "count" integer NOT NULL,
    "create_date" timestamp NOT NULL,
    "price" integer NOT NULL,
    "modified_price" boolean NOT NULL,
    CONSTRAINT "cart-dish_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE "cart_cart-dish_id_seq" INCREMENT  MINVALUE  MAXVALUE  CACHE ;

CREATE TABLE "public"."cart_cart-dish" (
    "id" integer DEFAULT nextval('"cart_cart-dish_id_seq"') NOT NULL,
    "id_cart" integer NOT NULL,
    "id_cart-dish" integer NOT NULL,
    CONSTRAINT "cart_cart-dish_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE categoires_dish_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 4 CACHE 1;

CREATE TABLE "public"."categoires_dish" (
    "id" integer DEFAULT nextval('categoires_dish_id_seq') NOT NULL,
    "name" character varying NOT NULL,
    "acitve" boolean NOT NULL,
    CONSTRAINT "categoires_dish_name" UNIQUE ("name"),
    CONSTRAINT "categoires_dish_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE dish_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 4 CACHE 1;

CREATE TABLE "public"."dish" (
    "id" integer DEFAULT nextval('dish_id_seq') NOT NULL,
    "name" character varying NOT NULL,
    "active" boolean NOT NULL,
    "time" timestamp NOT NULL,
    "portions" integer NOT NULL,
    "weight" integer NOT NULL,
    "price" integer NOT NULL,
    "rating" integer NOT NULL,
    "image" text NOT NULL,
    "proteins" numeric NOT NULL,
    "fats" numeric NOT NULL,
    "carbons" numeric NOT NULL,
    "callogry" numeric NOT NULL,
    "id_categories" integer NOT NULL,
    CONSTRAINT "dish_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE dish_tag_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 4 CACHE 1;

CREATE TABLE "public"."dish_tag" (
    "id" integer DEFAULT nextval('dish_tag_id_seq') NOT NULL,
    "id_dish" integer NOT NULL,
    "id_tag" integer NOT NULL,
    CONSTRAINT "dish_tag_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE order_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."order" (
    "id" integer DEFAULT nextval('order_id_seq') NOT NULL,
    "create_date" timestamp NOT NULL,
    "id_status" integer NOT NULL,
    "active" boolean NOT NULL,
    "id_cart" integer NOT NULL,
    CONSTRAINT "order_id_cart" UNIQUE ("id_cart"),
    CONSTRAINT "order_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE status_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."status" (
    "id" integer DEFAULT nextval('status_id_seq') NOT NULL,
    "name" character varying NOT NULL,
    "key" integer NOT NULL,
    "description" text NOT NULL,
    CONSTRAINT "status_name" UNIQUE ("name"),
    CONSTRAINT "status_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE tag_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 2 CACHE 1;

CREATE TABLE "public"."tag" (
    "id" integer DEFAULT nextval('tag_id_seq') NOT NULL,
    "name" character varying NOT NULL,
    "active" boolean NOT NULL,
    "type" character varying NOT NULL,
    CONSTRAINT "tag_name" UNIQUE ("name"),
    CONSTRAINT "tag_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE token_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 12 CACHE 1;

CREATE TABLE "public"."token" (
    "id" integer DEFAULT nextval('token_id_seq') NOT NULL,
    "date" timestamp NOT NULL,
    "active" boolean NOT NULL,
    "token" text NOT NULL,
    CONSTRAINT "token_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "token_token" UNIQUE ("token")
) WITH (oids = false);


CREATE SEQUENCE "type-tag_id_seq" INCREMENT  MINVALUE  MAXVALUE  CACHE ;

CREATE TABLE "public"."type-tag" (
    "id" smallint DEFAULT nextval('"type-tag_id_seq"') NOT NULL,
    "key" character varying NOT NULL,
    "description" text NOT NULL,
    CONSTRAINT "type-tag_key" UNIQUE ("key"),
    CONSTRAINT "type-tag_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE usera_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 2 CACHE 1;

CREATE TABLE "public"."users" (
    "id" integer DEFAULT nextval('usera_id_seq') NOT NULL,
    "fio" character varying NOT NULL,
    "nik" character varying NOT NULL,
    "email" character varying NOT NULL,
    "password" character varying NOT NULL,
    "avatar" text NOT NULL,
    "is_active" boolean NOT NULL,
    "is_admin" boolean NOT NULL,
    "is_user" boolean NOT NULL,
    CONSTRAINT "usera_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "users_email" UNIQUE ("email"),
    CONSTRAINT "users_nik" UNIQUE ("nik")
) WITH (oids = false);


CREATE SEQUENCE users_token_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 11 CACHE 1;

CREATE TABLE "public"."users_token" (
    "id" integer DEFAULT nextval('users_token_id_seq') NOT NULL,
    "id_users" integer NOT NULL,
    "id_token" integer NOT NULL,
    CONSTRAINT "users_token_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


ALTER TABLE ONLY "public"."cart" ADD CONSTRAINT "cart_id_users_fkey" FOREIGN KEY (id_users) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."cart_cart-dish" ADD CONSTRAINT "cart_cart-dish_id_cart-dish_fkey" FOREIGN KEY ("id_cart-dish") REFERENCES "cart-dish"(id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."cart_cart-dish" ADD CONSTRAINT "cart_cart-dish_id_cart_fkey" FOREIGN KEY (id_cart) REFERENCES cart(id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."dish" ADD CONSTRAINT "dish_id_categories_fkey" FOREIGN KEY (id_categories) REFERENCES categoires_dish(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."dish_tag" ADD CONSTRAINT "dish_tag_id_dish_fkey" FOREIGN KEY (id_dish) REFERENCES dish(id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."dish_tag" ADD CONSTRAINT "dish_tag_id_tag_fkey" FOREIGN KEY (id_tag) REFERENCES tag(id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."order" ADD CONSTRAINT "order_id_cart_fkey" FOREIGN KEY (id_cart) REFERENCES cart(id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."order" ADD CONSTRAINT "order_id_status_fkey" FOREIGN KEY (id_status) REFERENCES status(id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."users_token" ADD CONSTRAINT "users_token_id_token_fkey" FOREIGN KEY (id_token) REFERENCES token(id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."users_token" ADD CONSTRAINT "users_token_id_users_fkey" FOREIGN KEY (id_users) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;

-- 2021-11-04 05:46:57.544154+00
