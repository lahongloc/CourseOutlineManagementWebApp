<h1 align="center">📚 Course Syllabus Management System</h1>

<h3 align="center">A comprehensive web application for managing course syllabi, built with a robust tech stack to ensure security, efficiency, and user-friendliness. This project showcases my ability to integrate various technologies and develop a fully functional web application.</h3>

## ✨ Features
- **📋 Course Syllabus Management**: Create, edit, and delete course syllabi.
- **👥 User Management**: Admin and user roles with different levels of access and capabilities.
- **📝 Assign Syllabi**: Assign syllabi to instructors.
- **💬 Comment System**: Users can comment on syllabi.
- **🔍 Advanced Search**: Search syllabi based on various criteria.
- **🧠 Sentiment Analysis**: Analyze user comments using ML sentiment analysis.
- **💬 Chat**: Real-time chat functionality using Firebase.
- **💳 Payment Integration**: VNPay integration for payments.
- **📄 PDF Generation**: Generate PDF versions of syllabi.
- **☁️ File Storage**: Amazon S3 for file storage.
- **📊 Statistics Reporting (Chart.js)**:
  - Sales and revenue statistics by year, quarter, month.
  - Statistics on the number of syllabi in different statuses: in the process of approval (HOLDING), and approved (ACCEPTED).

## 🛠 Tech Stack

### Backend
- **☕️ Java Spring MVC**
- **🛠 JDBC**
- **🐬 MySQL**
- **🔒 Spring Security**
- **🔑 JWT (JSON Web Tokens)** (For user authorization)
- **📧 Spring Mail**
- **💳 VNPay**
- **📄 Spring PDF Generator** (For file gernerating)
- **☁️ Amazon S3** (For file storage)
- **📈 Chart.js** (for statistics reporting)

### Frontend
- **⚛️ ReactJs**
- **🎨 MUI (Material-UI)**
- **🔥 Firebase** (for real-time chat)
- **🔗 API Integration** (for ML sentiment analysis)

## 🚀 Getting Started

### Prerequisites
- Java 8 or higher
- MySQL
- Node.js
- npm

### Installation

1. **Clone the repository:**
    ```sh
    git clone [https://github.com/lahongloc/HotelManagementWeb.git](https://github.com/lahongloc/CourseOutlineManagementWebApp.git)
    cd CourseOutlineManagementWebApp
    ```

2. **Backend Setup:**
    Update the `databases.properties` file with your MySQL and other configurations.
    - Open the project in NetBeans (or any IDE of your choice).
    - Open MySQL and import the `courseoutlinemanagementdb.sql` file.
    - Update the database username, password, and name in the `databases.properties` file within the project.
    - Right-click on the project and select `Run`.

3. **Frontend Setup:**
    - Navigate to the frontend directory:
      ```sh
      cd CourseOutlineManagementWeb
      ```
    - Install the dependencies:
      ```sh
      npm install
      ```
    - Run the application:
      ```sh
      npm start
      ```

## 💡 Usage

### 🔐 Authentication
- **Admin Login**: Admin can log in and access all features.
      - Available **Admin** account:**username**: Admin1, **password**: 123456
- **User Login**: Users can log in and access features based on their roles. There are two roles: **Lecturer** and **Student**
      - Available **Lecturer** account: **username**: dhthanh, **password**: 123455
      - Available **Student** account: **username**: ttkiet, **password**: 123456
  

### 📋 Core Features
1. **Manage Syllabi**:
    - Create new syllabi.
    - Edit existing syllabi.
    - Delete syllabi.
    - Assign syllabi to instructors.

2. **Comment System**:
    - Users can comment on syllabi.
    - Sentiment analysis on comments to gauge user sentiment.

3. **Search**:
    - Advanced search functionality to find syllabi based on multiple criteria.

4. **Real-Time Chat**:
    - Real-time chat functionality using Firebase.

5. **Payment Integration**:
    - VNPay integration for handling payments.

6. **PDF Generation**:
    - Generate and download PDF versions of syllabi.

7. **File Storage**:
    - Use Amazon S3 for storing files securely.
8. **Statistics Reporting (Chart.js)**:
    - Sales and revenue statistics by year, quarter, month.
    - Statistics on the number of syllabi in different statuses: in the process of approval (holding), and approved (accepted).

## 📸 Screenshots
**ADMIN SIDE** - Server Side Rendering
- Hone page: ![image](https://github.com/lahongloc/CourseOutlineManagementWebApp/assets/109413731/08377572-691b-4947-865b-26c9d9eac292)
- Students and Lecturers management page:
  ![image](https://github.com/lahongloc/CourseOutlineManagementWebApp/assets/109413731/1d3ecb22-18ab-49f1-ac85-fe973e845cda)
  ![image](https://github.com/lahongloc/CourseOutlineManagementWebApp/assets/109413731/bd459ce5-458d-4aa6-ad13-fe3379425c37)
  ![image](https://github.com/lahongloc/CourseOutlineManagementWebApp/assets/109413731/5ea81470-5809-4d61-874b-d7a9ea68091c)
  ![image](https://github.com/lahongloc/CourseOutlineManagementWebApp/assets/109413731/ebe6e329-eb24-42c5-8913-da197409267b)
- Report anf Statistics page:
  ![image](https://github.com/lahongloc/CourseOutlineManagementWebApp/assets/109413731/4abf5de6-6e03-4d6b-aced-630afbfb3490)
  ![image](https://github.com/lahongloc/CourseOutlineManagementWebApp/assets/109413731/fffb3e8f-9db3-459f-9220-283e50fc9d1b)
**CLIENT SITE** - Client Side Rendering
- Home page: ![image](https://github.com/lahongloc/CourseOutlineManagementWebApp/assets/109413731/f9b372a0-4be4-46c1-88c8-5d18e566f6d7)
- User detail page: ![image](https://github.com/lahongloc/CourseOutlineManagementWebApp/assets/109413731/5ff41055-7204-4c18-9e28-bed266a3000d)
- Workspaces (place where lecturers can compile course outline):
  ![image](https://github.com/lahongloc/CourseOutlineManagementWebApp/assets/109413731/a9bf4e36-947c-44d5-a7eb-74de225e7642)
  ![image](https://github.com/lahongloc/CourseOutlineManagementWebApp/assets/109413731/212b071f-427a-45a0-b94d-c707191590af)
  ![image](https://github.com/lahongloc/CourseOutlineManagementWebApp/assets/109413731/0da2a16a-7756-4610-99a2-fa431c14fe1d)
- Course outline detail page: ![image](https://github.com/lahongloc/CourseOutlineManagementWebApp/assets/109413731/2d0cb42f-fb70-48fc-9441-fe450fab1260)
- Real-time chat page: ![image](https://github.com/lahongloc/CourseOutlineManagementWebApp/assets/109413731/0fdf824b-50b4-48a1-b348-6b621784b378)

## 🤝 Contributing
- Contributions are welcome! Please submit a pull request or open an issue to discuss any changes.

## 📞 Contact
- **Name**: [La Hồng Lộc]
- **Email**: [hongloc111990@gmail.com]
- **LinkedIn**: [www.linkedin.com/in/hongloc2405]
