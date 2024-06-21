export const isLecturer = (user) => {
	if (user !== null) return user.role === "ROLE_LECTURER";
};

export const isStudent = (user) => {
	if (user !== null) return user.role === "ROLE_STUDENT";
};
