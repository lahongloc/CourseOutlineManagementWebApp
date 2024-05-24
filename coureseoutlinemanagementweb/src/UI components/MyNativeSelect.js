import Box from "@mui/material/Box";
import InputLabel from "@mui/material/InputLabel";
import FormControl from "@mui/material/FormControl";
import NativeSelect from "@mui/material/NativeSelect";
import { useState } from "react";

export default function MyNativeSelect({
	disabled = false,
	onChociceChange,
	names,
	fieldSelected = null,
	...props
}) {
	const [value, setValue] = useState("");

	return (
		<div>
			<FormControl fullWidth sx={{ width: 200 }}>
				<InputLabel variant="standard" htmlFor="uncontrolled-native">
					Khoa
				</InputLabel>
				{/* <InputLabel htmlFor={props.label}>{props.label}</InputLabel> */}
				<NativeSelect
					disabled={disabled}
					defaultValue={fieldSelected}
					inputProps={{
						name: props.label,
						id: "uncontrolled-native",
					}}
					onChange={(e) => {
						onChociceChange(e.target.value);
						setValue(e.target.value);
					}}
				>
					<option value={null}>Chọn khoa</option>
					{names.map((item, index) => {
						return (
							<option
								value={item.id}
								selected={item.id === fieldSelected}
								key={index}
							>
								{item.name}
							</option>
						);
					})}
				</NativeSelect>
			</FormControl>
		</div>
	);
}
