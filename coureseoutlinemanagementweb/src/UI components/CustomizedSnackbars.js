import * as React from "react";
import Button from "@mui/material/Button";
import Snackbar from "@mui/material/Snackbar";
import Alert from "@mui/material/Alert";

export default function CustomizedSnackbars({ message = null }) {
	const [open, setOpen] = React.useState(false);

	React.useEffect(() => {
		setOpen(message !== null);
	}, [message]);

	const handleClose = (event, reason) => {
		if (reason === "clickaway") {
			return;
		}

		setOpen(false);
	};

	return (
		<div>
			{/* <Button onClick={handleClick}>Open Snackbar</Button> */}
			<Snackbar open={open} autoHideDuration={6000} onClose={handleClose}>
				<Alert
					onClose={handleClose}
					severity="success"
					variant="filled"
					sx={{ width: "100%" }}
				>
					{message}
				</Alert>
			</Snackbar>
		</div>
	);
}
