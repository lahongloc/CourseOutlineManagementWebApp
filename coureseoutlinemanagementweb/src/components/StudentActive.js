import { useEffect } from "react";
import { useRef } from "react";
import { useState } from "react";
import LinearBuffer from "../UI components/LinearBuffer";
import {
	Alert,
	Avatar,
	Box,
	Button,
	TextField,
	Typography,
} from "@mui/material";
import { blue, pink } from "@mui/material/colors";
import { Form } from "react-bootstrap";
import APIs, { endpoints } from "../configs/APIs";

const StudentActive = () => {
	const [studentActive, setStudentActive] = useState({
		role: "ROLE_STUDENT",
	});
	const avatar = useRef();
	const [loading, setLoading] = useState(false);
	const [preview, setPreview] = useState(null);
	const [message, setMessage] = useState({
		success: false,
		error: false,
	});

	useEffect(() => {
		console.log(studentActive);
	});

	const active = (evt) => {
		evt.preventDefault();

		const process = async () => {
			setLoading(true);
			try {
				let form = new FormData();
				for (let field in studentActive) {
					form.append(field, studentActive[field]);
				}

				form.append("files", avatar.current.files[0] || "");

				let res = await APIs.post(endpoints["student-active"], form, {
					headers: {
						"Content-Type": "multipart/form-data",
					},
				});
				if (res.status === 204) {
					setMessage((prev) => {
						return { error: false, success: true };
					});
				} else {
					setMessage((prev) => {
						return { success: false, error: true };
					});
				}
			} catch (ex) {
				setMessage((prev) => {
					return { success: false, error: true };
				});
				console.error(ex);
			} finally {
				setLoading(false);
			}
		};

		process();
	};

	return (
		<>
			{loading && <LinearBuffer />}
			{/* <Typography variant="h4" sx={{ textAlign: "center" }}>
				KÍCH HOẠT TÀI KHOẢN
				<b style={{ color: blue[500] }}>SINH VIÊN</b>
			</Typography> */}
			<Box
				onSubmit={active}
				component="form"
				sx={{
					display: "flex",
					flexDirection: "column",
					alignItems: "center",
					border: "1px solid #ccc",
					borderRadius: "8px",
					padding: "16px",
					marginBottom: "120px",
					maxWidth: "800px",
					margin: "0 auto",
					mt: 4,
					mb: 4,
					gap: 2,
					backgroundColor: "#f9f9f9",
				}}
			>
				<div
					className="d-flex justify-content-center align-items-center full-height mt-5"
					style={{ flexDirection: "column" }}
				>
					<Typography
						variant="h4"
						sx={{ textAlign: "center", mb: 4 }}
					>
						KÍCH HOẠT TÀI KHOẢN
						<b style={{ color: blue[500] }}> SINH VIÊN</b>
						<br />
						YÊU CẦU CẬP NHẬT{" "}
						<b style={{ color: blue[500] }}>
							AVATAR VÀ MẬT KHẨU
						</b>{" "}
					</Typography>
					<Avatar
						onClick={() => avatar.current.click()}
						alt="Remy Sharp"
						src={preview || ""}
						sx={{
							mb: 2,
							width: 100,
							height: 100,
							cursor: "pointer",
						}}
					/>

					<Form.Group
						style={{ width: "10rem", display: "none" }}
						className="mt-3"
					>
						<Form.Control
							onChange={(e) => {
								const selectedFile = e.target.files[0];
								const reader = new FileReader();
								reader.onloadend = () => {
									setPreview(reader.result);
								};
								reader.readAsDataURL(selectedFile);
							}}
							type="file"
							ref={avatar}
						/>
					</Form.Group>
					{message.success && (
						<Alert
							className="animate__animated animate__tada"
							sx={{
								marginTop: 5,
							}}
							severity="success"
						>
							Kích hoạt thành công, mời
							<b style={{ color: blue[500] }}> sinh viên</b> đăng
							nhập tài khoản vào hệ thống để trải nghiệm!
						</Alert>
					)}
					{message.error && (
						<Alert
							className="animate__animated animate__wobble"
							sx={{
								marginTop: 5,
							}}
							severity="error"
						>
							Kích hoạt tài khoản thất bại, sinh viên kiểm tra
							thật kỹ thông tin{" "}
							<b style={{ color: blue[500] }}>
								Ảnh đại diện, Username, Password!
							</b>{" "}
						</Alert>
					)}
				</div>
				<TextField
					fullWidth
					helperText="Nhập username sinh viên"
					label="Username"
					value={studentActive.username}
					onChange={(e) =>
						setStudentActive((prev) => ({
							...prev,
							username: e.target.value,
						}))
					}
					sx={{
						backgroundColor: "#ffffff",
						borderBottomLeftRadius: "8px",
						borderBottomRightRadius: "8px",
						borderTopLeftRadius: "4px",
						borderTopRightRadius: "4px",
					}}
				/>
				<TextField
					fullWidth
					helperText="Nhập mật khẩu"
					label="Mật khẩu"
					value={studentActive.studentCode}
					onChange={(e) =>
						setStudentActive((prev) => ({
							...prev,
							password: e.target.value,
						}))
					}
					sx={{
						backgroundColor: "#ffffff",
						borderBottomLeftRadius: "8px",
						borderBottomRightRadius: "8px",
						borderTopLeftRadius: "4px",
						borderTopRightRadius: "4px",
					}}
				/>
				<Button
					type="submit"
					variant="contained"
					sx={{
						mt: 3,
						bgcolor: blue[520], // Màu chủ đạo xanh dương
						"&:hover": {
							bgcolor: pink[700], // Màu nền khi di chuột qua
						},
						width: "160px",
						height: "40px",
					}}
					disabled={loading}
				>
					Kích hoạt
				</Button>
			</Box>
		</>
	);
};

export default StudentActive;
