# Creating GitHub Issues - Instructions

This directory contains tools to help you create GitHub issues from the backlog defined in `BACKLOG.md`.

## Option 1: Using GitHub CLI (Recommended)

### Prerequisites
1. Install GitHub CLI: https://cli.github.com/
2. Authenticate with GitHub:
   ```bash
   gh auth login
   ```

### Create All Issues
Simply run the script:
```bash
./create-issues.sh
```

This will create all 42 issues in the repository with proper labels and formatting.

## Option 2: Using Python Script

### Prerequisites
1. Install Python 3.7+
2. Install requests library:
   ```bash
   pip install requests
   ```
3. Create a GitHub Personal Access Token:
   - Go to https://github.com/settings/tokens
   - Generate new token with `repo` scope
   - Save the token securely

### Create All Issues
```bash
python create-issues-python.py YOUR_GITHUB_TOKEN
```

## Option 3: Manual Creation

If you prefer to create issues manually, use `BACKLOG.md` as a reference. For each issue:

1. Go to https://github.com/andrei-korbut/home-projects/issues/new
2. Copy the title from the backlog
3. Copy the description/acceptance criteria
4. Add the appropriate labels
5. Click "Create issue"

## Issue Summary

The backlog contains **42 issues** organized into **10 epics**:

1. **Epic 1: Project Setup & Infrastructure** (3 issues)
   - Backend setup, Frontend setup, Docker configuration

2. **Epic 2: Database Models & Migrations** (2 issues)
   - Database models, Initial migration

3. **Epic 3: Setup Page** (8 issues)
   - 4 backend endpoints, 4 frontend features

4. **Epic 4: Cars Page** (9 issues)
   - 4 backend endpoints, 5 frontend features

5. **Epic 5: Dashboard Page** (5 issues)
   - 2 backend endpoints, 3 frontend features

6. **Epic 6: Backend Logic** (3 issues)
   - Calculation logic, Archive logic

7. **Epic 7: Validation** (3 issues)
   - Frontend/backend validation, Error handling

8. **Epic 8: Testing** (3 issues)
   - Unit tests, Integration tests

9. **Epic 9: Documentation** (3 issues)
   - README, API docs, CI/CD

10. **Epic 10: Polish** (3 issues)
    - Responsive design, Loading states, Database seeding

## Recommended Implementation Order

1. Start with Epic 1 (Project Setup) - Issues 1-3
2. Then Epic 2 (Database) - Issues 4-5
3. Build features page by page:
   - Epic 3 (Setup Page) - Issues 6-13
   - Epic 4 (Cars Page) - Issues 14-22
   - Epic 5 (Dashboard) - Issues 23-27
4. Add backend logic - Epic 6 - Issues 28-30
5. Improve validation - Epic 7 - Issues 31-33
6. Add testing - Epic 8 - Issues 34-36
7. Document - Epic 9 - Issues 37-39
8. Polish - Epic 10 - Issues 40-42

## Labels Used

- `backend` - Backend/API work
- `frontend` - Frontend/UI work
- `setup` - Initial setup/configuration
- `infrastructure` - Infrastructure/DevOps
- `docker` - Docker related
- `database` - Database related
- `models` - Data models
- `migration` - Database migrations
- `api` - API endpoints
- `ui` - User interface
- `feature` - New feature
- `component` - Reusable component
- `validation` - Validation logic
- `error-handling` - Error handling
- `logic` - Business logic
- `calculation` - Calculation logic
- `testing` - Testing related
- `unit-tests` - Unit tests
- `integration-tests` - Integration tests
- `documentation` - Documentation
- `ci-cd` - CI/CD pipeline
- `enhancement` - Enhancement/improvement
- `setup-page` - Setup page specific
- `cars-page` - Cars page specific
- `dashboard-page` - Dashboard page specific

## Notes

- Each issue is designed to be a complete, self-contained unit of work
- Issues are split by frontend and backend concerns
- Each frontend issue assumes integration with the backend endpoints
- The backlog follows the project structure defined in `ProjectVisionAndScope.md`
- Priority levels: High (must have for MVP), Medium (should have), Low (nice to have)
