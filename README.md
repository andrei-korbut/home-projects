# Car Maintenance Tracker

A full-stack application to track car maintenance items with time-based and km-based intervals.

## Project Status

This project is in the planning phase. The complete project vision and scope is documented in `ProjectVisionAndScope.md`.

## 📋 Backlog & Issues

The project has been broken down into **42 issues** organized into **10 epics**. 

### Quick Links
- 📖 **[Full Backlog](BACKLOG.md)** - Detailed breakdown of all 42 issues
- 📊 **[Backlog Summary](BACKLOG_SUMMARY.md)** - Visual overview and roadmap
- 🚀 **[Issue Creation Instructions](CREATE_ISSUES_INSTRUCTIONS.md)** - How to create GitHub issues
- 📝 **[Issue Template](ISSUE_TEMPLATE.md)** - Manual issue creation template

### Creating GitHub Issues

**Option 1: Automated (GitHub CLI)**
```bash
./create-issues.sh
```

**Option 2: Automated (Python)**
```bash
python create-issues-python.py YOUR_GITHUB_TOKEN
```

**Option 3: Manual**
Follow the instructions in `CREATE_ISSUES_INSTRUCTIONS.md`

## 🏗️ Tech Stack

### Backend
- .NET 8 Web API
- Entity Framework Core
- SQL Server
- RESTful API
- Swagger/OpenAPI

### Frontend
- React 18
- Vite
- Tailwind CSS
- react-router-dom
- Axios

### DevOps
- Docker & docker-compose
- GitHub Actions (planned)

## 📁 Repository Structure

```
home-projects/
├── ProjectVisionAndScope.md      # Complete project requirements
├── BACKLOG.md                     # Detailed issue backlog (42 issues)
├── BACKLOG_SUMMARY.md             # Visual overview and roadmap
├── CREATE_ISSUES_INSTRUCTIONS.md  # How to create issues
├── ISSUE_TEMPLATE.md              # Manual issue template
├── create-issues.sh               # Bash script to create all issues
├── create-issues-python.py        # Python script to create all issues
└── README.md                      # This file
```

## 🎯 Project Overview

### Core Features
- **Maintenance Templates**: Create and manage part maintenance templates
- **Car Management**: Register cars and customize maintenance schedules
- **Tracking**: Record maintenance changes (km or date-based)
- **Dashboard**: View maintenance status with color-coded indicators
  - 🔴 Overdue
  - 🟡 Due Soon (< 30 days or < 300 km)
  - 🟢 OK (> 30 days or > 300 km)

### Pages
1. **Setup Page** (`/setup`) - Manage maintenance templates
2. **Cars Page** (`/cars`) - Manage cars and track maintenance
3. **Dashboard** (`/dashboard`) - Overview with status indicators

## 🚀 Getting Started

1. **Review the project vision**: Read `ProjectVisionAndScope.md`
2. **Check the backlog**: Review `BACKLOG.md` or `BACKLOG_SUMMARY.md`
3. **Create issues**: Follow instructions in `CREATE_ISSUES_INSTRUCTIONS.md`
4. **Start development**: Begin with Epic 1 (Project Setup)

## 📈 Development Roadmap

- **Phase 1**: Foundation (Project setup, Database models)
- **Phase 2**: Setup Page (Template management)
- **Phase 3**: Cars Management (Car and maintenance tracking)
- **Phase 4**: Dashboard (Status overview)
- **Phase 5**: Quality & Polish (Testing, Documentation, Enhancements)

See `BACKLOG_SUMMARY.md` for detailed roadmap.

## 📄 License

This is a personal project for learning and demonstration purposes.
