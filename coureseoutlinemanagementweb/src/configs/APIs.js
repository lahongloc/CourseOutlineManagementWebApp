import axios from "axios";
import cookie from "react-cookies";

const BASE_URL = "http://localhost:8080/CourseOutlineManagementWebApp/";

export const endpoints = {
	getOutlines: "/api/getOutlines/",
	getFaculties: "/api/getFaculties/",
	getHomeClient: "/api/getHomeClient/",
	login: "/api/login/",
	"current-user": "/api/current-user/",
	"lecturer-register": "/api/lecturer-register/",
	getLecturers: "/api/getLecturers/",
	"update-lecturer": "/api/lecturer-update/",
	getSubjetcs: "/api/getSubjects/",
	"save-outline": "/api/add-outline/",
	getScores: "/api/getScores/",
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
