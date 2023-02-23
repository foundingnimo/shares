-- SQL Schema
create table if not exists public.impact_media
(
    id        serial
        primary key,
    impact_id integer,
    link      varchar,
    type      varchar
);

create table if not exists public.impacts
(
    id          serial
        primary key,
    name        varchar,
    metric      integer,
    logo_url    varchar,
    description varchar,
    likes       integer
);

create table if not exists public.organizations
(
    id                  serial
        primary key,
    name                varchar,
    logo_url            varchar,
    location_name       varchar,
    website             varchar,
    twitter             varchar,
    facebook            varchar,
    instagram           varchar,
    email               varchar,
    shop_url            varchar,
    about_text          varchar,
    likes               integer,
    gln                 varchar,
    blockchain_address  varchar,
    sustainability_link varchar
);

create table if not exists public.organizations_media
(
    id              serial
        primary key,
    organization_id integer,
    link            varchar,
    type            varchar
);

create table if not exists public.product_impact
(
    id         serial
        primary key,
    product_id bigint,
    impact_id  bigint
);

create table if not exists public.product_media
(
    id         serial
        primary key,
    product_id integer,
    link       varchar,
    type       varchar
);

create table if not exists public.products
(
    id              serial
        primary key,
    organization_id integer,
    supplychain_id  integer,
    name            varchar,
    description     varchar,
    url             varchar,
    code            varchar,
    batch_code      varchar,
    gtin            varchar,
    product_date    varchar
);

create table if not exists public.supplychain_node_files
(
    id                  serial
        constraint supply_chain_node_files_pkey
            primary key,
    supplychain_node_id integer,
    path                varchar,
    type                varchar,
    name                varchar,
    hex                 varchar,
    blockchain_hash     varchar
);

create table if not exists public.supplychain_node_impacts
(
    id                  serial
        primary key,
    supplychain_node_id bigint,
    impact_id           bigint
);

create table if not exists public.supplychain_node_media
(
    id                  serial
        constraint supply_chain_node_media_pkey
            primary key,
    supplychain_node_id integer,
    link                varchar,
    type                varchar
);

create table if not exists public.supplychain_nodes
(
    id                 serial
        constraint supply_chain_nodes_pkey
            primary key,
    supplychain_id     integer,
    "order"            integer,
    step_name          varchar,
    name               varchar,
    description        varchar,
    logo_url           varchar,
    location_name      varchar,
    blockchain_address varchar,
    position           numeric(12, 6)[]
);

create table if not exists public.supplychains
(
    id   serial
        constraint supply_chains_pkey
            primary key,
    name varchar
);

create table if not exists public.transactions
(
    id                  bigserial
        primary key,
    product_id          integer,
    organization_id     integer,
    supplychain_node_id integer,
    sender              varchar,
    receiver            varchar,
    message             varchar,
    hash                varchar,
    time_stamp          timestamp
);


create table if not exists public.awards
(
    id              serial
        primary key,
    organization_id integer,
    link            varchar,
    description     varchar
);
