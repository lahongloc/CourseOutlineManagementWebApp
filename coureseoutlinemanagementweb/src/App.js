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
import Content from "./commons/Content";
import MyOutline from "./components/MyOutlines";
import Outlinecompilation from "./components/Outlinecompilation";
import StudentRegister from "./components/StudentRegister";
import StudentActive from "./components/StudentActive";
import ChatComponent from "./components/ChatComponents";
// import { child, set, get, getDatabase, ref } from "firebase/database";
// import { database } from "./configs/Firebase";
// import ChatRealTime from "./components/ChatRealTime";

export const UserContext = createContext();
export const NonAdminUsersContext = createContext();
export const FacultyContext = createContext();
export const MajorContext = createContext();
export const GradeContext = createContext();
export const AcademicYearContext = createContext();
export const SubjectsContext = createContext();
export const LecturerContext = createContext();

const App = () => {
	// const dbRef = ref(database);
	// get(child(dbRef, `users/1`)).then((snapshot) => {
	// 	if (snapshot.exists()) {
	// 	  console.log("firebase: ", snapshot.val());
	// 	} else {
	// 	  console.log("No data available");
	// 	}
	//   }).catch((error) => {
	// 	console.error(error);
	//   });

	// set(child(dbRef, 'users/2'), {
	// 	id: 2,
	// 	username: "test"
	//   });

	const [faculties, setFaculties] = useState([]);
	const [major, setMajor] = useState([]);
	const [grade, setGrade] = useState([]);
	const [academicYear, setAcademicYear] = useState([]);
	const [subjects, setSubjects] = useState([]);
	const [lecturers, setLecturers] = useState([]);
	const [nonAdminUsers, setNonAdminUsers] = useState([]);

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
		console.log(faculties);
	});
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

	const loadSubjects = async () => {
		try {
			let url = `${endpoints["getSubjetcs"]}`;
			let res = await APIs.get(url);

			setSubjects(res.data);
		} catch (ex) {
			console.error(ex);
		}
	};

	useEffect(() => {
		loadSubjects();
	}, []);

	const loadLecturers = async () => {
		try {
			let url = `${endpoints["getLecturers"]}`;
			let res = await APIs.get(url);

			setLecturers(res.data);
		} catch (ex) {
			console.error(ex);
		}
	};

	useEffect(() => {
		loadLecturers();
	}, []);

	const loadNonAdminUsers = async () => {
		try {
			let url = `${endpoints["getNonAdminUsers"]}`;
			let res = await APIs.get(url);

			setNonAdminUsers(res.data);
		} catch (ex) {
			console.error(ex);
		}
	};

	useEffect(() => {
		loadNonAdminUsers();
	}, []);

	const [user, dispatch] = useReducer(
		UserReducer,
		cookie.load("user") || null,
	);

	return (
		<UserContext.Provider value={[user, dispatch]}>
			<FacultyContext.Provider value={faculties}>
				<MajorContext.Provider value={major}>
					<GradeContext.Provider value={grade}>
						<AcademicYearContext.Provider value={academicYear}>
							<SubjectsContext.Provider value={subjects}>
								<LecturerContext.Provider value={lecturers}>
									<NonAdminUsersContext.Provider
										value={nonAdminUsers}
									>
										<BrowserRouter>
											{/* <Header /> */}
											<ResponsiveAppBar />

											{/* <Container> */}
											<Routes>
												<Route
													path="/lecturer-signup"
													element={<SignUp />}
												/>
												<Route
													path="/account-details"
													element={<AccountDetails />}
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
													element={
														<StudentRegister />
													}
												/>
												{/* <Route path="/" element={<Home />} /> */}
												<Route
													path="/"
													element={<Content />}
												/>
												<Route
													path="/login"
													element={<Login />}
												/>
												<Route
													path="/my-outlines"
													element={
														<MyOutline
															status={"ACCEPTED"}
														/>
													}
												/>
												<Route
													path="/my-workspace"
													element={
														<MyOutline
															status={"HOLDING"}
														/>
													}
												/>
												<Route
													path="/outline-compiling"
													element={
														<Outlinecompilation />
													}
												/>
												<Route
													path="/chat-real-time"
													element={<ChatComponent />}
												/>
											</Routes>
											{/* </Container> */}
											<Footer />
										</BrowserRouter>
									</NonAdminUsersContext.Provider>
								</LecturerContext.Provider>
							</SubjectsContext.Provider>
						</AcademicYearContext.Provider>
					</GradeContext.Provider>
				</MajorContext.Provider>
			</FacultyContext.Provider>
		</UserContext.Provider>
	);
};

export default App;
