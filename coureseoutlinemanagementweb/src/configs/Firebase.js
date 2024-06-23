import { initializeApp } from "firebase/app";
import { getAuth } from "firebase/auth";
import { getFirestore } from "firebase/firestore";

const firebaseConfig = {
	apiKey: "AIzaSyC5p0550nN7PyCLg2gQzvTwa1N9lZBgbp4",
	authDomain: "courseoutlinemanagementsystem.firebaseapp.com",
	databaseURL:
		"https://courseoutlinemanagementsystem-default-rtdb.asia-southeast1.firebasedatabase.app",
	projectId: "courseoutlinemanagementsystem",
	storageBucket: "courseoutlinemanagementsystem.appspot.com",
	messagingSenderId: "152856997433",
	appId: "1:152856997433:web:1784dd000c6c1df4ece7e8",
	measurementId: "G-59NR9MHPPQ",
};

const app = initializeApp(firebaseConfig);
const auth = getAuth(app);
const db = getFirestore(app);

export { auth, db };
