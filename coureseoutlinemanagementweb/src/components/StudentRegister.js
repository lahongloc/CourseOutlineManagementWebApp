import * as React from "react";
import Box from "@mui/material/Box";
import TextField from "@mui/material/TextField";
import { pink } from "@mui/material/colors";
import Radio from "@mui/material/Radio";
import { blue } from "@mui/material/colors";
import Stack from "@mui/material/Stack";
import Button from "@mui/material/Button";
import "@fontsource/roboto/300.css";
import "@fontsource/roboto/400.css";
import "@fontsource/roboto/500.css";
import "@fontsource/roboto/700.css";

import { useContext, useState } from "react";
import { AcademicYearContext, GradeContext, MajorContext } from "../App";
import { useEffect } from "react";
import {
	Alert,
	Autocomplete,
	Divider,
	FormControl,
	FormControlLabel,
	FormLabel,
	RadioGroup,
	Typography,
} from "@mui/material";
import { useCallback } from "react";
import { format } from "date-fns";
import APIs, { endpoints } from "../configs/APIs";
import LinearBuffer from "../UI components/LinearBuffer";

const StudentRegister = () => {
	const major = useContext(MajorContext);
	const grade = useContext(GradeContext);
	const academicYear = useContext(AcademicYearContext);

	// useEffect(() => {
	//     console.log("academicYear: ", academicYear)
	//     console.log("major: ", major)
	//     console.log("grade: ", grade)
	// })

	const [student, setStudent] = useState({ role: "ROLE_STUDENT", sex: true });
	const [loading, setLoading] = useState(false);
	const [message, setMessage] = useState({
		success: false,
		error: false,
	});

	const [selectedValue, setSelectedValue] = React.useState("a");

	const handleChange = (event) => {
		setSelectedValue(event.target.value);
	};

	const handleMajorChange = useCallback((event, value) => {
		setStudent((prev) => {
			return { ...prev, majorId: value ? value.id : null };
		});
	});

	const handleGradeChange = useCallback((event, value) => {
		setStudent((prev) => {
			return { ...prev, gradeId: value ? value.id : null };
		});
	});

	const handleAcademicYearChange = useCallback((event, value) => {
		setStudent((prev) => {
			return { ...prev, academicYearId: value ? value.id : null };
		});
	});

	const controlProps = (item) => ({
		checked: selectedValue === item,
		onChange: handleChange,
		value: item,
		name: "color-radio-button-demo",
		inputProps: { "aria-label": item },
	});

	const studentRegister = (event) => {
		event.preventDefault();

		const process = async () => {
			setLoading(true);
			try {
				let form = new FormData();

				for (let field in student) {
					form.append(field, student[field]);
				}

				form.set(
					"birthday",
					format(form.get("birthday"), "yyyy/MM/dd"),
				);

				let res = await APIs.post(endpoints["student-register"], form);

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
			}
		};

		process();
	};

	useEffect(() => {
		console.log(student);
	});

	return (
		<>
			{loading && <LinearBuffer />}
			{message.success && (
				<Alert
					className="animate__animated animate__tada"
					sx={{ marginTop: 5 }}
					severity="success"
				>
					Đăng ký thành công, tài khoản của bạn sẽ được phê duyệt bởi
					quản trị viên!
				</Alert>
			)}
			{message.error && (
				<Alert
					className="animate__animated animate__wobble"
					sx={{ marginTop: 5 }}
					severity="error"
				>
					Đăng ký thất bại, hãy đảm bảo các thông tin bạn nhập là
					chính xác!
				</Alert>
			)}
			<Typography variant="h4" sx={{ textAlign: "center", mt: 4, mb: 4 }}>
				GỬI YÊU CẦU CẤP TÀI KHOẢN DÀNH CHO{" "}
				<p>
					<b style={{ color: blue[500] }}>SINH VIÊN</b>
				</p>
			</Typography>
			<Box
				onSubmit={studentRegister}
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
					gap: 2,
					backgroundColor: "#f9f9f9",
				}}
			>
				<Box
					sx={{
						display: "grid",
						gridTemplateColumns: "1fr 1fr",
						gap: 2,
						width: "100%",
					}}
				>
					<TextField
						fullWidth
						helperText="Nhập đầy đủ họ và tên"
						label="Họ và tên"
						value={student.name}
						onChange={(e) =>
							setStudent((prev) => ({
								...prev,
								name: e.target.value,
							}))
						}
						sx={{
							backgroundColor: "#ffffff",
							borderBottomLeftRadius: "8px",
							borderBottomRightRadius: "8px",
						}}
					/>
					<TextField
						fullWidth
						helperText="Nhập username"
						label="Username"
						value={student.username}
						onChange={(e) =>
							setStudent((prev) => ({
								...prev,
								username: e.target.value,
							}))
						}
						sx={{ backgroundColor: "#ffffff",borderBottomLeftRadius: "8px",
                        borderBottomRightRadius: "8px", }}
					/>
					<TextField
						fullWidth
						helperText="Nhập mã số sinh viên"
						label="Mã số sinh viên"
						value={student.studentCode}
						onChange={(e) =>
							setStudent((prev) => ({
								...prev,
								studentCode: e.target.value,
							}))
						}
						sx={{ backgroundColor: "#ffffff",borderBottomLeftRadius: "8px",
                        borderBottomRightRadius: "8px", }}
					/>
					<TextField
						fullWidth
						helperText="Nhập địa chỉ email"
						label="Địa chỉ Email Sinh Viên"
						value={student.email}
						onChange={(e) =>
							setStudent((prev) => ({
								...prev,
								email: e.target.value,
							}))
						}
						sx={{ backgroundColor: "#ffffff",borderBottomLeftRadius: "8px",
                        borderBottomRightRadius: "8px", }}
					/>
					<TextField
						fullWidth
						helperText="Nhập số điện thoại cá nhân"
						label="Số điện thoại"
						value={student.hotline}
						onChange={(e) =>
							setStudent((prev) => ({
								...prev,
								hotline: e.target.value,
							}))
						}
						sx={{ backgroundColor: "#ffffff",borderBottomLeftRadius: "8px",
                        borderBottomRightRadius: "8px", }}
					/>
					<TextField
						fullWidth
						helperText="Nhập sinh nhật: Tháng/Ngày/Năm"
						type="date"
						value={student.birthday}
						onChange={(e) =>
							setStudent((prev) => ({
								...prev,
								birthday: e.target.value,
							}))
						}
						sx={{ backgroundColor: "#ffffff",borderBottomLeftRadius: "8px",
                        borderBottomRightRadius: "8px", }}
					/>
					<Autocomplete
						disablePortal
						id="major-box-demo"
						options={major}
						getOptionLabel={(option) => option.name}
						onChange={handleMajorChange}
						sx={{ width: "100%" }}
						renderInput={(params) => (
							<TextField {...params} label="Ngành" />
						)}
					/>
					<Autocomplete
						disablePortal
						id="grade-box-demo"
						options={grade}
						getOptionLabel={(option) => option.name}
						onChange={handleGradeChange}
						sx={{ width: "100%" }}
						renderInput={(params) => (
							<TextField {...params} label="Lớp" />
						)}
					/>
					<Autocomplete
						disablePortal
						id="academicYear-box-demo"
						options={academicYear}
						getOptionLabel={(option) => option.name}
						onChange={handleAcademicYearChange}
						sx={{ width: "100%" }}
						renderInput={(params) => (
							<TextField {...params} label="Niên khóa" />
						)}
					/>
					<Stack direction="row" spacing={2} alignItems="center">
						<FormControl component="fieldset" fullWidth>
							<FormLabel component="legend">Giới tính</FormLabel>
							<RadioGroup
								row
								aria-label="sex"
								name="row-radio-buttons-group"
								value={student.sex ? "a" : "e"}
								onChange={(e) => {
									const isMale = e.target.value === "a";
									setStudent((prev) => ({
										...prev,
										sex: isMale,
									}));
								}}
							>
								<FormControlLabel
									value="a"
									control={<Radio {...controlProps("a")} />}
									label="Nam"
								/>
								<FormControlLabel
									value="e"
									control={<Radio {...controlProps("e")} />}
									label="Nữ"
									sx={{
										color: pink[800],
										"& .Mui-checked": {
											color: pink[600],
										},
									}}
								/>
							</RadioGroup>
						</FormControl>
						<Button
							type="submit"
							variant="contained"
							sx={{
								mt: 3,
								bgcolor: blue[520], // Màu chủ đạo xanh dương
								"&:hover": {
									bgcolor: pink[700], // Màu nền khi di chuột qua
								},
								width: "180px",
								height: "45px",
							}}
							disabled={loading}
						>
							Gửi yêu cầu
						</Button>
					</Stack>
				</Box>
			</Box>
		</>
	);
};

export default StudentRegister;
