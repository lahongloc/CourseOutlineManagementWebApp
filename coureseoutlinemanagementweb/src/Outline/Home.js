import { useCallback, useContext, useEffect, useRef, useState } from "react";
import APIs, { endpoints } from "../configs/APIs";
import { Badge, Card, Container, ListGroup, Row } from "react-bootstrap";
import PaginationControlled from "../UI components/PaginationControlled";
import LinearBuffer from "../UI components/LinearBuffer";
import { faFileArrowDown } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Navigate, useNavigate } from "react-router-dom";
import AlertDialog from "../UI components/AlertDialog";
import { UserContext } from "../App";
import { isStudent } from "../UserAuthorization/UserAuthoriation";
const Home = () => {
	const [user, dispatch] = useContext(UserContext);
	const [outlines, setOutlines] = useState([]);
	const [page, setPage] = useState(null);
	const [loading, setLoading] = useState(false);
	let pageSize = useRef();

	const nav = useNavigate();

	const handleSetPage = useCallback((e, value) => {
		setPage(value);
	});

	// useEffect(() => {
	// 	console.log("A");
	// 	// console.log("Trang hiện tại: ", page);
	// 	// console.log("Tổng tất cả trang: ", pageSize.current);
	// });

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

	const redirectTo = (url) => {
		window.location.href = url;
	};

	const handleOutlineDownload = async (outlineId, price) => {
		console.log("tai d cuong: ", outlineId);

		let url = `${endpoints["vnpay"]}?amount=${
			price * 100
		}&month=6&outlineId=${outlineId}&userId=${user.id}`;
		let res = await APIs.get(url);
		console.log(res.data.url);

		window.open(res.data.url, "_blank");
		// redirectTo(res.data.url);
	};

	return (
		<>
			{loading && <LinearBuffer />}
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
								{/* <button
									onClick={() =>
										handleOutlineDownload(outline.outlineId)
									}
									style={{
										border: "none",
										marginTop: 2,
									}}
								> */}
								{isStudent(user) && (
									<AlertDialog
										title={"THANH TOÁN ĐỂ TẢI ĐỀ CƯƠNG"}
										message={`Bạn phải thanh toán ${new Intl.NumberFormat(
											"vi-VN",
											{
												style: "currency",
												currency: "VND",
											},
										).format(
											outline.price,
										)} để tải đề cương này!`}
										handleClick={handleOutlineDownload}
										itemId={outline.outlineId}
										price={outline.price}
										icon={
											<FontAwesomeIcon
												icon={faFileArrowDown}
												style={{
													color: "#5f34df",
													fontSize: 25,
													marginLeft: 5,
												}}
											/>
										}
									/>
								)}
								{/* </button> */}
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
