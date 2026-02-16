# Car Maintenance Tracker - Backlog

This document contains the backlog of issues for the Car Maintenance Tracker project, split by frontend and backend work.

## Epic 1: Project Setup & Infrastructure

### Issue 1: Backend - Initialize .NET 8 Web API Project
**Type:** Backend  
**Labels:** setup, backend, infrastructure  
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

---

### Issue 2: Frontend - Initialize React + Vite Project
**Type:** Frontend  
**Labels:** setup, frontend, infrastructure  
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

---

### Issue 3: DevOps - Docker Configuration
**Type:** DevOps  
**Labels:** setup, docker, infrastructure  
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

---

## Epic 2: Database Models & Migrations

### Issue 4: Backend - Create Database Models
**Type:** Backend  
**Labels:** backend, database, models  
**Priority:** High  

**Description:**
Create Entity Framework Core models for all database entities.

**Acceptance Criteria:**
- [ ] Create MaintenanceItemTemplate model with all required fields
- [ ] Create Car model with all required fields
- [ ] Create CarMaintenanceItem model with all required fields
- [ ] Create TrackChange model with all required fields
- [ ] Configure relationships between entities
- [ ] Add data annotations for validation
- [ ] Configure DbContext with all DbSets

**Model Specifications:**
- MaintenanceItemTemplate: id, name, intervalType, intervalValue, archived, createdAt
- Car: id, name, currentKm, createdAt
- CarMaintenanceItem: id, carId, maintenanceTemplateId, lastServiceKm, lastServiceDate, intervalValue, intervalType, calculatedNextKm, calculatedNextDate
- TrackChange: id, carMaintenanceItemId, km, date

---

### Issue 5: Backend - Create Initial Database Migration
**Type:** Backend  
**Labels:** backend, database, migration  
**Priority:** High  

**Description:**
Create and apply initial database migration with all tables.

**Acceptance Criteria:**
- [ ] Generate initial EF Core migration
- [ ] Verify migration creates all tables correctly
- [ ] Test migration apply and rollback
- [ ] Document migration commands in README
- [ ] Ensure proper indexes are created

---

## Epic 3: Setup Page (/setup) - Maintenance Templates

### Issue 6: Backend - GET /setup Endpoint
**Type:** Backend  
**Labels:** backend, api, setup-page  
**Priority:** High  

**Description:**
Create endpoint to retrieve list of maintenance templates.

**Acceptance Criteria:**
- [ ] Implement GET /setup endpoint
- [ ] Return templates sorted by createdAt (newest first)
- [ ] Filter out archived templates by default (or include flag to show archived)
- [ ] Return proper JSON structure
- [ ] Add Swagger documentation
- [ ] Handle empty list scenario

**Response Example:**
```json
[
  {
    "id": 1,
    "name": "Oil Change",
    "intervalType": "km",
    "intervalValue": 10000,
    "archived": false,
    "createdAt": "2026-01-15T10:30:00Z"
  }
]
```

---

### Issue 7: Backend - POST /setup Endpoint
**Type:** Backend  
**Labels:** backend, api, setup-page  
**Priority:** High  

**Description:**
Create endpoint to add new maintenance template.

**Acceptance Criteria:**
- [ ] Implement POST /setup endpoint
- [ ] Validate required fields (name, intervalType, intervalValue)
- [ ] Validate intervalType is either "km" or "time"
- [ ] Validate intervalValue > 0
- [ ] Set archived to false by default
- [ ] Set createdAt automatically
- [ ] Return created template with generated ID
- [ ] Return appropriate error messages for validation failures
- [ ] Add Swagger documentation

---

### Issue 8: Backend - PUT /setup/{id} Endpoint
**Type:** Backend  
**Labels:** backend, api, setup-page  
**Priority:** High  

**Description:**
Create endpoint to update existing maintenance template.

**Acceptance Criteria:**
- [ ] Implement PUT /setup/{id} endpoint
- [ ] Validate all fields same as POST
- [ ] Return 404 if template not found
- [ ] Return updated template
- [ ] Preserve createdAt timestamp
- [ ] Add Swagger documentation

---

