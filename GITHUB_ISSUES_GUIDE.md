# GitHub Issues Creation Guide

This document provides templates for creating GitHub issues from the backlog. Each issue follows a consistent format that clearly separates backend and frontend work.

---

## Issue Template Format

Use this template when creating issues in GitHub:

```markdown
## Description
[Brief description of the feature/issue]

## Priority
[CRITICAL / HIGH / MEDIUM / LOW]

## Dependencies
- [ ] Issue #X must be completed first
- [ ] Issue #Y must be completed first

## Backend Work

### Database Changes
- [ ] Create/modify table: [table_name]
  - Fields: [list fields]
- [ ] Create migrations

### API Endpoints
- [ ] `[METHOD] [endpoint]` - [description]
  - Request body: [schema]
  - Response: [schema]
  - Status codes: [list codes]

### Business Logic
- [ ] [Describe logic/calculations]
- [ ] [Validation rules]

### Testing
- [ ] Unit tests for [feature]
- [ ] Integration tests for [endpoints]

## Frontend Work

### UI Components
- [ ] Create/modify page: [page_name]
- [ ] Create/modify component: [component_name]

### Features
- [ ] [User action/feature description]
- [ ] Form validation
- [ ] Error handling
- [ ] Loading states

### API Integration
- [ ] Call `[METHOD] http://backend:8000/[endpoint]`
- [ ] Handle response
- [ ] Handle errors

### Testing
- [ ] Component tests
- [ ] E2E tests for user flow

## Acceptance Criteria
- [ ] [Specific testable criterion]
- [ ] [Specific testable criterion]

## Definition of Done
- [ ] Backend endpoint(s) implemented and tested
- [ ] Frontend UI implemented and tested
- [ ] API integration complete
- [ ] Manual testing completed
- [ ] Code reviewed
- [ ] Documentation updated (if needed)
```

---

## Example: Issue #1 (Filled Template)

```markdown
# Issue #1: List Part Maintenance Templates

## Description
Display all existing part maintenance templates on the setup page. This is the foundation for managing maintenance templates and allows users to view all available templates in a sorted list.

## Priority
HIGH

## Dependencies
- [x] Issue #0 (Infrastructure Setup) must be completed first

## Backend Work

### Database Changes
- [ ] Create table `MaintenanceItemTemplate`
  - `id` (int, primary key, auto-increment)
  - `name` (string, not null)
  - `intervalType` (string, not null, values: 'km' or 'time')
  - `intervalValue` (int, not null)
  - `archived` (bool, default false)
  - `createdAt` (datetime, auto-generated)
- [ ] Create initial migration script

### API Endpoints
- [ ] `GET /setup` - List all maintenance templates
  - Request: None (query params optional for filtering)
  - Response:
    ```json
    {
      "templates": [
        {
          "id": 1,
          "name": "Oil Change",
          "intervalType": "km",
          "intervalValue": 10000,
          "archived": false,
          "createdAt": "2026-01-15T10:30:00Z"
        }
      ]
    }
    ```
  - Status codes: 200 (success), 500 (server error)

### Business Logic
- [ ] Return only non-archived templates by default
- [ ] Sort by `createdAt` DESC (newest first)
- [ ] Handle empty result set gracefully

### Testing
- [ ] Unit tests for template repository/service
- [ ] Integration test for GET /setup endpoint
- [ ] Test with empty database
- [ ] Test with multiple templates

## Frontend Work

### UI Components
- [ ] Create page: `/setup`
- [ ] Create component: `TemplateList`
- [ ] Create component: `TemplateListItem`

### Features
- [ ] Display templates in list/table format
- [ ] Show template fields: name, interval type, interval value
- [ ] Show empty state: "There are no currently available parts' maintenance templates."
- [ ] Add "Add New Template" button at top (non-functional placeholder)
- [ ] Add navigation link to setup page

### API Integration
- [ ] Call `GET http://backend:8000/setup` on page load
- [ ] Display loading state while fetching
- [ ] Handle API errors gracefully
- [ ] Show error message if fetch fails

### Testing
- [ ] Component test for TemplateList with mock data
- [ ] Component test for empty state
- [ ] E2E test: Navigate to /setup and verify templates display

## Acceptance Criteria
- [ ] Setup page is accessible via navigation
- [ ] GET /setup endpoint returns templates in correct format
- [ ] Templates are sorted by creation date (newest first)
- [ ] Empty state message displays when no templates exist
- [ ] Loading state displays while fetching data
- [ ] Error message displays if API call fails
- [ ] Page layout matches design specifications

