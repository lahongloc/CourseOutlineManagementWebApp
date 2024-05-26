import * as React from "react";
import Breadcrumbs from "@mui/material/Breadcrumbs";
import Typography from "@mui/material/Typography";
import Stack from "@mui/material/Stack";
import NavigateNextIcon from "@mui/icons-material/NavigateNext";
import { Link } from "react-router-dom";

function handleClick(event) {
	event.preventDefault();
	console.info("You clicked a breadcrumb.");
}

export default function CustomSeparator({ ...props }) {
	return (
		<Stack spacing={2}>
			<Breadcrumbs separator="›" aria-label="breadcrumb">
				{props.levels.map((level, index) => {
					return (
						<Link
							style={{ textDecoration: "none" }}
							underline="hover"
							key={index + 1}
							color="inherit"
							to={level.link}
						>
							{level.name}
						</Link>
					);
				})}
			</Breadcrumbs>
		</Stack>
	);
}