### Issue 9: Backend - PUT /setup/{id}/archive & restore Endpoints
**Type:** Backend  
**Labels:** backend, api, setup-page  
**Priority:** Medium  

**Description:**
Create endpoints to archive and restore maintenance templates.

**Acceptance Criteria:**
- [ ] Implement PUT /setup/{id}/archive endpoint
- [ ] Implement PUT /setup/{id}/restore endpoint
- [ ] Archive: set archived = true
- [ ] Restore: set archived = false
- [ ] Return 404 if template not found
- [ ] Return updated template status
- [ ] Add Swagger documentation

**Note:** When template is archived, all linked CarMaintenanceItems should be hidden from UI (handled in GET /cars endpoint).

---

### Issue 10: Frontend - Setup Page UI Component
**Type:** Frontend  
**Labels:** frontend, ui, setup-page  
**Priority:** High  

**Description:**
Create the Setup page UI to display and manage maintenance templates.

**Acceptance Criteria:**
- [ ] Create /setup route and page component
- [ ] Display list of templates or empty state message
- [ ] Show "Add new template" button
- [ ] Display template cards with name, interval type, and value
- [ ] Show edit (pencil) button for each template
- [ ] Show archive/restore button for each template
- [ ] Implement proper layout with Tailwind CSS
- [ ] Handle loading states
- [ ] Handle error states

---

### Issue 11: Frontend - Add New Maintenance Template Feature
**Type:** Frontend  
**Labels:** frontend, feature, setup-page  
**Priority:** High  

**Description:**
Implement functionality to add new maintenance templates with validation.

**Acceptance Criteria:**
- [ ] Render input fields when "Add new template" is clicked
- [ ] Name input field (string, required)
- [ ] Interval Type dropdown (km/time, required)
- [ ] Interval Value input (number, required, > 0)
- [ ] Dynamic label for Interval Value (km or days based on type)
- [ ] Show Save and Cancel buttons
- [ ] Implement frontend validation with error messages
- [ ] Call POST /setup endpoint on save
- [ ] Hide fields and refresh list on successful save
- [ ] Display backend error messages if API call fails
- [ ] Cancel button clears form without saving

**Validation Error Messages:**
- Name: "Name is obligatory field"
- Interval Type: "Interval type is obligatory field"
- Interval Value: "Interval value is obligatory field"

---

### Issue 12: Frontend - Edit Maintenance Template Feature
**Type:** Frontend  
**Labels:** frontend, feature, setup-page  
**Priority:** High  

**Description:**
Implement inline editing functionality for maintenance templates.

**Acceptance Criteria:**
- [ ] Transform template fields to editable on pencil icon click
- [ ] Pre-populate fields with current values
- [ ] Show Save and Cancel buttons
- [ ] Implement same validation as add feature
- [ ] Call PUT /setup/{id} endpoint on save
- [ ] Update UI with saved values
- [ ] Handle API errors and show error messages
- [ ] Revert to display mode on cancel

---

### Issue 13: Frontend - Archive/Restore Template Feature
**Type:** Frontend  
**Labels:** frontend, feature, setup-page  
**Priority:** Medium  

**Description:**
Implement archive and restore functionality for maintenance templates.

**Acceptance Criteria:**
- [ ] Show "Archive" button for non-archived templates
- [ ] Show "Restore" button for archived templates
- [ ] Display confirmation dialog before archiving
- [ ] Call PUT /setup/{id}/archive or PUT /setup/{id}/restore endpoint
- [ ] Update UI to reflect new status
- [ ] Archived templates should be visually distinguished or hidden
- [ ] Handle API errors

---

## Epic 4: Cars Page (/cars) - Car Management

### Issue 14: Backend - GET /cars Endpoint
**Type:** Backend  
**Labels:** backend, api, cars-page  
**Priority:** High  

**Description:**
Create endpoint to retrieve list of all cars with their maintenance items.

**Acceptance Criteria:**
- [ ] Implement GET /cars endpoint
- [ ] Return cars sorted by createdAt (newest first)
- [ ] Include all non-archived CarMaintenanceItems for each car
- [ ] Calculate and include next service km/date for each item
- [ ] Include template information for each maintenance item
- [ ] Return proper nested JSON structure
- [ ] Add Swagger documentation

