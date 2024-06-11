import { useContext, useEffect, useState } from "react";
import { UserContext } from "../App";
import APIs, { endpoints } from "../configs/APIs";
import OutlinedCard from "../UI components/OutlinedCard";
import { Alert, AlertTitle, Box, Container } from "@mui/material";
import { width } from "@fortawesome/free-brands-svg-icons/fa42Group";

const MyOutline = ({ status }) => {
	const [user, dispatch] = useContext(UserContext);
	const [outlines, setOutlines] = useState();
	const [loading, setLoading] = useState(false);

	const loadMyOutlines = async () => {
		setLoading(false);
		let url = `${endpoints["getOutlines"]}`;
		if (user) url = `${url}?lecturerId=${user.id}`;
		if (status) url = `${url}&status=${status}`;

		try {
			const res = await APIs.get(url);
			setOutlines(res.data);
		} catch (err) {
			console.error(err);
		} finally {
			setLoading(true);
		}
	};

	useEffect(() => {
		console.info("Outlines: ", outlines)
	})

	useEffect(() => {
		loadMyOutlines();
	}, [status]);

	return (
		<>
			<Alert severity="info">
				<AlertTitle>ĐỀ CƯƠNG</AlertTitle>
				{(status === "HOLDING" &&
					"Đây là các đề cương đang trong quá trình biên soạn!") ||
					"Đây là các đề cương bạn đã biên soạn!"}
			</Alert>
			<Box
				sx={{
					display: "flex",
					justifyContent: "space-evenly",
					margin: 5,
					marginTop: 7,
					flexWrap: "wrap",
					alignItems: "center",
				}}
			>
				{loading &&
					outlines.map((o, index) => {
						const props = {
							name: o.subject,
							lecturer: o.lecturer,
							description: o.description,
							outlineId: o.outlineId,
						};
						return (
							<OutlinedCard
								{...props}
								sx={{ width: "25%" }}
								key={index}
							/>
						);
					})}
			</Box>
		</>
	);
};

export default MyOutline;
