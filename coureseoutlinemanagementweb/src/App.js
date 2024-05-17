import "./App.css";
import "bootstrap/dist/css/bootstrap.min.css";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import Header from "./commons/Header";
import Footer from "./commons/Footer";
import Home from "./Outline/Home";
import Login from "./components/Login";
import { Container } from "react-bootstrap";

const App = () => {
	return (
		<>
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
		</>
	);
};

export default App;