**Response Example:**
```json
[
  {
    "id": 1,
    "name": "Toyota Camry",
    "currentKm": 50000,
    "createdAt": "2026-01-01T10:00:00Z",
    "maintenanceItems": [
      {
        "id": 1,
        "templateId": 1,
        "templateName": "Oil Change",
        "intervalType": "km",
        "intervalValue": 10000,
        "lastServiceKm": 45000,
        "lastServiceDate": null,
        "calculatedNextKm": 55000,
        "calculatedNextDate": null
      }
    ]
  }
]
```

---

### Issue 15: Backend - POST /cars Endpoint
**Type:** Backend  
**Labels:** backend, api, cars-page  
**Priority:** High  

**Description:**
Create endpoint to add new car with maintenance items.

**Acceptance Criteria:**
- [ ] Implement POST /cars endpoint
- [ ] Validate car name (required)
- [ ] Validate currentKm (required, >= 0)
- [ ] Accept array of maintenance items
- [ ] For each maintenance item, validate interval and last service km/date
- [ ] Create CarMaintenanceItem records for all non-archived templates
- [ ] Calculate and store next service km/date for each item
- [ ] Return created car with all maintenance items
- [ ] Add Swagger documentation

**Request Example:**
```json
{
  "name": "Toyota Camry",
  "currentKm": 50000,
  "maintenanceItems": [
    {
      "templateId": 1,
      "intervalValue": 10000,
      "lastServiceKm": 45000,
      "lastServiceDate": null
    }
  ]
}
```

---

### Issue 16: Backend - PUT /cars/{id} Endpoint
**Type:** Backend  
**Labels:** backend, api, cars-page  
**Priority:** High  

**Description:**
Create endpoint to update car and its maintenance items.

**Acceptance Criteria:**
- [ ] Implement PUT /cars/{id} endpoint
- [ ] Allow updating car name and currentKm
- [ ] Allow updating maintenance item intervals and last service km/date
- [ ] Recalculate next service km/date for updated items
- [ ] Validate all fields
- [ ] Return 404 if car not found
- [ ] Return updated car with maintenance items
- [ ] Add Swagger documentation

---

### Issue 17: Backend - POST /trackchange/{carMaintenanceItemId} Endpoint
**Type:** Backend  
**Labels:** backend, api, cars-page  
**Priority:** High  

**Description:**
Create endpoint to track a maintenance change for a car maintenance item.

**Acceptance Criteria:**
- [ ] Implement POST /trackchange/{carMaintenanceItemId} endpoint
- [ ] Accept km or date based on interval type
- [ ] Validate input (km >= 0 if type=km, valid date if type=time)
- [ ] Create TrackChange record
- [ ] Update CarMaintenanceItem with new lastServiceKm or lastServiceDate
- [ ] Recalculate next service km/date
- [ ] Return updated maintenance item
- [ ] Return 404 if maintenance item not found
- [ ] Add Swagger documentation

**Request Example:**
```json
{
  "km": 55000,
  "date": null
}
```
or
```json
{
  "km": null,
  "date": "2026-02-15T00:00:00Z"
}
```

---

### Issue 18: Frontend - Cars List Page UI
**Type:** Frontend  
**Labels:** frontend, ui, cars-page  
**Priority:** High  

**Description:**
Create the Cars list page UI to display all cars with their maintenance items.

**Acceptance Criteria:**
- [ ] Create /cars route and page component
- [ ] Display "Add Car" button at the top
- [ ] Display list of cars or empty state message
- [ ] For each car, show:
  - Car name
  - Current mileage
  - List of maintenance items with details
  - Edit button (pencil icon)
- [ ] For each maintenance item, show:
  - Part name
  - Interval information
  - Last service km/date
  - Next service km/date
  - "Track Change" button
  - Toggle to show change history
- [ ] Implement proper layout with Tailwind CSS
- [ ] Handle loading and error states
- [ ] Call GET /cars endpoint on page load

---

### Issue 19: Frontend - Add New Car Page
**Type:** Frontend  
**Labels:** frontend, feature, cars-page  
**Priority:** High  

**Description:**
Create page to add new car with maintenance configuration.

