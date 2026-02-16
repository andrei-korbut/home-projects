# GitHub Issue Creation Template

Use this template when creating issues manually on GitHub. Simply copy and paste the content for each issue.

---

## How to Use This Template

1. Go to: https://github.com/andrei-korbut/home-projects/issues/new
2. Find the issue you want to create below
3. Copy the **Title** and paste into GitHub's title field
4. Copy the **Body** and paste into GitHub's description field
5. Add the **Labels** listed
6. Click "Submit new issue"

---

## Issue 1

**Title:**
```
Backend: Initialize .NET 8 Web API Project
```

**Labels:** `setup`, `backend`, `infrastructure`

**Body:**
```markdown
**Type:** Backend
**Priority:** High

**Description:**
Set up the .NET 8 Web API project with Entity Framework Core and SQL Server.

**Acceptance Criteria:**
- [ ] Create .NET 8 Web API project structure
- [ ] Configure Entity Framework Core
- [ ] Set up SQL Server connection
- [ ] Enable Swagger/OpenAPI
- [ ] Configure CORS for local development
- [ ] Create basic project structure (Controllers, Models, Services folders)
- [ ] Add necessary NuGet packages

**Technical Notes:**
- Use Entity Framework Core for ORM
- Configure connection string in appsettings.json
- Enable Swagger UI for API documentation
```

---

## Issue 2

**Title:**
```
Frontend: Initialize React + Vite Project
```

**Labels:** `setup`, `frontend`, `infrastructure`

**Body:**
```markdown
**Type:** Frontend
**Priority:** High

**Description:**
Set up the React project using Vite with Tailwind CSS and routing.

**Acceptance Criteria:**
- [ ] Create React project with Vite
- [ ] Configure Tailwind CSS
- [ ] Set up react-router-dom for navigation
- [ ] Configure Axios for API calls
- [ ] Create basic folder structure (components, pages, services, utils)
- [ ] Set up environment variables for API base URL
- [ ] Create basic layout component with navigation

**Technical Notes:**
- Use Vite for fast development
- Configure API base URL to work with Docker networking
- Set up basic routes for /setup, /cars, /dashboard
```

---

## Issue 3

**Title:**
```
DevOps: Docker Configuration
```

**Labels:** `setup`, `docker`, `infrastructure`

**Body:**
```markdown
**Type:** DevOps
**Priority:** High

**Description:**
Create Docker configuration for frontend, backend, and database.

**Acceptance Criteria:**
- [ ] Create Dockerfile for backend (.NET 8)
- [ ] Create Dockerfile for frontend (React)
- [ ] Create docker-compose.yml with all three services
- [ ] Configure network for inter-service communication
- [ ] Set up volume for SQL Server data persistence
- [ ] Document docker-compose commands in README
- [ ] Configure environment variables for each service

**Technical Notes:**
- Backend should be accessible at http://localhost:5000
- Frontend should be accessible at http://localhost:3000
- SQL Server should use persistent volume
- Configure proper service naming for URL resolution
```

---

## Note

For the complete list of all 42 issues, please refer to `BACKLOG.md`.

For automated creation of all issues at once, use:
- `create-issues.sh` (requires GitHub CLI)
- `create-issues-python.py` (requires Python and GitHub token)

See `CREATE_ISSUES_INSTRUCTIONS.md` for detailed instructions.
