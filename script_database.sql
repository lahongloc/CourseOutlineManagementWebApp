create table courseoutlinedb.user (
	id int primary key auto_increment,
    username varchar(50) not null unique,
    sex boolean,
    birthday datetime,
    password varchar(500) not null,
    name varchar(50) not null,
    role varchar(20),
    email varchar(50),
    hotline varchar(20),
    avatar varchar(500),
    is_active boolean default(false),
    created_datetime datetime
);

create table courseoutlinedb.faculty (
	id int primary key auto_increment,
    name varchar(100) not null
);

create table courseoutlinedb.major (
	id int primary key auto_increment,
    name varchar(100) not null,
    faculty_id int,
    foreign key (faculty_id) references faculty(id)
);

create table courseoutlinedb.lecturer (
	id int primary key auto_increment,
    user_id int,
    faculty_id int,
    foreign key (user_id) references user(id),
    foreign key (faculty_id) references faculty(id)
);

create table courseoutlinedb.admin (
	id int primary key auto_increment,
    user_id int,
    foreign key (user_id) references user(id)
);

create table courseoutlinedb.grade (
	id int primary key auto_increment,
    name varchar(30),
    major_id int,
    foreign key (major_id) references major(id)
);

create table courseoutlinedb.subject (
	id int primary key auto_increment,
    name varchar(45)
);

create table courseoutlinedb.faculty_subject (
	id int primary key auto_increment,
    faculty_id int,
    subject_id int,
    foreign key (faculty_id) references faculty(id),
    foreign key (subject_id) references subject(id),
    unique key (faculty_id, subject_id)
);

create table courseoutlinedb.academic_year (
	id int primary key auto_increment,
	name varchar(50),
    start datetime,
    finish datetime
);

create table courseoutlinedb.semester (
	id int primary key auto_increment,
    name varchar(50),
    academic_year_id int,
    foreign key (academic_year_id) references academic_year(id)
);

create table courseoutlinedb.student (
	id int primary key auto_increment,
    student_code varchar(15) unique,
    user_id int,
    grade_id int,
    major_id int,
    academic_year_id int,
    foreign key (user_id) references user(id),
    foreign key (grade_id) references grade(id),
    foreign key (major_id) references major(id),
    foreign key (academic_year_id) references academic_year(id)
);

create table courseoutlinedb.score (
	id int primary key auto_increment,
    name varchar(50),
    assessment varchar(300)
);

create table courseoutlinedb.outline (
	id int primary key auto_increment,
    started_datetime datetime not null,
    expired_datetime datetime not null,
    description varchar(500), 
    theo_credit_hour int not null,
    prac_credit_hour int not null,
    lecturer_id int,
    subject_id int,
    status varchar(15),
    approver_id int,
    foreign key (lecturer_id) references lecturer(id),
    foreign key (subject_id) references subject(id),
    foreign key (approver_id) references admin(id)
);

create table courseoutlinedb.outline_score (
	id int primary key auto_increment,
    percent float,
    outline_id int,
    score_id int,
    foreign key (outline_id) references outline(id),
    foreign key (score_id) references score(id),
    unique key (outline_id, score_id)
);

create table courseoutlinedb.outline_academic_year (
id int primary key auto_increment,
    outline_id int,
    academic_year_id int,
    foreign key (outline_id) references outline(id),
    foreign key (academic_year_id) references academic_year(id),
    unique key (outline_id, academic_year_id)
);

create table courseoutlinedb.outline_subject (
	id int primary key auto_increment,
    outline_id int,
    subject_id int,
    type varchar(50),
    foreign key (outline_id) references outline(id),
    foreign key (subject_id) references subject(id),
    unique key (outline_id, subject_id)
);

create table courseoutlinedb.comment (
	id int primary key auto_increment,
    content varchar(350) not null,
    student_id int,
    outline_id int,
    foreign key (student_id) references student(id),
    foreign key (outline_id) references outline(id)
);

create table courseoutlinedb.feedback (
	id int primary key auto_increment,
    content varchar(350) not null,
    student_id int,
    outline_id int,
    foreign key (student_id) references student(id),
    foreign key (outline_id) references outline(id)
);

CREATE TABLE courseoutlinedb.student_outline_download (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    outline_id INT NOT NULL,
    downloaded_date DATETIME,
    FOREIGN KEY (student_id) REFERENCES courseoutlinedb.student(id),
    FOREIGN KEY (outline_id) REFERENCES courseoutlinedb.outline(id)
);

INSERT INTO faculty (name) VALUES
('Công nghệ thông tin'),
('Quản trị kinh doanh');

INSERT INTO major (name, faculty_id) VALUES
('Công nghệ thông tin', 1),
('Khoa học máy tính', 1),
('Quản trị kinh doanh', 2),
('Du lịch', 2);

INSERT INTO user (username, sex, birthday, password, name, role, email, hotline, avatar, is_active, created_datetime) VALUES
('admin1', 1, '1970-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Admin số 1', 'ROLE_ADMIN', 'admin1@gmail.com', '0123456789', 'avatar1.png', TRUE, NOW()),
('admin2', 1, '1970-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Admin số 2', 'ROLE_ADMIN', 'admin2@gmail.com', '0123456789', 'avatar2.png', TRUE, NOW());

INSERT INTO admin (user_id) VALUES
(1),
(2);

-- Giảng viên CNTT (id: 3-8)
INSERT INTO user (username, sex, birthday, password, name, role, email, hotline, avatar, is_active, created_datetime) VALUES
('thvinh', 1, '1989-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Trương Hoàng Vinh', 'ROLE_LECTURER', 'vinh.th@gmail.com', '0123456789', 'http://it.ou.edu.vn/asset/ckfinder/userfiles/5/images/TS_%20TH%20Vinh.jpg', FALSE, NOW()),
('dhthanh', 1, '1989-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Dương Hữu Thành', 'ROLE_LECTURER', 'thanh.dh@gmail.com', '0123456789', 'http://it.ou.edu.vn/asset/ckfinder/userfiles/5/images/ThS_%20DH%20Thanh.jpg', TRUE, NOW()),
('lqphuong', 1, '1981-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Lưu Quang Phương', 'ROLE_LECTURER', 'phuong.lq@gmail.com', '0123456789', 'http://it.ou.edu.vn/asset/ckfinder/userfiles/5/images/giang_vien/Phuong_2.jpg', TRUE, NOW()),
('ntptrang', 0, '1987-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Thị Phương Trang', 'ROLE_LECTURER', 'trang.ntp@gmail.com', '0123456789', 'http://it.ou.edu.vn/asset/ckfinder/userfiles/5/images/giang_vien/PTrang1.jpg', TRUE, NOW()),
('ntmtrang', 0, '1978-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Thị Mai Trang', 'ROLE_LECTURER', 'trang.ntm@gmail.com', '0123456789', 'http://it.ou.edu.vn/asset/ckfinder/userfiles/5/images/ThS_%20NTM%20Trang.png', TRUE, NOW()),
('ntdat', 1, '1974-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Tiến Đạt', 'ROLE_LECTURER', 'dat.nt@gmail.com', '0123456789', 'http://it.ou.edu.vn/asset/ckfinder/userfiles/5/images/TS_%20NT%20Dat.jpg', TRUE, NOW());

