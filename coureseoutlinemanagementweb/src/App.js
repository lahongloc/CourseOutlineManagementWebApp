import "./App.css";
import "bootstrap/dist/css/bootstrap.min.css";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import Header from "./commons/Header";
import Footer from "./commons/Footer";
import Home from "./Outline/Home";
import Login from "./components/Login";
import { Container } from "react-bootstrap";
import { createContext, useReducer } from "react";
import UserReducer from "./reducers/UserReducer";
import cookie from "react-cookies";

export const UserContext = createContext();

const App = () => {
	const [user, dispatch] = useReducer(
		UserReducer,
		cookie.load("user") || null,
	);

	return (
		<UserContext.Provider value={[user, dispatch]}>
			<BrowserRouter>
				<Header />
				<Container>
					<Routes>
						<Route path="/" element={<Home />} />
						<Route path="/login" element={<Login />} />
					</Routes>
				</Container>
				<Footer />
			</BrowserRouter>
		</UserContext.Provider>
	);
};

export default App;
