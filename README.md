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

## 🛠 Tech Stack

### Backend
- **☕️ Java Spring MVC**
- **🛠 JDBC**
- **🐬 MySQL**
- **🔒 Spring Security**
- **🔑 JWT (JSON Web Tokens)**
- **📧 Spring Mail**
- **💳 VNPay**
- **📄 Spring PDF Generator**
- **☁️ Amazon S3**

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

## 📸 Screenshots
**ADMIN SIDE** - Server Side Rendering
![image](https://github.com/lahongloc/CourseOutlineManagementWebApp/assets/109413731/6b01f6a2-4860-4875-9308-920eedd731e6)


## 🤝 Contributing
- Contributions are welcome! Please submit a pull request or open an issue to discuss any changes.

## 📞 Contact
- **Name**: [La Hồng Lộc]
- **Email**: [hongloc111990@gmail.com]
- **LinkedIn**: [www.linkedin.com/in/hongloc2405]