**Acceptance Criteria:**
- [ ] Create /cars/new route and page component
- [ ] Car name input field (required)
- [ ] Current mileage input field (required, integer >= 0)
- [ ] Fetch all non-archived templates on page load
- [ ] For each template, render fields:
  - Template name (read-only)
  - Interval value (editable, default from template)
  - Last service km/date (editable based on interval type)
- [ ] For time-based intervals, use masked date input (dd/mm/yyyy)
- [ ] Implement frontend validation for all fields
- [ ] Show validation error messages
- [ ] Save button calls POST /cars endpoint
- [ ] Redirect to /cars list on successful save
- [ ] Cancel button returns to /cars list

**Validation Error Messages:**
- Name: "Name is obligatory field"
- Mileage: "Mileage is obligatory field"
- Interval: "Interval is obligatory field"
- Last service: "Last service km/date is obligatory field"

---

### Issue 20: Frontend - Edit Car Page
**Type:** Frontend  
**Labels:** frontend, feature, cars-page  
**Priority:** High  

**Description:**
Create page to edit existing car and its maintenance items.

**Acceptance Criteria:**
- [ ] Create /cars/{id}/edit route and page component
- [ ] Fetch car data on page load
- [ ] Allow editing car name
- [ ] Allow editing current km
- [ ] Allow editing maintenance item intervals
- [ ] Allow editing last service km/date for each item
- [ ] Pre-populate all fields with current values
- [ ] Use masked date input for time-based intervals
- [ ] Implement validation (same as add car)
- [ ] Save button calls PUT /cars/{id} endpoint
- [ ] Redirect to /cars list on successful save
- [ ] Cancel button returns to /cars list

---

### Issue 21: Frontend - Track Change Feature
**Type:** Frontend  
**Labels:** frontend, feature, cars-page  
**Priority:** High  

**Description:**
Implement track change functionality for maintenance items.

**Acceptance Criteria:**
- [ ] Add "Track Change" button for each maintenance item
- [ ] On click, show modal or inline form
- [ ] For km-based items:
  - Show input field for km
  - Pre-populate with current car mileage
- [ ] For time-based items:
  - Show masked date input field (dd/mm/yyyy)
  - Pre-populate with current date
- [ ] Implement validation
- [ ] Call POST /trackchange/{carMaintenanceItemId} endpoint
- [ ] Update UI with new values after successful save
- [ ] Show success/error messages
- [ ] Close modal/form after save

---

### Issue 22: Frontend - Maintenance Item Change History
**Type:** Frontend  
**Labels:** frontend, feature, cars-page  
**Priority:** Medium  

**Description:**
Display change history for each maintenance item in a collapsible section.

**Acceptance Criteria:**
- [ ] Add toggle/expand button for each maintenance item
- [ ] Fetch change history from TrackChange records
- [ ] Display list of all changes with:
  - Date/time of change
  - Km at change (if applicable)
  - Calculated usage duration until change
- [ ] Show "No changes recorded" if empty
- [ ] Implement collapsible UI component
- [ ] Handle loading state while fetching history

**Note:** May require additional GET endpoint to fetch TrackChange history.

---

## Epic 5: Dashboard Page (/dashboard)

### Issue 23: Backend - GET /dashboard/{carId} Endpoint
**Type:** Backend  
**Labels:** backend, api, dashboard-page  
**Priority:** High  

**Description:**
Create endpoint to retrieve dashboard data for a specific car with status grouping.

**Acceptance Criteria:**
- [ ] Implement GET /dashboard/{carId} endpoint
- [ ] Calculate status for each maintenance item:
  - Overdue (Red): past due km/date
  - Due Soon (Yellow): < 30 days or < 300 km
  - OK (Green): > 30 days or > 300 km
- [ ] Group maintenance items by status
- [ ] For each item, include:
  - Name, interval info
  - Next due km/date
  - Remaining km or days
- [ ] Return car information (name, current km)
- [ ] Return 404 if car not found
- [ ] Add Swagger documentation

**Response Example:**
```json
{
  "car": {
    "id": 1,
    "name": "Toyota Camry",
    "currentKm": 50000
  },
  "overdue": [...],
  "dueSoon": [...],
  "ok": [...]
}
```

---