-- Giảng viên QTKD (id: 9-13)
INSERT INTO user (username, sex, birthday, password, name, role, email, hotline, avatar, is_active, created_datetime) VALUES
('nhsinh', 1, '1980-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Hoàng Sinh ', 'ROLE_LECTURER', 'sinh.nh@gmail.com', '0123456789', 'https://lh4.googleusercontent.com/proxy/8tdvf_8wjAOuUdgncUo2JXPfgvFIg8lc9XFsjQIK1YLVSQRJyQG57OA0UaU1Vb__n7M6QD7CRA9YFbK1tJz6v-ggvlV89AeNX4YAOm5jUuIDtrQf-ZBzFJ3-_OS-XGsIZ6M53pIf', TRUE, NOW()),
('hdtvy', 0, '1980-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Hoàng Đinh Thảo Vy ', 'ROLE_LECTURER', 'vy.hdt@gmail.com', '0123456789', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqKDGDpriotDBZeb1qD0TgOV6-sbr8BUNwDgrFJ41l1w&s', TRUE, NOW()),
('pminh', 1, '1980-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Phạm Minh', 'ROLE_LECTURER', 'minh.p@gmail.com', '0123456789', 'https://lh3.googleusercontent.com/proxy/2ejS6TB2fLjmJcTeG8JHplvHGFdYvFDHuLNqVq00wJRikRmvodBxMytIDCs1kDPGgholuqdmm81yTB5ZlkgIpJR46bN3uy8KvbYbVMDX67aCIalw4mKM91TFOWOMyQ', TRUE, NOW()),
('cmtri', 1, '1980-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Cao Minh Trí ', 'ROLE_LECTURER', 'tri.cm@gmail.com', '0123456789', 'https://elo.edu.vn/wp-content/uploads/2021/06/Cao-Minh-Tri.png', TRUE, NOW()),
('httduong', 0, '1980-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Hà Thị Thùy Dương', 'ROLE_LECTURER', 'duong.htt@gmail.com', '0123456789', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR28nZ-wY-RCtWLtrTLMXUCLghNpU9UJ18ZY4RRcBaoMQ&s', TRUE, NOW());

INSERT INTO lecturer (user_id, faculty_id) VALUES
-- CNTT
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
-- QTKD
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2);

-- Sinh viên
INSERT INTO user (username, sex, birthday, password, name, role, email, hotline, avatar, is_active, created_datetime) VALUES
-- Khoa CNTT
-- k20 khmt (id: 14-29)
('vnmlinh', 0, '2002-11-29', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Vũ Nguyễn Mai Linh', 'ROLE_STUDENT', 'linh@gmail.com', '0123456789', NULL, FALSE, NOW()),
('pthai', 1, '2002-05-18', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Phan Thanh Hải', 'ROLE_STUDENT', 'hai@gmail.com', '0123456789', NULL, FALSE, NOW()),
('ltdat', 1, '2002-10-14', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Lương Tấn Đạt', 'ROLE_STUDENT', 'dat@gmail.com', '0123456789', NULL, FALSE, NOW()),
('lvphon', 1, '2002-03-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Lê Văn Phôn', 'ROLE_STUDENT', 'phon@gmail.com', '0123456789', NULL, FALSE, NOW()),
('nvana', 0, '2002-10-09', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Vân Anh', 'ROLE_STUDENT', 'anh@gmail.com', '0123456789', NULL, FALSE, NOW()),
('thtvinh', 1, '2002-06-03', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Trần Hồ Thế Vinh', 'ROLE_STUDENT', 'vinh@gmail.com', '0123456789', NULL, FALSE, NOW()),
('phquyet', 1, '2002-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Phạm Hữu Quyết', 'ROLE_STUDENT', 'quyet@gmail.com', '0123456789', NULL, FALSE, NOW()),
('pdquynh', 0, '2002-02-14', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Phạm Diệu Quỳnh', 'ROLE_STUDENT', 'quynh@gmail.com', '0123456789', NULL, FALSE, NOW()),
('lbphong', 1, '2002-09-08', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Lại Bình Phong', 'ROLE_STUDENT', 'phong@gmail.com', '0123456789', NULL, FALSE, NOW()),
('nntrung', 1, '2002-04-13', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Nghĩa Trung', 'ROLE_STUDENT', 'trung@gmail.com', '0123456789', NULL, FALSE, NOW()),
('tnqnhan', 1, '2002-08-15', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Trần Ngọc Quang Nhân', 'ROLE_STUDENT', 'nhan@gmail.com', '0123456789', NULL, FALSE, NOW()),
('nttru', 1, '2002-10-14', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Tấn Trụ', 'ROLE_STUDENT', 'tru@gmail.com', '0123456789', NULL, FALSE, NOW()),
('hdnguyen', 1, '1999-11-17', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Hồ Đắc Nguyên', 'ROLE_STUDENT', 'nguyen@gmail.com', '0123456789', NULL, FALSE, NOW()),
('nhhao', 1, '2002-01-29', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Hoàng Hảo', 'ROLE_STUDENT', 'hao@gmail.com', '0123456789', NULL, FALSE, NOW()),
('ntnlu', 0, '2002-09-08', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Thị Ngọc Lụa', 'ROLE_STUDENT', 'lua@gmail.com', '0123456789', NULL, FALSE, NOW()),
('tmhieu', 1, '2002-12-27', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Trịnh Minh Hiếu', 'ROLE_STUDENT', 'hieu@gmail.com', '0123456789', NULL, FALSE, NOW()),
-- k20 cntt (id: 30-43)
('btam', 0, '2002-07-14', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Bùi Thanh Tâm', 'ROLE_STUDENT', 'tam@gmail.com', '0123456789', NULL, FALSE, NOW()),
('hqv', 1, '2002-02-12', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Hồ Quang Văn', 'ROLE_STUDENT', 'van@gmail.com', '0123456789', NULL, FALSE, NOW()),
('dtphong', 1, '2002-10-04', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Đoàn Trung Phong', 'ROLE_STUDENT', 'phong@gmail.com', '0123456789', NULL, FALSE, NOW()),
('ntkhai', 0, '2002-03-18', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Ngô Thị Kim Tài', 'ROLE_STUDENT', 'tai@gmail.com', '0123456789', NULL, FALSE, NOW()),
('plho', 1, '2001-06-02', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Phan Lê Hồ', 'ROLE_STUDENT', 'ho@gmail.com', '0123456789', NULL, FALSE, NOW()),
('nmthanh', 1, '2002-01-13', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Ngô Minh Thành', 'ROLE_STUDENT', 'thanh@gmail.com', '0123456789', NULL, FALSE, NOW()),
('tnnam', 1, '2002-10-19', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Trần Nhật Nam', 'ROLE_STUDENT', 'nam@gmail.com', '0123456789', NULL, FALSE, NOW()),
('ttphat', 1, '2002-02-10', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Thái Tấn Phát', 'ROLE_STUDENT', 'phat@gmail.com', '0123456789', NULL, FALSE, NOW()),
('hmhoang', 1, '2001-09-23', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Huỳnh Minh Hoàng', 'ROLE_STUDENT', 'hoang@gmail.com', '0123456789', NULL, FALSE, NOW()),
('ntngocyen', 0, '2002-01-22', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Thị Ngọc Yến', 'ROLE_STUDENT', 'yen@gmail.com', '0123456789', NULL, FALSE, NOW()),
('dgiahuy', 1, '2002-01-03', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Đoàn Gia Huy', 'ROLE_STUDENT', 'huy@gmail.com', '0123456789', NULL, FALSE, NOW()),
('ttkhoa', 0, '2002-07-19', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Trương Thị Kim Hoa', 'ROLE_STUDENT', 'hoa@gmail.com', '0123456789', NULL, FALSE, NOW()),
('ldankiet', 1, '2002-09-19', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Lê Đông Anh Kiệt', 'ROLE_STUDENT', 'kiet@gmail.com', '0123456789', NULL, FALSE, NOW()),
('ntthanh', 0, '2002-05-05', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Thị Thanh', 'ROLE_STUDENT', 'thanh@gmail.com', '0123456789', NULL, FALSE, NOW()),

-- k21 cntt (id: 44-59)
('ttkiet', 1, '2003-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Trần Tuấn Kiệt', 'ROLE_STUDENT', 'kiettran.cv@gmail.com', '0123456789', 'https://zpsocial-f47-org.zadn.vn/2bb9ac814b16a448fd07.jpg', TRUE, NOW()),
('lhloc', 1, '2003-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'La Hồng Lộc', 'ROLE_STUDENT', 'loc@gmail.com', '0123456789', 'https://zpsocial-f54-org.zadn.vn/283c78389a527a0c2343.jpg', TRUE, NOW()),
('dvkhanh', 1, '2003-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Dương Văn Khánh', 'ROLE_STUDENT', 'khanh@gmail.com', '0123456789', NULL, FALSE, NOW()),
('nhnhi', 0, '2003-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Hoàng Nhi', 'ROLE_STUDENT', 'nhi@gmail.com', '0123456789', NULL, FALSE, NOW()),
('htthuy', 0, '2003-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Hồ Thanh Thúy', 'ROLE_STUDENT', 'thuy@gmail.com', '0123456789', NULL, FALSE, NOW()),
('ntlam', 0, '2003-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Ngô Thanh Lam', 'ROLE_STUDENT', 'lam@gmail.com', '0123456789', NULL, FALSE, NOW()),
('nvlau', 1, '2003-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Ngô Văn Lâu', 'ROLE_STUDENT', 'lau@gmail.com', '0123456789', NULL, FALSE, NOW()),
('ttlan', 1, '2003-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Trần Lê Lân', 'ROLE_STUDENT', 'lan@gmail.com', '0123456789', NULL, FALSE, NOW()),
('vctuan', 1, '2003-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Văn Công Tuấn', 'ROLE_STUDENT', 'tuan@gmail.com', '0123456789', NULL, FALSE, NOW()),
('tqhau', 1, '2003-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Thằng Quốc Hậu', 'ROLE_STUDENT', 'hau@gmail.com', '0123456789', NULL, FALSE, NOW()),
('nhtam', 1, '2003-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Hoài Tâm', 'ROLE_STUDENT', 'tam@gmail.com', '0123456789', NULL, FALSE, NOW()),
('nctuan', 1, '2003-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Châu Tuấn', 'ROLE_STUDENT', 'tuan@gmail.com', '0123456789', NULL, FALSE, NOW()),
('nthvy', 0, '2003-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Thị Hiền Vy', 'ROLE_STUDENT', 'vy@gmail.com', '0123456789', NULL, FALSE, NOW()),
('chhung', 1, '2003-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Đỗ Chí Hưng', 'ROLE_STUDENT', 'hung@gmail.com', '0123456789', NULL, FALSE, NOW()),
('ntmvan', 1, '2003-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Thị Mỹ Vân', 'ROLE_STUDENT', 'van@gmail.com', '0123456789', NULL, FALSE, NOW()),
('dntu', 1, '2003-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Đặng Ngọc Tú', 'ROLE_STUDENT', 'tu@gmail.com', '0123456789', NULL, FALSE, NOW()),
-- k21 khmt (id: 60-75)
('tqthanh', 1, '2003-05-22', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Tsàn Quý Thành', 'ROLE_STUDENT', 'thanh@gmail.com', '0123456789', NULL, FALSE, NOW()),
('hqminh', 1, '2003-06-07', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Hoàng Quốc Minh', 'ROLE_STUDENT', 'minh@gmail.com', '0123456789', NULL, FALSE, NOW()),
('tbatuan', 1, '2003-04-28', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Trương Bùi Anh Tuấn', 'ROLE_STUDENT', 'tuan@gmail.com', '0123456789', NULL, FALSE, NOW()),
('nxloc', 1, '2003-01-27', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Xuân Lộc', 'ROLE_STUDENT', 'loc@gmail.com', '0123456789', NULL, FALSE, NOW()),
('tatien', 1, '2003-01-28', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Trần An Tiến', 'ROLE_STUDENT', 'tien@gmail.com', '0123456789', NULL, FALSE, NOW()),
('thkhang', 1, '2003-09-14', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Trịnh Huỳnh Thịnh Khang', 'ROLE_STUDENT', 'khang@gmail.com', '0123456789', NULL, FALSE, NOW()),
('ntanh', 1, '2003-04-20', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Thế Anh', 'ROLE_STUDENT', 'anh@gmail.com', '0123456789', NULL, FALSE, NOW()),
('dtthao', 0, '2003-02-20', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Đoàn Thị Thảo', 'ROLE_STUDENT', 'thao@gmail.com', '0123456789', NULL, FALSE, NOW()),
('lnaphong', 1, '2003-09-27', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Lê Nguyễn Anh Phong', 'ROLE_STUDENT', 'phong@gmail.com', '0123456789', NULL, FALSE, NOW()),
('lpthinh', 1, '2003-01-04', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Lâm Phát Thịnh', 'ROLE_STUDENT', 'thinh@gmail.com', '0123456789', NULL, FALSE, NOW()),
('pdmvuong', 1, '2003-11-07', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Phạm Đỗ Minh Vương', 'ROLE_STUDENT', 'vuong@gmail.com', '0123456789', NULL, FALSE, NOW()),
('ndtngan', 0, '2003-08-22', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Đặng Thanh Ngân', 'ROLE_STUDENT', 'ngan@gmail.com', '0123456789', NULL, FALSE, NOW()),
('pdan', 1, '2003-09-09', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Phạm Dương An', 'ROLE_STUDENT', 'an@gmail.com', '0123456789', NULL, FALSE, NOW()),
('ttthanh', 0, '2003-09-27', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Tạ Thị Thiên Thanh', 'ROLE_STUDENT', 'thanh@gmail.com', '0123456789', NULL, FALSE, NOW()),
('pbthieu', 1, '2003-02-12', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Phạm Bá Trung Hiếu', 'ROLE_STUDENT', 'hieu@gmail.com', '0123456789', NULL, FALSE, NOW()),
('npmnhat', 1, '2003-05-15', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Phan Minh Nhật', 'ROLE_STUDENT', 'nhat@gmail.com', '0123456789', NULL, FALSE, NOW()),

-- k22 khmt (id: 76-86)
('ndnguyen', 1, '2004-03-08', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Ngô Đông Nguyên', 'ROLE_STUDENT', 'nguyen@gmail.com', '0123456789', NULL, FALSE, NOW()),
('haduy', 1, '2004-01-20', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Hoàng Anh Duy', 'ROLE_STUDENT', 'duy@gmail.com', '0123456789', NULL, FALSE, NOW()),
('pmquang', 1, '2003-02-06', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Phí Minh Quang', 'ROLE_STUDENT', 'quang@gmail.com', '0123456789', NULL, FALSE, NOW()),
('lghuy', 1, '2004-01-03', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Lê Gia Huy', 'ROLE_STUDENT', 'huy@gmail.com', '0123456789', NULL, FALSE, NOW()),
('nttung', 1, '2004-01-19', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Thanh Tùng', 'ROLE_STUDENT', 'tung@gmail.com', '0123456789', NULL, FALSE, NOW()),
('nnpnhu', 0, '2004-08-30', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Ngọc Phượng Như', 'ROLE_STUDENT', 'nhu@gmail.com', '0123456789', NULL, FALSE, NOW()),
('ntlloi', 1, '2004-07-31', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Tấn Lợi', 'ROLE_STUDENT', 'loi@gmail.com', '0123456789', NULL, FALSE, NOW()),
('dbtien', 1, '2004-10-09', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Đinh Bích Tiên', 'ROLE_STUDENT', 'tien@gmail.com', '0123456789', NULL, FALSE, NOW()),
('tndminh', 1, '2004-09-30', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Trần Nguyễn Đức Minh', 'ROLE_STUDENT', 'minh@gmail.com', '0123456789', NULL, FALSE, NOW()),
('bxtien', 1, '2004-09-07', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Bạch Xuân Thiên', 'ROLE_STUDENT', 'thien@gmail.com', '0123456789', NULL, FALSE, NOW()),
('hqdat', 1, '2004-01-01', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Hứa Quang Đạt', 'ROLE_STUDENT', 'dat@gmail.com', '0123456789', NULL, FALSE, NOW()),
-- k22 cntt (id: 87-96)
('lthd', 1, '2004-10-27', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Lê Thanh Dân', 'ROLE_STUDENT', 'danthanh@gmail.com', '0123456789', NULL, FALSE, NOW()),
('ltphat', 1, '2004-12-15', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Lê Tấn Phát', 'ROLE_STUDENT', 'phatle@gmail.com', '0123456789', NULL, FALSE, NOW()),
('clngan', 0, '2004-09-02', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Chu Lệ Ngân', 'ROLE_STUDENT', 'ngancl@gmail.com', '0123456789', NULL, FALSE, NOW()),
('bvduc', 1, '2004-06-13', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Bùi Văn Đức', 'ROLE_STUDENT', 'ducbv@gmail.com', '0123456789', NULL, FALSE, NOW()),
('ltan', 1, '2004-02-09', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Lê Tân', 'ROLE_STUDENT', 'tanle@gmail.com', '0123456789', NULL, FALSE, NOW()),
('tcdung', 1, '2004-10-05', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Trương Chí Dũng', 'ROLE_STUDENT', 'dungtc@gmail.com', '0123456789', NULL, FALSE, NOW()),
('lahao', 1, '2004-07-24', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Lê Anh Hào', 'ROLE_STUDENT', 'haolah@gmail.com', '0123456789', NULL, FALSE, NOW()),
('nhyen', 0, '2004-04-15', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Hoàng Yến', 'ROLE_STUDENT', 'yennguyen@gmail.com', '0123456789', NULL, FALSE, NOW()),
('dpnam', 1, '2004-12-02', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Đặng Phương Nam', 'ROLE_STUDENT', 'namdp@gmail.com', '0123456789', NULL, FALSE, NOW()),
('tqdat', 1, '2004-10-04', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Trịnh Quốc Đạt', 'ROLE_STUDENT', 'dat.trinh@gmail.com', '0123456789', NULL, FALSE, NOW()),

-- Khoa QTKD
-- k20 du lich (id: 97-101)
('hgihan', 0, '2002-09-20', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Huỳnh Gia Hân', 'ROLE_STUDENT', 'hanhg@gmail.com', '0123456789', NULL, FALSE, NOW()),
('nqthai', 1, '2002-11-16', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Quốc Thái', 'ROLE_STUDENT', 'thainguyen@gmail.com', '0123456789', NULL, FALSE, NOW()),
('dtthuong', 0, '2002-02-06', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Đặng Thị Thu Hương', 'ROLE_STUDENT', 'huongdang@gmail.com', '0123456789', NULL, FALSE, NOW()),
('tthxuan', 0, '2002-02-13', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Trương Thị Hồng Xuân', 'ROLE_STUDENT', 'xuantruong@gmail.com', '0123456789', NULL, FALSE, NOW()),
('lnanh', 0, '2002-02-02', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Lê Ngọc Ánh', 'ROLE_STUDENT', 'anhle@gmail.com', '0123456789', NULL, FALSE, NOW()),
-- k20 qtkd (id: 102-108)
('nguyentuanh', 0, '2002-10-28', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Lê Anh Tú', 'ROLE_STUDENT', 'nguyentuanh@gmail.com', NULL, NULL, FALSE, NOW()),
('nqdong', 1, '2002-01-05', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Quý Đông', 'ROLE_STUDENT', 'nqdong@gmail.com', NULL, NULL, FALSE, NOW()),
('nttthao', 0, '2002-12-06', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Thị Thu Thảo', 'ROLE_STUDENT', 'nttthao@gmail.com', NULL, NULL, FALSE, NOW()),
('htkimgnan', 0, '2002-09-30', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Huỳnh Thị Kim Ngân', 'ROLE_STUDENT', 'htkimgnan@gmail.com', NULL, NULL, FALSE, NOW()),
('nlangbang', 0, '2002-02-21', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Lăng Băng', 'ROLE_STUDENT', 'nlangbang@gmail.com', NULL, NULL, FALSE, NOW()),
('ctanhlinh', 0, '2002-06-16', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Chu Thị Ánh Linh', 'ROLE_STUDENT', 'ctanhlinh@gmail.com', NULL, NULL, FALSE, NOW()),
('lquocthang', 0, '2002-11-14', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Lê Quốc Thắng', 'ROLE_STUDENT', 'lquocthang@gmail.com', NULL, NULL, FALSE, NOW()),
-- k21 du lich (id: 109-118)
('vtkimgnan', 0, '2003-07-11', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Võ Thị Kim Ngân', 'ROLE_STUDENT', 'vtkimgnan@gmail.com', NULL, NULL, FALSE, NOW()),
('ntkimdang', 0, '2003-02-08', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Thị Kim Đang', 'ROLE_STUDENT', 'ntkimdang@gmail.com', NULL, NULL, FALSE, NOW()),
('vtthanthu', 0, '2003-10-14', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Võ Thanh Thư', 'ROLE_STUDENT', 'vtthanthu@gmail.com', NULL, NULL, FALSE, NOW()),
('nnathu', 0, '2003-02-26', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Ngọc Anh Thư', 'ROLE_STUDENT', 'nnathu@gmail.com', NULL, NULL, FALSE, NOW()),
('nnghan', 0, '2003-06-30', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Ngọc Hân', 'ROLE_STUDENT', 'nnghan@gmail.com', NULL, NULL, FALSE, NOW()),
('lghan', 0, '2003-05-15', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Lý Gia Hân', 'ROLE_STUDENT', 'lghan@gmail.com', NULL, NULL, FALSE, NOW()),
('dgt', 0, '2003-10-08', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Đoàn Gia Thịnh', 'ROLE_STUDENT', 'dgt@gmail.com', NULL, NULL, FALSE, NOW()),
('lathu', 0, '2003-12-11', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Lê Anh Thư', 'ROLE_STUDENT', 'lathu@gmail.com', NULL, NULL, FALSE, NOW()),
('ntynhi', 0, '2003-04-21', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Thị Ý Nhi', 'ROLE_STUDENT', 'ntynhi@gmail.com', NULL, NULL, FALSE, NOW()),
('ptbyen', 0, '2003-07-23', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Phan Thị Bảo Yến', 'ROLE_STUDENT', 'ptbyen@gmail.com', NULL, NULL, FALSE, NOW()),
-- k21 qtkd (id: 119-125)
('hqvinh', 1, '2003-01-20', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Hứa Quang Vinh', 'ROLE_STUDENT', 'hqvinh@gmail.com', NULL, NULL, FALSE, NOW()),
('tkhanhan', 0, '2003-05-17', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Trần Khánh Hân', 'ROLE_STUDENT', 'tkhanhan@gmail.com', NULL, NULL, FALSE, NOW()),
('tlthao', 0, '2003-04-04', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Trần Lê Tuyết Thảo', 'ROLE_STUDENT', 'tlthao@gmail.com', NULL, NULL, FALSE, NOW()),
('vnquynh', 0, '2003-04-28', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Võ Như Quỳnh', 'ROLE_STUDENT', 'vnquynh@gmail.com', NULL, NULL, FALSE, NOW()),
('mmintam', 0, '2003-07-15', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Mã Minh Tâm', 'ROLE_STUDENT', 'mmintam@gmail.com', NULL, NULL, FALSE, NOW()),
('mdthuytrang', 0, '2003-04-17', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Mai Dương Thùy Trang', 'ROLE_STUDENT', 'mdthuytrang@gmail.com', NULL, NULL, FALSE, NOW()),
('nhdongnhi', 0, '2003-12-04', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Hoài Đông Nhi', 'ROLE_STUDENT', 'nhdongnhi@gmail.com', NULL, NULL, FALSE, NOW()),
-- k22 du lich (id: 126-132)
('vtnquynh', 0, '2004-04-06', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Võ Thị Như Quỳnh', 'ROLE_STUDENT', 'vtnquynh@gmail.com', NULL, NULL, FALSE, NOW()),
('vtphat', 1, '2004-02-25', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Võ Tiến Phát', 'ROLE_STUDENT', 'vtphat@gmail.com', NULL, NULL, FALSE, NOW()),
('tnphuonghang', 0, '2004-02-08', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Trần Nguyễn Phượng Hằng', 'ROLE_STUDENT', 'tnphuonghang@gmail.com', NULL, NULL, FALSE, NOW()),
('nlquyen', 0, '2004-08-13', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Lệ Quyên', 'ROLE_STUDENT', 'nlquyen@gmail.com', NULL, NULL, FALSE, NOW()),
('nhaodao', 0, '2004-01-16', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Hoàng Anh Đào', 'ROLE_STUDENT', 'nhaodao@gmail.com', NULL, NULL, FALSE, NOW()),
('lnptrinh', 0, '2004-12-02', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Lộc Ngọc Phương Trinh', 'ROLE_STUDENT', 'lnptrinh@gmail.com', NULL, NULL, FALSE, NOW()),
('dbhhoang', 0, '2004-11-20', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Diệp Bảo Hoàng', 'ROLE_STUDENT', 'dbhhoang@gmail.com', NULL, NULL, FALSE, NOW()),
-- k22 qtkd (id: 133-142)
('ptqnhu', 0, '2004-01-05', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Phan Thị Quỳnh Như', 'ROLE_STUDENT', 'ptqnhu@gmail.com', NULL, NULL, FALSE, NOW()),
('nthkieum', 1, '2004-11-06', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Thị Hiếu Khiêm', 'ROLE_STUDENT', 'nthkieum@gmail.com', NULL, NULL, FALSE, NOW()),
('ltphuong', 0, '2004-03-20', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Lưu Thanh Hương', 'ROLE_STUDENT', 'ltphuong@gmail.com', NULL, NULL, FALSE, NOW()),
('mtlkhanh', 0, '2004-10-04', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Mai Thị Lệ Khánh', 'ROLE_STUDENT', 'mtlkhanh@gmail.com', NULL, NULL, FALSE, NOW()),
('ntnglinh', 0, '2004-07-09', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Thị Ngọc Linh', 'ROLE_STUDENT', 'ntnglinh@gmail.com', NULL, NULL, FALSE, NOW()),
('ntxuyen', 0, '2004-01-09', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Thị Xuyến', 'ROLE_STUDENT', 'ntxuyen@gmail.com', NULL, NULL, FALSE, NOW()),
('ltle', 0, '2004-05-07', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Lê Trần Lê', 'ROLE_STUDENT', 'ltle@gmail.com', NULL, NULL, FALSE, NOW()),
('nhbquyen', 1, '2004-02-20', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Nguyễn Hạ Bảo Quyên', 'ROLE_STUDENT', 'nhbquyen@gmail.com', NULL, NULL, FALSE, NOW()),
('tpthao', 0, '2004-01-13', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Trần Phương Thảo', 'ROLE_STUDENT', 'tpthao@gmail.com', NULL, NULL, FALSE, NOW()),
('ptmanh', 0, '2004-01-03', '$2a$10$WaTkll.lhpONkb4Q.jXHUuctHxZaiu3R33yMgyli249gOO50ERrNG', 'Phạm Thị Minh Ánh', 'ROLE_STUDENT', 'ptmanh@gmail.com', NULL, NULL, FALSE, NOW());


INSERT INTO grade (name, major_id) VALUES
-- k20 (id: 1-8)
('DH20IT01', 1),
('DH20IT02', 1),
('DH20CS01', 2),
('DH20CS02', 2),
('DH20BA01', 3),
('DH20BA02', 3),
('DH20TO01', 4),
('DH20TO02', 4),
-- k21 (id: 9-16)
('DH21IT01', 1),
('DH21IT02', 1),
('DH21CS01', 2),
('DH21CS02', 2),
('DH21BA01', 3),
('DH21BA02', 3),
('DH21TO01', 4),
('DH21TO02', 4),
-- k22 (id: 17-24)
('DH22IT01', 1),
('DH22IT02', 1),
('DH22CS01', 2),
('DH22CS02', 2),
('DH22BA01', 3),
('DH22BA02', 3),
('DH22TO01', 4),
('DH22TO02', 4);

INSERT INTO academic_year (name, start, finish) VALUES
('2020-2024', '2020-10-01', '2024-09-30'),
('2021-2025', '2021-10-01', '2025-09-30'),
('2022-2026', '2022-10-01', '2026-09-30');

INSERT INTO semester (name, academic_year_id) VALUES
('Học kỳ 1', 1),
('Học kỳ 2', 1),
('Học kỳ 3', 1),
('Học kỳ 4', 1),
('Học kỳ 5', 1),
('Học kỳ 6', 1),
('Học kỳ 7', 1),
('Học kỳ 8', 1),
('Học kỳ 9', 1),
('Học kỳ 10', 1),
('Học kỳ 11', 1),
('Học kỳ 1', 2),
('Học kỳ 2', 2),
('Học kỳ 3', 2),
('Học kỳ 4', 2),
('Học kỳ 5', 2),
('Học kỳ 6', 2),
('Học kỳ 7', 2),
('Học kỳ 8', 2),
('Học kỳ 9', 2),
('Học kỳ 10', 2),
('Học kỳ 11', 2),
('Học kỳ 1', 3),
('Học kỳ 2', 3),
('Học kỳ 3', 3),
('Học kỳ 4', 3),
('Học kỳ 5', 3),
('Học kỳ 6', 3),
('Học kỳ 7', 3),
('Học kỳ 8', 3),
('Học kỳ 9', 3),
('Học kỳ 10', 3),
('Học kỳ 11', 3);

INSERT INTO student (student_code, user_id, grade_id, major_id, academic_year_id) VALUES
-- k20 khmt (id: 14-29)
-- cs2001
("2051050001", 14, 3, 2, 1),
("2051050002", 15, 3, 2, 1),
("2051050003", 16, 3, 2, 1),
("2051050004", 17, 3, 2, 1),
("2051050005", 18, 3, 2, 1),
("2051050006", 19, 3, 2, 1),
("2051050007", 20, 3, 2, 1),
("2051050008", 21, 3, 2, 1),
-- cs2002
("2051050009", 22, 4, 2, 1),
("2051050010", 23, 4, 2, 1),
("2051050011", 24, 4, 2, 1),
("2051050012", 25, 4, 2, 1),
("2051050013", 26, 4, 2, 1),
("2051050014", 27, 4, 2, 1),
("2051050015", 28, 4, 2, 1),
("2051050016", 29, 4, 2, 1),
-- k20 cntt (id: 30-43)
-- it2001
("2051050017", 30, 1, 1, 1),
("2051050018", 31, 1, 1, 1),
("2051050019", 32, 1, 1, 1),
("2051050020", 33, 1, 1, 1),
("2051050021", 34, 1, 1, 1),
("2051050022", 35, 1, 1, 1),
("2051050023", 36, 1, 1, 1),
-- it2002
("2051050024", 37, 2, 1, 1),
("2051050025", 38, 2, 1, 1),
("2051050026", 39, 2, 1, 1),
("2051050027", 40, 2, 1, 1),
("2051050028", 41, 2, 1, 1),
("2051050029", 42, 2, 1, 1),
("20510500230", 43, 2, 1, 1),
-- k21 cntt (id: 44-59)
-- it2101
("21510500001", 44, 9, 1, 2),
("21510500002", 45, 9, 1, 2),
("21510500003", 46, 9, 1, 2),
("21510500004", 47, 9, 1, 2),
("21510500005", 48, 9, 1, 2),
("21510500006", 49, 9, 1, 2),
("21510500007", 50, 9, 1, 2),
("21510500008", 51, 9, 1, 2),
-- it2102
("21510500009", 52, 10, 1, 2),
("21510500010", 53, 10, 1, 2),
("21510500011", 54, 10, 1, 2),
("21510500012", 55, 10, 1, 2),
("21510500013", 56, 10, 1, 2),
("21510500014", 57, 10, 1, 2),
("21510500015", 58, 10, 1, 2),
("21510500016", 59, 10, 1, 2),
-- k21 khmt (id: 60-75)
-- cs2101
("21510500017", 60, 11, 2, 2),
("21510500018", 61, 11, 2, 2),
("21510500019", 62, 11, 2, 2),
("21510500020", 63, 11, 2, 2),
("21510500021", 64, 11, 2, 2),
("21510500022", 65, 11, 2, 2),
("21510500023", 66, 11, 2, 2),
("21510500024", 67, 11, 2, 2),
-- cs2102
("21510500025", 68, 12, 2, 2),
("21510500026", 69, 12, 2, 2),
("21510500027", 70, 12, 2, 2),
("21510500028", 71, 12, 2, 2),
("21510500029", 72, 12, 2, 2),
("21510500030", 73, 12, 2, 2),
("21510500031", 74, 12, 2, 2),
("21510500032", 75, 12, 2, 2),
-- k22 khmt (id: 76-86)
-- cs2201
("2251050002", 76, 19, 2, 3),
("2251050003", 77, 19, 2, 3),
("2251050004", 78, 19, 2, 3),
("2251050005", 79, 19, 2, 3),
("2251050006", 80, 19, 2, 3),
("2251050007", 81, 19, 2, 3),
-- cs2202
("2251050008", 82, 20, 2, 3),
("2251050009", 83, 20, 2, 3),
("2251050010", 84, 20, 2, 3),
("2251050011", 85, 20, 2, 3),
("2251050012", 86, 20, 2, 3),
-- k22 cntt (id: 87-96)
-- it2201
("2251050013", 87, 17, 1, 3),
("2251050014", 88, 17, 1, 3),
("2251050015", 89, 17, 1, 3),
("2251050016", 90, 17, 1, 3),
("2251050017", 91, 17, 1, 3),
-- it2202
("2251050018", 92, 18, 1, 3),
("2251050019", 93, 18, 1, 3),
("2251050020", 94, 18, 1, 3),
("2251050021", 95, 18, 1, 3),
("2251050022", 96, 18, 1, 3),
-- k20 du lich (id: 97-101)
-- to2001
("2054050001", 97, 7, 4, 1),
("2054050002", 98, 7, 4, 1),
("2054050003", 99, 7, 4, 1),
-- to2002
("2054050004", 100, 8, 4, 1),
("2054050005", 101, 8, 4, 1),
-- k20 qtkd (id: 102-108)
-- ba2001
("2054050006", 102, 5, 3, 1),
("2054050007", 103, 5, 3, 1),
("2054050008", 104, 5, 3, 1),
("2054050009", 105, 5, 3, 1),
-- ba2002
("2054050010", 106, 6, 3, 1),
("2054050011", 107, 6, 3, 1),
("2054050012", 108, 6, 3, 1),
-- k21 du lich (id: 109-118)
-- to2101
("2154050001", 109, 15, 4, 2),
("2154050002", 110, 15, 4, 2),
("2154050003", 111, 15, 4, 2),
("2154050004", 112, 15, 4, 2),
("2154050005", 113, 15, 4, 2),
-- to2102
("2154050006", 114, 16, 4, 2),
("2154050007", 115, 16, 4, 2),
("2154050008", 116, 16, 4, 2),
("2154050009", 117, 16, 4, 2),
("2154050010", 118, 16, 4, 2),
-- k21 qtkd (id: 119-125)
-- ba2101
("2154050011", 119, 13, 3, 2),
("2154050012", 120, 13, 3, 2),
("2154050013", 121, 13, 3, 2),
("2154050014", 122, 13, 3, 2),
-- ba2102
("2154050015", 123, 14, 3, 2),
("2154050016", 124, 14, 3, 2),
("2154050017", 125, 14, 3, 2),
-- k22 du lich (id: 126-132)
-- to2201
("2254050001", 126, 23, 4, 3),
("2254050002", 127, 23, 4, 3),
("2254050003", 128, 23, 4, 3),
("2254050004", 129, 23, 4, 3),
-- to2202
("2254050005", 130, 24, 4, 3),
("2254050006", 131, 24, 4, 3),
("2254050007", 132, 24, 4, 3),
-- k22 qtkd (id: 133-142)
-- ba2201
("2254050008", 133, 21, 3, 3),
("2254050009", 134, 21, 3, 3),
("2254050010", 135, 21, 3, 3),
("2254050011", 136, 21, 3, 3),
("2254050012", 137, 21, 3, 3),
-- ba2202
("2254050013", 138, 22, 3, 3),
("2254050014", 139, 22, 3, 3),
("2254050015", 140, 22, 3, 3),
("2254050016", 141, 22, 3, 3),
("2254050017", 142, 22, 3, 3);

INSERT INTO subject (name) VALUES
-- Khoa CNTT (id: 1-42)
('Nhập môn tin học'),
('Đại số tuyến tính'),
('Cơ sở lập trình'),
('Giải tích'),
('Kỹ thuật lập trình'),
('Kiến trúc máy tính'),
('Cấu trúc dữ liệu và thuật giải 1'),
('Ứng dụng web'),
('Hệ điều hành'),
('Xác suất và thống kê'),
('Triết học Mác - Lênin'),
('Cấu trúc dữ liệu và Giải thuật 2'),
('Cơ sở dữ liệu'),
('Mạng máy tính'),
('Kinh tế chính trị Mác - Lênin'),
('Lập trình hướng đối tượng'),
('Phân tích thiết kế hệ thống'),
('Toán rời rạc'),
('Chủ nghĩa xã hội khoa học'),
('Lập trình giao diện'),
('Quản trị hệ cơ sở dữ liệu'),
('Kỹ năng nghề nghiệp'),
('Lịch sử Đảng CS Việt Nam'),
('Mạng máy tính nâng cao'),
('Lập trình web'),
('Công nghệ phần mềm'),
('Các công nghệ lập trình hiện đại'),
('Toán cho máy học'),
('Trí tuệ nhân tạo'),
('Cơ sở dữ liệu phân tán'),
('Phân tích dữ liệu'),
('Tư tưởng Hồ Chí Minh'),
('Lập trình mạng'),
('Quản trị mạng'),
('Kiểm thử phần mềm'),
('Phát triển hệ thống web'),
('Thị giác máy tính'),
('Khai phá dữ liệu'),
('Lập trình cơ sở dữ liệu'),
('Đồ án ngành'),
('Thực tập tốt nghiệp'),
('Khóa luận tốt nghiệp'),
-- Khoa QTKD (id: 43-60)
('Quản trị học'),
('Marketing căn bản'),
('Quản trị nhân sự'),
('Tài chính doanh nghiệp'),
('Quản trị chiến lược'),
('Kế toán tài chính'),
('Quản trị sản xuất'),
('Kinh tế vi mô'),
('Kinh tế vĩ mô'),
('Quản lý du lịch'),
('Marketing du lịch'),
('Lữ hành và hướng dẫn viên du lịch'),
('Quản trị nhà hàng khách sạn'),
('Kinh tế du lịch'),
('Văn hóa du lịch'),
('Quản lý sự kiện'),
('Pháp luật du lịch'),
('Địa lý du lịch Việt Nam');

INSERT INTO score (name, assessment) VALUES
('Giữa kỳ', 'Bài kiểm tra giữa kỳ'),
('Cuối kỳ', 'Bài kiểm tra cuối kỳ'),
('Bài tập lớn', 'Bài tập nhóm'),
('Thực hành', 'Bài thực hành');

INSERT INTO outline (started_datetime, expired_datetime, description, theo_credit_hour, prac_credit_hour, lecturer_id, subject_id, status, approver_id) VALUES
-- Khoa CNTT
('2018-01-01', '2018-06-30', 'Đề cương cho môn học Nhập môn tin học', 3, 1, 4, 1, TRUE, 1),
('2017-01-01', '2017-06-30', 'Đề cương cho môn học Đại số tuyến tính', 3, 1, 1, 2, TRUE, 1),
('2016-01-01', '2016-06-30', 'Đề cương cho môn học Cơ sở lập trình', 3, 1, 5, 3, TRUE, 1),
('2015-01-01', '2015-06-30', 'Đề cương cho môn học Giải tích', 3, 1, 1, 4, TRUE, 1),
('2014-01-01', '2014-06-30', 'Đề cương cho môn học Kỹ thuật lập trình', 3, 1, 5, 5, TRUE, 1),
('2013-01-01', '2013-06-30', 'Đề cương cho môn học Kiến trúc máy tính', 3, 1, 6, 6, TRUE, 1),
('2012-01-01', '2012-06-30', 'Đề cương cho môn học Cấu trúc dữ liệu và thuật giải 1', 3, 1, 5, 7, TRUE, 1),
('2011-01-01', '2011-06-30', 'Đề cương cho môn học Ứng dụng web', 3, 1, 2, 8, TRUE, 1),
('2010-01-01', '2010-06-30', 'Đề cương cho môn học Hệ điều hành', 3, 1, 1, 9, TRUE, 1),
('2009-01-01', '2009-06-30', 'Đề cương cho môn học Xác suất và thống kê', 3, 1, 1, 10, TRUE, 1),
('2008-01-01', '2008-06-30', 'Đề cương cho môn học Triết học Mác - Lênin', 3, 1, 7, 11, TRUE, 1),
('2007-01-01', '2007-06-30', 'Đề cương cho môn học Cấu trúc dữ liệu và Giải thuật 2', 3, 1, 5, 12, TRUE, 1),
('2006-01-01', '2006-06-30', 'Đề cương cho môn học Cơ sở dữ liệu', 3, 1, 4, 13, TRUE, 1),
('2005-01-01', '2005-06-30', 'Đề cương cho môn học Mạng máy tính', 3, 1, 1, 14, TRUE, 1),
('2004-01-01', '2004-06-30', 'Đề cương cho môn học Kinh tế chính trị Mác - Lênin', 3, 1, 8, 15, TRUE, 1),
('2003-01-01', '2003-06-30', 'Đề cương cho môn học Lập trình hướng đối tượng', 3, 1, 2, 16, TRUE, 1),
('2002-01-01', '2002-06-30', 'Đề cương cho môn học Phân tích thiết kế hệ thống', 3, 1, 4, 17, TRUE, 1),
('2001-01-01', '2001-06-30', 'Đề cương cho môn học Toán rời rạc', 3, 1, 3, 18, TRUE, 1),
('2000-01-01', '2000-06-30', 'Đề cương cho môn học Chủ nghĩa xã hội khoa học', 3, 1, 7, 19, TRUE, 1),
('1999-01-01', '1999-06-30', 'Đề cương cho môn học Lập trình giao diện', 3, 1, 5, 20, TRUE, 1),
('1998-01-01', '1998-06-30', 'Đề cương cho môn học Quản trị hệ cơ sở dữ liệu', 3, 1, 4, 21, TRUE, 1),
('1997-01-01', '1997-06-30', 'Đề cương cho môn học Kỹ năng nghề nghiệp', 3, 1, 1, 22, TRUE, 1),
('1996-01-01', '1996-06-30', 'Đề cương cho môn học Lịch sử Đảng CS Việt Nam', 3, 1, 8, 23, TRUE, 1),
('1995-01-01', '1995-06-30', 'Đề cương cho môn học Mạng máy tính nâng cao', 3, 1, 3, 24, TRUE, 1),
('1994-01-01', '1994-06-30', 'Đề cương cho môn học Lập trình web', 3, 1, 2, 25, TRUE, 1),
('1993-01-01', '1993-06-30', 'Đề cương cho môn học Công nghệ phần mềm', 3, 1, 2, 26, TRUE, 1),
('1992-01-01', '1992-06-30', 'Đề cương cho môn học Các công nghệ lập trình hiện đại', 3, 1, 2, 27, TRUE, 1),
('1991-01-01', '1991-06-30', 'Đề cương cho môn học Toán cho máy học', 3, 1, 1, 28, TRUE, 1),
('1990-01-01', '1990-06-30', 'Đề cương cho môn học Trí tuệ nhân tạo', 3, 1, 1, 29, TRUE, 1),
('1989-01-01', '1989-06-30', 'Đề cương cho môn học Cơ sở dữ liệu phân tán', 3, 1, 4, 30, TRUE, 1),
('1988-01-01', '1988-06-30', 'Đề cương cho môn học Phân tích dữ liệu', 3, 1, 1, 31, TRUE, 2),
('1987-01-01', '1987-06-30', 'Đề cương cho môn học Tư tưởng Hồ Chí Minh', 3, 1, 8, 32, TRUE, 2),
('1986-01-01', '1986-06-30', 'Đề cương cho môn học Lập trình mạng', 3, 1, 3, 33, TRUE, 2),
('1985-01-01', '1985-06-30', 'Đề cương cho môn học Quản trị mạng', 3, 1, 3, 34, TRUE, 2),
('1984-01-01', '1984-06-30', 'Đề cương cho môn học Kiểm thử phần mềm', 3, 1, 4, 35, TRUE, 2),
('1983-01-01', '1983-06-30', 'Đề cương cho môn học Phát triển hệ thống web', 3, 1, 2, 36, TRUE, 2),
('1982-01-01', '1982-06-30', 'Đề cương cho môn học Thị giác máy tính', 3, 1, 4, 37, TRUE, 2),
('1981-01-01', '1981-06-30', 'Đề cương cho môn học Khai phá dữ liệu', 3, 1, 6, 38, TRUE, 2),
('1980-01-01', '1980-06-30', 'Đề cương cho môn học Lập trình cơ sở dữ liệu', 3, 1, 4, 39, TRUE, 2),
('1979-01-01', '1979-06-30', 'Đề cương cho môn học Đồ án ngành', 3, 1, 1, 40, TRUE, 2),
('1978-01-01', '1978-06-30', 'Đề cương cho môn học Thực tập tốt nghiệp', 3, 1, 1, 41, TRUE, 2),
('1977-01-01', '1977-06-30', 'Đề cương cho môn học Khóa luận tốt nghiệp', 3, 1, 1, 42, TRUE, 2),

-- Khoa QTKD
('2000-01-01', '2000-06-30', 'Đề cương cho môn học Quản trị học', 3, 1, 7, 43, TRUE, 1),
('1999-01-01', '1999-06-30', 'Đề cương cho môn học Marketing căn bản', 3, 1, 8, 44, TRUE, 1),
('1998-01-01', '1998-06-30', 'Đề cương cho môn học Quản trị nhân sự', 3, 1, 9, 45, TRUE, 1),
('1997-01-01', '1997-06-30', 'Đề cương cho môn học Tài chính doanh nghiệp', 3, 1, 10, 46, TRUE, 1),
('1996-01-01', '1996-06-30', 'Đề cương cho môn học Quản trị chiến lược', 3, 1, 11, 47, TRUE, 1),
('1995-01-01', '1995-06-30', 'Đề cương cho môn học Kế toán tài chính', 3, 1, 7, 48, TRUE, 1),
('1994-01-01', '1994-06-30', 'Đề cương cho môn học Quản trị sản xuất', 3, 1, 8, 49, TRUE, 1),
('1993-01-01', '1993-06-30', 'Đề cương cho môn học Kinh tế vi mô', 3, 1, 9, 50, TRUE, 1),
('1992-01-01', '1992-06-30', 'Đề cương cho môn học Kinh tế vĩ mô', 3, 1, 10, 51, TRUE, 1),
('1991-01-01', '1991-06-30', 'Đề cương cho môn học Quản lý du lịch', 3, 1, 11, 52, TRUE, 1),
('1990-01-01', '1990-06-30', 'Đề cương cho môn học Marketing du lịch', 3, 1, 7, 53, TRUE, 2),
('1989-01-01', '1989-06-30', 'Đề cương cho môn học Lữ hành và hướng dẫn viên du lịch', 3, 1, 8, 54, TRUE, 2),
('1988-01-01', '1988-06-30', 'Đề cương cho môn học Quản trị nhà hàng khách sạn', 3, 1, 9, 55, TRUE, 2),
('1987-01-01', '1987-06-30', 'Đề cương cho môn học Kinh tế du lịch', 3, 1, 10, 56, TRUE, 2),
('1986-01-01', '1986-06-30', 'Đề cương cho môn học Văn hóa du lịch', 3, 1, 11, 57, TRUE, 2),
('1985-01-01', '1985-06-30', 'Đề cương cho môn học Quản lý sự kiện', 3, 1, 7, 58, TRUE, 2),
('1984-01-01', '1984-06-30', 'Đề cương cho môn học Pháp luật du lịch', 3, 1, 8, 59, TRUE, 2),
('1983-01-01', '1983-06-30', 'Đề cương cho môn học Địa lý du lịch Việt Nam', 3, 1, 9, 60, TRUE, 2);

-- Thêm dữ liệu cho năm học '2020-2024'
INSERT INTO outline_academic_year (outline_id, academic_year_id)
SELECT o.id, a.id
FROM outline o
CROSS JOIN academic_year a
WHERE a.name = '2020-2024';

-- Thêm dữ liệu cho năm học '2021-2025'
INSERT INTO outline_academic_year (outline_id, academic_year_id)
SELECT o.id, a.id
FROM outline o
CROSS JOIN academic_year a
WHERE a.name = '2021-2025';

-- Thêm dữ liệu cho năm học '2022-2026'
INSERT INTO outline_academic_year (outline_id, academic_year_id)
SELECT o.id, a.id
FROM outline o
CROSS JOIN academic_year a
WHERE a.name = '2022-2026';

-- Thêm dữ liệu cho bảng outline_subject
INSERT INTO outline_subject (outline_id, subject_id)
SELECT o.id, s.id
FROM outline o
JOIN subject s ON o.subject_id = s.id;

-- Thêm dữ liệu cho bảng faculty_subject
INSERT INTO faculty_subject (faculty_id, subject_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(2, 43),
(2, 44),
(2, 45),
(2, 46),
(2, 47),
(2, 48),
(2, 49),
(2, 50),
(2, 51),
(2, 52),
(2, 53),
(2, 54),
(2, 55),
(2, 56),
(2, 57),
(2, 58),
(2, 59),
(2, 60);

INSERT INTO courseoutlinedb.comment (content, student_id, outline_id) VALUES
('Bài giảng rất hay và dễ hiểu.', 1, 1),
('Tôi cảm thấy khá khó khăn với phần bài tập này.', 2, 1),
('Giáo viên giải thích rất chi tiết và nắm vững kiến thức.', 3, 1),
('Mình muốn hỏi thêm về phần ví dụ này.', 4, 1),
('Phần này khá thú vị và ứng dụng được vào thực tế.', 5, 1),
('Tôi cần sự giúp đỡ về phần này, liệu có ai giúp được không?', 6, 1),
('Mong muốn thêm nhiều ví dụ thực tế hơn để hiểu sâu hơn.', 7, 1),
('Tôi đã hiểu rõ hơn về vấn đề này sau buổi giảng này.', 8, 1),
('Cần thêm thời gian để làm bài tập về nhà.', 9, 2),
('Giáo viên nên giảng bài một cách chi tiết hơn.', 10, 2),
('Bài giảng rất tốt và dễ hiểu.', 11, 2),
('Mong muốn có thêm tài liệu học tập.', 12, 2),
('Tôi cảm thấy thực sự hứng thú với nội dung này.', 13, 2),
('Phần này khá khó khăn và cần thời gian để nắm vững.', 14, 2),
('Tôi đã hiểu rõ hơn về vấn đề này sau buổi học này.', 15, 2),
('Bài giảng rất chi tiết và dễ hiểu.', 16, 2),
('Tôi cảm thấy khá khó khăn với phần này.', 17, 3),
('Giáo viên giải thích rất rõ ràng và dễ hiểu.', 18, 3),
('Phần này khá thú vị và áp dụng được vào thực tế.', 19, 3),
('Tôi cần thêm sự hỗ trợ về phần này.', 20, 3),
('Mong muốn thêm nhiều ví dụ hơn để hiểu sâu hơn.', 21, 3),
('Tôi đã hiểu rõ hơn về vấn đề này sau buổi giảng.', 22, 3),
('Bài giảng rất hay và dễ hiểu.', 23, 3),
('Tôi cảm thấy khá khó khăn với phần bài tập này.', 24, 3),
('Giáo viên giải thích rất chi tiết và nắm vững kiến thức.', 25, 3),
('Mình muốn hỏi thêm về phần ví dụ này.', 26, 3),
('Phần này khá thú vị và ứng dụng được vào thực tế.', 27, 3),
('Tôi cần sự giúp đỡ về phần này, liệu có ai giúp được không?', 28, 3),
('Mong muốn thêm nhiều ví dụ thực tế hơn để hiểu sâu hơn.', 29, 3),
('Tôi đã hiểu rõ hơn về vấn đề này sau buổi giảng này.', 30, 3),
('Cần thêm thời gian để làm bài tập về nhà.', 31, 4),
('Giáo viên nên giảng bài một cách chi tiết hơn.', 32, 4),
('Bài giảng rất tốt và dễ hiểu.', 33, 4),
('Mong muốn có thêm tài liệu học tập.', 34, 4),
('Tôi cảm thấy thực sự hứng thú với nội dung này.', 35, 4),
('Phần này khá khó khăn và cần thời gian để nắm vững.', 36, 4),
('Tôi đã hiểu rõ hơn về vấn đề này sau buổi học này.', 37, 4),
('Bài giảng rất chi tiết và dễ hiểu.', 38, 4),
('Tôi cảm thấy khá khó khăn với phần này.', 39, 4),
('Giáo viên giải thích rất rõ ràng và dễ hiểu.', 40, 4),
('Phần này khá thú vị và áp dụng được vào thực tế.', 41, 4),
('Tôi cần thêm sự hỗ trợ về phần này.', 42, 4),
('Mong muốn thêm nhiều ví dụ hơn để hiểu sâu hơn.', 43, 4),
('Tôi đã hiểu rõ hơn về vấn đề này sau buổi giảng.', 44, 4),
('Bài giảng rất hay và dễ hiểu.', 45, 4),
('Tôi cảm thấy khá khó khăn với phần bài tập này.', 46, 4),
('Giáo viên giải thích rất chi tiết và nắm vững kiến thức.', 47, 4),
('Mình muốn hỏi thêm về phần ví dụ này.', 48, 4),
('Phần này khá thú vị và ứng dụng được vào thực tế.', 49, 4),
('Tôi cần sự giúp đỡ về phần này, liệu có ai giúp được không?', 50,51),
('Mong muốn thêm nhiều ví dụ thực tế hơn để hiểu sâu hơn.', 52, 4),
('Tôi đã hiểu rõ hơn về vấn đề này sau buổi giảng này.', 53, 4),
('Cần thêm thời gian để làm bài tập về nhà.', 54, 5),
('Giáo viên nên giảng bài một cách chi tiết hơn.', 55, 5),
('Bài giảng rất tốt và dễ hiểu.', 56, 5),
('Mong muốn có thêm tài liệu học tập.', 57, 5),
('Tôi cảm thấy thực sự hứng thú với nội dung này.', 58, 5),
('Phần này khá khó khăn và cần thời gian để nắm vững.', 59, 5),
('Tôi đã hiểu rõ hơn về vấn đề này sau buổi học này.', 60, 5),
('Bài giảng rất chi tiết và dễ hiểu.', 61, 5),
('Tôi cảm thấy khá khó khăn với phần này.', 62, 5),
('Giáo viên giải thích rất rõ ràng và dễ hiểu.', 63, 5),
('Phần này khá thú vị và áp dụng được vào thực tế.', 64, 5),
('Tôi cần thêm sự hỗ trợ về phần này.', 65, 5),
('Mong muốn thêm nhiều ví dụ hơn để hiểu sâu hơn.', 66, 5),
('Tôi đã hiểu rõ hơn về vấn đề này sau buổi giảng.', 67, 5),
('Bài giảng rất hay và dễ hiểu.', 68, 5),
('Tôi cảm thấy khá khó khăn với phần bài tập này.', 69, 5),
('Giáo viên giải thích rất chi tiết và nắm vững kiến thức.', 70, 5),
('Mình muốn hỏi thêm về phần ví dụ này.', 71, 5),
('Phần này khá thú vị và ứng dụng được vào thực tế.', 72, 5),
('Tôi cần sự giúp đỡ về phần này, liệu có ai giúp được không?', 73, 5),
('Mong muốn thêm nhiều ví dụ thực tế hơn để hiểu sâu hơn.', 74, 5),
('Tôi đã hiểu rõ hơn về vấn đề này sau buổi giảng này.', 75, 5),
('Cần thêm thời gian để làm bài tập về nhà.', 76, 6),
('Giáo viên nên giảng bài một cách chi tiết hơn.', 77, 6),
('Bài giảng rất tốt và dễ hiểu.', 78, 6),
('Mong muốn có thêm tài liệu học tập.', 79, 6),
('Tôi cảm thấy thực sự hứng thú với nội dung này.', 80, 6),
('Phần này khá khó khăn và cần thời gian để nắm vững.', 81, 6),
('Tôi đã hiểu rõ hơn về vấn đề này sau buổi học này.', 82, 6),
('Bài giảng rất chi tiết và dễ hiểu.', 83, 6),
('Tôi cảm thấy khá khó khăn với phần này.', 84, 6),
('Giáo viên giải thích rất rõ ràng và dễ hiểu.', 85, 6),
('Phần này khá thú vị và áp dụng được vào thực tế.', 86, 6),
('Tôi cần thêm sự hỗ trợ về phần này.', 87, 6),
('Mong muốn thêm nhiều ví dụ hơn để hiểu sâu hơn.', 88, 6),
('Tôi đã hiểu rõ hơn về vấn đề này sau buổi giảng.', 89, 6),
('Bài giảng rất hay và dễ hiểu.', 90, 6),
('Tôi cảm thấy khá khó khăn với phần bài tập này.', 91, 6),
('Giáo viên giải thích rất chi tiết và nắm vững kiến thức.', 92, 6),
('Mình muốn hỏi thêm về phần ví dụ này.', 93, 6),
('Phần này khá thú vị và ứng dụng được vào thực tế.', 94, 6),
('Tôi cần sự giúp đỡ về phần này, liệu có ai giúp được không?', 95, 6),
('Mong muốn thêm nhiều ví dụ thực tế hơn để hiểu sâu hơn.', 96, 6),
('Tôi đã hiểu rõ hơn về vấn đề này sau buổi giảng này.', 97, 6);


INSERT INTO courseoutlinedb.feedback (content, student_id, outline_id) VALUES
('Môn học rất thú vị và giáo viên rất nhiệt tình.', 1, 1),
('Đề cương hữu ích và dễ hiểu.', 2, 2),
('Môn học này cần cải thiện cách giảng dạy.', 3, 3),
('Tôi cảm thấy thách thức với nội dung của môn học.', 4, 4),
('Cần nâng cao chất lượng bài giảng.', 5, 5),
('Nội dung môn học khá thú vị nhưng quá nhiều công việc nhóm.', 6, 6),
('Giáo viên cần cải thiện phương pháp giảng dạy.', 7, 7),
('Tôi thích cách thức hướng dẫn thực hành của giáo viên.', 8, 8),
('Nội dung môn học rất hữu ích cho công việc sau này.', 9, 9),
('Tôi rất hài lòng với môn học này.', 10, 10);


INSERT INTO courseoutlinedb.outline_score (percent, outline_id, score_id) VALUES
-- Outline 1
(40, 1, 1),  -- Giữa kỳ
(30, 1, 2),  -- Cuối kỳ
(20, 1, 3),  -- Bài tập lớn
(10, 1, 4),  -- Thực hành

-- Outline 2
(50, 2, 1),  -- Giữa kỳ
(20, 2, 2),  -- Cuối kỳ
(30, 2, 3),  -- Bài tập lớn

-- Outline 3
(60, 3, 1),  -- Giữa kỳ
(40, 3, 2),  -- Cuối kỳ

-- Outline 4
(70, 4, 1),  -- Giữa kỳ
(30, 4, 2),  -- Cuối kỳ

-- Outline 5
(80, 5, 1),  -- Giữa kỳ
(10, 5, 2),  -- Cuối kỳ
(5, 5, 3),   -- Bài tập lớn
(5, 5, 4),   -- Thực hành

-- Outline 6
(40, 6, 1),  -- Giữa kỳ
(30, 6, 2),  -- Cuối kỳ
(20, 6, 3),  -- Bài tập lớn
(10, 6, 4),  -- Thực hành

-- Outline 7
(50, 7, 1),  -- Giữa kỳ
(20, 7, 2),  -- Cuối kỳ
(30, 7, 3),  -- Bài tập lớn

-- Outline 8
(60, 8, 1),  -- Giữa kỳ
(40, 8, 2),  -- Cuối kỳ

-- Outline 9
(70, 9, 1),  -- Giữa kỳ
(30, 9, 2),  -- Cuối kỳ

-- Outline 10
(80, 10, 1),  -- Giữa kỳ
(10, 10, 2),  -- Cuối kỳ
(5, 10, 3),   -- Bài tập lớn
(5, 10, 4),   -- Thực hành

-- Outline 11
(40, 11, 1),  -- Giữa kỳ
(30, 11, 2),  -- Cuối kỳ
(20, 11, 3),  -- Bài tập lớn
(10, 11, 4),  -- Thực hành

-- Outline 12
(50, 12, 1),  -- Giữa kỳ
(20, 12, 2),  -- Cuối kỳ
(30, 12, 3),  -- Bài tập lớn

-- Outline 13
(60, 13, 1),  -- Giữa kỳ
(40, 13, 2),  -- Cuối kỳ

-- Outline 14
(70, 14, 1),  -- Giữa kỳ
(30, 14, 2),  -- Cuối kỳ

-- Outline 15
(80, 15, 1),  -- Giữa kỳ
(10, 15, 2),  -- Cuối kỳ
(5, 15, 3),   -- Bài tập lớn
(5, 15, 4),   -- Thực hành

-- Outline 16
(40, 16, 1),  -- Giữa kỳ
(30, 16, 2),  -- Cuối kỳ
(20, 16, 3),  -- Bài tập lớn
(10, 16, 4),  -- Thực hành

-- Outline 17
(50, 17, 1),  -- Giữa kỳ
(20, 17, 2),  -- Cuối kỳ
(30, 17, 3),  -- Bài tập lớn

-- Outline 18
(60, 18, 1),  -- Giữa kỳ
(40, 18, 2),  -- Cuối kỳ

-- Outline 19
(70, 19, 1),  -- Giữa kỳ
(30, 19, 2),  -- Cuối kỳ

-- Outline 20
(80, 20, 1),  -- Giữa kỳ
(10, 20, 2),  -- Cuối kỳ
(5, 20, 3),   -- Bài tập lớn
(5, 20, 4),   -- Thực hành

-- Outline 21
(40, 21, 1),  -- Giữa kỳ
(30, 21, 2),  -- Cuối kỳ
(20, 21, 3),  -- Bài tập lớn
(10, 21, 4),  -- Thực hành

-- Outline 22
(50, 22, 1),  -- Giữa kỳ
(20, 22, 2),  -- Cuối kỳ
(30, 22, 3),  -- Bài tập lớn

-- Outline 23
(60, 23, 1),  -- Giữa kỳ
(40, 23, 2),  -- Cuối kỳ

-- Outline 24
(70, 24, 1),  -- Giữa kỳ
(30, 24, 2),  -- Cuối kỳ

-- Outline 25
(80, 25, 1),  -- Giữa kỳ
(10, 25, 2),  -- Cuối kỳ
(5, 25, 3),   -- Bài tập lớn
(5, 25, 4),   -- Thực hành

-- Outline 26
(40, 26, 1),  -- Giữa kỳ
(30, 26, 2),  -- Cuối kỳ
(20, 26, 3),  -- Bài tập lớn
(10, 26, 4),  -- Thực hành

-- Outline 27
(50, 27, 1),  -- Giữa kỳ
(20, 27, 2),  -- Cuối kỳ
(30, 27, 3),  -- Bài tập lớn

-- Outline 28
(60, 28, 1),  -- Giữa kỳ
(40, 28, 2),  -- Cuối kỳ

-- Outline 29
(70, 29, 1),  -- Giữa kỳ
(30, 29, 2),  -- Cuối kỳ

-- Outline 30
(80, 30, 1),  -- Giữa kỳ
(10, 30, 2),  -- Cuối kỳ
(5, 30, 3),   -- Bài tập lớn
(5, 30, 4),   -- Thực hành

-- Outline 31
(40, 31, 1),  -- Giữa kỳ
(30, 31, 2),  -- Cuối kỳ
(20, 31, 3),  -- Bài tập lớn
(10, 31, 4),  -- Thực hành

-- Outline 32
(50, 32, 1),  -- Giữa kỳ
(20, 32, 2),  -- Cuối kỳ
(30, 32, 3),  -- Bài tập lớn

-- Outline 33
(60, 33, 1),  -- Giữa kỳ
(40, 33, 2),  -- Cuối kỳ

-- Outline 34
(70, 34, 1),  -- Giữa kỳ
(30, 34, 2),  -- Cuối kỳ

-- Outline 35
(80, 35, 1),  -- Giữa kỳ
(10, 35, 2),  -- Cuối kỳ
(5, 35, 3),   -- Bài tập lớn
(5, 35, 4),   -- Thực hành

-- Outline 36
(40, 36, 1),  -- Giữa kỳ
(30, 36, 2),  -- Cuối kỳ
(20, 36, 3),  -- Bài tập lớn
(10, 36, 4),  -- Thực hành

-- Outline 37
(50, 37, 1),  -- Giữa kỳ
(20, 37, 2),  -- Cuối kỳ
(30, 37, 3),  -- Bài tập lớn

-- Outline 38
(60, 38, 1),  -- Giữa kỳ
(40, 38, 2),  -- Cuối kỳ

-- Outline 39
(70, 39, 1),  -- Giữa kỳ
(30, 39, 2),  -- Cuối kỳ

-- Outline 40
(80, 40, 1),  -- Giữa kỳ
(10, 40, 2),  -- Cuối kỳ
(5, 40, 3),   -- Bài tập lớn
(5, 40, 4),   -- Thực hành

-- Outline 41
(40, 41, 1),  -- Giữa kỳ
(30, 41, 2),  -- Cuối kỳ
(20, 41, 3),  -- Bài tập lớn
(10, 41, 4),  -- Thực hành

-- Outline 42
(50, 42, 1),  -- Giữa kỳ
(20, 42, 2),  -- Cuối kỳ
(30, 42, 3),  -- Bài tập lớn

-- Outline 43
(60, 43, 1),  -- Giữa kỳ
(40, 43, 2),  -- Cuối kỳ

-- Outline 44
(70, 44, 1),  -- Giữa kỳ
(30, 44, 2),  -- Cuối kỳ

-- Outline 45
(80, 45, 1),  -- Giữa kỳ
(10, 45, 2),  -- Cuối kỳ
(5, 45, 3),   -- Bài tập lớn
(5, 45, 4),   -- Thực hành

-- Outline 46
(40, 46, 1),  -- Giữa kỳ
(30, 46, 2),  -- Cuối kỳ
(20, 46, 3),  -- Bài tập lớn
(10, 46, 4),  -- Thực hành

-- Outline 47
(50, 47, 1),  -- Giữa kỳ
(20, 47, 2),  -- Cuối kỳ
(30, 47, 3),  -- Bài tập lớn

-- Outline 48
(60, 48, 1),  -- Giữa kỳ
(40, 48, 2),  -- Cuối kỳ

-- Outline 49
(70, 49, 1),  -- Giữa kỳ
(30, 49, 2),  -- Cuối kỳ

-- Outline 50
(80, 50, 1),  -- Giữa kỳ
(10, 50, 2),  -- Cuối kỳ
(5, 50, 3),   -- Bài tập lớn
(5, 50, 4),   -- Thực hành

-- Outline 51
(40, 51, 1),  -- Giữa kỳ
(30, 51, 2),  -- Cuối kỳ
(20, 51, 3),  -- Bài tập lớn
(10, 51, 4),  -- Thực hành

-- Outline 52
(50, 52, 1),  -- Giữa kỳ
(20, 52, 2),  -- Cuối kỳ
(30, 52, 3),  -- Bài tập lớn

-- Outline 53
(60, 53, 1),  -- Giữa kỳ
(40, 53, 2),  -- Cuối kỳ

-- Outline 54
(70, 54, 1),  -- Giữa kỳ
(30, 54, 2),  -- Cuối kỳ

-- Outline 55
(80, 55, 1),  -- Giữa kỳ
(10, 55, 2),  -- Cuối kỳ
(5, 55, 3),   -- Bài tập lớn
(5, 55, 4),   -- Thực hành

-- Outline 56
(40, 56, 1),  -- Giữa kỳ
(30, 56, 2),  -- Cuối kỳ
(20, 56, 3),  -- Bài tập lớn
(10, 56, 4),  -- Thực hành

-- Outline 57
(50, 57, 1),  -- Giữa kỳ
(20, 57, 2),  -- Cuối kỳ
(30, 57, 3),  -- Bài tập lớn

-- Outline 58
(60, 58, 1),  -- Giữa kỳ
(40, 58, 2),  -- Cuối kỳ

-- Outline 59
(70, 59, 1),  -- Giữa kỳ
(30, 59, 2),  -- Cuối kỳ

-- Outline 60
(80, 60, 1),  -- Giữa kỳ
(10, 60, 2),  -- Cuối kỳ
(5, 60, 3),   -- Bài tập lớn
(5, 60, 4);   -- Thực hành

INSERT INTO student_outline_download (student_id, outline_id, downloaded_date) VALUES
(1, 1, '2024-01-02 10:00:00'),
(1, 2, '2024-01-02 11:00:00'),
(1, 3, '2024-01-02 12:00:00'),
(1, 4, '2024-01-02 13:00:00'),
(1, 5, '2024-01-02 14:00:00'),
(2, 4, '2024-01-03 10:00:00'),
(2, 6, '2024-01-03 10:30:00'),
(2, 7, '2024-01-03 11:00:00'),
(3, 6, '2024-01-04 09:00:00'),
(3, 8, '2024-01-04 09:30:00'),
(3, 9, '2024-01-04 10:00:00'),
(4, 10, '2024-01-05 11:00:00'),
(4, 11, '2024-01-05 11:30:00'),
(4, 12, '2024-01-05 12:00:00'),
(4, 13, '2024-01-05 12:30:00'),
(4, 14, '2024-01-05 13:00:00'),
(5, 15, '2024-01-06 14:00:00'),
(5, 16, '2024-01-06 14:30:00'),
(5, 17, '2024-01-06 15:00:00'),
(6, 21, '2024-01-07 17:30:00'),
(6, 22, '2024-01-07 18:00:00'),
(6, 23, '2024-01-07 18:30:00'),
(6, 24, '2024-01-07 19:00:00'),
(7, 25, '2024-01-08 20:00:00'),
(7, 27, '2024-01-08 21:00:00'),
(7, 28, '2024-01-08 21:30:00'),
(7, 29, '2024-01-08 22:00:00'),
(8, 30, '2024-01-09 23:00:00'),
(8, 31, '2024-01-09 23:30:00'),
(8, 32, '2024-01-10 00:00:00'),
(8, 33, '2024-01-10 00:30:00'),
(8, 34, '2024-01-10 01:00:00'),
(9, 38, '2024-01-11 03:30:00'),
(9, 39, '2024-01-11 04:00:00'),
(10, 40, '2024-01-12 05:00:00'),
(10, 41, '2024-01-12 05:30:00'),
(10, 42, '2024-01-12 06:00:00'),
(10, 43, '2024-01-12 06:30:00'),
(10, 44, '2024-01-12 07:00:00'),
(11, 49, '2024-01-13 10:00:00'),
(12, 50, '2024-01-14 11:00:00'),
(12, 51, '2024-01-14 11:30:00'),
(12, 52, '2024-01-14 12:00:00'),
(12, 53, '2024-01-14 12:30:00'),
(13, 58, '2024-01-15 15:30:00'),
(13, 59, '2024-01-15 16:00:00'),
(14, 60, '2024-01-16 17:00:00'),
(14, 1, '2024-01-16 17:30:00'),
(15, 5, '2024-01-17 20:00:00'),
(15, 6, '2024-01-17 20:30:00'),
(15, 7, '2024-01-17 21:00:00'),
(15, 8, '2024-01-17 21:30:00'),
(15, 9, '2024-01-17 22:00:00'),
(16, 10, '2024-01-18 23:00:00'),
(16, 11, '2024-01-18 23:30:00'),
(16, 12, '2024-01-19 00:00:00'),
(17, 15, '2024-01-20 02:00:00'),
(17, 16, '2024-01-20 02:30:00'),
(17, 17, '2024-01-20 03:00:00'),
(17, 18, '2024-01-20 03:30:00'),
(17, 19, '2024-01-20 04:00:00'),
(18, 20, '2024-01-21 05:00:00'),
(18, 21, '2024-01-21 05:30:00'),
(18, 22, '2024-01-21 06:00:00'),
(18, 23, '2024-01-21 06:30:00'),
(18, 24, '2024-01-21 07:00:00'),
(19, 25, '2024-01-22 08:00:00'),
(19, 29, '2024-01-22 10:00:00'),
(20, 30, '2024-01-23 11:00:00'),
(20, 31, '2024-01-23 11:30:00'),
(20, 32, '2024-01-23 12:00:00'),
(20, 33, '2024-01-23 12:30:00'),
(20, 34, '2024-01-23 13:00:00');