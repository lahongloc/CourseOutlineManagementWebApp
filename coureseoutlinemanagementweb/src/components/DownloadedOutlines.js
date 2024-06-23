import { DataGrid } from "@mui/x-data-grid";
import MyDataGrid from "../UI components/MyDataGrid";
import { Container } from "@mui/material";
import { useContext, useEffect, useState } from "react";
import { UserContext } from "../App";
import APIs, { endpoints } from "../configs/APIs";
import LinearBuffer from "../UI components/LinearBuffer";
const DownloadedOutlines = () => {
	const [user, dispatch] = useContext(UserContext);
	const [outlinesDocoments, setOutlineDocuments] = useState([]);
	const [loading, setLoading] = useState(false);
	const [columns, setColumns] = useState([]);
	const [rows, setRows] = useState([]);

	useEffect(() => {
		const r = outlinesDocoments.map((o) => ({
			id: o.outlineId,
			outlineName: o.outlineName,
			link: o.url,
		}));
		setColumns([
			{ field: "id", headerName: "ID", width: 90 },
			{
				field: "outlineName",
				headerName: "Tên đề cương",
				width: 300,
				editable: true,
			},
			{
				field: "link",
				headerName: "Đường dẫn file",
				width: 710,
				editable: true,
			},
		]);

		setRows(r);
	}, [outlinesDocoments]);

	// const rows = [{ id: 10, outlineName: "toan roi rac", link: "fnjnnadnd" }];

	const loadOutlineDocuments = async () => {
		setLoading(true);
		try {
			let url = `${endpoints["getDownloadedOutlineDocument"]}${user.id}/`;
			let res = await APIs.get(url);
			console.log("jahbab", res.data);
			setOutlineDocuments(res.data);
		} catch (err) {
			console.error(err);
		} finally {
			setLoading(false);
		}
	};

	useEffect(() => {
		loadOutlineDocuments();
	}, []);

	return (
		<Container sx={{ marginTop: 20 }}>
			{loading && <LinearBuffer />}
			<MyDataGrid columns={columns} rows={rows} />
		</Container>
	);
};

export default DownloadedOutlines;
