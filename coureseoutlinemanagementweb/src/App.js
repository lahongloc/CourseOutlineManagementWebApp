import "./App.css";
import "bootstrap/dist/css/bootstrap.min.css";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import Header from "./commons/Header";
import Footer from "./commons/Footer";
import Home from "./Outline/Home";
import Login from "./components/Login";
import { Container } from "react-bootstrap";
import { createContext, useEffect, useReducer, useState } from "react";
import UserReducer from "./reducers/UserReducer";
import cookie from "react-cookies";
import SignUp from "./components/SignUp";
import AccountDetails from "./components/AccountDetails";
import APIs, { endpoints } from "./configs/APIs";
import ResponsiveAppBar from "./UI components/ResponsiveAppBar";
import BasicSimpleTreeView from "./UI components/BasicSimpleTreeView";
import StudentRegister from "./components/StudentRegister";
import StudentActive from "./components/StudentActive";

export const UserContext = createContext();
export const FacultyContext = createContext();
export const MajorContext = createContext();
export const GradeContext = createContext();
export const AcademicYearContext = createContext();

const App = () => {
	const [faculties, setFaculties] = useState([]);
	const [major, setMajor] = useState([]);
	const [grade, setGrade] = useState([]);
	const [academicYear, setAcademicYear] = useState([]);

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

	const loadMajors = async () => {
		try {
			let url = `${endpoints["getMajors"]}`;
			let res = await APIs.get(url);

			setMajor(res.data);
		} catch (ex) {
			console.error(ex);
		}
	};

	useEffect(() => {
		loadMajors();
	}, []);

	const loadGrades = async () => {
		try {
			let url = `${endpoints["getGrades"]}`;
			let res = await APIs.get(url);

			setGrade(res.data);
		} catch (ex) {
			console.error(ex);
		}
	};

	useEffect(() => {
		loadGrades();
	}, []);

	const loadAcademicYears = async () => {
		try {
			let url = `${endpoints["getAcademicYears"]}`;
			let res = await APIs.get(url);

			setAcademicYear(res.data);
		} catch (ex) {
			console.error(ex);
		}
	};

	useEffect(() => {
		loadAcademicYears();
	}, []);

	const [user, dispatch] = useReducer(
		UserReducer,
		cookie.load("user") || null,
	);

	const a = { name: "ljk", age: 17 };

	return (
		<UserContext.Provider value={[user, dispatch]}>
			<FacultyContext.Provider value={faculties}>
				<MajorContext.Provider value={major}>
					<GradeContext.Provider value={grade}>
						<AcademicYearContext.Provider value={academicYear}>
						<BrowserRouter>
					{/* <Header /> */}
					<ResponsiveAppBar />
					<BasicSimpleTreeView />
					<Container>
						<Routes>
							<Route
								path="/lecturer-register"
								element={<SignUp />}
							/>
							<Route
								path="/student-active"
								element={<StudentActive />}
							/>
							<Route
								path="/account-details"
								element={<AccountDetails />}
							/>
							<Route
								path="/student-register"
								element={<StudentRegister />}
							/>
							<Route path="/" element={<Home />} />
							<Route path="/login" element={<Login />} />
						</Routes>
					</Container>
					<Footer />
				</BrowserRouter>
						</AcademicYearContext.Provider>
					</GradeContext.Provider>
				</MajorContext.Provider>
			</FacultyContext.Provider>
		</UserContext.Provider>
	);
};

export default App;
