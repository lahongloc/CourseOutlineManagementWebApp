import * as React from "react";
import InputLabel from "@mui/material/InputLabel";
import MenuItem from "@mui/material/MenuItem";
import FormControl from "@mui/material/FormControl";
import Select from "@mui/material/Select";
import Button from "@mui/material/Button";

function ControlledOpenSelect({
	onChociceChange,
	names,
	fieldSelected = null,
	...props
}) {
	const [value, setValue] = React.useState("");
	const [open, setOpen] = React.useState(false);

	const handleClose = () => {
		setOpen(false);
	};

	const handleOpen = () => {
		setOpen(true);
	};

	return (
		<div>
			<FormControl variant="outlined" fullWidth sx={{ minWidth: 120 }}>
				<InputLabel id="demo-controlled-open-select-label">
					{props.label}
				</InputLabel>
				<Select
					labelId="demo-controlled-open-select-label"
					id="demo-controlled-open-select"
					open={open}
					onClose={handleClose}
					onOpen={handleOpen}
					value={value}
					label={props.label}
					onChange={(e) => {
						onChociceChange(e.target.value);
						setValue(e.target.value);
					}}
				>
					{names.map((item, index) => {
						return (
							<MenuItem key={index} value={item.id}>
								{item.name}
							</MenuItem>
						);
					})}
				</Select>
			</FormControl>
		</div>
	);
}

export default React.memo(ControlledOpenSelect);
