import * as React from "react";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TableRow from "@mui/material/TableRow";
import Paper from "@mui/material/Paper";
import { Button, IconButton, TextField } from "@mui/material";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faPlus, faXmark } from "@fortawesome/free-solid-svg-icons";

const IncreaseTable = ({
	cells,
	fields,
	handleFieldChange,
	addField,
	deleteField,
}) => {
	return (
		<TableContainer sx={{ marginTop: 2 }} component={Paper}>
			<Table sx={{ minWidth: 650 }} aria-label="simple table">
				<TableHead>
					<TableRow>
						{cells.map((c, index) => {
							return (
								<TableCell
									align={index !== 0 ? "right" : "justify"}
									key={index}
								>
									{c}
								</TableCell>
							);
						})}
					</TableRow>
				</TableHead>
				<TableBody>
					{fields.map((field, index) => {
						return (
							<TableRow
								sx={{
									"&:last-child td, &:last-child th": {
										border: 0,
									},
								}}
								key={index}
							>
								<TableCell component="th" scope="row">
									<TextField
										id="standard-basic"
										variant="standard"
										value={field.name}
										onChange={(e) =>
											handleFieldChange(
												index,
												"name",
												e.target.value,
											)
										}
									/>
								</TableCell>
								<TableCell align="right">
									<TextField
										id="standard-basic"
										variant="standard"
										value={field.assessment}
										onChange={(e) =>
											handleFieldChange(
												index,
												"assessment",
												e.target.value,
											)
										}
									/>
								</TableCell>
								<TableCell align="right">
									<TextField
										id="standard-basic"
										variant="standard"
										value={field.percent}
										type="number"
										onChange={(e) =>
											handleFieldChange(
												index,
												"percent",
												e.target.value,
											)
										}
									/>
									%
								</TableCell>
								{index > 1 && (
									<TableCell align="right">
										<IconButton
											color="secondary"
											aria-label="add an alarm"
											sx={{ padding: 1 }}
											// onClick={() =>
											// 	setFields((prev) => {
											// 		return prev.filter(
											// 			(f, i) => i !== index,
											// 		);
											// 	})
											// }
											onClick={() => deleteField(index)}
										>
											<FontAwesomeIcon
												icon={faXmark}
												style={{ color: "#6e51c8" }}
											/>
										</IconButton>
									</TableCell>
								)}
							</TableRow>
						);
					})}

					<TableRow
						sx={{
							"&:last-child td, &:last-child th": {
								border: 0,
							},
						}}
					>
						<TableCell component="th" scope="row"></TableCell>
						<TableCell align="right"></TableCell>
						<TableCell align="right"></TableCell>
						<TableCell align="right">
							<IconButton
								color="secondary"
								aria-label="add an alarm"
								sx={{ padding: 1 }}
								onClick={addField}
							>
								<FontAwesomeIcon
									icon={faPlus}
									style={{ color: "#6e51c8" }}
								/>
							</IconButton>
						</TableCell>
					</TableRow>
				</TableBody>
			</Table>
		</TableContainer>
	);
};

export default IncreaseTable;
