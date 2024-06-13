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
import ControlledOpenSelect from "./ControlledOpenSelect";

const IncreaseTable = ({
	cells,
	fields,
	handleScoreChange,
	addField,
	deleteField,
	maxIncrease = null,
	currentItemNumber = null,
	...props
}) => {
	const [assessment, setAssessment] = React.useState("");

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
					{fields.map((item, index) => {
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
									<ControlledOpenSelect
										label={"Cột điểm"}
										scoreItem={item.id}
										names={props.scores}
										onChociceChange={(value) => {
											handleScoreChange(
												index,
												"id",
												value,
											);

											const assessment =
												props.scores.find(
													(element) =>
														element.id === value,
												)?.assessment;

											handleScoreChange(
												index,
												"assessment",
												assessment,
											);

											const name = props.scores.find(
												(element) =>
													element.id === value,
											)?.name;

											handleScoreChange(
												index,
												"name",
												assessment,
											);
										}}
									/>
								</TableCell>
								<TableCell align="right">
									{item.assessment}
								</TableCell>
								<TableCell align="right">
									<TextField
										id="standard-basic"
										variant="standard"
										value={item.percent ?? ""}
										onChange={(e) => {
											handleScoreChange(
												index,
												"percent",
												e.target.value,
											);
										}}
									/>
									%
								</TableCell>
								{index > 1 && (
									<TableCell align="right">
										<IconButton
											color="secondary"
											aria-label="add an alarm"
											sx={{
												padding: 1,
											}}
											onClick={() => deleteField(index)}
										>
											<FontAwesomeIcon
												icon={faXmark}
												style={{ color: "#cb2027" }}
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
						{currentItemNumber < maxIncrease && (
							<TableCell align="right">
								<IconButton
									color="secondary"
									aria-label="add an alarm"
									sx={{
										padding: 1,
										boxShadow:
											"rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px",
									}}
									onClick={addField}
								>
									<FontAwesomeIcon
										icon={faPlus}
										style={{ color: "#6e51c8" }}
									/>
								</IconButton>
							</TableCell>
						)}
					</TableRow>
				</TableBody>
			</Table>
		</TableContainer>
	);
};

export default IncreaseTable;
