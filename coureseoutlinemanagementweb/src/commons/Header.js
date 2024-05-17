import { useEffect, useState } from "react";
import { Container, Nav, NavDropdown, Navbar } from "react-bootstrap";
import APIs, { endpoints } from "../configs/APIs";
import { Link } from "react-router-dom";

const Header = () => {
	const [faculty, setFaculty] = useState([]);
	const [loading, setLoading] = useState(false);

	const loadFaculty = async () => {
		try {
			let url = `${endpoints["getFaculties"]}`;
			let res = await APIs.get(url);
			setFaculty(res.data);
			console.log(res.data);
		} catch (ex) {
			console.error(ex);
		} finally {
			setLoading(false);
		}
	};

	useEffect(() => {
		loadFaculty();
	}, []);

	return (
		<>
			<Navbar expand="lg" className="bg-body-tertiary">
				<Container>
					<Navbar.Brand href="#home">
						OUTLINE MANAGEMENT SYSTEM
					</Navbar.Brand>
					<Navbar.Toggle aria-controls="basic-navbar-nav" />
					<Navbar.Collapse id="basic-navbar-nav">
						<Nav className="me-auto">
							<Nav.Link href="#home">Trang chủ</Nav.Link>
							<Link className="nav-link text-danger" to="/login">
								Đăng nhập
							</Link>
							<NavDropdown
								title="Khoa - Ban"
								id="basic-nav-dropdown"
							>
								{faculty.map((f) => (
									<NavDropdown.Item href="/" key={f.id}>
										{f.name}
									</NavDropdown.Item>
								))}
							</NavDropdown>
						</Nav>
					</Navbar.Collapse>
				</Container>
			</Navbar>
		</>
	);
};

export default Header;
