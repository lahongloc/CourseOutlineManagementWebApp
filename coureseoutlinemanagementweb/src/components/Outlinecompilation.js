import { useCallback, useContext, useEffect, useState } from "react";
import { useSearchParams } from "react-router-dom";
import APIs, { endpoints } from "../configs/APIs";
import {
	Alert,
	Badge,
	Box,
	Button,
	Container,
	Paper,
	TextField,
	Typography,
	useRadioGroup,
} from "@mui/material";
import SendIcon from "@mui/icons-material/Send";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faFileLines } from "@fortawesome/free-solid-svg-icons";
import DateRange from "../UI components/DateRange";
import "@fontsource/roboto/300.css";
import "@fontsource/roboto/400.css";
import "@fontsource/roboto/500.css";
import "@fontsource/roboto/700.css";
import { UserContext } from "../App";
import MultipleSelectChip from "../UI components/MultipleSelectChip";
import IncreaseTable from "../UI components/IncreaseTable";
import dayjs from "dayjs";

const Outlinecompilation = () => {
	const [user, dispatch] = useContext(UserContext);
	const [currentOutline, setCurrentOutline] = useState(null);
	const [q] = useSearchParams();
	const [subjects, setSujects] = useState([]);

	const [timeRange, setTimeRange] = useState([null, null]);

	const [timeRangeFormat, setTimeRangeFormat] = useState([
		{
			start: null,
			end: null,
		},
	]);
	const [preSubs, setPreSubs] = useState([]);
	const [theory, setTheory] = useState("");
	const [prac, setPrac] = useState("");
	const [fields, setFields] = useState([
		{
			name: "",
			assessment: "",
			percent: 0.0,
		},
		{
			name: "",
			assessment: "",
			percent: 0.0,
		},
	]);

	const saveOutline = async () => {
		try {
			let myForm = {
				time: { ...timeRangeFormat },
				preSubs: [...preSubs],
				theory: theory,
				prac: prac,
				outlineScores: [...fields],
			};

			let form = new FormData();
			for (var f in myForm) {
				form.append(f, myForm[f]);
			}

			let res = await APIs.post(endpoints["save-outline"], form, {
				headers: {
					"Content-Type": "multipart/form-data",
				},
			});
		} catch (err) {
			console.error(err);
		}
	};

	useEffect(() => {
		let myForm = {
			time: { ...timeRangeFormat },
			preSubs: [...preSubs],
			theory: theory,
			prac: prac,
			outlineScores: [...fields],
		};

		console.log(myForm);
	});

	const outlineId = q.get("outlineId");

	const handleFieldChange = (index, key, value) => {
		setFields((prevFields) => {
			const newFields = [...prevFields];
			newFields[index][key] = value;
			return newFields;
		});
	};

	const handlePreSubjectChange = useCallback((event) => {
		const {
			target: { value },
		} = event;
		setPreSubs(typeof value === "string" ? value.split(",") : value);
	});

	const addField = () => {
		setFields((prev) => {
			return [
				...prev,
				{
					name: "",
					assessment: "",
					percent: 0.0,
				},
			];
		});
	};

	const deleteField = (index) => {
		setFields((prev) => {
			return prev.filter((f, i) => i !== index);
		});
	};

	const loadSubjects = async () => {
		try {
			let res = await APIs.get(endpoints["getSubjetcs"]);
			if (res.status === 200) {
				setSujects(res.data);
			}
		} catch (err) {
			console.error(err);
		}
	};

	const loadCurrentOutline = async () => {
		try {
			let url = `${endpoints["getOutlines"]}?outlineId=${q.get(
				"outlineId",
			)}`;
			let res = await APIs.get(url);
			setCurrentOutline(res.data);
		} catch (err) {
			console.error(err);
		}
	};

	useEffect(() => {
		loadSubjects();
		loadCurrentOutline();
	}, []);

	//=================LOCAL STORAGE
	useEffect(() => {
		if (outlineId) {
			const savedTheory = localStorage.getItem(
				`theoryCredits_${outlineId}`,
			);
			const savedPrac = localStorage.getItem(`pracCredits_${outlineId}`);

			if (savedTheory) {
				setTheory(savedTheory);
			}
			if (savedPrac) {
				setPrac(savedPrac);
			}
		}
	}, [outlineId]);

	useEffect(() => {
		if (outlineId) {
			localStorage.setItem(`theoryCredits_${outlineId}`, theory);
		}
	}, [theory, outlineId]);

	useEffect(() => {
		if (outlineId) {
			localStorage.setItem(`pracCredits_${outlineId}`, prac);
		}
	}, [prac, outlineId]);

	//===
	useEffect(() => {
		if (outlineId) {
			const savedPreSubs = localStorage.getItem(`preSubs_${outlineId}`);
			if (savedPreSubs) {
				setPreSubs(JSON.parse(savedPreSubs));
			}
		}
	}, [outlineId]);

	useEffect(() => {
		if (outlineId) {
			localStorage.setItem(
				`preSubs_${outlineId}`,
				JSON.stringify(preSubs),
			);
		}
	}, [preSubs, outlineId]);

	//======
	useEffect(() => {
		if (outlineId) {
			const savedFields = localStorage.getItem(`fields_${outlineId}`);
			if (savedFields) {
				setFields(JSON.parse(savedFields));
			}
		}
	}, [outlineId]);

	useEffect(() => {
		if (outlineId) {
			localStorage.setItem(`fields_${outlineId}`, JSON.stringify(fields));
		}
	}, [fields, outlineId]);

	//====DATEEEE

	useEffect(() => {
		if (outlineId) {
			const savedDates = localStorage.getItem(`dateRange_${outlineId}`);
			if (savedDates) {
				const parsedDates = JSON.parse(savedDates);
				setTimeRange([dayjs(parsedDates[0]), dayjs(parsedDates[1])]);
			}
		}
	}, [outlineId]);

	useEffect(() => {
		if (outlineId && timeRange[0] && timeRange[1]) {
			const formattedDates = [
				timeRange[0].toISOString(),
				timeRange[1].toISOString(),
			];
			localStorage.setItem(
				`dateRange_${outlineId}`,
				JSON.stringify(formattedDates),
			);
		}
	}, [timeRange, outlineId]);

	const handleDateChange = (newValue) => {
		setTimeRange(newValue);
	};

	const formatDate = (date) => {
		return date ? dayjs(date).format("YYYY/MM/DD") : "";
	};

	useEffect(() => {
		if (timeRange[0] && timeRange[1]) {
			setTimeRangeFormat([
				{
					start: formatDate(timeRange[0]),
					end: formatDate(timeRange[1]),
				},
			]);
		}
	}, [timeRange]);

	return (
		<>
			{currentOutline !== null && (
				<Box>
					<Box>
						<FontAwesomeIcon icon="fa-regular fa-file-lines" />
						<h1 className="text-center">BIÊN SOẠN ĐỀ CƯƠNG</h1>
					</Box>

					<Box
						sx={{
							width: "65%",
							height: "max-content",
							margin: "auto",
							marginTop: 5,
							marginBottom: 5,
							boxShadow:
								"rgba(100, 100, 111, 0.2) 0px 7px 29px 0px",
							borderRadius: "17px",
							padding: 5,
						}}
					>
						<h5 style={{ marginBottom: 25 }}>
							<FontAwesomeIcon
								icon={faFileLines}
								style={{ color: "#825dee", fontSize: 35 }}
							/>
							<span>
								{" "}
								ĐỀ CƯƠNG MÔN: {currentOutline[0].subject}
							</span>
						</h5>
						<DateRange
							value={timeRange}
							handleDateChange={handleDateChange}
						/>
						<Typography
							sx={{ marginTop: 2 }}
							variant="h6"
							gutterBottom
						>
							I. Thông tin tổng quát - General Information
						</Typography>
						<Typography
							sx={{ marginTop: 2 }}
							variant="p"
							gutterBottom
						>
							<span style={{ fontWeight: 600 }}>
								- Số tín chỉ:
							</span>
						</Typography>

						<Box
							component="form"
							sx={{
								"& > :not(style)": { m: 1, width: "25ch" },
							}}
							noValidate
							autoComplete="off"
						>
							<TextField
								id="filled-basic"
								label="Tín chỉ lý thuyết"
								variant="filled"
								type="number"
								value={theory}
								onChange={(e) => setTheory(e.target.value)}
							/>
							<TextField
								id="filled-basic"
								label="Tín chỉ thực hành"
								variant="filled"
								type="number"
								value={prac}
								onChange={(e) => setPrac(e.target.value)}
							/>
						</Box>

						<table className="table">
							<tr>
								<td>
									<Typography
										sx={{ marginTop: 2 }}
										variant="p"
										gutterBottom
									>
										<span style={{ fontWeight: 600 }}>
											- Khoa phụ trách:
										</span>{" "}
										<Alert
											icon={false}
											sx={{ width: "fit-content", m: 1 }}
											severity="info"
										>
											<b>{currentOutline[0].faculty}</b>
										</Alert>
									</Typography>
								</td>
								<td>
									<Typography
										sx={{ marginTop: 2 }}
										variant="p"
										gutterBottom
									>
										<span style={{ fontWeight: 600 }}>
											- Email liên hệ:
										</span>{" "}
										{user.email}
									</Typography>
								</td>
							</tr>
						</table>
						<hr></hr>
						<Typography variant="h6" gutterBottom>
							II. Thông tin về môn học - Course overview
						</Typography>
						<Typography
							sx={{ marginTop: 2 }}
							variant="p"
							gutterBottom
						>
							<span style={{ fontWeight: 600 }}>
								- Mô tả môn học/Course description:
							</span>{" "}
							{currentOutline[0].description}
						</Typography>

						<Typography
							sx={{ marginTop: 2, display: "block" }}
							variant="p"
							gutterBottom
						>
							<span style={{ fontWeight: 600 }}>
								- Môn học điều kiện/Requirements:
							</span>{" "}
						</Typography>
						<MultipleSelectChip
							subjects={subjects}
							items={preSubs}
							handlePreSubjectChange={handlePreSubjectChange}
						/>
						<Typography
							sx={{ marginTop: 2 }}
							variant="p"
							gutterBottom
						>
							<span style={{ fontWeight: 600 }}>
								- Đánh giá môn học:
							</span>
						</Typography>
						<IncreaseTable
							cells={[
								"Tên cột điểm",
								"Đánh giá",
								"Phần trăm (%)",
							]}
							fields={fields}
							handleFieldChange={handleFieldChange}
							addField={addField}
							deleteField={deleteField}
						/>

						<Button
							sx={{ marginTop: 5, marginLeft: 101 }}
							variant="contained"
							endIcon={<SendIcon />}
							onClick={saveOutline}
						>
							LƯU
						</Button>
					</Box>
				</Box>
			)}
		</>
	);
};

export default Outlinecompilation;
