import * as React from "react";
import Box from "@mui/material/Box";
import { SimpleTreeView } from "@mui/x-tree-view/SimpleTreeView";
import { TreeItem } from "@mui/x-tree-view/TreeItem";
import { useContext } from "react";
import { AcademicYearContext, FacultyContext, SubjectsContext } from "../App";

export default function BasicSimpleTreeView({ setSelectedItem }) {
	const faculties = useContext(FacultyContext);
	const subjects = useContext(SubjectsContext);
	const academicYears = useContext(AcademicYearContext);

	// nhóm 2 khóa liên tiếp
	function groupAcademicYears(academicYears) {
		let groupedYears = [];

		for (let i = 0; i < academicYears.length; i += 2) {
			const startYear = academicYears[i].name.split("-")[0].trim();
			const endYear = academicYears[i + 1].name.split("-")[0].trim();
			const groupYear = `${startYear}-${endYear}`;

			groupedYears.push({
				id: academicYears[i].id,
				name: groupYear,
			});
		}

		return groupedYears;
	}

	const groupedAcademicYears = groupAcademicYears(academicYears);

	const tree = [
		{
			name: "Đề cương theo khoa",
			levels: faculties,
		},
		{
			name: "Các môn học",
			levels: subjects,
		},
		{
			name: "Hai khóa liên tiếp",
			levels: groupedAcademicYears,
		},
	];

	const handleItemSelect = (category, item) => {
		setSelectedItem({ category, item });
	};

	return (
		<Box position="fixed" sx={{ height: 220, flexGrow: 1, maxWidth: 300 }}>
			<SimpleTreeView>
				{tree.map((item, index) => {
					return (
						<TreeItem key={index} itemId={index} label={item.name}>
							<Box
								sx={{
									maxHeight: 150,
									overflowY: "auto",
								}}
							>
								{item.levels.map((branch, index2) => {
									return (
										<TreeItem
											key={branch.name + index2}
											itemId={branch.name + index2}
											label={branch.name}
											onClick={() =>
												handleItemSelect(
													item.name,
													branch,
												)
											}
										/>
									);
								})}
							</Box>
						</TreeItem>
					);
				})}
			</SimpleTreeView>
		</Box>
	);
}
