import * as React from "react";
import Box from "@mui/material/Box";
import Card from "@mui/material/Card";
import CardActions from "@mui/material/CardActions";
import CardContent from "@mui/material/CardContent";
import Button from "@mui/material/Button";
import Typography from "@mui/material/Typography";
import { useNavigate } from "react-router-dom";

const bull = (
	<Box
		component="span"
		sx={{ display: "inline-block", mx: "2px", transform: "scale(0.8)" }}
	>
		•
	</Box>
);

export default function OutlinedCard({
	name,
	lecturer,
	description,
	outlineId,
	status,
}) {
	const nav = useNavigate();

	const card = (
		<React.Fragment>
			<CardContent>
				<Typography variant="h5" component="div">
					{name}
				</Typography>
				<Typography sx={{ mb: 1.5 }} color="text.secondary">
					Author: {lecturer}
				</Typography>
				<Typography variant="body2">{description}</Typography>
			</CardContent>
			<CardActions>
				<Button
					onClick={() => {
						if (status === "HOLDING") {
							nav(`/outline-compiling/?outlineId=${outlineId}`);
						} else if (status === "ACCEPTED") {
							nav(`/detail-page/${outlineId}`);
						}
					}}
					size="small"
				>
					XEM CHI TIẾT
				</Button>
			</CardActions>
		</React.Fragment>
	);

	return (
		<Box
			sx={{
				width: "30%",
				maxWidth: "35%",
				marginBottom: 3,
				marginRight: 3,
				boxShadow:
					"rgba(17, 17, 26, 0.1) 0px 4px 16px, rgba(17, 17, 26, 0.1) 0px 8px 24px, rgba(17, 17, 26, 0.1) 0px 16px 56px",
				borderRadius: 2,
			}}
		>
			<Card
				sx={{ borderRadius: 2, position: "relative" }}
				variant="outlined"
			>
				{/* <svg
					style={{ position: "absolute", bottom: 0 }}
					xmlns="http://www.w3.org/2000/svg"
					viewBox="0 0 1440 320"
				>
					<path
						fill="#0099ff"
						fill-opacity="0.25"
						d="M0,288L30,266.7C60,245,120,203,180,192C240,181,300,203,360,218.7C420,235,480,245,540,240C600,235,660,213,720,202.7C780,192,840,192,900,197.3C960,203,1020,213,1080,186.7C1140,160,1200,96,1260,64C1320,32,1380,32,1410,32L1440,32L1440,320L1410,320C1380,320,1320,320,1260,320C1200,320,1140,320,1080,320C1020,320,960,320,900,320C840,320,780,320,720,320C660,320,600,320,540,320C480,320,420,320,360,320C300,320,240,320,180,320C120,320,60,320,30,320L0,320Z"
					></path>
				</svg> */}

				{card}
			</Card>
		</Box>
	);
}
