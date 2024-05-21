import axios from "axios";
import cookie from "react-cookies";

const BASE_URL = " http://localhost:8080/CourseOutlineManagementWebApp";

export const endpoints = {
	getOutlines: "/api/getOutlines/",
	getFaculties: "/api/getFaculties/",
	login: "/api/login/",
	register: "/api/addUser/",
};

export const authApi = () => {
	return axios.create({
		baseURL: BASE_URL,
		header: {
			Authorization: cookie.load("token"),
		},
	});
};

export default axios.create({
	baseURL: BASE_URL,
});
