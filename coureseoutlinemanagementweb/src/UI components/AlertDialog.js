import * as React from "react";
import Button from "@mui/material/Button";
import Dialog from "@mui/material/Dialog";
import DialogActions from "@mui/material/DialogActions";
import DialogContent from "@mui/material/DialogContent";
import DialogContentText from "@mui/material/DialogContentText";
import DialogTitle from "@mui/material/DialogTitle";

export default function AlertDialog({
	icon = null,
	price = null,
	handleClick = null,
	itemId = null,
	message = null,
	title = null,
}) {
	const [open, setOpen] = React.useState(false);

	const handleClickOpen = () => {
		setOpen(true);
	};

	const handleClose = () => {
		setOpen(false);
	};

	const handleAgree = () => {
		handleClick(itemId, price);
		setOpen(false);
	};

	return (
		<React.Fragment>
			<Button variant="outlined" onClick={handleClickOpen}>
				{new Intl.NumberFormat("vi-VN", {
					style: "currency",
					currency: "VND",
				}).format(price)}
				{icon}
			</Button>
			<Dialog
				open={open}
				onClose={handleClose}
				aria-labelledby="alert-dialog-title"
				aria-describedby="alert-dialog-description"
			>
				<DialogTitle id="alert-dialog-title">{title}</DialogTitle>
				<DialogContent>
					<DialogContentText id="alert-dialog-description">
						{message}
					</DialogContentText>
				</DialogContent>
				<DialogActions>
					<Button onClick={handleClose}>Từ chối</Button>
					<Button onClick={handleAgree} autoFocus>
						Đồng ý
					</Button>
				</DialogActions>
			</Dialog>
		</React.Fragment>
	);
}
