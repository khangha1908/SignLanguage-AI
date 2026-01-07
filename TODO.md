# 🚀 Azure Deployment Checklist

## ✅ Completed Tasks
- [x] Analyze project structure (React frontend + Node.js backend + MySQL)
- [x] Create backend/.env.example with required environment variables
- [x] Create GitHub Actions workflow for backend deployment
- [x] Create PowerShell deployment script (deploy-azure.ps1)
- [x] Update backend/server.js with production CORS configuration
- [x] Create comprehensive README.md with deployment instructions
- [x] Create staticwebapp.config.json for frontend deployment
- [x] Update .gitignore with deployment-related files

## 🔄 Remaining Tasks

### Phase 1: Repository Setup
- [ ] Create GitHub repository (if not exists)
- [ ] Push current code to GitHub
- [ ] Configure GitHub repository settings

### Phase 2: Azure Infrastructure Setup
- [ ] Update deploy-azure.ps1 with your actual names:
  - Resource group name
  - App names (frontend/backend)
  - Database server name
  - GitHub repository URL
- [ ] Run PowerShell script to create Azure resources
- [ ] Note down the generated URLs and connection strings

### Phase 3: Environment Configuration
- [ ] Update backend/server.js CORS origins with actual Azure URLs
- [ ] Create backend/.env file with production values
- [ ] Configure OAuth redirect URIs in Google/Facebook consoles
- [ ] Set up GitHub Secrets for CI/CD (if using GitHub Actions)

### Phase 4: Database Setup
- [ ] Connect to Azure MySQL database
- [ ] Run backend/setup_database.sql to create tables
- [ ] Verify database connection from backend

### Phase 5: Deployment & Testing
- [ ] Deploy backend to Azure App Service
- [ ] Deploy frontend to Azure Static Web Apps
- [ ] Test all endpoints and functionality
- [ ] Configure custom domain (optional)
- [ ] Set up monitoring and alerts

### Phase 6: Security & Optimization
- [ ] Enable HTTPS and SSL certificates
- [ ] Configure Azure Firewall rules
- [ ] Set up Azure Backup for database
- [ ] Enable Azure CDN for static assets (optional)
- [ ] Configure Azure Application Insights

## 📋 Quick Start Commands

```bash
# 1. Initialize git (if not done)
git init
git add .
git commit -m "Initial commit with Azure deployment setup"

# 2. Create GitHub repo and push
# (Replace with your GitHub username/repo)
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git push -u origin main

# 3. Run Azure deployment script
# (Update variables in deploy-azure.ps1 first)
.\deploy-azure.ps1
```

## 🔧 Configuration Files to Update

### deploy-azure.ps1
- `$resourceGroupName`
- `$frontendAppName`
- `$backendAppName`
- `$dbServerName`
- GitHub repository URL

### backend/server.js
- `allowedOrigins` array with actual Azure URLs

### backend/.env
- Database connection details
- OAuth credentials
- Session secret

## 🚨 Important Notes

- **Azure Student Account**: You have FREE credits - use them wisely!
- **CORS**: Update origins in server.js AFTER creating Azure resources
- **Environment Variables**: Never commit .env files to Git
- **Database**: Use Azure Database for MySQL (not local MySQL)
- **OAuth**: Update redirect URIs in Google/Facebook consoles with production URLs

## 📞 Support

If you encounter issues:
1. Check Azure Portal logs
2. Verify environment variables
3. Test locally first
4. Check CORS configuration
5. Review database connection

## 🎯 Success Criteria

- [ ] Frontend accessible at Azure Static Web Apps URL
- [ ] Backend API responding at Azure App Service URL
- [ ] Database connected and functional
- [ ] Authentication working (Google/Facebook login)
- [ ] Sign language detection working
- [ ] All features functional in production

---

**Next Steps**: Update the variables in `deploy-azure.ps1` and run it to create your Azure infrastructure!
