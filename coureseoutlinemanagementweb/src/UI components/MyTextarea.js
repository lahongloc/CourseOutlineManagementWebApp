import * as React from "react";
import { styled } from "@mui/system";
import { TextareaAutosize } from "@mui/material";

const MyTextarea = ({ placeholder, handleValueChange, valueItem }) => {
	const ref = React.useRef();
	
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