### Issue 24: Backend - PUT /cars/{id}/km Endpoint
**Type:** Backend  
**Labels:** backend, api, dashboard-page  
**Priority:** Medium  

**Description:**
Create endpoint to update only the current km/mileage for a car.

**Acceptance Criteria:**
- [ ] Implement PUT /cars/{id}/km endpoint
- [ ] Accept new km value
- [ ] Validate km >= 0
- [ ] Update car's currentKm
- [ ] Return updated car
- [ ] Return 404 if car not found
- [ ] Add Swagger documentation

---

### Issue 25: Frontend - Dashboard Page UI
**Type:** Frontend  
**Labels:** frontend, ui, dashboard-page  
**Priority:** High  

**Description:**
Create the Dashboard page UI with status-grouped maintenance items.

**Acceptance Criteria:**
- [ ] Create /dashboard route and page component
- [ ] Dropdown to select car (fetch from GET /cars)
- [ ] Default to first car in list
- [ ] Display current mileage for selected car
- [ ] Add edit button to update mileage inline
- [ ] Show three sections:
  - 🔴 Overdue
  - 🟡 Due Soon
  - 🟢 OK
- [ ] For each maintenance item in sections, display:
  - Part name
  - Interval information
  - Next due date/km
  - Remaining km or days
  - "Track Change" button
- [ ] Implement proper styling with color coding
- [ ] Handle loading and error states
- [ ] Call GET /dashboard/{carId} on car selection

---

### Issue 26: Frontend - Dashboard Car Selection
**Type:** Frontend  
**Labels:** frontend, feature, dashboard-page  
**Priority:** High  

**Description:**
Implement car selection dropdown for dashboard filtering.

**Acceptance Criteria:**
- [ ] Create dropdown component with all cars
- [ ] Display car name in dropdown
- [ ] Default to first car
- [ ] On selection change, call GET /dashboard/{carId}
- [ ] Update entire dashboard view with new car data
- [ ] Maintain selection in component state
- [ ] Handle case when no cars exist

---

### Issue 27: Frontend - Dashboard Inline Mileage Update
**Type:** Frontend  
**Labels:** frontend, feature, dashboard-page  
**Priority:** Medium  

**Description:**
Implement inline editing of current mileage on dashboard.

**Acceptance Criteria:**
- [ ] Display current mileage with edit button (pencil icon)
- [ ] On click, transform to input field
- [ ] Show Save and Cancel buttons
- [ ] Validate km >= 0
- [ ] Call PUT /cars/{id}/km endpoint on save
- [ ] Update displayed mileage
- [ ] Refresh dashboard data to recalculate statuses
- [ ] Handle API errors
- [ ] Revert on cancel

---

## Epic 6: Backend Logic & Calculations

### Issue 28: Backend - Next Service Calculation Logic
**Type:** Backend  
**Labels:** backend, logic, calculation  
**Priority:** High  

**Description:**
Implement calculation logic for next service km/date.

**Acceptance Criteria:**
- [ ] Create service to calculate next service
- [ ] For km-based: NextServiceKm = LastServiceKm + IntervalValue
- [ ] For time-based: NextServiceDate = LastServiceDate + IntervalValue (days)
- [ ] Calculate on car creation
- [ ] Recalculate on track change
- [ ] Recalculate on maintenance item update
- [ ] Store calculated values in CarMaintenanceItem
- [ ] Add unit tests for calculation logic

---

### Issue 29: Backend - Dashboard Status Calculation Logic
**Type:** Backend  
**Labels:** backend, logic, calculation  
**Priority:** High  

**Description:**
Implement status calculation logic for dashboard grouping.

**Acceptance Criteria:**
- [ ] Create service to calculate maintenance item status
- [ ] For km-based:
  - Red: CurrentKm >= NextServiceKm
  - Yellow: NextServiceKm - CurrentKm <= 300
  - Green: NextServiceKm - CurrentKm > 300
- [ ] For time-based:
  - Red: Today >= NextServiceDate
  - Yellow: NextServiceDate - Today <= 30 days
  - Green: NextServiceDate - Today > 30 days
- [ ] Use in GET /dashboard/{carId} endpoint
- [ ] Add unit tests for status logic

