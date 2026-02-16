# Backlog and Issue Creation Guide

This directory contains the structured backlog of issues for the Car Maintenance Tracker project, generated from the ProjectVisionAndScope.md document.

## 📋 Contents

- **issues.json** - Complete backlog of 40 issues with full descriptions, tasks, and labels
- **create_issues.py** - Python script to automatically create all issues on GitHub
- **README.md** - This file

## 🎯 Issue Structure

All issues are organized by:
- **Backend work**: Database, API endpoints, business logic
- **Frontend work**: UI components, pages, forms, integration with backend
- **DevOps work**: Docker, docker-compose, deployment configuration
- **Documentation**: README, API documentation

Each issue includes:
- Clear title indicating the type of work (Backend/Frontend/DevOps)
- Detailed description of what needs to be built
- Specific tasks as checkboxes
- API endpoint details (for backend issues)
- Integration points (for frontend issues)
- Technology stack
- Relevant labels for organization

## 📊 Backlog Summary

### Backend Issues (18)
1. Setup database schema and models
2. GET /setup - List templates
3. POST /setup - Create template
4. PUT /setup/{id} - Edit template
5. PUT /setup/{id}/archive - Archive template
6. PUT /setup/{id}/restore - Restore template
7. GET /cars - List cars with maintenance items
8. POST /cars - Create car
9. PUT /cars/{id} - Edit car
10. PUT /cars/{id}/km - Update mileage
11. POST /trackchange/{id} - Record maintenance change
12. GET /dashboard/{carId} - Get dashboard data
13. Setup Swagger documentation
14. Add CORS configuration
15. Add error handling middleware
16. Add logging configuration

### Frontend Issues (18)
1. Setup React app with Vite and Tailwind
2. Create Setup page - List templates
3. Create Setup page - Add template
4. Create Setup page - Edit template
5. Create Setup page - Archive/Restore template
6. Create Cars page - List view
7. Create Add Car page
8. Create Edit Car page
9. Implement Track Change functionality
10. Create Dashboard page - Main view
11. Dashboard - Inline edit mileage
12. Create reusable components library
13. Create masked date input component
14. Add error handling and loading states
15. Add API service layer
16. Add form validation utilities

### DevOps Issues (4)
1. Create Dockerfile for backend
2. Create Dockerfile for frontend
3. Create docker-compose.yml
4. Add .dockerignore files
5. Add .gitignore

### Documentation & Testing (2)
1. Create README with setup instructions
2. Backend unit tests for core business logic

**Total: 40 Issues**

## 🚀 How to Create Issues on GitHub

### Prerequisites

