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
	TextareaAutosize,
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
import cookie from "react-cookies";
import MyTextarea from "../UI components/MyTextarea";

const Outlinecompilation = () => {
	const [user, dispatch] = useContext(UserContext);
	const [currentOutline, setCurrentOutline] = useState(null);
	const [q] = useSearchParams();
	const [subjects, setSujects] = useState([]);
	const [scores, setScores] = useState([]);

	// states needed to post API
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
	const [outlineScores, setOutlineScores] = useState([
		{
			id: null,
			percent: null,
			assessment: null,
		},
		{
			id: null,
			percent: null,
			assessment: null,
		},
	]);
	const [description, setDescription] = useState("");

	useEffect(() => {
		console.log("hbnjnnda: ", outlineScores);
	});

	// post API to save an outline
	const saveOutline = async () => {
		try {
			let form = new FormData();
			// Time Range Format
			form.append("start", timeRangeFormat[0].start);
			form.append("end", timeRangeFormat[0].end);

			// Outline Scores
			outlineScores.forEach((score, index) => {
				form.append(`outlineScoreId${index + 1}`, score.id);
				form.append(`percent${index + 1}`, score.percent);
			});

			form.append("description", description);
			form.append("prac", prac);
			form.append("theory", theory);
			form.append("preSubs", [...preSubs]);

			let res = await APIs.post(endpoints["save-outline"], form, {
				headers: {
					"Content-Type": "multipart/form-data; charset=UTF-8",
				},
			});
		} catch (err) {
			console.error(err);
		}
	};

	// handling functions
	const outlineId = q.get("outlineId");

	const handleDescriptionChange = useCallback((e) => {
		setDescription(e.target.value);
	});

	const handleScoreChange = (index, field, value) => {
		setOutlineScores((prev) => {
			const updatedScores = [...prev];
			updatedScores[index] = { ...updatedScores[index], [field]: value };
			return updatedScores;
		});
	};

	const handlePreSubjectChange = useCallback((event) => {
		const {
			target: { value },
		} = event;
		setPreSubs(typeof value === "string" ? value.split(",") : value);
	});

	const addField = () => {
		setOutlineScores((prev) => {
			return [
				...prev,
				{
					id: null,
					percent: null,
				},
			];
		});
	};

	const deleteField = (index) => {
		console.log("index la: ", index);
		setOutlineScores((prev) => {
			return prev.filter((f, i) => i !== index);
		});
	};

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

	// data loading function to initialize the page
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

	const loadScores = async () => {
		try {
			let res = await APIs.get(endpoints["getScores"]);
			if (res.status === 200) {
				setScores(res.data);
			}
		} catch (err) {
			console.error(err);
		}
	};

	useEffect(() => {
		loadSubjects();
		loadCurrentOutline();
		loadScores();
	}, []);

	// loacal storage to temporarily save the data
	useEffect(() => {
		if (outlineId) {
			const savedTheory = localStorage.getItem(
				`theoryCredits_${outlineId}`,
			);
			const savedPrac = localStorage.getItem(`pracCredits_${outlineId}`);
			const savedPreSubs = localStorage.getItem(`preSubs_${outlineId}`);
			const savedDates = localStorage.getItem(`dateRange_${outlineId}`);
			const savedScores = localStorage.getItem(
				`outlineScores_${outlineId}`,
			);
			const savedDescription = localStorage.getItem(
				`description_${outlineId}`,
			);

			if (savedTheory) setTheory(savedTheory);
			if (savedPrac) setPrac(savedPrac);
			if (savedPreSubs) setPreSubs(JSON.parse(savedPreSubs));
			if (savedDates) {
				const parsedDates = JSON.parse(savedDates);
				setTimeRange([dayjs(parsedDates[0]), dayjs(parsedDates[1])]);
			}
			if (savedScores) {
				setOutlineScores(JSON.parse(savedScores));
			}
			if (savedDescription) {
				setDescription(savedDescription);
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

	useEffect(() => {
		if (outlineId) {
			localStorage.setItem(
				`preSubs_${outlineId}`,
				JSON.stringify(preSubs),
			);
		}
	}, [preSubs, outlineId]);

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

	useEffect(() => {
		if (outlineId) {
			localStorage.setItem(
				`outlineScores_${outlineId}`,
				JSON.stringify(outlineScores),
			);
		}
	}, [outlineScores, outlineId]);

	useEffect(() => {
		if (outlineId && description !== "") {
			localStorage.setItem(`description_${outlineId}`, description);
		}
	}, [description, outlineId]);

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
						<MyTextarea
							valueItem={description}
							handleValueChange={handleDescriptionChange}
							placeholder={`Mô tả cho môn học ${currentOutline[0].subject}...`}
						/>

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
							fields={outlineScores}
							handleScoreChange={handleScoreChange}
							addField={addField}
							deleteField={deleteField}
							scores={scores}
							// handleValueChange1={handleValueChange1}
							// handleValueChange2={handleValueChange2}
							// score1={score1}
							// score2={score2}
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
