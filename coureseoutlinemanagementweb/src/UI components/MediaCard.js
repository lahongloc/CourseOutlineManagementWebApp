import { Grid, InputLabel, Paper, TextField } from "@mui/material";
import { useEffect, useState } from "react";

export default function MediaCard({ account }) {
	const [accInfo, setAccInfo] = useState({});

	useEffect(() => {
		setAccInfo(account);
	}, []);

	return (
		<>
			<Grid sx={{ flexGrow: 1 }} container spacing={2}>
				<Grid item xs={12}>
					<Grid container justifyContent="center" spacing={2}>
						{Object.keys(accInfo).map((field, index) => (
							<Grid key={index} item>
								<InputLabel htmlFor={field}>{field}</InputLabel>
								<TextField
									// disabled
									id={field}
									value={accInfo[field]}
									variant="outlined"
									// onChange={e => setAccInfo(prev => {
									// 	return {...prev, }
									// })}
								/>
							</Grid>
						))}
					</Grid>
				</Grid>
			</Grid>{" "}
		</>
	);
}