---

### Issue 30: Backend - Template Archive Cascade Logic
**Type:** Backend  
**Labels:** backend, logic, feature  
**Priority:** Medium  

**Description:**
Implement logic to hide CarMaintenanceItems when template is archived.

**Acceptance Criteria:**
- [ ] When template is archived, mark associated CarMaintenanceItems
- [ ] GET /cars should filter out items with archived templates
- [ ] GET /dashboard should filter out items with archived templates
- [ ] Archived items should not appear in UI
- [ ] When template is restored, items become visible again
- [ ] Don't delete CarMaintenanceItems, just hide them

---

## Epic 7: Validation & Error Handling

### Issue 31: Frontend - Masked Date Input Component
**Type:** Frontend  
**Labels:** frontend, component, validation  
**Priority:** High  

**Description:**
Create reusable masked date input component with validation.

**Acceptance Criteria:**
- [ ] Create component for dd/mm/yyyy format
- [ ] Enforce mask as user types
- [ ] Validate dd <= 31
- [ ] Validate mm <= 12
- [ ] Validate yyyy >= 2000
- [ ] Show validation errors
- [ ] Allow clearing the input
- [ ] Make component reusable across pages
- [ ] Add visual feedback for invalid input
- [ ] Handle edge cases (leap years, month-end dates)

---

### Issue 32: Backend - Comprehensive Input Validation
**Type:** Backend  
**Labels:** backend, validation, error-handling  
**Priority:** High  

**Description:**
Implement comprehensive validation for all API endpoints.

**Acceptance Criteria:**
- [ ] Add validation for all required fields
- [ ] Validate data types and ranges
- [ ] Return 400 Bad Request with error details for validation failures
- [ ] Use consistent error response format
- [ ] Validate date parsing from dd/mm/yyyy format
- [ ] Add model validation attributes
- [ ] Test validation with invalid inputs

**Error Response Format:**
```json
{
  "errors": {
    "name": ["Name is obligatory field"],
    "intervalValue": ["Interval value must be greater than 0"]
  }
}
```

---

### Issue 33: Frontend - Global Error Handling
**Type:** Frontend  
**Labels:** frontend, error-handling  
**Priority:** Medium  

**Description:**
Implement global error handling and user feedback system.

**Acceptance Criteria:**
- [ ] Create error boundary component
- [ ] Display user-friendly error messages
- [ ] Handle API errors consistently
- [ ] Show loading spinners during API calls
- [ ] Display success messages after operations
- [ ] Create toast/notification component
- [ ] Handle network errors gracefully
- [ ] Log errors for debugging

---

## Epic 8: Testing & Quality Assurance

### Issue 34: Backend - Unit Tests for Models and Logic
**Type:** Backend  
**Labels:** backend, testing, unit-tests  
**Priority:** Medium  

**Description:**
Create unit tests for calculation logic and model validation.

**Acceptance Criteria:**
- [ ] Test next service calculation logic
- [ ] Test status calculation logic
- [ ] Test date parsing logic
- [ ] Test validation logic
- [ ] Test edge cases
- [ ] Achieve >80% code coverage for logic layer
- [ ] Use xUnit or NUnit framework

---

### Issue 35: Backend - Integration Tests for API Endpoints
**Type:** Backend  
**Labels:** backend, testing, integration-tests  
**Priority:** Medium  

**Description:**
Create integration tests for all API endpoints.

**Acceptance Criteria:**
- [ ] Test all GET endpoints
- [ ] Test all POST endpoints
- [ ] Test all PUT endpoints
- [ ] Test error responses (404, 400)
- [ ] Test with in-memory database
- [ ] Test complete workflows (add car, track change, etc.)
- [ ] Use WebApplicationFactory for testing

---

### Issue 36: Frontend - Component Unit Tests
**Type:** Frontend  
**Labels:** frontend, testing, unit-tests  
**Priority:** Low  

**Description:**
Create unit tests for React components.

**Acceptance Criteria:**
- [ ] Test masked date input component
- [ ] Test form validation logic
- [ ] Test component rendering
- [ ] Test user interactions
- [ ] Use Jest and React Testing Library
- [ ] Achieve >70% component coverage

---