## Definition of Done
- [ ] Backend endpoint implemented and tested
- [ ] Frontend page/components implemented and tested
- [ ] API integration complete and working
- [ ] Manual testing completed (can see templates, empty state works)
- [ ] Code reviewed and approved
- [ ] Merged to main branch
```

---

## Quick Issue Creation Checklist

When creating an issue from the backlog, ensure you:

1. ✅ Copy the appropriate section from BACKLOG.md
2. ✅ Use the issue template format above
3. ✅ Fill in all sections (Backend Work, Frontend Work, etc.)
4. ✅ List dependencies on other issues
5. ✅ Add appropriate labels:
   - `backend` and/or `frontend`
   - `priority: critical/high/medium/low`
   - `phase-0/1/2/3/4`
   - `enhancement`
6. ✅ Assign to appropriate developer(s)
7. ✅ Add to project board/milestone

---

## Recommended Labels

Create these labels in your GitHub repository:

### By Work Type
- `backend` - Backend API/database work
- `frontend` - Frontend UI/UX work
- `devops` - Infrastructure/Docker work
- `documentation` - Documentation updates
- `testing` - Testing-focused work

### By Priority
- `priority: critical` - Must be done first
- `priority: high` - Important, do early
- `priority: medium` - Important, but can wait
- `priority: low` - Nice to have

### By Phase
- `phase-0: infrastructure` - Infrastructure setup
- `phase-1: setup` - Setup page features
- `phase-2: cars` - Car management features
- `phase-3: dashboard` - Dashboard features
- `phase-4: polish` - Polish and testing

### By Status
- `ready` - Ready to start work
- `in-progress` - Currently being worked on
- `blocked` - Blocked by dependencies
- `review` - In code review
- `testing` - In testing phase

---

## Issue Workflow

```
┌─────────────┐
│   Backlog   │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│    Ready    │ ← Dependencies met, can start
└──────┬──────┘
       │
       ▼
┌─────────────┐
│ In Progress │ ← Assigned, actively working
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Review    │ ← PR created, in code review
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Testing   │ ← Manual testing in progress
└──────┬──────┘
       │
       ▼
┌─────────────┐
│    Done     │ ← Merged, deployed
└─────────────┘
```

---

## Creating Issues from BACKLOG.md

### For Issue #0:
```bash
# Copy from BACKLOG.md lines for Issue #0
# Paste into GitHub issue
# Add labels: backend, frontend, devops, priority: critical, phase-0: infrastructure
# Add to milestone: MVP v1.0
```

### For Issue #1:
```bash
# Copy from BACKLOG.md lines for Issue #1
# Paste into GitHub issue
# Add labels: backend, frontend, priority: high, phase-1: setup
# Mark dependency: "Depends on #0"
# Add to milestone: MVP v1.0
```

### Continue for all 14 issues (0-13)

---

## Project Board Setup

Create a GitHub project board with these columns:

1. **Backlog** - All issues that are defined but not ready
2. **Ready** - Issues with dependencies met, ready to start
3. **In Progress** - Currently being worked on
4. **Review** - In code review
5. **Testing** - Manual testing in progress
6. **Done** - Completed and merged

### Moving Cards

- Issues automatically move to "In Progress" when assigned
- Issues move to "Review" when PR is created
- Issues move to "Testing" when PR is approved
- Issues move to "Done" when PR is merged

---

## Sprint Planning Suggestion

### Sprint 0 (Week 1)
- Issue #0: Infrastructure Setup

### Sprint 1 (Week 2)
- Issue #1: List Templates
- Issue #2: Create Template
- Issue #3: Edit Template
- Issue #4: Archive/Restore Template

### Sprint 2 (Week 3)
- Issue #5: List Cars
- Issue #6: Create Car
- Issue #7: Edit Car

### Sprint 3 (Week 4)
- Issue #8: Track Change
- Issue #9: Change History
- Issue #10: Dashboard Display

### Sprint 4 (Week 5)
- Issue #11: Update Mileage
- Issue #12: Error Handling
- Issue #13: Testing & Documentation

---

## Tips for Success

1. **Always complete dependencies first** - Don't start Issue #6 before completing Issues #0-4
2. **Create issues in order** - Follow the numbering for logical flow
3. **Update issue status regularly** - Keep the project board current
4. **Link PRs to issues** - Use "Closes #X" in PR description
5. **Test each issue independently** - Each should be a complete, working feature
6. **Review before merging** - All code should be reviewed
7. **Keep PRs focused** - One issue per PR, avoid scope creep

---

## Automation Suggestions

Set up GitHub Actions to:
- Auto-label issues based on title/content
- Move cards on project board based on PR status
- Run tests on PR creation
- Auto-assign reviewers
- Post status updates in Slack/Discord

---

For more details on each issue, see [BACKLOG.md](./BACKLOG.md)
For quick reference, see [BACKLOG_QUICK_REFERENCE.md](./BACKLOG_QUICK_REFERENCE.md)
