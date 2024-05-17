import { useState } from "react";
import { Button, Form } from "react-bootstrap";
import APIs, { endpoints } from "../configs/APIs";

const Login = () => {
	const [username, setUsername] = useState("");
	const [password, setPassword] = useState("");

	const login = async () => {
		try {
			let res = await APIs.post(endpoints["login"], {
				username,
				password,
			});
			console.log(res.data);
		} catch (err) {
			console.error(err);
		}
	};

	return (
		<>
			<button onClick={login}>DN</button>
			<h1 className="text-center text-info">ĐĂNG NHẬP NGƯỜI DÙNG</h1>

			<Form>
				<Form.Group
					className="mb-3"
					controlId="exampleForm.ControlInput1"
				>
					<Form.Label>Tên đăng nhập</Form.Label>
					<Form.Control
						onChange={(e) => setUsername(e.target.value)}
						type="text"
						placeholder="Tên đăng nhập"
					/>
				</Form.Group>
				<Form.Group
					className="mb-3"
					controlId="exampleForm.ControlInput1"
				>
					<Form.Label>Mật khẩu</Form.Label>
					<Form.Control
						onChange={(e) => setPassword(e.target.value)}
						type="password"
						placeholder="Mật khẩu"
					/>
				</Form.Group>
				<Form.Group
					className="mb-3"
					controlId="exampleForm.ControlInput1"
				>
					<Button variant="info" type="submit">
						Đăng nhập
					</Button>
				</Form.Group>
			</Form>
		</>
	);
};

export default Login;
