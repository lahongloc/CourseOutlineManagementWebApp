import cookie from "react-cookies";
import { LOGIN, LOGOUT } from "./Actions";

const UserReducer = (currentState, action) => {
	switch (action.type) {
		case LOGIN:
			return action.payload;
		case LOGOUT:
			cookie.remove("token");
			cookie.remove("user");
			return null;
	}

	return currentState;
};

export default UserReducer;
