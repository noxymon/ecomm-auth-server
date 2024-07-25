create table s_roles
(
    id   varchar(36),
    name varchar(100) not null,
    primary key (id),
    unique (name)
);

create table s_users
(
    id       varchar(36),
    username varchar(100) not null,
    active   boolean      not null,
    id_role  varchar(36)  not null,
    primary key (id),
    unique (username),
    foreign key (id_role) references s_roles (id)
);

create table s_users_passwords
(
    id_user  varchar(36),
    password varchar(255) not null,
    primary key (id_user),
    foreign key (id_user) references s_users (id)
);

create table s_permissions
(
    id               varchar(36),
    permission_label varchar(100) not null,
    permission_value varchar(100) not null,
    primary key (id),
    unique (value)
);

create table s_roles_permissions
(
    id_role       varchar(36),
    id_permission varchar(36),
    primary key (id_role, id_permission),
    foreign key (id_role) references s_roles (id),
    foreign key (id_permission) references s_permissions (id)
);

insert into s_roles (id, name)
values ('r001', 'staff');

insert into s_roles (id, name)
values ('r002', 'manager');

insert into s_users (id, username, active, id_role)
values ('u001', 'user001', true, 'r001');

insert into s_users (id, username, active, id_role)
values ('u002', 'user002', true, 'r002');

-- password : teststaff
insert into s_users_passwords (id_user, password)
values ('u001', '$2a$10$8AfV.EkFEPh2OpqInI6r9.FT73nYeKe1bU6Lh.iLqOGnvNxDgXgGS');

-- password : testmanager
insert into s_users_passwords (id_user, password)
values ('u002', '$2a$10$RPB/8RrHOPBbUj0iYRy7hu7K2fMKEFIR5Cqb2oGyeKcRFY/sH0.Mi');

insert into s_permissions (id, permission_label, permission_value)
values ('p001', 'Lihat Data Transaksi', 'VIEW_TRANSAKSI');

insert into s_permissions (id, permission_label, permission_value)
values ('p002', 'Edit Data Transaksi', 'EDIT_TRANSAKSI');

insert into s_roles_permissions (id_role, id_permission)
values ('r001', 'p001');

insert into s_roles_permissions (id_role, id_permission)
values ('r002', 'p001');

insert into s_roles_permissions (id_role, id_permission)
values ('r002', 'p002');