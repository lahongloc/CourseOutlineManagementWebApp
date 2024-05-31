import * as React from "react";
import { styled } from "@mui/system";
import { TextareaAutosize } from "@mui/material";

const MyTextarea = ({ placeholder, handleValueChange, valueItem }) => {
	const ref = React.useRef();

	// const Textarea = styled(TextareaAutosize)(
	// 	({ theme }) => `
	// margin-left: 0.5rem;
	// margin-top: 0.75rem;
	// box-sizing: border-box;
	// width: 100%;
	// font-family: 'IBM Plex Sans', sans-serif;
	// font-size: 0.875rem;
	// font-weight: 400;
	// line-height: 1.5;
	// padding: 8px 12px;
	// border-radius: 8px;
	// color: ${theme.palette.mode === "dark" ? grey[300] : grey[900]};
	// background: ${theme.palette.mode === "dark" ? grey[900] : "#fff"};
	// border: 1px solid ${theme.palette.mode === "dark" ? grey[700] : grey[200]};
	// box-shadow: 0px 2px 2px ${
	// 	theme.palette.mode === "dark" ? grey[900] : grey[50]
	// };`,
	// );

	// &:hover {
	//   border-color: ${blue[400]};
	// }

	// &:focus {
	//   border-color: ${blue[400]};
	//   box-shadow: 0 0 0 3px ${
	// 		theme.palette.mode === "dark" ? blue[600] : blue[200]
	// 	};
	// }

	//
	//   `,
	// );

	return (
		<TextareaAutosize
			style={{
				marginLeft: "0.5rem",
				marginTop: "0.75rem",
				boxSizing: "border-box",
				width: "100%",
				fontFamily: "IBM Plex Sans, sans-serif",
				fontSize: "0.875rem",
				fontWeight: 400,
				lineHeight: 1.5,
				padding: "8px 12px",
				borderRadius: "8px",
				outline: "none",
				border: "none",
				boxShadow:
					"rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px",
			}}
			type="text"
			aria-label="minimum height"
			minRows={3}
			value={valueItem}
			placeholder={placeholder}
			onChange={handleValueChange}
		/>
	);
};

export default React.memo(MyTextarea);
