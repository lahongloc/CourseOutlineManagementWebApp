import {
	Avatar,
	Button,
	Container,
	Grid,
	InputLabel,
	TextField,
} from "@mui/material";
import { useCallback, useContext, useEffect, useRef, useState } from "react";
import { FacultyContext, UserContext } from "../App";
import { PANO } from "../static/images/pano";
import AvatarCustom from "../UI components/BadgeAvatars";
import BadgeAvatars from "../UI components/BadgeAvatars";
import { format } from "date-fns";
import ControlledOpenSelect from "../UI components/ControlledOpenSelect";
import APIs, { endpoints } from "../configs/APIs";
import cookie from "react-cookies";
import MyNativeSelect from "../UI components/MyNativeSelect";

const AccountDetails = () => {
	const [user, dispatch] = useContext(UserContext);
	const faculties = useContext(FacultyContext);
	const [currentFaculty, setCurrentFaculty] = useState(null);
	const [isDisabled, setIsDisabled] = useState(true);
	const avt = useRef();

	const [userInfo, setUserInfo] = useState({
		username: user.username,
		name: user.name,
		birthday: format(user.birthday, "yyyy-MM-dd"),
		sex: user.sex ? "Nam" : "Nữ",
		role: user.role === "ROLE_STUDENT" ? "Sinh viên" : "Giảng viên",
		email: user.email,
		hotline: user.hotline,
		avatar: user.avatar,
	});

	const fields = [
		"Tên đăng nhập",
		"Họ và tên",
		"Ngày sinh",
		"Giới tính",
		"Chức vụ",
		"Email",
		"Số điện thoại",
	];

	const handleFieldChange = (e, field) => {
		setUserInfo((prev) => {
			return { ...prev, [field]: e.target.value };
		});
	};

	const handleFacultyChange = useCallback((value) => {
		setUserInfo((prev) => {
			return { ...prev, facultyId: value };
		});
	});

	const loadLecturer = async () => {
		try {
			let url = `${endpoints["getLecturers"]}?userId=${user.id}`;
			let res = await APIs.get(url);
			setCurrentFaculty(res.data[0].facultyId);
		} catch (err) {
			console.error(err);
		}
	};

	useEffect(() => {
		loadLecturer();
	}, []);

	useEffect(() => {
		console.log("curr: ", currentFaculty);
	});

	return (
		<>
			<Container sx={{ marginBottom: 15, marginTop: 10 }}>
				<Grid sx={{ flexGrow: 1 }} container spacing={2}>
					<Grid item xs={12}>
						<Grid
							sx={{
								boxShadow:
									"rgba(100, 100, 111, 0.2) 0px 7px 29px 0px",
								height: 500,
								borderRadius: "16px",
								overflow: "hidden",
								padding: 3,
							}}
							container
							// justifyContent="center"
							spacing={0}
						>
							<Grid
								justifyContent="center"
								sx={{
									width: "70%",
									display: "flex",
									flexWrap: "wrap",
									alignItems: "center",
									justifyContent: "space-between",
									padding: 2,
								}}
							>
								{Object.keys(userInfo).map((field, index) => {
									if (
										field === "facultyId" ||
										field === "avatar"
									) {
										return <></>;
									}
									return (
										<Grid key={index} item xs={12} sm={6}>
											<InputLabel htmlFor={field}>
												{fields[index]}
											</InputLabel>
											<TextField
												type={
													field === "birthday"
														? "date"
														: "text"
												}
												id={field}
												variant="standard"
												value={userInfo[field]}
												onChange={(e) =>
													handleFieldChange(e, field)
												}
												disabled={isDisabled}
											/>
										</Grid>
									);
								})}
								<Grid item xs={12} sm={6}>
									{/* <ControlledOpenSelect
										fieldSelected={currentFaculty}
										label={"Khoa"}
										onChociceChange={handleFacultyChange}
										names={faculties}
									/> */}
									<MyNativeSelect
										disabled={isDisabled}
										fieldSelected={currentFaculty}
										names={faculties}
										onChociceChange={handleFacultyChange}
										label={"Khoa"}
									/>
								</Grid>
							</Grid>
							<Grid
								sx={{
									width: "30%",
									display: "flex",
									padding: 5,
									flexDirection: "column",
									alignItems: "center",
									// justifyContent: "flex-start",
								}}
							>
								<Avatar
									onClick={() => avt.current.click()}
									sx={{
										cursor: "pointer",
										width: 230,
										height: 230,
										marginTop: 5,
										boxShadow:
											"rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px",
									}}
									alt="Remy Sharp"
									src={userInfo.avatar}
								/>
								<input
									disabled={isDisabled}
									type="file"
									ref={avt}
									style={{ display: "none" }}
									onChange={(e) => {
										const selectedFile = e.target.files[0];
										const reader = new FileReader();
										reader.onloadend = () => {
											setUserInfo((prev) => {
												return {
													...prev,
													avatar: reader.result,
												};
											});
										};
										reader.readAsDataURL(selectedFile);
									}}
								/>
								<Grid sx={{ marginTop: 5 }} item>
									<Button
										onClick={() => setIsDisabled(false)}
										sx={{ marginRight: 2 }}
										variant="outlined"
									>
										Sửa
									</Button>
									<Button
										onClick={() => setIsDisabled(true)}
										variant="contained"
									>
										Cập nhật
									</Button>
								</Grid>
							</Grid>
						</Grid>
					</Grid>
				</Grid>{" "}
			</Container>
		</>
	);
};

export default AccountDetails;