1. **GitHub Personal Access Token**: You need a token with `repo` scope
   - Go to: https://github.com/settings/tokens
   - Click "Generate new token" → "Generate new token (classic)"
   - Give it a descriptive name (e.g., "Issue Creator")
   - Select the `repo` scope (full control of private repositories)
   - Click "Generate token" and copy it immediately (you won't see it again!)

2. **Python 3.x**: Ensure Python 3 is installed
   ```bash
   python3 --version
   ```

3. **Requests library**: Install if not already available
   ```bash
   pip install requests
   # or
   pip3 install requests
   ```

### Option 1: Using Environment Variable (Recommended)

```bash
# Set your GitHub token as an environment variable
export GITHUB_TOKEN='your_personal_access_token_here'

# Navigate to the backlog directory
cd backlog

# Run the script
python3 create_issues.py
```

### Option 2: Using Command Line Argument

```bash
cd backlog
python3 create_issues.py --token 'your_personal_access_token_here'
```

### Option 3: Dry Run (Preview Only)

To see what issues would be created without actually creating them:

```bash
python3 create_issues.py --dry-run
```

### Advanced Options

```bash
# Specify custom repository
python3 create_issues.py --owner andrei-korbut --repo home-projects

# Use custom issues file
python3 create_issues.py --file ./my-issues.json

# Adjust delay between API calls (to avoid rate limiting)
python3 create_issues.py --delay 2.0
```

### Full Command Help

```bash
python3 create_issues.py --help
```

## 📝 Manual Issue Creation

If you prefer to create issues manually or want to create only specific ones, you can:

1. Open the `issues.json` file
2. Find the issue you want to create
3. Copy the title, body, and labels
4. Go to https://github.com/andrei-korbut/home-projects/issues/new
5. Paste the content and assign labels

## 🏷️ Issue Labels

The backlog uses the following labels to organize work:

- `backend` - Backend API work
- `frontend` - Frontend UI work
- `api` - API endpoint implementation
- `ui` - User interface components
- `setup` - Initial setup and configuration
- `forms` - Form handling and validation
- `database` - Database schema and models
- `cars` - Car-related features
- `dashboard` - Dashboard features
- `trackchange` - Track change functionality
- `devops` - DevOps and deployment
- `docker` - Docker configuration
- `documentation` - Documentation work
- `testing` - Testing work
- `configuration` - Configuration and setup
- `error-handling` - Error handling
- `logging` - Logging configuration
- `components` - Reusable components
- `architecture` - Architectural decisions
- `validation` - Validation logic
- `git` - Git configuration

## 📐 Issue Organization Strategy

Issues are organized to support parallel development:

### Phase 1: Foundation (Can work in parallel)
- Backend: Database setup + Swagger
- Frontend: React setup
- DevOps: Dockerfile and docker-compose setup

### Phase 2: Core Features
- **Setup Page (Templates)**
  - Backend: GET, POST, PUT /setup endpoints
  - Frontend: List, Add, Edit, Archive templates
  
- **Cars Page**
  - Backend: GET, POST, PUT /cars endpoints
  - Frontend: List, Add, Edit cars

### Phase 3: Advanced Features
- **Dashboard**
  - Backend: GET /dashboard endpoint with status calculation
  - Frontend: Dashboard view with grouping
  
- **Track Change**
  - Backend: POST /trackchange endpoint
  - Frontend: Track change modal (shared component)

### Phase 4: Polish
- Error handling
- Loading states
- Logging
- Documentation
- Testing

## 🔄 Recommended Development Order

1. **Start with**: Database models + React setup + Docker files
2. **Then**: Setup page (templates) - simplest CRUD
3. **Next**: Cars page - more complex with relationships
4. **Then**: Track change functionality
5. **Finally**: Dashboard with status calculation
6. **Throughout**: Add error handling, logging, documentation

## 📊 Progress Tracking

After creating the issues, you can track progress using:

- GitHub Projects board
- Milestones for each phase
- Labels to filter by type of work
- Assignees for team members

## 💡 Tips

1. **Create all issues at once** using the script for a complete backlog
2. **Use labels** to filter and organize work
3. **Create a GitHub Project board** to visualize progress
4. **Assign issues** to team members or yourself
5. **Use milestones** to group issues by release/phase
6. **Link related issues** using GitHub's issue references (#123)

## 🤝 Contributing

When working on an issue:

1. Comment on the issue to claim it
2. Create a feature branch: `feature/issue-number-short-description`
3. Reference the issue in commits: `git commit -m "Fix: implement GET /setup endpoint #2"`
4. Create a PR when done and link it to the issue
5. Check off completed tasks in the issue description

## 📞 Support

If you encounter any issues with the script or have questions about the backlog:

1. Check that your GitHub token has the correct permissions
2. Ensure Python and requests library are installed
3. Verify the repository name and owner are correct
4. Check GitHub API rate limits if you encounter errors

## 🎉 Ready to Start!

Your backlog is ready to go. Run the script to create all 40 issues and start building the Car Maintenance Tracker!

```bash
export GITHUB_TOKEN='your_token'
cd backlog
python3 create_issues.py
```

Good luck with your project! 🚀
