import axios from "axios";

const BASE_URL = 'http://localhost:8085/CourseOutlineManagementWebApp/';

export const endpoints = {
    'getOutlines': '/api/getOutlines/',
    'getFaculties': '/api/getFaculties/'
}

export default axios.create({
    baseURL: BASE_URL
});