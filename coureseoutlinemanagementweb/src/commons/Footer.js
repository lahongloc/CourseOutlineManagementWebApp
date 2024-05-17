import React from "react";
import { Container, Row, Col } from "react-bootstrap";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
	faFacebookF,
	faTwitter,
	faGoogle,
	faInstagram,
	faLinkedinIn,
	faGithub,
} from "@fortawesome/free-brands-svg-icons";
import { width } from "@fortawesome/free-brands-svg-icons/fa42Group";

const Footer = () => {
	return (
		<>
			<footer className="bg-light text-center text-white">
				<Container className="p-4 pb-0">
					<section className="mb-4">
						<Row className="justify-content-center">
							<Col md="auto">
								<a href="#!" className="text-white">
									<FontAwesomeIcon
										icon={faFacebookF}
										style={{
											backgroundColor: "#3b5998",
											borderRadius: "50%",
											width: "60%",
										}}
										className="p-2"
									/>
								</a>
							</Col>
							<Col md="auto">
								<a href="#!" className="text-white">
									<FontAwesomeIcon
										icon={faTwitter}
										style={{ backgroundColor: "#55acee" }}
										className="p-2 rounded-circle"
									/>
								</a>
							</Col>
							<Col md="auto">
								<a href="#!" className="text-white">
									<FontAwesomeIcon
										icon={faGoogle}
										style={{ backgroundColor: "#dd4b39" }}
										className="p-2 rounded-circle"
									/>
								</a>
							</Col>
							<Col md="auto">
								<a href="#!" className="text-white">
									<FontAwesomeIcon
										icon={faInstagram}
										style={{ backgroundColor: "#ac2bac" }}
										className="p-2 rounded-circle"
									/>
								</a>
							</Col>
							<Col md="auto">
								<a href="#!" className="text-white">
									<FontAwesomeIcon
										icon={faLinkedinIn}
										style={{ backgroundColor: "#0082ca" }}
										className="p-2 rounded-circle"
									/>
								</a>
							</Col>
							<Col md="auto">
								<a href="#!" className="text-white">
									<FontAwesomeIcon
										icon={faGithub}
										style={{ backgroundColor: "#333333" }}
										className="p-2 rounded-circle"
									/>
								</a>
							</Col>
						</Row>
					</section>
				</Container>

				<div
					className="text-center p-3"
					style={{ backgroundColor: "rgba(0, 0, 0, 0.2)" }}
				>
					© {new Date().getFullYear()} Copyright:
					<a className="text-white" href="https://mdbootstrap.com/">
						MDBootstrap.com
					</a>
				</div>
			</footer>
		</>
	);
};

export default Footer;
