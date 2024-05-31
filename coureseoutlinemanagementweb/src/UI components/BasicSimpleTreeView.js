import * as React from "react";
import Box from "@mui/material/Box";
import { SimpleTreeView } from "@mui/x-tree-view/SimpleTreeView";
import { TreeItem } from "@mui/x-tree-view/TreeItem";

export default function BasicSimpleTreeView({}) {
	const tree = [
		{
			name: "Danh sách đề cương",
			levels: [
				{
					name: "Công nghệ thông tin",
				},
				{
					name: "Ngoại ngữ",
				},
				{
					name: "Tài chính - ngân hàng",
				},
			],
		},
		{
			name: "Các môn học cần soạn đề cương",
			levels: [
				{
					name: "Toán cao cấp",
				},
				{
					name: "Thiết kế Web",
				},
			],
		},
	];
	return (
		<Box sx={{ height: 0, flexGrow: 1, maxWidth: 300 }}>
			<SimpleTreeView>
				{tree.map((item, index) => {
					return (
						<TreeItem key={index} itemId={index} label={item.name}>
							{item.levels.map((branch, index2) => {
								return (
									<TreeItem
										key={branch.name + index2}
										itemId={branch.name + index2}
										label={branch.name}
									/>
								);
							})}
						</TreeItem>
					);
				})}
			</SimpleTreeView>
		</Box>
	);
}
