import React, { useContext, useEffect, useState } from "react";
import {
	Autocomplete,
	TextField,
	Button,
	List,
	ListItem,
	ListItemText,
	Paper,
	ListItemAvatar,
	Avatar,
	Typography,
} from "@mui/material";
import {
	collection,
	doc,
	query,
	orderBy,
	onSnapshot,
	addDoc,
	serverTimestamp,
} from "firebase/firestore";
import { db } from "../configs/Firebase";
import { NonAdminUsersContext, UserContext } from "../App";
import Login from "./Login";
import { blue } from "@mui/material/colors";
import { isLecturer } from "../UserAuthorization/UserAuthoriation";
import LinearBuffer from "../UI components/LinearBuffer";

const ChatComponent = () => {
	const [user] = useContext(UserContext);
	const [selectedReceiver, setSelectedReceiver] = useState(null);
	const nonAdminUsers = useContext(NonAdminUsersContext);
	const [messages, setMessages] = useState([]);
	const [messageContent, setMessageContent] = useState("");
	const [filteredUsers, setFilteredUsers] = useState([]);

	const handleReceiverSelect = (event, newValue) => {
		setSelectedReceiver(newValue ? newValue.email : null);
	};

	useEffect(() => {
		if (user && user.role === "ROLE_STUDENT") {
			// Thực hiện filter nonAdminUsers khi Student đăng nhập (chỉ được nhắn tin với giảng viên)
			const filtered = nonAdminUsers.filter(
				(u) => u.role === "ROLE_LECTURER" && u.role !== user.role,
			);
			console.log("a: ", nonAdminUsers)
			setFilteredUsers(filtered);
		}
		if (user && selectedReceiver) {
			const sortedUsers = [user.email, selectedReceiver].sort();
			const chatId = `${sortedUsers[0]}_${sortedUsers[1]}`;
			const chatDocRef = doc(db, "chats", chatId);
			const messagesRef = collection(chatDocRef, "messages");
			const q = query(messagesRef, orderBy("timestamp"));

			const unsubscribe = onSnapshot(q, (querySnapshot) => {
				const messageList = [];
				querySnapshot.forEach((doc) => {
					messageList.push(doc.data());
				});
				setMessages(messageList);
			});

			return () => unsubscribe();
		}
	}, [user, selectedReceiver]);

	const handleSubmit = async (e) => {
		e.preventDefault();
		if (messageContent.trim() === "" || !selectedReceiver) return;

		try {
			const sortedUsers = [user.email, selectedReceiver].sort();
			const chatId = `${sortedUsers[0]}_${sortedUsers[1]}`;
			const chatDocRef = doc(db, "chats", chatId);
			const messagesRef = collection(chatDocRef, "messages");

			await addDoc(messagesRef, {
				sender: user.email,
				receiver: selectedReceiver,
				content: messageContent,
				timestamp: serverTimestamp(),
			});

			setMessageContent("");
		} catch (error) {
			console.error("Error sending message:", error);
		}
	};

	return (
		<>
			{user ? (
				<div className="App container">
					<Typography
						variant="h4"
						sx={{ textAlign: "center", mt: 4, mb: 4 }}
					>
						NHẮN TIN TRỰC TUYẾN THỜI GIAN THỰC SỬ DỤNG{" "}
						<p>
							<b style={{ color: blue[500] }}>FIREBASE</b>
						</p>
					</Typography>
					<div>
						{isLecturer(user) ? (
							<Autocomplete
								disablePortal
								id="receiver-select"
								options={nonAdminUsers}
								getOptionLabel={(option) => option.email}
								onChange={handleReceiverSelect}
								sx={{ width: "100%" }}
								renderInput={(params) => (
									<TextField
										{...params}
										label="Chọn người muốn gửi tin nhắn"
									/>
								)}
							/>
						) : (
							<Autocomplete
								disablePortal
								id="receiver-select"
								options={filteredUsers}
								getOptionLabel={(option) => option.email}
								onChange={handleReceiverSelect}
								sx={{ width: "100%" }}
								renderInput={(params) => (
									<React.Fragment>
										<TextField
											{...params}
											label="Chọn người muốn gửi tin nhắn"
										/>
									</React.Fragment>
								)}
							/>
						)}
					</div>
					{selectedReceiver && (
						<>
							<Paper
								style={{
									maxHeight: 400,
									overflow: "auto",
									marginTop: 20,
									marginBottom: 20,
								}}
							>
								<List>
									{messages.map((message, index) => (
										<ListItem
											key={index}
											style={{
												justifyContent:
													message.sender ===
													user.email
														? "flex-end"
														: "flex-start",
											}}
										>
											<ListItemAvatar>
												<Avatar>
													{message.sender
														.charAt(0)
														.toUpperCase()}
												</Avatar>
											</ListItemAvatar>
											<ListItemText
												primary={message.content}
												secondary={`Sent by: ${message.sender}`}
												style={{
													textAlign:
														message.sender ===
														user.email
															? "right"
															: "left",
													backgroundColor:
														message.sender ===
														user.email
															? "#dcf8c6"
															: "#fff",
													borderRadius: "10px",
													padding: "10px",
													maxWidth: "60%",
												}}
											/>
										</ListItem>
									))}
								</List>
							</Paper>
							<form
								onSubmit={handleSubmit}
								style={{
									display: "flex",
									alignItems: "center",
									marginTop: 20,
								}}
							>
								<TextField
									type="text"
									value={messageContent}
									onChange={(e) =>
										setMessageContent(e.target.value)
									}
									placeholder="Type your message..."
									fullWidth
									variant="outlined"
									sx={{ marginRight: 2 }}
								/>
								<Button
									type="submit"
									variant="contained"
									color="primary"
								>
									Gửi
								</Button>
							</form>
						</>
					)}
				</div>
			) : (
				<Login />
			)}
		</>
	);
};

export default ChatComponent;
