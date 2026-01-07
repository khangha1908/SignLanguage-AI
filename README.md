# Sign Language Recognition App

Ứng dụng nhận diện ngôn ngữ ký hiệu sử dụng MediaPipe và React.

## 🚀 Tính năng

- Nhận diện ngôn ngữ ký hiệu thời gian thực
- Đăng ký/đăng nhập với Google và Facebook OAuth
- Dashboard quản lý dữ liệu
- Giao diện responsive
- Bảo mật với JWT và rate limiting

## 🛠️ Công nghệ sử dụng

- **Frontend**: React 18, Redux, React Router
- **Backend**: Node.js, Express.js, MySQL
- **AI/ML**: MediaPipe, TensorFlow.js
- **Authentication**: Passport.js (Google/Facebook OAuth)
- **Deployment**: Azure (Static Web Apps + App Service + MySQL)

## 📋 Yêu cầu hệ thống

- Node.js 18+
- MySQL 8.0+
- Azure subscription (Student account được khuyến nghị)

## 🔧 Cài đặt và chạy locally

### 1. Clone repository
```bash
git clone https://github.com/your-username/sign-language-recognition.git
cd sign-language-recognition
```

### 2. Cài đặt dependencies

**Frontend:**
```bash
npm install
```

**Backend:**
```bash
cd backend
npm install
```

### 3. Cấu hình database

Tạo database MySQL và chạy script setup:
```bash
mysql -u root -p < backend/setup_database.sql
```

### 4. Cấu hình environment variables

Copy file `.env.example` thành `.env` trong thư mục `backend` và điền thông tin:

```bash
cp backend/.env.example backend/.env
```

### 5. Chạy ứng dụng

**Terminal 1 - Backend:**
```bash
cd backend
npm run dev
```

**Terminal 2 - Frontend:**
```bash
npm start
```

Ứng dụng sẽ chạy tại:
- Frontend: http://localhost:3000
- Backend: http://localhost:5000

## 🚀 Deploy lên Azure

### Phương pháp 1: Sử dụng PowerShell Script (Khuyến nghị)

1. **Cập nhật thông tin trong `deploy-azure.ps1`:**
   - Thay đổi tên resource group, app names, database names
   - Cập nhật GitHub repository URL

2. **Chạy script:**
   ```powershell
   .\deploy-azure.ps1
   ```

3. **Cập nhật CORS trong `backend/server.js`:**
   - Thay `your-frontend-app-name` và `your-backend-app-name` bằng tên thực tế

4. **Push code lên GitHub:**
   ```bash
   git add .
   git commit -m "Add Azure deployment configuration"
   git push origin main
   ```

### Phương pháp 2: Manual Setup qua Azure Portal

#### Bước 1: Tạo Azure Database for MySQL
1. Truy cập [Azure Portal](https://portal.azure.com)
2. Tạo **Azure Database for MySQL** server
3. Cấu hình firewall để cho phép Azure services
4. Tạo database `sign_language_db`
5. Import schema từ `backend/setup_database.sql`

#### Bước 2: Deploy Backend (App Service)
1. Tạo **App Service** với Node.js runtime
2. Cấu hình Application Settings:
   ```
   DB_HOST=your-mysql-server.mysql.database.azure.com
   DB_USER=your-username@your-mysql-server
   DB_PASSWORD=your-password
   DB_NAME=sign_language_db
   SESSION_SECRET=your-secure-session-secret
   NODE_ENV=production
   PORT=8080
   ```
3. Deploy code từ GitHub hoặc upload ZIP

#### Bước 3: Deploy Frontend (Static Web Apps)
1. Tạo **Static Web App**
2. Kết nối với GitHub repository
3. Cấu hình build settings:
   - Build command: `npm run build`
   - Output location: `build`
   - API location: `backend`

### Phương pháp 3: Sử dụng GitHub Actions

1. **Cấu hình Secrets trong GitHub:**
   - `AZURE_CREDENTIALS`: Service Principal credentials
   - `AZURE_WEBAPP_NAME`: Tên App Service

2. **Push code để trigger deployment:**
   ```bash
   git add .
   git commit -m "Setup CI/CD with GitHub Actions"
   git push origin main
   ```

## 🔐 Cấu hình Authentication

### Google OAuth
1. Truy cập [Google Cloud Console](https://console.cloud.google.com)
2. Tạo OAuth 2.0 Client ID
3. Thêm authorized redirect URIs:
   - Development: `http://localhost:5000/auth/google/callback`
   - Production: `https://your-backend-app.azurewebsites.net/auth/google/callback`

### Facebook OAuth
1. Truy cập [Facebook Developers](https://developers.facebook.com)
2. Tạo Facebook App
3. Thêm Valid OAuth Redirect URIs:
   - Development: `http://localhost:5000/auth/facebook/callback`
   - Production: `https://your-backend-app.azurewebsites.net/auth/facebook/callback`

## 📊 Monitoring và Logs

### Backend Logs
- Application logs: Azure App Service logs
- Security logs: `backend/security.log` và `backend/auth-security.log`

### Frontend Monitoring
- Azure Static Web Apps analytics
- Application Insights (tùy chọn)

## 🔧 Troubleshooting

### Lỗi CORS
- Kiểm tra `allowedOrigins` trong `backend/server.js`
- Đảm bảo frontend domain được thêm vào whitelist

### Lỗi Database Connection
- Kiểm tra connection string trong environment variables
- Đảm bảo MySQL server firewall cho phép Azure services

### Lỗi Deployment
- Kiểm tra build logs trong Azure Portal
- Đảm bảo tất cả dependencies được liệt kê trong `package.json`

## 📝 API Documentation

### Authentication Endpoints
- `POST /auth/register` - Đăng ký
- `POST /auth/login` - Đăng nhập
- `GET /auth/logout` - Đăng xuất
- `GET /auth/google` - Google OAuth
- `GET /auth/facebook` - Facebook OAuth

### Data Endpoints
- `GET /data/signs` - Lấy danh sách ký hiệu
- `POST /data/signs` - Thêm ký hiệu mới
- `PUT /data/signs/:id` - Cập nhật ký hiệu
- `DELETE /data/signs/:id` - Xóa ký hiệu

## 🤝 Đóng góp

1. Fork project
2. Tạo feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Tạo Pull Request

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

## 📞 Liên hệ

- Email: your-email@example.com
- GitHub: [@your-username](https://github.com/your-username)
- LinkedIn: [Your LinkedIn](https://linkedin.com/in/your-profile)

---

⭐ Nếu project này hữu ích, hãy cho chúng tôi một ngôi sao!
