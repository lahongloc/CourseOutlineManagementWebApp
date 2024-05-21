import {
	Avatar,
	Box,
	Button,
	Container,
	CssBaseline,
	FormControl,
	FormControlLabel,
	FormLabel,
	Grid,
	Input,
	InputLabel,
	Radio,
	RadioGroup,
	TextField,
} from "@mui/material";
import { useCallback, useEffect, useRef, useState } from "react";
import APIs, { endpoints } from "../configs/APIs";
import ControlledOpenSelect from "../UI components/ControlledOpenSelect";
import { Form } from "react-bootstrap";

const SignUp = () => {
	const [value, setValue] = useState("female");
	const [faculties, setFaculties] = useState([]);

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

	const handleFacultyChange = useCallback((value) => {
		setLecturer((prev) => {
			return { ...prev, facultyId: value };
		});
	});

	const register = (evt) => {
		evt.preventDefault();
		const process = async () => {
			let form = new FormData();
			for (let field in lecturer) {
				form.append(field, lecturer[field]);
			}

			form.append("files", avatar.current.files[0]);

			try {
				let res = await APIs.post(endpoints["register"], form);
				console.log(res.data);
			} catch (err) {
				console.error(err);
			}
		};

		process();
	};

	return (
		<>
			<Container component="main" maxWidth="xs">
				<CssBaseline />
				<Box
					sx={{
						marginTop: 8,
						display: "flex",
						flexDirection: "column",
						alignItems: "center",
					}}
				>
					<Box
						component="form"
						noValidate
						// onSubmit={handleSubmit}
						sx={{ mt: 3 }}
					>
						<Grid container spacing={2}>
							<Grid
								sx={{
									display: "flex",
									alignItems: "center",
								}}
								item
								xs={12}
							>
								<Avatar
									alt="Remy Sharp"
									src={preview || ""}
									sx={{
										mb: 3,
										width: 70,
										height: 70,
									}}
								/>
							</Grid>
							<Grid item xs={12}>
								<Form.Group className="mb-3">
									<Form.Label>Ảnh đại diện</Form.Label>
									<Form.Control
										onChange={(e) => {
											const selectedFile =
												e.target.files[0];
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
							</Grid>
							<Grid item xs={12}>
								<TextField
									required
									fullWidth
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
							<Grid item xs={12} sm={6}>
								<InputLabel htmlFor="component-simple">
									Ngày sinh
								</InputLabel>
								<Input
									fullWidth
									autoFocus
									id="component-simple"
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
								xs={12}
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
							<Grid item xs={12}>
								<TextField
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
							<Grid item xs={12}>
								<TextField
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
							<Grid item xs={12}>
								<TextField
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
							<Grid item xs={12}>
								<TextField
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
							{/* <Grid item xs={12}>
								<ControlledOpenSelect
									onChociceChange={handleFacultyChange}
									label={"Khoa"}
									names={faculties}
								/>
							</Grid> */}
						</Grid>

						<Button
							onClick={register}
							type="submit"
							fullWidth
							variant="contained"
							sx={{ mt: 3, mb: 2 }}
						>
							Sign Up
						</Button>
					</Box>
				</Box>
			</Container>
		</>
	);
};

export default SignUp;
