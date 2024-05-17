import axios from "axios";
import cookie from "react-cookies";

const BASE_URL = "http://localhost:8080/CourseOutlineManagementWebApp/";

export const endpoints = {
	getOutlines: "/api/getOutlines/",
	getFaculties: "/api/getFaculties/",
	login: "/api/login/",
	"current-user": "/api/current-user/",
};

export const authApi = () => {
	return axios.create({
		baseURL: "http://localhost:8080",
		heaader: {
			Authorization: cookie.load("token"),
		},
	});
};

export default axios.create({
	baseURL: BASE_URL,
});
