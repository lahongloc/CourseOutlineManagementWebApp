import * as React from "react";
import Typography from "@mui/material/Typography";
import Pagination from "@mui/material/Pagination";
import Stack from "@mui/material/Stack";

export default function PaginationControlled({ count, page, pageChange }) {
	return (
		<Stack spacing={2}>
			<Typography><b>Trang: {page}</b></Typography>
			<Pagination count={count} page={page} onChange={pageChange} />
		</Stack>
	);
}
