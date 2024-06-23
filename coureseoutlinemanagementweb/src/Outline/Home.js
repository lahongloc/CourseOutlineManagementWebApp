import { useCallback, useContext, useEffect, useRef, useState } from "react";
import APIs, { endpoints } from "../configs/APIs";
import { Badge, Card, Container, Row, Col, ListGroup } from "react-bootstrap";
import PaginationControlled from "../UI components/PaginationControlled";
import LinearBuffer from "../UI components/LinearBuffer";
import {
	Autocomplete,
	Button,
	Chip,
	Link,
	Stack,
	SvgIcon,
	TextField,
	Typography,
} from "@mui/material";
import { blue } from "@mui/material/colors";
import {
	AcademicYearContext,
	FacultyContext,
	LecturerContext,
	SubjectsContext,
} from "../App";
import { Navigate, useNavigate } from "react-router-dom";
import styled from "styled-components";
import ChatIcon from "@mui/icons-material/Chat";
import { faFileArrowDown } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import AlertDialog from "../UI components/AlertDialog";
import { UserContext } from "../App";
import { isStudent } from "../UserAuthorization/UserAuthoriation";

const Home = ({ selectedItem }) => {
	const [user, dispatch] = useContext(UserContext);
	const [outlines, setOutlines] = useState([]);
	const [outlineFilters, setOutlineFilters] = useState({});
	const [page, setPage] = useState(null);
	const [loading, setLoading] = useState(false);
	const [urls, setUrls] = useState([]);
	let pageSize = useRef();

	const lecturers = useContext(LecturerContext);
	const academicYears = useContext(AcademicYearContext);
	const subjects = useContext(SubjectsContext);
	const faculties = useContext(FacultyContext);
	const [theoCreditHourRange, setTheoCreditHourRange] = useState([]);
	const [pracCreditHourRange, setPracCreditHourRange] = useState([]);

	const handleLoadDocumentUrls = async () => {};

	const buildQueryParams = (params) => {
		return Object.keys(params)
			.filter((key) => params[key] != null)
			.map(
				(key) =>
					`${encodeURIComponent(key)}=${encodeURIComponent(
						params[key],
					)}`,
			)
			.join("&");
	};

	const loadOutlines = async () => {
		setLoading(true);
		try {
			let params = {
				...outlineFilters,
			};

			if (page) params.page = page;
			params.outlineStatus = "ACCEPTED";

			let queryString = buildQueryParams(params);
			let url = `${endpoints["getOutlines"]}?${queryString}`;
			console.log("QueryString: ", `${queryString}`);
			let res = await APIs.get(url);

			let docUrl = `${endpoints["getDownloadedOutlineDocument"]}${user.id}/`;
			let docRes = await APIs.get(docUrl);

			if (docRes.data) {
				const mergedOutlines = res.data.map((o) => {
					const matchedOutline = docRes.data.find(
						(dr) => dr.outlineId === o.outlineId,
					);

					return matchedOutline
						? { ...o, url: matchedOutline.url }
						: o;
				});
				setOutlines(mergedOutlines);
			} else setOutlines(res.data);

			if (page === null) {
				pageSize.current = Math.ceil(res.data.length / 9);
				setPage(1);
			}
		} catch (ex) {
			console.error(ex);
		} finally {
			setLoading(false);
		}
	};

	useEffect(() => {
		loadOutlines();
	}, [page]);

	useEffect(() => {
		setPage(null);
	}, [outlineFilters]);

	useEffect(() => {
		handleSelectedItemChange(selectedItem);
	}, [selectedItem]);

	useEffect(() => {
		if (subjects.length > 0) {
			console.log("jnjnjnjn ", subjects);
			const uniqueTheoCreditHours = new Set(
				subjects.map((s) => (s.outline ? s.outline.theoCreditHour : 0)),
			);
			const uniquePracCreditHours = new Set(
				subjects.map((s) => (s.outline ? s.outline.pracCreditHour : 0)),
			);

			const sortedTheoCreditHours = Array.from(
				uniqueTheoCreditHours,
			).sort((a, b) => a - b);
			const sortedPracCreditHours = Array.from(
				uniquePracCreditHours,
			).sort((a, b) => a - b);

			setTheoCreditHourRange(
				sortedTheoCreditHours.map((hour) => String(hour)),
			);
			setPracCreditHourRange(
				sortedPracCreditHours.map((hour) => String(hour)),
			);
		}
	}, [subjects]);

	const handleSetPage = useCallback((e, value) => {
		setPage(value);
	});

	const handleSelectedItemChange = useCallback((item) => {
		setOutlineFilters((prev) => {
			let newFilters = { ...prev };

			if (item) {
				if (item.category === "Đề cương theo khoa") {
					newFilters.facultyId = item.item.id;
				} else if (item.category === "Các môn học") {
					newFilters.subjectId = item.item.id;
				} else if (item.category === "Hai khóa liên tiếp") {
					newFilters.academicYearRange = item.item.name;
				}
			}

			return newFilters;
		});
	}, []);

	const handleLecturerChange = useCallback((event, value) => {
		setOutlineFilters((prev) => {
			return { ...prev, lecturerId: value ? value.id : null };
		});
	});

	const handleAcademicYearChange = useCallback((event, value) => {
		setOutlineFilters((prev) => {
			return { ...prev, academicYearId: value ? value.id : null };
		});
	});

	const handleSubjectChange = useCallback((event, value) => {
		setOutlineFilters((prev) => {
			return { ...prev, subjectId: value ? value.id : null };
		});
	});

	const handleTheoCreditHourChange = useCallback((event, value) => {
		setOutlineFilters((prev) => {
			return { ...prev, theoCreditHour: value };
		});
	});

	const handlePracCreditHourChange = useCallback((event, value) => {
		setOutlineFilters((prev) => {
			return { ...prev, pracCreditHour: value };
		});
	});

	const handleFilterDelete = useCallback((key) => {
		setOutlineFilters((prev) => {
			let newFilters = { ...prev };
			newFilters[key] = null;
			return newFilters;
		});
	}, []);

	const nav = useNavigate();
	const toChat = (event) => {
		event.preventDefault();
		nav("/chat-real-time");
	};

	const CustomButton = styled(Button)({
		backgroundColor: "#2196f3",
		color: "white",
		boxShadow: "0 4px 8px rgba(33, 150, 243, 0.6)",
		"&:hover": {
			backgroundColor: "#1976d2",
			boxShadow: "0 4px 12px rgba(33, 150, 243, 0.8)",
		},
		"&:active": {
			boxShadow: "0 4px 16px rgba(33, 150, 243, 1)",
		},
	});
	const redirectTo = (url) => {
		window.location.href = url;
	};

	const handleOutlineDownload = async (outlineId, price) => {
		let url = `${endpoints["vnpay"]}?amount=${
			price * 100
		}&month=6&outlineId=${outlineId}&userId=${user.id}`;
		let res = await APIs.get(url);
		console.log(res.data.url);

		window.open(res.data.url, "_blank");
		// redirectTo(res.data.url);
	};

	const handleOpenLink = (url) => {
		window.open(url, "_blank");
	};

	return (
		<>
			<Typography variant="h4" sx={{ textAlign: "center", mt: 4, mb: 4 }}>
				HỆ THỐNG QUẢN LÝ ĐỀ CƯƠNG MÔN HỌC{" "}
				<p>
					<b style={{ color: blue[500] }}>LK UNIVERSITY</b>
				</p>
				<CustomButton onClick={(event) => toChat(event)}>
					<ChatIcon></ChatIcon>
				</CustomButton>
			</Typography>
			{loading && <LinearBuffer />}
			<Container>
				<Row className="mb-4 align-items-center">
					<Col className="mb-3" xs={12} md={6}>
						<Autocomplete
							disablePortal
							id="lecturer1-box-demo"
							options={lecturers}
							getOptionLabel={(option) => option.nameLecturer}
							onChange={handleLecturerChange}
							renderInput={(params) => (
								<TextField {...params} label="Tên giảng viên" />
							)}
						/>
					</Col>
					<Col className="mb-3" xs={12} md={6}>
						<Autocomplete
							disablePortal
							id="lecturer2-box-demo"
							options={subjects}
							getOptionLabel={(option) => option.name}
							onChange={handleSubjectChange}
							renderInput={(params) => (
								<TextField {...params} label="Tên đề cương" />
							)}
						/>
					</Col>
					<Col xs={12} md={6}>
						<Autocomplete
							disablePortal
							id="lecturer4-box-demo"
							options={academicYears}
							getOptionLabel={(option) =>
								`K${option.name.substring(2, 4)}`
							}
							onChange={handleAcademicYearChange}
							renderInput={(params) => (
								<TextField {...params} label="Khóa học" />
							)}
						/>
					</Col>
					<Col xs={12} md={3} className="align-items-center">
						<Autocomplete
							disablePortal
							id="lecturer2-box-demo"
							options={theoCreditHourRange}
							getOptionLabel={(option) => option.toString()}
							onChange={handleTheoCreditHourChange}
							renderInput={(params) => (
								<TextField
									{...params}
									label="Tín chỉ lý thuyết"
								/>
							)}
						/>
					</Col>
					<Col xs={12} md={3} className="align-items-center">
						<Autocomplete
							disablePortal
							id="lecturer2-box-demo"
							options={pracCreditHourRange}
							getOptionLabel={(option) => option.toString()}
							onChange={handlePracCreditHourChange}
							renderInput={(params) => (
								<TextField
									{...params}
									label="Tín chỉ thực hành"
								/>
							)}
						/>
					</Col>
				</Row>

				<Stack
					direction="row"
					spacing={1}
					style={{ display: "flex", flexWrap: "wrap", gap: "5px" }}
				>
					{outlineFilters.facultyId && (
						<Chip
							label={`Khoa: ${
								faculties.find(
									(faculty) =>
										faculty.id === outlineFilters.facultyId,
								)?.name || ""
							}`}
							onDelete={() => handleFilterDelete("facultyId")}
							sx={{
								bgcolor: "#2196f3", // Màu xanh dương
								color: "white",
								fontWeight: "bold",
								marginRight: "5px",
								marginBottom: "5px",
								"&:hover": {
									bgcolor: "#f44336", // Màu đỏ
								},
								textShadow: "1px 1px 2px rgba(0,0,0,0.5)",
							}}
						/>
					)}
					{outlineFilters.subjectId && (
						<Chip
							label={`Môn học: ${
								subjects.find(
									(subject) =>
										subject.id === outlineFilters.subjectId,
								)?.name || ""
							}`}
							onDelete={() => handleFilterDelete("subjectId")}
							sx={{
								bgcolor: "#2196f3", // Màu xanh dương
								color: "white",
								fontWeight: "bold",
								marginRight: "5px",
								marginBottom: "5px",
								"&:hover": {
									bgcolor: "#f44336", // Màu đỏ
								},
								textShadow: "1px 1px 2px rgba(0,0,0,0.5)",
							}}
						/>
					)}
					{outlineFilters.academicYearRange && (
						<Chip
							label={`Khóa học: ${outlineFilters.academicYearRange}`}
							onDelete={() =>
								handleFilterDelete("academicYearRange")
							}
							sx={{
								bgcolor: "#2196f3", // Màu xanh dương
								color: "white",
								fontWeight: "bold",
								marginRight: "5px",
								marginBottom: "5px",
								"&:hover": {
									bgcolor: "#f44336", // Màu đỏ
								},
								textShadow: "1px 1px 2px rgba(0,0,0,0.5)",
							}}
						/>
					)}
				</Stack>

				<PaginationControlled
					count={pageSize.current}
					page={page || 1}
					pageChange={handleSetPage}
				/>
				<Row className="mt-2">
					{outlines.map((outline) => (
						<Col key={outline.outlineId} md={4} className="mb-3">
							<Card className="border border-primary">
								<Card.Header>
									<h5>Mã đề cương: {outline.outlineId}</h5>
									{isStudent(user) && !outline.url && (
										<AlertDialog
											title={"THANH TOÁN ĐỂ TẢI ĐỀ CƯƠNG"}
											message={`Bạn phải thanh toán ${new Intl.NumberFormat(
												"vi-VN",
												{
													style: "currency",
													currency: "VND",
												},
											).format(
												outline.price,
											)} để tải đề cương này!`}
											handleClick={handleOutlineDownload}
											itemId={outline.outlineId}
											price={outline.price}
											icon={
												<FontAwesomeIcon
													icon={faFileArrowDown}
													style={{
														color: "#5f34df",
														fontSize: 25,
														marginLeft: 5,
													}}
												/>
											}
										/>
									)}
									{outline.url && (
										<Button
											onClick={() =>
												handleOpenLink(outline.url)
											}
										>
											Link
										</Button>
									)}
								</Card.Header>
								<Card.Body>
									<ListGroup variant="flush">
										<ListGroup.Item className="text-truncate">
											<strong>Giảng viên:</strong>{" "}
											{outline.lecturer}
										</ListGroup.Item>
										<ListGroup.Item className="text-truncate">
											<strong>Môn học:</strong>{" "}
											{outline.subject}
										</ListGroup.Item>
										<ListGroup.Item className="text-truncate">
											<strong>Khoa quản lý:</strong>{" "}
											{outline.faculty}
										</ListGroup.Item>

										<ListGroup.Item className="text-truncate">
											<strong>Mô tả:</strong>{" "}
											{outline.description}
										</ListGroup.Item>
										<ListGroup.Item className="text-truncate">
											<strong>Lý thuyết:</strong>{" "}
											{outline.theory}
										</ListGroup.Item>
										<ListGroup.Item className="text-truncate">
											<strong>Thực hành:</strong>{" "}
											{outline.practice}
										</ListGroup.Item>
										{outline.preSubjects.length > 0 &&
											outline.preSubjects.map(
												(sub, index) => {
													const subjectKey = `subject${index}`;
													return (
														<ListGroup.Item className="text-truncate">
															<strong>
																Môn tiên quyết{" "}
																{index + 1}:
															</strong>{" "}
															{sub[subjectKey]}
														</ListGroup.Item>
													);
												},
											)}
									</ListGroup>
								</Card.Body>
								<Card.Footer>
									<Badge bg="info">Thông tin chi tiết</Badge>
								</Card.Footer>
							</Card>
						</Col>
					))}
				</Row>
			</Container>
		</>
	);
};

export default Home;
