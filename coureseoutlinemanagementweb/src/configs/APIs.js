import axios from "axios";
import cookie from "react-cookies";

const BASE_URL = " http://localhost:8085/CourseOutlineManagementWebApp/";

export const endpoints = {
	getOutlines: "/api/getOutlines/",
	getFaculties: "/api/getFaculties/",
	getHomeClient: "/api/getHomeClient/",
	getAcademicYears: "/api/getAcademicYears/",
	getGrades: "/api/getGrades/",
	getMajors: "/api/getMajors/",
	getStudents: "/api/getStudents/",	
	login: "/api/login/",
	"current-user": "/api/current-user/",
	"lecturer-register": "/api/lecturer-register/",
	"student-register": "/api/student-register/",
	getLecturers: "/api/getLecturers/",
	"update-lecturer": "/api/lecturer-update/",
	"student-active": "/api/student-active/"
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
