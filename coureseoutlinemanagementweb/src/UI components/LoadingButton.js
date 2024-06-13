import * as React from "react";
import Box from "@mui/material/Box";
import CircularProgress from "@mui/material/CircularProgress";
import { green } from "@mui/material/colors";
import Button from "@mui/material/Button";
import Fab from "@mui/material/Fab";
import CheckIcon from "@mui/icons-material/Check";
import SaveIcon from "@mui/icons-material/Save";
import SendIcon from "@mui/icons-material/Send";

export default function LoadingButton({ loading = true, action, text }) {
	return (
		<Box sx={{ display: "flex", alignItems: "center" }}>
			<Box sx={{ m: 1, position: "relative" }}>
				<Button
					endIcon={<SendIcon />}
					variant="contained"
					disabled={loading}
					onClick={action}
				>
					{text}
				</Button>
				{loading && (
					<CircularProgress
						size={24}
						sx={{
							color: green[500],
							position: "absolute",
							top: "50%",
							left: "50%",
							marginTop: "-12px",
							marginLeft: "-12px",
						}}
					/>
				)}
			</Box>
		</Box>
	);
}
