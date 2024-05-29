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
import { Alert, Button } from "@mui/material";
import LinearBuffer from "../UI components/LinearBuffer";
import "animate.css";

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
	const [userInfo, setUserInfo] = useState({});
	const [loading, setLoading] = useState(false);
	const [success, setSuccess] = useState(true);

	const [q] = useSearchParams();

	const fields = [
		{
			id: "username",
			label: "Tên đăng nhập",
			type: "text",
		},
		{
			id: "password",
			label: "Mật khẩu",
			type: "password",
		},
	];

	const handleFieldChange = (e, field) => {
		setUserInfo((prev) => {
			return { ...prev, [field]: e.target.value };
		});
	};

	const login = (evt) => {
		evt.preventDefault();

		const process = async () => {
			setLoading(true);
			try {
				let res = await APIs.post(endpoints["login"], { ...userInfo });
				console.log("data la: ", res.data);
				cookie.save("token", res.data);

				let currentUser = await authApi().get(
					endpoints["current-user"],
				);
				cookie.save("user", currentUser.data);

				dispatch({
					type: LOGIN,
					payload: currentUser.data,
				});
				setSuccess(true);
			} catch (err) {
				setSuccess(false);
				console.error(err);
			} finally {
				setLoading(false);
				setTimeout(() => {
					setSuccess(true);
				}, 5000);
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
			{loading && <LinearBuffer />}

			<Container component="main" maxWidth="xs">
				<CssBaseline />
				<Box
					sx={{
						marginTop: 15,
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
					{success || (
						<Alert
							className="animate__animated animate__wobble"
							sx={{
								marginTop: 5,
								marginBottom: 5,
							}}
							severity="warning"
						>
							Tên đăng nhập hoặc mật khẩu không chính xác! Hoặc
							tài khoản của bạn chưa được kích hoạt, vui lòng chờ!
						</Alert>
					)}
					<Box
						component="form"
						onSubmit={login}
						noValidate
						sx={{ mt: 1 }}
					>
						{fields.map((field, index) => {
							return (
								<TextField
									margin="normal"
									required
									fullWidth
									type={field.type}
									id={field.id}
									label={field.label}
									autoComplete={field.id}
									autoFocus
									value={userInfo[field.id]}
									onChange={(e) =>
										handleFieldChange(e, field.id)
									}
								/>
							);
						})}

						<FormControlLabel
							control={
								<Checkbox value="remember" color="primary" />
							}
							label="Lưu mật khẩu"
						/>
						<Button
							type="submit"
							fullWidth
							disabled={loading}
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
	);
};

export default Login;