## Epic 9: Documentation & Deployment

### Issue 37: Documentation - README and Setup Guide
**Type:** Documentation  
**Labels:** documentation  
**Priority:** Medium  

**Description:**
Create comprehensive documentation for setting up and running the project.

**Acceptance Criteria:**
- [ ] Update README.md with project overview
- [ ] Document prerequisites (Docker, Node.js, .NET)
- [ ] Document Docker setup and commands
- [ ] Document how to run frontend locally
- [ ] Document how to run backend locally
- [ ] Document database migrations
- [ ] Add API documentation link (Swagger)
- [ ] Add troubleshooting section
- [ ] Include architecture diagram

---

### Issue 38: Documentation - API Documentation
**Type:** Documentation  
**Labels:** documentation, backend  
**Priority:** Medium  

**Description:**
Ensure comprehensive API documentation in Swagger.

**Acceptance Criteria:**
- [ ] All endpoints documented in Swagger
- [ ] Request/response examples for all endpoints
- [ ] Document all error responses
- [ ] Document validation requirements
- [ ] Add descriptions for all models
- [ ] Configure Swagger UI with proper branding
- [ ] Export Swagger JSON for reference

---

### Issue 39: DevOps - CI/CD Pipeline Setup
**Type:** DevOps  
**Labels:** devops, ci-cd  
**Priority:** Low  

**Description:**
Set up CI/CD pipeline for automated testing and deployment.

**Acceptance Criteria:**
- [ ] Create GitHub Actions workflow
- [ ] Run backend tests on push
- [ ] Run frontend tests on push
- [ ] Build Docker images on push to main
- [ ] Add linting checks
- [ ] Add code coverage reporting
- [ ] Document CI/CD process

---

## Epic 10: Polish & Enhancements

### Issue 40: Frontend - Responsive Design
**Type:** Frontend  
**Labels:** frontend, ui, enhancement  
**Priority:** Low  

**Description:**
Ensure all pages are responsive and work on mobile devices.

**Acceptance Criteria:**
- [ ] Test all pages on mobile viewport
- [ ] Adjust layouts for small screens
- [ ] Ensure touch-friendly buttons
- [ ] Test on different screen sizes
- [ ] Use Tailwind responsive utilities
- [ ] Add mobile navigation menu if needed

---

### Issue 41: Frontend - Loading States and Skeletons
**Type:** Frontend  
**Labels:** frontend, ui, enhancement  
**Priority:** Low  

**Description:**
Add loading skeletons and better loading states.

**Acceptance Criteria:**
- [ ] Create skeleton loader components
- [ ] Add loading skeletons for car list
- [ ] Add loading skeletons for setup list
- [ ] Add loading skeletons for dashboard
- [ ] Improve loading spinner designs
- [ ] Add transition animations

---

### Issue 42: Backend - Database Seeding
**Type:** Backend  
**Labels:** backend, database, enhancement  
**Priority:** Low  

**Description:**
Create database seeding for development/testing.

**Acceptance Criteria:**
- [ ] Create seed data script
- [ ] Add sample maintenance templates
- [ ] Add sample cars with maintenance items
- [ ] Add sample track changes
- [ ] Document how to run seeding
- [ ] Make seeding optional for production

---

---

## Summary

**Total Issues:** 42

**By Type:**
- Backend: 18 issues
- Frontend: 18 issues
- DevOps: 3 issues
- Documentation: 2 issues
- Testing: 1 issue (split testing into separate issues)

**By Priority:**
- High: 26 issues
- Medium: 13 issues
- Low: 3 issues

**Recommended Implementation Order:**
1. Epic 1: Project Setup & Infrastructure (Issues 1-3)
2. Epic 2: Database Models & Migrations (Issues 4-5)
3. Epic 3: Setup Page (Issues 6-13)
4. Epic 4: Cars Page (Issues 14-22)
5. Epic 5: Dashboard Page (Issues 23-27)
6. Epic 6: Backend Logic (Issues 28-30)
7. Epic 7: Validation (Issues 31-33)
8. Epic 8: Testing (Issues 34-36)
9. Epic 9: Documentation (Issues 37-39)
10. Epic 10: Polish (Issues 40-42)

