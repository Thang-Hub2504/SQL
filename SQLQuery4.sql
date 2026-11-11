USE QL_DIEM;
GO

-- 1. Thêm cột GioiTinh nếu chưa có
IF COL_LENGTH('HOCVIEN', 'GioiTinh') IS NULL
    ALTER TABLE HOCVIEN ADD GioiTinh NVARCHAR(3);
GO

-- 2. Xóa dữ liệu cũ (bảng con trước, bảng cha sau)
DELETE FROM KETQUA;
DELETE FROM HOCVIEN;
DELETE FROM MON;
DELETE FROM LOP;
GO

-- 3. Nhập dữ liệu (bảng cha trước, bảng con sau)
INSERT INTO LOP (MaLop, TenLop) VALUES
('L01', N'Công nghệ thông tin A'),
('L02', N'Công nghệ thông tin B');

INSERT INTO MON (MaMon, TenMon, STC) VALUES
('M01', N'Cơ sở dữ liệu', 3),
('M02', N'Lập trình căn bản', 4),
('M03', N'Mạng máy tính', 3);

INSERT INTO HOCVIEN (MaHV, TenHV, DienThoai, MaLop, GioiTinh) VALUES
(1, N'Nguyễn Hoàng Thắng', '0901111111', 'L01', N'Nam'),
(2, N'Nguyễn Hoàng Khá',   '0902222222', 'L01', N'Nữ'),
(3, N'Nguyễn Tuấn Tú',     '0903333333', 'L02', N'Nam'),
(4, N'Nguyễn Bá Đạt',      '0904444444', 'L01', N'Nam'),
(5, N'Nguyễn Minh Đạt',    '0905555555', 'L01', N'Nam'),
(6, N'Lê Đặng Trọng',      '0906666666', 'L02', N'Nam'),
(7, N'Bùi Quang Tâm',      '0907777777', 'L02', N'Nam');

INSERT INTO KETQUA (MaHV, MaMon, LanThi, Diem) VALUES
(1, 'M01', 1, 8.5),
(1, 'M02', 1, 7.0),
(2, 'M01', 1, 4.0),
(2, 'M01', 2, 6.5),
(3, 'M03', 1, 9.0),
(4, 'M01', 1, 7.5),
(5, 'M02', 1, 6.0),
(6, 'M03', 1, 8.0),
(7, 'M01', 1, 5.5);
GO

-- 4. Kiểm tra
SELECT * FROM HOCVIEN;
GO