import { useCallback, useContext, useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import APIs, { endpoints } from "../configs/APIs";
import {
	Card,
	Container,
	ListGroup,
	CardHeader,
	ListGroupItem,
	CardFooter,
	Stack,
} from "react-bootstrap";
import { blue, deepPurple, green, pink } from "@mui/material/colors";
import { isStudent } from "../UserAuthorization/UserAuthoriation";
import { UserContext } from "../App";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faFileArrowDown } from "@fortawesome/free-solid-svg-icons";
import {
	Alert,
	Avatar,
	Box,
	CardContent,
	Divider,
	Grid,
	LinearProgress,
	List,
	ListItem,
	ListItemAvatar,
	ListItemText,
	Paper,
	TextareaAutosize,
	Typography,
} from "@mui/material";
import AlertDialog from "../UI components/AlertDialog";
import { format } from "date-fns";
import Button from "@mui/material/Button";
import cookie from "react-cookies";

const OutlineDetailPage = () => {
	const { outlineId } = useParams();

	const [outline, setOutline] = useState([]);
	const [outlineDetail, setOutlineDetail] = useState(null);
	const [loading, setLoading] = useState(false);
	const user = cookie.load("user");
	const [newComment, setNewComment] = useState({
		userId: user.id,
		outlineId: outlineId,
	});
	const [message, setMessage] = useState({
		success: false,
		error: false,
	});

	useEffect(() => {
		const loadOutlineDetail = async () => {
			setLoading(true);
			try {
				// thông tin chi tiết outline đã chọn
				let urlOutline = `${endpoints["getOutlines"]}?outlineId=${outlineId}`;
				let resOutline = await APIs.get(urlOutline);
				setOutlineDetail(resOutline.data[0]);

				// các comment của outline đã chọn
				let urlComments = `${endpoints["getComments"]}${outlineId}`;
				let resComments = await APIs.get(urlComments);
				setOutline(resComments.data);

				window.scrollTo({ top: 0, behavior: "smooth" });
			} catch (error) {
				console.error("Lỗi khi tải chi tiết đề cương:", error);
			} finally {
				setLoading(false);
			}
		};

		loadOutlineDetail();
	}, [outlineId, message]);

	const handleCommentSubmit = async (e) => {
		e.preventDefault();
		const process = async () => {
			setLoading(true);
			try {
				const currentDate = new Date();
				const payload = {
					...newComment,
					createdDate: format(currentDate, "yyyy/MM/dd"),
				};

				let res = await APIs.post(endpoints["addComment"], payload, {
					headers: {
						"Content-Type": "application/json",
					},
				});

				setNewComment((prev) => ({
					...prev,
					content: null,
				}));

				if (res.status === 201) {
					setMessage((prev) => {
						return { error: false, success: true };
					});
					setTimeout(() => {
						setMessage((prev) => {
							return { ...prev, success: false };
						});
					}, 3000);
				} else {
					setMessage((prev) => {
						return { success: false, error: true };
					});
				}
			} catch (err) {
				setMessage((prev) => {
					return { success: false, error: true };
				});
				console.error(err);
			} finally {
				setLoading(false);
			}
		};

		process();
	};

	const handleCommentChange = useCallback((e) => {
		const { value } = e.target;
		setNewComment((prev) => ({
			...prev,
			content: value,
		}));
	});

	const handleOutlineDownload = async (outlineId, price) => {
		let url = `${endpoints["vnpay"]}?amount=${
			price * 100
		}&month=6&outlineId=${outlineId}&userId=${user.id}`;
		let res = await APIs.get(url);
		console.log(res.data.url);

		window.open(res.data.url, "_blank");
		// redirectTo(res.data.url);
	};

	return (
		<Container>
			<Box p={3}>
				{loading && <LinearProgress />}
				{outlineDetail && outline && (
					<>
						<Typography
							variant="h4"
							sx={{ textAlign: "center", mt: 1, mb: 2 }}
						>
							THẢO LUẬN - ĐÓNG GÓP Ý KIẾN CHO ĐỀ CƯƠNG{" "}
							<p>
								<b
									style={{
										color: blue[500],
										textTransform: "uppercase",
									}}
								>
									{outlineDetail.subject}
								</b>
							</p>
						</Typography>
						{message.success && (
							<Alert
								className="animate__animated animate__tada"
								sx={{ marginTop: 5 }}
								severity="success"
							>
								THÔNG BÁO: Đóng góp ý kiến thành công. Cảm ơn
								bạn!
							</Alert>
						)}
						{message.error && (
							<Alert
								className="animate__animated animate__wobble"
								sx={{ marginTop: 5 }}
								severity="error"
							>
								LỖI: Kiểm tra lại thông tin thật kỹ trước khi
								đóng góp. Cảm ơn bạn!
							</Alert>
						)}
						<Grid container spacing={3}>
							<Grid item xs={12}>
								<Card className="border border-primary">
									<CardHeader>
										<Typography variant="h5">
											Mã đề cương:{" "}
											{outlineDetail.outlineId}
										</Typography>
									</CardHeader>
									<CardContent>
										<ListGroup variant="flush">
											<ListGroupItem className="text-truncate">
												<strong>Giảng viên:</strong>{" "}
												{outlineDetail.lecturer}
											</ListGroupItem>
											<ListGroupItem className="text-truncate">
												<strong>Môn học:</strong>{" "}
												{outlineDetail.subject}
											</ListGroupItem>
											<ListGroupItem className="text-truncate">
												<strong>Khoa quản lý:</strong>{" "}
												{outlineDetail.faculty}
											</ListGroupItem>
											<ListGroupItem className="text-truncate">
												<strong>Ngày bắt đầu:</strong>{" "}
												{new Date(
													outlineDetail.startedDate,
												).toLocaleDateString()}
											</ListGroupItem>
											<ListGroupItem className="text-truncate">
												<strong>Ngày kết thúc:</strong>{" "}
												{new Date(
													outlineDetail.expiredDate,
												).toLocaleDateString()}
											</ListGroupItem>
											<ListGroupItem className="text-truncate">
												<strong>Mô tả:</strong>{" "}
												{outlineDetail.description}
											</ListGroupItem>
											<ListGroupItem className="text-truncate">
												<strong>Lý thuyết:</strong>{" "}
												{outlineDetail.theory}
											</ListGroupItem>
											<ListGroupItem className="text-truncate">
												<strong>Thực hành:</strong>{" "}
												{outlineDetail.practice}
											</ListGroupItem>
										</ListGroup>
									</CardContent>
									<CardFooter>
										{isStudent(user) && (
											<AlertDialog
												title={
													"THANH TOÁN ĐỂ TẢI ĐỀ CƯƠNG"
												}
												message={`Bạn phải thanh toán ${new Intl.NumberFormat(
													"vi-VN",
													{
														style: "currency",
														currency: "VND",
													},
												).format(
													outlineDetail.price,
												)} để tải đề cương này!`}
												handleClick={
													handleOutlineDownload
												}
												itemId={outlineDetail.outlineId}
												price={outlineDetail.price}
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
									</CardFooter>
								</Card>
							</Grid>
							<Grid item xs={12}>
								<Box
									component="form"
									onSubmit={handleCommentSubmit}
									sx={{
										width: "100%",
										maxWidth: 600,
										margin: "0 auto",
										padding: 2,
										backgroundColor: "#f9f9f9",
										borderRadius: 8,
										boxShadow: "0 2px 4px rgba(0,0,0,0.1)",
										border: "1px solid #ddd",
									}}
								>
									<TextareaAutosize
										placeholder="Nhập bình luận bạn muốn đóng góp ..."
										value={newComment.content || ""}
										onChange={handleCommentChange}
										style={{
											width: "100%",
											padding: "12px",
											fontSize: "16px",
											border: "none",
											borderRadius: 8,
											resize: "none",
											boxShadow:
												"0 2px 4px rgba(0,0,0,0.1)",
											marginBottom: 16,
										}}
									/>
									<Stack
										direction={{ xs: "column", sm: "row" }}
										spacing={{ xs: 1, sm: 2 }}
										alignItems="center"
										justifyContent="flex-end"
									>
										<Button
											type="submit"
											variant="contained"
											sx={{
												bgcolor: blue[500],
												color: "#fff",
												"&:hover": {
													bgcolor: green[500],
												},
												minWidth: 120,
												minHeight: 40,
												borderRadius: 20,
											}}
											disabled={loading}
										>
											Gửi
										</Button>
										{loading && <LinearProgress />}
									</Stack>
								</Box>
							</Grid>
							<Grid item xs={12}>
								<Paper elevation={3} sx={{ p: 2 }}>
									<Typography variant="h5" gutterBottom>
										Bình luận
									</Typography>
									<Divider />
									<List
										sx={{
											width: "100%",
											bgcolor: "background.paper",
										}}
									>
										{outline.map((comment) => (
											<ListItem
												key={comment.id}
												alignItems="flex-start"
											>
												<ListItemAvatar>
													<Avatar
														sx={{
															bgcolor:
																deepPurple[500],
														}}
														src={
															comment.user.avatar
														}
													></Avatar>
												</ListItemAvatar>
												<ListItemText
													primary={comment.content}
													secondary={
														<Typography
															variant="body2"
															component="span"
															sx={{
																color: "text.secondary",
															}}
														>
															{comment.user.name}{" "}
															(@
															{
																comment.user
																	.username
															}
															) -{" "}
															{comment.user
																.role ===
															"ROLE_STUDENT"
																? "SINH VIÊN"
																: "GIẢNG VIÊN"}{" "}
															- Ngày đóng góp:{" "}
															{new Date(
																comment.createdDate,
															).toLocaleDateString()}{" "}
															-{" "}
															<b>
																{comment.positive ===
																null
																	? "Chưa đánh giá"
																	: comment.positive ===
																	  1
																	? "Tích cực"
																	: "Tiêu cực"}
															</b>
															<p>
																<b>
																	{comment.modelResponse ===
																	null
																		? ""
																		: comment.modelResponse +
																		  " - Trả lời tự động bởi PhoBERT"}
																</b>
															</p>
														</Typography>
													}
												/>
											</ListItem>
										))}
									</List>
								</Paper>
							</Grid>
						</Grid>
					</>
				)}
			</Box>
		</Container>
	);
};

export default OutlineDetailPage;
