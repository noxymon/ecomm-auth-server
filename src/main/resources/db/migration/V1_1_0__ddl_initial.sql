create table account
(
    id       varchar(36),
    username varchar(100) not null,
    nama     varchar(100) not null,
    email    varchar(100) not null,
    primary key (id),
    unique (username),
    unique (email)
);

create table transaction
(
    id              varchar(36),
    id_pengguna     varchar(36)    not null,
    waktu_transaksi timestamp      not null,
    keterangan      varchar(255),
    nilai           decimal(19, 2) not null,
    primary key (id),
    foreign key (id_pengguna) references account (id)
);

insert into account (id, username, nama, email) values
    ('u001', 'user001', 'User 001','user001@yopmail.com');

insert into account (id, username, nama, email) values
    ('u002', 'user002', 'User 002','user002@yopmail.com');

insert into account (id, username, nama, email) values
    ('u003', 'user003', 'User 003','user003@yopmail.com');

insert into transaction (id, id_pengguna, waktu_transaksi, keterangan, nilai) values
    ('t101', 'u001', '2020-01-01 08:00:00', 'Transaksi 1 User 001', 100001);

insert into transaction (id, id_pengguna, waktu_transaksi, keterangan, nilai) values
    ('t102', 'u001', '2020-01-02 08:00:00', 'Transaksi 2 User 001', 100002);

insert into transaction (id, id_pengguna, waktu_transaksi, keterangan, nilai) values
    ('t103', 'u001', '2020-01-03 08:00:00', 'Transaksi 3 User 001', 100003);

insert into transaction (id, id_pengguna, waktu_transaksi, keterangan, nilai) values
    ('t201', 'u002', '2020-02-01 08:00:00', 'Transaksi 1 User 002', 200001);

insert into transaction (id, id_pengguna, waktu_transaksi, keterangan, nilai) values
    ('t202', 'u002', '2020-02-02 08:00:00', 'Transaksi 2 User 002', 200002);

insert into transaction (id, id_pengguna, waktu_transaksi, keterangan, nilai) values
    ('t203', 'u002', '2020-02-03 08:00:00', 'Transaksi 3 User 002', 200003);

insert into transaction (id, id_pengguna, waktu_transaksi, keterangan, nilai) values
    ('t301', 'u003', '2020-03-01 08:00:00', 'Transaksi 1 User 003', 300001);

insert into transaction (id, id_pengguna, waktu_transaksi, keterangan, nilai) values
    ('t302', 'u003', '2020-03-02 08:00:00', 'Transaksi 2 User 003', 300002);

insert into transaction (id, id_pengguna, waktu_transaksi, keterangan, nilai) values
    ('t303', 'u003', '2020-03-03 08:00:00', 'Transaksi 3 User 003', 300003);