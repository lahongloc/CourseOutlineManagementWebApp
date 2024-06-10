import { useCallback, useEffect, useRef, useState } from "react";
import APIs, { endpoints } from "../configs/APIs";
import { Badge, Card, Container, ListGroup, Row } from "react-bootstrap";
import PaginationControlled from "../UI components/PaginationControlled";
import { render } from "@testing-library/react";

const Home = () => {
	const [outlines, setOutlines] = useState([]);
	const [page, setPage] = useState(null);
	const [loading, setLoading] = useState(false);
	let pageSize = useRef();
	let checkLoad = useRef(false);

	const handleSetPage = useCallback((e, value) => {
		setPage(value);
	});

	useEffect(() => {
		loadOutlines();
		// console.log(outlines.length)
	}, [page]);

	const loadOutlines = async () => {
		setLoading(true);
		try {
			// console.log("B");
			let url = `${endpoints["getOutlines"]}`;
			if (page) url = `${url}?page=${page}`;
			let res = await APIs.get(url);
			setOutlines(res.data);
			if (page === null) {
				pageSize.current = Math.ceil(res.data.length / 4);
				setPage(1);
			}
			console.log(url, page);
		} catch (ex) {
			console.error(ex);
		} finally {
			setLoading(false);
		}
	};

	useEffect(() => {
		// console.log("C");
		loadOutlines();
	}, [page]);

	return (
		<>
			<Container>
				<PaginationControlled
					count={pageSize.current}
					page={page || 1}
					pageChange={handleSetPage}
				/>

				<Row className="mt-2">
					{outlines.map((outline) => (
						<Card key={outline.outlineId} className="mb-3">
							<Card.Header>
								<h5>Mã đề cương: {outline.outlineId}</h5>
							</Card.Header>
							<Card.Body>
								<ListGroup variant="flush">
									<ListGroup.Item>
										<strong>Giảng viên:</strong>{" "}
										{outline.lecturer}
									</ListGroup.Item>
									<ListGroup.Item>
										<strong>Môn học:</strong>{" "}
										{outline.subject}
									</ListGroup.Item>
									<ListGroup.Item>
										<strong>Khoa quản lý:</strong>{" "}
										{outline.faculty}
									</ListGroup.Item>
									<ListGroup.Item>
										<strong>Ngày bắt đầu:</strong>{" "}
										{new Date(
											outline.startedDate,
										).toLocaleDateString()}
									</ListGroup.Item>
									<ListGroup.Item>
										<strong>Ngày kết thúc:</strong>{" "}
										{new Date(
											outline.expiredDate,
										).toLocaleDateString()}
									</ListGroup.Item>
									<ListGroup.Item>
										<strong>Mô tả:</strong>{" "}
										{outline.description}
									</ListGroup.Item>
									<ListGroup.Item>
										<strong>Lý thuyết:</strong>{" "}
										{outline.theory}
									</ListGroup.Item>
									<ListGroup.Item>
										<strong>Thực hành:</strong>{" "}
										{outline.practice}
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
