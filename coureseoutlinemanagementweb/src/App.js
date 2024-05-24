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
import LecturerRegister from "./components/LecturerRegister";
import SignUp from "./components/SignUp";
import AccountDetails from "./components/AccountDetails";
import APIs, { endpoints } from "./configs/APIs";

export const UserContext = createContext();
export const FacultyContext = createContext();

const App = () => {
	const [faculties, setFaculties] = useState([]);

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

	const [user, dispatch] = useReducer(
		UserReducer,
		cookie.load("user") || null,
	);

	const a = { name: "ljk", age: 17 };

	return (
		<UserContext.Provider value={[user, dispatch]}>
			<FacultyContext.Provider value={faculties}>
				<BrowserRouter>
					<Header />
					<Container>
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
								path="/lecturer-register"
								element={<LecturerRegister />}
							/>
							<Route path="/" element={<Home />} />
							<Route path="/login" element={<Login />} />
						</Routes>
					</Container>
					<Footer />
				</BrowserRouter>
			</FacultyContext.Provider>
		</UserContext.Provider>
	);
};

export default App;
