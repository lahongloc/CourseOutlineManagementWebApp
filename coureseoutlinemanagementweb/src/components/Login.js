import { useContext, useEffect, useState } from "react";
import APIs, { authApi, endpoints } from "../configs/APIs";
import cookie from "react-cookies";
import { LOGIN } from "../reducers/Actions";
import { Navigate, useSearchParams } from "react-router-dom";
import { UserContext } from "../App";
import * as React from "react";
import Avatar from "@mui/material/Avatar";
import CssBaseline from "@mui/material/CssBaseline";
import TextField from "@mui/material/TextField";
import FormControlLabel from "@mui/material/FormControlLabel";
import Checkbox from "@mui/material/Checkbox";
import Link from "@mui/material/Link";
import Grid from "@mui/material/Grid";
import Box from "@mui/material/Box";
import LockOutlinedIcon from "@mui/icons-material/LockOutlined";
import Typography from "@mui/material/Typography";
import Container from "@mui/material/Container";
import { createTheme, ThemeProvider } from "@mui/material/styles";
import { Button } from "@mui/material";

function Copyright(props) {
	return (
		<Typography
			variant="body2"
			color="text.secondary"
			align="center"
			{...props}
		>
			{"Copyright © "}
			<Link color="inherit" href="https://mui.com/">
				Your Website
			</Link>{" "}
			{new Date().getFullYear()}
			{"."}
		</Typography>
	);
}

const defaultTheme = createTheme();

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
		<ThemeProvider theme={defaultTheme}>
			<Container component="main" maxWidth="xs">
				<CssBaseline />
				<Box
					sx={{
						marginTop: 8,
						display: "flex",
						flexDirection: "column",
						alignItems: "center",
					}}
				>
					<Avatar sx={{ m: 1, bgcolor: "secondary.main" }}>
						<LockOutlinedIcon />
					</Avatar>
					<Typography component="h1" variant="h5">
						Đăng nhập
					</Typography>
					<Box
						component="form"
						onSubmit={login}
						noValidate
						sx={{ mt: 1 }}
					>
						<TextField
							margin="normal"
							required
							fullWidth
							id="username"
							label="Tên đăng nhập"
							autoComplete="username"
							autoFocus
							value={username}
							onChange={(e) => setUsername(e.target.value)}
						/>
						<TextField
							margin="normal"
							required
							fullWidth
							label="Mật khẩu"
							type="password"
							id="password"
							autoComplete="current-password"
							value={password}
							onChange={(e) => setPassword(e.target.value)}
						/>
						<FormControlLabel
							control={
								<Checkbox value="remember" color="primary" />
							}
							label="Lưu mật khẩu"
						/>
						<Button
							type="submit"
							fullWidth
							variant="contained"
							sx={{ mt: 3, mb: 2 }}
						>
							Đăng nhập
						</Button>
						<Grid container>
							<Grid item xs>
								<Link href="#" variant="body2">
									Quên mật khẩu?
								</Link>
							</Grid>
							<Grid item>
								<Link href="/lecturer-signup" variant="body2">
									{"Bạn chưa có tài khoản? Đăng ký"}
								</Link>
							</Grid>
						</Grid>
					</Box>
				</Box>
				<Copyright sx={{ mt: 8, mb: 4 }} />
			</Container>
		</ThemeProvider>
		// <>
		// 	<h1 className="text-center text-info">ĐĂNG NHẬP NGƯỜI DÙNG</h1>

		// 	<Form onSubmit={login}>
		// 		<Form.Group
		// 			className="mb-3"
		// 			controlId="exampleForm.ControlInput1"
		// 		>
		// 			<Form.Label>Tên đăng nhập</Form.Label>
		// 			<Form.Control
		// 				onChange={(e) => setUsername(e.target.value)}
		// 				type="text"
		// 				placeholder="Tên đăng nhập"
		// 			/>
		// 		</Form.Group>
		// 		<Form.Group
		// 			className="mb-3"
		// 			controlId="exampleForm.ControlInput1"
		// 		>
		// 			<Form.Label>Mật khẩu</Form.Label>
		// 			<Form.Control
		// 				onChange={(e) => setPassword(e.target.value)}
		// 				type="password"
		// 				placeholder="Mật khẩu"
		// 			/>
		// 		</Form.Group>
		// 		<Form.Group
		// 			className="mb-3"
		// 			controlId="exampleForm.ControlInput1"
		// 		>
		// 			<Button variant="info" type="submit">
		// 				Đăng nhập
		// 			</Button>
		// 		</Form.Group>
		// 	</Form>
		// </>
	);
};

export default Login;
