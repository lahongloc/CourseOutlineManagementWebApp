import { useEffect, useState } from "react";
import { Form } from "react-bootstrap";

const LecturerRegister = () => {
	const [lecturer, setLecturer] = useState({});

	useEffect(() => {
		console.log(lecturer);
	});
	return (
		<>
			<Form.Group>
				<Form.Label>Tên đăng nhập</Form.Label>
				<Form.Control
					value={lecturer.username || ""}
					onChange={(e) =>
						setLecturer((prev) => ({
							...prev,
							username: e.target.value,
						}))
					}
				/>
				<Form.Label>Mật khẩu</Form.Label>
				<Form.Control
					value={lecturer.password || ""}
					onChange={(e) =>
						setLecturer((prev) => ({
							...prev,
							password: e.target.value,
						}))
					}
				/>
			</Form.Group>
		</>
	);
};

export default LecturerRegister;
