import {
	Alert,
	Avatar,
	Box,
	Button,
	CircularProgress,
	Container,
	CssBaseline,
	FormControl,
	FormControlLabel,
	FormLabel,
	Grid,
	Input,
	InputLabel,
	Paper,
	Radio,
	RadioGroup,
	TextField,
} from "@mui/material";
import { useCallback, useEffect, useRef, useState } from "react";
import APIs, { endpoints } from "../configs/APIs";
import ControlledOpenSelect from "../UI components/ControlledOpenSelect";
import { Form } from "react-bootstrap";
import { parse, format } from "date-fns";
import LinearBuffer from "../UI components/LinearBuffer";
import "animate.css";

const SignUp = () => {
	const [faculties, setFaculties] = useState([]);
	const [message, setMessage] = useState({
		success: false,
		error: false,
	});

	const [loading, setLoading] = useState(false);

	const [lecturer, setLecturer] = useState({ role: "ROLE_LECTURER" });
	const [preview, setPreview] = useState(null);
	const avatar = useRef();

	const loadFaculties = async () => {
		try {
			let url = `${endpoints["getFaculties"]}`;
			let res = await APIs.get(url);

			setFaculties(res.data);
		} catch (ex) {
			console.error(ex);
		}
	};

	useEffect(() => {
		loadFaculties();
	}, []);

	useEffect(() => {
		console.log(lecturer);
	});

	const handleFacultyChange = useCallback((value) => {
		setLecturer((prev) => {
			return { ...prev, facultyId: value };
		});
	});

	const register = (evt) => {
		evt.preventDefault();

		const process = async () => {
			setLoading(true);

			try {
				let form = new FormData();
				for (let field in lecturer) {
					form.append(field, lecturer[field]);
				}

				form.set(
					"birthday",
					format(form.get("birthday"), "yyyy/MM/dd"),
				);

				form.append("files", avatar.current.files[0]);

				let res = await APIs.post(endpoints["lecturer-register"], form);
				if (res.status === 201) {
					setMessage((prev) => {
						return { error: false, success: true };
					});
				} else {
					setMessage((prev) => {
						return { success: false, error: true };
					});
				}
			} catch (err) {
				setMessage((prev) => {
					return { success: false, error: true };
				});
				console.error(err);
			} finally {
				setLoading(false);
				setTimeout(() => {
					setMessage({
						success: false,
						error: false,
					});
				}, 5000);
			}
		};

		process();
	};

	return (
		<>
			{loading && <LinearBuffer />}
			<div
				className="d-flex justify-content-center align-items-center full-height mt-5"
				style={{ flexDirection: "column" }}
			>
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
						severity="info"
					>
						Đăng ký thành công, tài khoản của bạn sẽ được phê duyệt
						bởi quản trị viên!
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
						Đăng ký thất bại, hãy đảm bảo các thông tin bạn nhập là
						chính xác!
					</Alert>
				)}
			</div>

			<Container
				sx={{
					marginBottom: "15rem",
				}}
				component="main"
				maxWidth="md"
			>
				<CssBaseline />
				<Box
					sx={{
						marginTop: 2,
						display: "flex",
						flexDirection: "column",
						alignItems: "center",
					}}
				>
					<Box
						component="form"
						noValidate
						onSubmit={register}
						sx={{
							mt: 3,
							display: "flex",
							justifyContent: "space-between",
						}}
					>
						<Grid container spacing={4}>
							<Grid item xs={11}>
								<TextField
									variant="standard"
									fullWidth
									required
									id="name"
									label="Họ và tên"
									autoFocus
									value={lecturer.name || ""}
									onChange={(e) =>
										setLecturer((prev) => {
											return {
												...prev,
												name: e.target.value,
											};
										})
									}
								/>
							</Grid>
							<Grid item xs={11} sm={5}>
								<InputLabel htmlFor="birthday">
									Ngày sinh
								</InputLabel>
								<TextField
									required
									variant="standard"
									fullWidth
									autoFocus
									id="birthday"
									type="date"
									value={lecturer.birthday || ""}
									onChange={(e) =>
										setLecturer((prev) => {
											return {
												...prev,
												birthday: e.target.value,
											};
										})
									}
								/>
							</Grid>
							<Grid
								sx={{
									marginLeft: 4.2,
								}}
								item
								xs={11}
								sm={5}
							>
								<FormControl>
									<FormLabel id="demo-controlled-radio-buttons-group">
										Giới tính
									</FormLabel>
									<RadioGroup
										sx={{
											display: "flex",
											flexDirection: "row",
										}}
										aria-labelledby="demo-controlled-radio-buttons-group"
										name="sex"
										value={lecturer.sex || ""}
										onChange={(e) =>
											setLecturer((prev) => {
												return {
													...prev,
													sex: e.target.value,
												};
											})
										}
									>
										<FormControlLabel
											value="True"
											control={<Radio />}
											label="Nam"
										/>
										<FormControlLabel
											value="False"
											control={<Radio />}
											label="Nữ"
										/>
									</RadioGroup>
								</FormControl>
							</Grid>
							<Grid item xs={11}>
								<TextField
									variant="standard"
									required
									fullWidth
									id="email"
									label="Email"
									type="email"
									value={lecturer.email || ""}
									onChange={(e) =>
										setLecturer((prev) => {
											return {
												...prev,
												email: e.target.value,
											};
										})
									}
								/>
							</Grid>
							<Grid item xs={11}>
								<ControlledOpenSelect
									label={"Khoa"}
									onChociceChange={handleFacultyChange}
									names={faculties}
								/>
							</Grid>
						</Grid>
						<Grid container spacing={2}>
							<Grid item xs={11}>
								<TextField
									variant="standard"
									required
									fullWidth
									id="hotline"
									type="number"
									label="Số điện thoại"
									value={lecturer.hotline || ""}
									onChange={(e) =>
										setLecturer((prev) => {
											return {
												...prev,
												hotline: e.target.value,
											};
										})
									}
								/>
							</Grid>
							<Grid item xs={11}>
								<TextField
									variant="standard"
									required
									fullWidth
									id="username"
									label="Username"
									value={lecturer.username || ""}
									onChange={(e) =>
										setLecturer((prev) => {
											return {
												...prev,
												username: e.target.value,
											};
										})
									}
								/>
							</Grid>
							<Grid item xs={11}>
								<TextField
									sx={{
										marginTop: 2.5,
									}}
									variant="standard"
									required
									fullWidth
									id="password"
									label="Password"
									type="password"
									value={lecturer.password || ""}
									onChange={(e) =>
										setLecturer((prev) => {
											return {
												...prev,
												password: e.target.value,
											};
										})
									}
								/>
							</Grid>
							<Grid item xs={11}>
								<Button
									type="submit"
									variant="contained"
									sx={{
										marginLeft: 37,
									}}
									disabled={loading}
								>
									Sign Up
								</Button>
							</Grid>
						</Grid>
					</Box>
				</Box>
			</Container>
		</>
	);
};

export default SignUp;
