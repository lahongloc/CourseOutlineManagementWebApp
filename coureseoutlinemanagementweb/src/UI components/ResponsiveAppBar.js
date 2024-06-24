import * as React from "react";
import AppBar from "@mui/material/AppBar";
import Box from "@mui/material/Box";
import Toolbar from "@mui/material/Toolbar";
import IconButton from "@mui/material/IconButton";
import Typography from "@mui/material/Typography";
import Menu from "@mui/material/Menu";
import MenuIcon from "@mui/icons-material/Menu";
import Container from "@mui/material/Container";
import Avatar from "@mui/material/Avatar";
import Button from "@mui/material/Button";
import Tooltip from "@mui/material/Tooltip";
import MenuItem from "@mui/material/MenuItem";
import AdbIcon from "@mui/icons-material/Adb";
import { UserContext } from "../App";
import { LOGOUT } from "../reducers/Actions";
import { useNavigate } from "react-router-dom";
import LoginIcon from "@mui/icons-material/Login";
import AvatarChip from "./AvatarChip";
import { isLecturer, isStudent } from "../UserAuthorization/UserAuthoriation";

function ResponsiveAppBar() {
	const [user, dispatch] = React.useContext(UserContext);
	// const pages = ["Trang chủ", "Workspace", "Đề cương của tôi"];
	const pages = [
		{
			name: "Workspaces",
			link: "/my-workspace",
		},
		{
			name: "Đề cương của tôi",
			link: "/my-outlines",
		},
	];
	const nav = useNavigate();
	const settings = [
		{
			name: "Hồ sơ",
			link: "/account-details",
		},
		{
			name: "Đăng xuất",
			call: () => {
				dispatch({
					type: LOGOUT,
				});
			},
		},
	];

	const [anchorElNav, setAnchorElNav] = React.useState(null);
	const [anchorElUser, setAnchorElUser] = React.useState(null);

	const handleOpenNavMenu = (event) => {
		setAnchorElNav(event.currentTarget);
	};
	const handleOpenUserMenu = (event) => {
		setAnchorElUser(event.currentTarget);
	};

	const handleCloseNavMenu = () => {
		setAnchorElNav(null);
	};

	const handleCloseUserMenu = () => {
		setAnchorElUser(null);
	};

	return (
		<Box sx={{ mb: 8.75 }}>
			<AppBar position="fixed">
				<Container maxWidth="xl">
					<Toolbar disableGutters>
						<AdbIcon
							sx={{ display: { xs: "none", md: "flex" }, mr: 1 }}
						/>
						<Typography
							variant="h6"
							noWrap
							component="a"
							href="#app-bar-with-responsive-menu"
							sx={{
								mr: 2,
								display: { xs: "none", md: "flex" },
								fontFamily: "monospace",
								fontWeight: 700,
								letterSpacing: ".3rem",
								color: "inherit",
								textDecoration: "none",
							}}
						>
							LOGO
						</Typography>

						<Box
							sx={{
								flexGrow: 1,
								display: { xs: "none", md: "flex" },
							}}
						>
							<Button
								onClick={() => {
									nav("/");
								}}
								sx={{
									my: 2,
									color: "white",
									display: "block",
								}}
							>
								TRANG CHỦ
							</Button>
							{user === null && (
								<Button
									onClick={() => {
										nav("/student-register");
									}}
									sx={{
										my: 2,
										color: "white",
										display: "block",
									}}
								>
									Cấp tài khoản sinh viên
								</Button>
							)}
							{isLecturer(user) &&
								pages.map((page, index) => (
									<Button
										key={index}
										onClick={() => {
											nav(page.link);
										}}
										sx={{
											my: 2,
											color: "white",
											display: "block",
										}}
									>
										{page.name}
									</Button>
								))}
							{isStudent(user) && (
								<Button
									onClick={() => {
										nav("/downloaded-outlines");
									}}
									sx={{
										my: 2,
										color: "white",
										display: "block",
									}}
								>
									Đề cương đã tải
								</Button>
							)}
						</Box>

						{user ? (
							<Box sx={{ flexGrow: 0 }}>
								<Tooltip title={user.name}>
									<IconButton
										onClick={handleOpenUserMenu}
										sx={{ p: 0 }}
									>
										<AvatarChip
											avatar={user.avatar}
											name={user.name}
										/>
										{/* <Avatar
										alt="Remy Sharp"
										src={user.avatar}
									/> */}
									</IconButton>
								</Tooltip>
								<Menu
									sx={{ mt: "45px" }}
									id="menu-appbar"
									anchorEl={anchorElUser}
									anchorOrigin={{
										vertical: "top",
										horizontal: "right",
									}}
									keepMounted
									transformOrigin={{
										vertical: "top",
										horizontal: "right",
									}}
									open={Boolean(anchorElUser)}
									onClose={handleCloseUserMenu}
								>
									{settings.map((setting) => (
										<MenuItem
											key={setting.name}
											onClick={() => {
												handleCloseUserMenu();
												if (setting.link)
													nav(setting.link);
												else setting.call();
											}}
										>
											<Typography textAlign="center">
												{setting.name}
											</Typography>
										</MenuItem>
									))}
									{/* {isStudent(user) && (
										<MenuItem
											onClick={() => {
												handleCloseUserMenu();
												nav("/");
											}}
										>
											<Typography textAlign="center">
												Đề cương đã tải
											</Typography>
										</MenuItem>
									)} */}
								</Menu>
							</Box>
						) : (
							<Button
								onClick={() => {
									nav("/login");
								}}
								variant="secondary"
								startIcon={<LoginIcon />}
							>
								Đăng nhập
							</Button>
						)}
					</Toolbar>
				</Container>
			</AppBar>
		</Box>
	);
}
export default ResponsiveAppBar;
