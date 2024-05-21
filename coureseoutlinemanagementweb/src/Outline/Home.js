import { useEffect, useState } from "react";
import APIs, { endpoints } from "../configs/APIs";
import { Badge, Card, Container, ListGroup, Row } from "react-bootstrap";

const Home = () => {
	const [outline, setOutline] = useState([]);
	const [loading, setLoading] = useState(false);

	const loadOutline = async () => {
		setLoading(true);
		try {
			let url = `${endpoints["getOutlines"]}`;
			let res = await APIs.get(url);
			setOutline(res.data);
		} catch (ex) {
			console.error(ex);
		} finally {
			setLoading(false);
		}
	};

	useEffect(() => {
		loadOutline();
	}, []);

	return (
		<>
			<Container>
				<Row className="mt-2">
					{outline.map((outline) => (
						<Card key={outline[0]} className="mb-3">
							<Card.Header>
								<h5>Mã đề cương: {outline[0]}</h5>
							</Card.Header>
							<Card.Body>
								<ListGroup variant="flush">
									<ListGroup.Item>
										<strong>Giảng viên:</strong>{" "}
										{outline[6]}
									</ListGroup.Item>
									<ListGroup.Item>
										<strong>Môn học:</strong> {outline[7]}
									</ListGroup.Item>
									<ListGroup.Item>
										<strong>Khoa quản lý:</strong>{" "}
										{outline[8]}
									</ListGroup.Item>
									<ListGroup.Item>
										<strong>Ngày bắt đầu:</strong>{" "}
										{new Date(
											outline[1],
										).toLocaleDateString()}
									</ListGroup.Item>
									<ListGroup.Item>
										<strong>Ngày kết thúc:</strong>{" "}
										{new Date(
											outline[2],
										).toLocaleDateString()}
									</ListGroup.Item>
									<ListGroup.Item>
										<strong>Mô tả:</strong> {outline[3]}
									</ListGroup.Item>
									<ListGroup.Item>
										<strong>Lý thuyết:</strong> {outline[4]}
									</ListGroup.Item>
									<ListGroup.Item>
										<strong>Thực hành:</strong> {outline[5]}
									</ListGroup.Item>
								</ListGroup>
							</Card.Body>
							<Card.Footer>
								<Badge bg="info">Thông tin chi tiết</Badge>
							</Card.Footer>
						</Card>
					))}
				</Row>
			</Container>
		</>
	);
};

export default Home;
