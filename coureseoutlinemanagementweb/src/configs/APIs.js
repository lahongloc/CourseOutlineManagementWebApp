import axios from "axios";
import cookie from "react-cookies";

const BASE_URL = " http://localhost:8085/CourseOutlineManagementWebApp/";

export const endpoints = {
	getOutlines: "/api/getOutlines/",
	getFaculties: "/api/getFaculties/",
	getHomeClient: "/api/getHomeClient/",
	login: "/api/login/",
	"current-user": "/api/current-user/",
	"lecturer-register": "/api/lecturer-register/",
};

export const authApi = () => {
	return axios.create({
		baseURL: BASE_URL,
		headers: {
			Authorization: cookie.load("token"),
		},
	});
};

export default axios.create({
	baseURL: BASE_URL,
});
