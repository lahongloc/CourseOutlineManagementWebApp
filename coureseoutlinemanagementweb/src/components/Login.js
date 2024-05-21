import { useContext, useEffect, useState } from "react";
import { Button, Form } from "react-bootstrap";
import APIs, { authApi, endpoints } from "../configs/APIs";
import cookie from "react-cookies";
import { LOGIN } from "../reducers/Actions";
import { Navigate, useSearchParams } from "react-router-dom";
import { UserContext } from "../App";

const Login = () => {
	const [user, dispatch] = useContext(UserContext);
	const [username, setUsername] = useState("");
	const [password, setPassword] = useState("");

	const [q] = useSearchParams();

	useEffect(() => {
		console.log("cookie of user: ", cookie.load("token"));
		console.log("current user: ", user);
	});

	const login = (evt) => {
		evt.preventDefault();
		const process = async () => {
			try {
				let res = await APIs.post(endpoints["login"], {
					username,
					password,
				});
				console.log(res.data);
				cookie.save("token", res.data.token);
				cookie.save("user", res.data.currentUser);

				dispatch({
					type: LOGIN,
					payload: res.data.currentUser,
				});
			} catch (err) {
				console.error(err);
			}
		};

		process();
	};

	if (user !== null) {
		let next = q.get("next") || "/";
		return <Navigate to={next} />;
	}

	return (
		<>
			<h1 className="text-center text-info">ĐĂNG NHẬP NGƯỜI DÙNG</h1>

			<Form onSubmit={login}>
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
