import * as React from "react";
import Avatar from "@mui/material/Avatar";
import Chip from "@mui/material/Chip";
import Stack from "@mui/material/Stack";

export default function AvatarChip({ avatar, name }) {
	return (
		<Stack direction="row" spacing={1}>
			<Chip
				avatar={<Avatar alt="Natacha" src={avatar} />}
				sx={{ color: "#fff", height: 40 }}
				label={name}
				variant="primary"
			/>
		</Stack>
	);
}
