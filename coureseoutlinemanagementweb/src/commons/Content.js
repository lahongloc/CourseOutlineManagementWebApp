import * as React from "react";
import { styled } from "@mui/material/styles";
import Box from "@mui/material/Box";
import Paper from "@mui/material/Paper";
import Grid from "@mui/material/Grid";
import BasicSimpleTreeView from "../UI components/BasicSimpleTreeView";
import Home from "../Outline/Home";
import { Container } from "@mui/material";
import { useState } from "react";

const Item = styled(Paper)(({ theme }) => ({
	backgroundColor: theme.palette.mode === "dark" ? "#1A2027" : "#fff",
	...theme.typography.body2,
	padding: theme.spacing(1),
	textAlign: "center",
	color: theme.palette.text.secondary,
}));

const FixedGrid = styled(Grid)(({ theme }) => ({
	position: "fixed",
	top: 65,
	left: 0,
	bottom: 0,
	width: "25%", // Bạn có thể điều chỉnh width tùy ý
	overflow: "auto",
	borderRight: `1px solid ${theme.palette.divider}`,
}));

export default function Content() {
	const [selectedItem, setSelectedItem] = useState(null);

	return (
		<Box sx={{ flexGrow: 1, marginTop: 12 }}>
			<Grid container spacing={2}>
				<FixedGrid item xs={2.6}>
					<BasicSimpleTreeView setSelectedItem={setSelectedItem} />
				</FixedGrid>
				<Grid item xs={9} sx={{ ml: "24%" }}>
					<Container>
						<Home selectedItem={selectedItem} />
					</Container>
				</Grid>
			</Grid>
		</Box>
	);
}
