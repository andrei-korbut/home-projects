#!/bin/bash

# Script to create GitHub issues from backlog
# Usage: ./create-issues.sh
# Prerequisites: GitHub CLI (gh) must be installed and authenticated

REPO="andrei-korbut/home-projects"

echo "Creating GitHub issues for Car Maintenance Tracker..."
echo "Repository: $REPO"
echo ""

# Epic 1: Project Setup & Infrastructure

echo "Creating Issue 1: Backend - Initialize .NET 8 Web API Project"
gh issue create \
  --repo "$REPO" \
  --title "Backend: Initialize .NET 8 Web API Project" \
  --label "setup,backend,infrastructure" \
  --body "**Type:** Backend
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
- Enable Swagger UI for API documentation"

echo "Creating Issue 2: Frontend - Initialize React + Vite Project"
gh issue create \
  --repo "$REPO" \
  --title "Frontend: Initialize React + Vite Project" \
  --label "setup,frontend,infrastructure" \
  --body "**Type:** Frontend
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
- Set up basic routes for /setup, /cars, /dashboard"

echo "Creating Issue 3: DevOps - Docker Configuration"
gh issue create \
  --repo "$REPO" \
  --title "DevOps: Docker Configuration" \
  --label "setup,docker,infrastructure" \
  --body "**Type:** DevOps
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
- Configure proper service naming for URL resolution"

echo "Creating Issue 4: Backend - Create Database Models"
gh issue create \
  --repo "$REPO" \
  --title "Backend: Create Database Models" \
  --label "backend,database,models" \
  --body "**Type:** Backend
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
- TrackChange: id, carMaintenanceItemId, km, date"

echo "Creating Issue 5: Backend - Create Initial Database Migration"
gh issue create \
  --repo "$REPO" \
  --title "Backend: Create Initial Database Migration" \
  --label "backend,database,migration" \
  --body "**Type:** Backend
**Priority:** High

**Description:**
Create and apply initial database migration with all tables.

**Acceptance Criteria:**
- [ ] Generate initial EF Core migration
- [ ] Verify migration creates all tables correctly
- [ ] Test migration apply and rollback
- [ ] Document migration commands in README
- [ ] Ensure proper indexes are created"

echo "Creating Issue 6: Backend - GET /setup Endpoint"
gh issue create \
  --repo "$REPO" \
  --title "Backend: GET /setup Endpoint" \
  --label "backend,api,setup-page" \
  --body "**Type:** Backend
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
\`\`\`json
[
  {
    \"id\": 1,
    \"name\": \"Oil Change\",
    \"intervalType\": \"km\",
    \"intervalValue\": 10000,
    \"archived\": false,
    \"createdAt\": \"2026-01-15T10:30:00Z\"
  }
]
\`\`\`"

echo "Creating Issue 7: Backend - POST /setup Endpoint"
gh issue create \
  --repo "$REPO" \
  --title "Backend: POST /setup Endpoint" \
  --label "backend,api,setup-page" \
  --body "**Type:** Backend
**Priority:** High

**Description:**
Create endpoint to add new maintenance template.

**Acceptance Criteria:**
- [ ] Implement POST /setup endpoint
- [ ] Validate required fields (name, intervalType, intervalValue)
- [ ] Validate intervalType is either \"km\" or \"time\"
- [ ] Validate intervalValue > 0
- [ ] Set archived to false by default
- [ ] Set createdAt automatically
- [ ] Return created template with generated ID
- [ ] Return appropriate error messages for validation failures
- [ ] Add Swagger documentation"

echo "Creating Issue 8: Backend - PUT /setup/{id} Endpoint"
gh issue create \
  --repo "$REPO" \
  --title "Backend: PUT /setup/{id} Endpoint" \
  --label "backend,api,setup-page" \
  --body "**Type:** Backend
**Priority:** High

**Description:**
Create endpoint to update existing maintenance template.

**Acceptance Criteria:**
- [ ] Implement PUT /setup/{id} endpoint
- [ ] Validate all fields same as POST
- [ ] Return 404 if template not found
- [ ] Return updated template
- [ ] Preserve createdAt timestamp
- [ ] Add Swagger documentation"

echo "Creating Issue 9: Backend - PUT /setup/{id}/archive & restore Endpoints"
gh issue create \
  --repo "$REPO" \
  --title "Backend: PUT /setup/{id}/archive & restore Endpoints" \
  --label "backend,api,setup-page" \
  --body "**Type:** Backend
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

**Note:** When template is archived, all linked CarMaintenanceItems should be hidden from UI (handled in GET /cars endpoint)."

echo "Creating Issue 10: Frontend - Setup Page UI Component"
gh issue create \
  --repo "$REPO" \
  --title "Frontend: Setup Page UI Component" \
  --label "frontend,ui,setup-page" \
  --body "**Type:** Frontend
**Priority:** High

**Description:**
Create the Setup page UI to display and manage maintenance templates.

**Acceptance Criteria:**
- [ ] Create /setup route and page component
- [ ] Display list of templates or empty state message
- [ ] Show \"Add new template\" button
- [ ] Display template cards with name, interval type, and value
- [ ] Show edit (pencil) button for each template
- [ ] Show archive/restore button for each template
- [ ] Implement proper layout with Tailwind CSS
- [ ] Handle loading states
- [ ] Handle error states"

echo "Creating Issue 11: Frontend - Add New Maintenance Template Feature"
gh issue create \
  --repo "$REPO" \
  --title "Frontend: Add New Maintenance Template Feature" \
  --label "frontend,feature,setup-page" \
  --body "**Type:** Frontend
**Priority:** High

**Description:**
Implement functionality to add new maintenance templates with validation.

**Acceptance Criteria:**
- [ ] Render input fields when \"Add new template\" is clicked
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
- Name: \"Name is obligatory field\"
- Interval Type: \"Interval type is obligatory field\"
- Interval Value: \"Interval value is obligatory field\""

echo "Creating Issue 12: Frontend - Edit Maintenance Template Feature"
gh issue create \
  --repo "$REPO" \
  --title "Frontend: Edit Maintenance Template Feature" \
  --label "frontend,feature,setup-page" \
  --body "**Type:** Frontend
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
- [ ] Revert to display mode on cancel"

echo "Creating Issue 13: Frontend - Archive/Restore Template Feature"
gh issue create \
  --repo "$REPO" \
  --title "Frontend: Archive/Restore Template Feature" \
  --label "frontend,feature,setup-page" \
  --body "**Type:** Frontend
**Priority:** Medium

**Description:**
Implement archive and restore functionality for maintenance templates.

**Acceptance Criteria:**
- [ ] Show \"Archive\" button for non-archived templates
- [ ] Show \"Restore\" button for archived templates
- [ ] Display confirmation dialog before archiving
- [ ] Call PUT /setup/{id}/archive or PUT /setup/{id}/restore endpoint
- [ ] Update UI to reflect new status
- [ ] Archived templates should be visually distinguished or hidden
- [ ] Handle API errors"

echo "Creating Issue 14: Backend - GET /cars Endpoint"
gh issue create \
  --repo "$REPO" \
  --title "Backend: GET /cars Endpoint" \
  --label "backend,api,cars-page" \
  --body "**Type:** Backend
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
- [ ] Add Swagger documentation"

echo "Creating Issue 15: Backend - POST /cars Endpoint"
gh issue create \
  --repo "$REPO" \
  --title "Backend: POST /cars Endpoint" \
  --label "backend,api,cars-page" \
  --body "**Type:** Backend
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
- [ ] Add Swagger documentation"

echo "Creating Issue 16: Backend - PUT /cars/{id} Endpoint"
gh issue create \
  --repo "$REPO" \
  --title "Backend: PUT /cars/{id} Endpoint" \
  --label "backend,api,cars-page" \
  --body "**Type:** Backend
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
- [ ] Add Swagger documentation"

echo "Creating Issue 17: Backend - POST /trackchange/{carMaintenanceItemId} Endpoint"
gh issue create \
  --repo "$REPO" \
  --title "Backend: POST /trackchange/{carMaintenanceItemId} Endpoint" \
  --label "backend,api,cars-page" \
  --body "**Type:** Backend
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
- [ ] Add Swagger documentation"

echo "Creating Issue 18: Frontend - Cars List Page UI"
gh issue create \
  --repo "$REPO" \
  --title "Frontend: Cars List Page UI" \
  --label "frontend,ui,cars-page" \
  --body "**Type:** Frontend
**Priority:** High

**Description:**
Create the Cars list page UI to display all cars with their maintenance items.

**Acceptance Criteria:**
- [ ] Create /cars route and page component
- [ ] Display \"Add Car\" button at the top
- [ ] Display list of cars or empty state message
- [ ] For each car, show: Car name, Current mileage, List of maintenance items, Edit button
- [ ] For each maintenance item, show: Part name, Interval info, Last service, Next service, Track Change button, Toggle for change history
- [ ] Implement proper layout with Tailwind CSS
- [ ] Handle loading and error states
- [ ] Call GET /cars endpoint on page load"

echo "Creating Issue 19: Frontend - Add New Car Page"
gh issue create \
  --repo "$REPO" \
  --title "Frontend: Add New Car Page" \
  --label "frontend,feature,cars-page" \
  --body "**Type:** Frontend
**Priority:** High

**Description:**
Create page to add new car with maintenance configuration.

**Acceptance Criteria:**
- [ ] Create /cars/new route and page component
- [ ] Car name input field (required)
- [ ] Current mileage input field (required, integer >= 0)
- [ ] Fetch all non-archived templates on page load
- [ ] For each template, render editable fields
- [ ] For time-based intervals, use masked date input (dd/mm/yyyy)
- [ ] Implement frontend validation for all fields
- [ ] Show validation error messages
- [ ] Save button calls POST /cars endpoint
- [ ] Redirect to /cars list on successful save
- [ ] Cancel button returns to /cars list"

echo "Creating Issue 20: Frontend - Edit Car Page"
gh issue create \
  --repo "$REPO" \
  --title "Frontend: Edit Car Page" \
  --label "frontend,feature,cars-page" \
  --body "**Type:** Frontend
**Priority:** High

**Description:**
Create page to edit existing car and its maintenance items.

**Acceptance Criteria:**
- [ ] Create /cars/{id}/edit route and page component
- [ ] Fetch car data on page load
- [ ] Allow editing car name and current km
- [ ] Allow editing maintenance item intervals and last service km/date
- [ ] Pre-populate all fields with current values
- [ ] Use masked date input for time-based intervals
- [ ] Implement validation (same as add car)
- [ ] Save button calls PUT /cars/{id} endpoint
- [ ] Redirect to /cars list on successful save
- [ ] Cancel button returns to /cars list"

echo "Creating Issue 21: Frontend - Track Change Feature"
gh issue create \
  --repo "$REPO" \
  --title "Frontend: Track Change Feature" \
  --label "frontend,feature,cars-page" \
  --body "**Type:** Frontend
**Priority:** High

**Description:**
Implement track change functionality for maintenance items.

**Acceptance Criteria:**
- [ ] Add \"Track Change\" button for each maintenance item
- [ ] On click, show modal or inline form
- [ ] For km-based items: show input field pre-populated with current car mileage
- [ ] For time-based items: show masked date input pre-populated with current date
- [ ] Implement validation
- [ ] Call POST /trackchange/{carMaintenanceItemId} endpoint
- [ ] Update UI with new values after successful save
- [ ] Show success/error messages
- [ ] Close modal/form after save"

echo "Creating Issue 22: Frontend - Maintenance Item Change History"
gh issue create \
  --repo "$REPO" \
  --title "Frontend: Maintenance Item Change History" \
  --label "frontend,feature,cars-page" \
  --body "**Type:** Frontend
**Priority:** Medium

**Description:**
Display change history for each maintenance item in a collapsible section.

**Acceptance Criteria:**
- [ ] Add toggle/expand button for each maintenance item
- [ ] Fetch change history from TrackChange records
- [ ] Display list of all changes with date/time and km
- [ ] Show \"No changes recorded\" if empty
- [ ] Implement collapsible UI component
- [ ] Handle loading state while fetching history

**Note:** May require additional GET endpoint to fetch TrackChange history."

echo "Creating Issue 23: Backend - GET /dashboard/{carId} Endpoint"
gh issue create \
  --repo "$REPO" \
  --title "Backend: GET /dashboard/{carId} Endpoint" \
  --label "backend,api,dashboard-page" \
  --body "**Type:** Backend
**Priority:** High

**Description:**
Create endpoint to retrieve dashboard data for a specific car with status grouping.

**Acceptance Criteria:**
- [ ] Implement GET /dashboard/{carId} endpoint
- [ ] Calculate status for each maintenance item (Overdue, Due Soon, OK)
- [ ] Group maintenance items by status
- [ ] For each item, include name, interval info, next due, remaining km/days
- [ ] Return car information (name, current km)
- [ ] Return 404 if car not found
- [ ] Add Swagger documentation"

echo "Creating Issue 24: Backend - PUT /cars/{id}/km Endpoint"
gh issue create \
  --repo "$REPO" \
  --title "Backend: PUT /cars/{id}/km Endpoint" \
  --label "backend,api,dashboard-page" \
  --body "**Type:** Backend
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
- [ ] Add Swagger documentation"

echo "Creating Issue 25: Frontend - Dashboard Page UI"
gh issue create \
  --repo "$REPO" \
  --title "Frontend: Dashboard Page UI" \
  --label "frontend,ui,dashboard-page" \
  --body "**Type:** Frontend
**Priority:** High

**Description:**
Create the Dashboard page UI with status-grouped maintenance items.

**Acceptance Criteria:**
- [ ] Create /dashboard route and page component
- [ ] Dropdown to select car (fetch from GET /cars)
- [ ] Default to first car in list
- [ ] Display current mileage for selected car
- [ ] Add edit button to update mileage inline
- [ ] Show three sections: Overdue (Red), Due Soon (Yellow), OK (Green)
- [ ] For each item display: name, interval info, next due, remaining km/days, Track Change button
- [ ] Implement proper styling with color coding
- [ ] Handle loading and error states
- [ ] Call GET /dashboard/{carId} on car selection"

echo "Creating Issue 26: Frontend - Dashboard Car Selection"
gh issue create \
  --repo "$REPO" \
  --title "Frontend: Dashboard Car Selection" \
  --label "frontend,feature,dashboard-page" \
  --body "**Type:** Frontend
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
- [ ] Handle case when no cars exist"

echo "Creating Issue 27: Frontend - Dashboard Inline Mileage Update"
gh issue create \
  --repo "$REPO" \
  --title "Frontend: Dashboard Inline Mileage Update" \
  --label "frontend,feature,dashboard-page" \
  --body "**Type:** Frontend
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
- [ ] Revert on cancel"

echo "Creating Issue 28: Backend - Next Service Calculation Logic"
gh issue create \
  --repo "$REPO" \
  --title "Backend: Next Service Calculation Logic" \
  --label "backend,logic,calculation" \
  --body "**Type:** Backend
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
- [ ] Add unit tests for calculation logic"

echo "Creating Issue 29: Backend - Dashboard Status Calculation Logic"
gh issue create \
  --repo "$REPO" \
  --title "Backend: Dashboard Status Calculation Logic" \
  --label "backend,logic,calculation" \
  --body "**Type:** Backend
**Priority:** High

**Description:**
Implement status calculation logic for dashboard grouping.

**Acceptance Criteria:**
- [ ] Create service to calculate maintenance item status
- [ ] For km-based: Red (>= due), Yellow (< 300km), Green (> 300km)
- [ ] For time-based: Red (>= due), Yellow (< 30 days), Green (> 30 days)
- [ ] Use in GET /dashboard/{carId} endpoint
- [ ] Add unit tests for status logic"

echo "Creating Issue 30: Backend - Template Archive Cascade Logic"
gh issue create \
  --repo "$REPO" \
  --title "Backend: Template Archive Cascade Logic" \
  --label "backend,logic,feature" \
  --body "**Type:** Backend
**Priority:** Medium

**Description:**
Implement logic to hide CarMaintenanceItems when template is archived.

**Acceptance Criteria:**
- [ ] When template is archived, mark associated CarMaintenanceItems
- [ ] GET /cars should filter out items with archived templates
- [ ] GET /dashboard should filter out items with archived templates
- [ ] Archived items should not appear in UI
- [ ] When template is restored, items become visible again
- [ ] Don't delete CarMaintenanceItems, just hide them"

echo "Creating Issue 31: Frontend - Masked Date Input Component"
gh issue create \
  --repo "$REPO" \
  --title "Frontend: Masked Date Input Component" \
  --label "frontend,component,validation" \
  --body "**Type:** Frontend
**Priority:** High

**Description:**
Create reusable masked date input component with validation.

**Acceptance Criteria:**
- [ ] Create component for dd/mm/yyyy format
- [ ] Enforce mask as user types
- [ ] Validate dd <= 31, mm <= 12, yyyy >= 2000
- [ ] Show validation errors
- [ ] Allow clearing the input
- [ ] Make component reusable across pages
- [ ] Add visual feedback for invalid input
- [ ] Handle edge cases (leap years, month-end dates)"

echo "Creating Issue 32: Backend - Comprehensive Input Validation"
gh issue create \
  --repo "$REPO" \
  --title "Backend: Comprehensive Input Validation" \
  --label "backend,validation,error-handling" \
  --body "**Type:** Backend
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
- [ ] Test validation with invalid inputs"

echo "Creating Issue 33: Frontend - Global Error Handling"
gh issue create \
  --repo "$REPO" \
  --title "Frontend: Global Error Handling" \
  --label "frontend,error-handling" \
  --body "**Type:** Frontend
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
- [ ] Log errors for debugging"

echo "Creating Issue 34: Backend - Unit Tests for Models and Logic"
gh issue create \
  --repo "$REPO" \
  --title "Backend: Unit Tests for Models and Logic" \
  --label "backend,testing,unit-tests" \
  --body "**Type:** Backend
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
- [ ] Use xUnit or NUnit framework"

echo "Creating Issue 35: Backend - Integration Tests for API Endpoints"
gh issue create \
  --repo "$REPO" \
  --title "Backend: Integration Tests for API Endpoints" \
  --label "backend,testing,integration-tests" \
  --body "**Type:** Backend
**Priority:** Medium

**Description:**
Create integration tests for all API endpoints.

**Acceptance Criteria:**
- [ ] Test all GET endpoints
- [ ] Test all POST endpoints
- [ ] Test all PUT endpoints
- [ ] Test error responses (404, 400)
- [ ] Test with in-memory database
- [ ] Test complete workflows
- [ ] Use WebApplicationFactory for testing"

echo "Creating Issue 36: Frontend - Component Unit Tests"
gh issue create \
  --repo "$REPO" \
  --title "Frontend: Component Unit Tests" \
  --label "frontend,testing,unit-tests" \
  --body "**Type:** Frontend
**Priority:** Low

**Description:**
Create unit tests for React components.

**Acceptance Criteria:**
- [ ] Test masked date input component
- [ ] Test form validation logic
- [ ] Test component rendering
- [ ] Test user interactions
- [ ] Use Jest and React Testing Library
- [ ] Achieve >70% component coverage"

echo "Creating Issue 37: Documentation - README and Setup Guide"
gh issue create \
  --repo "$REPO" \
  --title "Documentation: README and Setup Guide" \
  --label "documentation" \
  --body "**Type:** Documentation
**Priority:** Medium

**Description:**
Create comprehensive documentation for setting up and running the project.

**Acceptance Criteria:**
- [ ] Update README.md with project overview
- [ ] Document prerequisites
- [ ] Document Docker setup and commands
- [ ] Document how to run frontend/backend locally
- [ ] Document database migrations
- [ ] Add API documentation link (Swagger)
- [ ] Add troubleshooting section
- [ ] Include architecture diagram"

echo "Creating Issue 38: Documentation - API Documentation"
gh issue create \
  --repo "$REPO" \
  --title "Documentation: API Documentation" \
  --label "documentation,backend" \
  --body "**Type:** Documentation
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
- [ ] Export Swagger JSON for reference"

echo "Creating Issue 39: DevOps - CI/CD Pipeline Setup"
gh issue create \
  --repo "$REPO" \
  --title "DevOps: CI/CD Pipeline Setup" \
  --label "devops,ci-cd" \
  --body "**Type:** DevOps
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
- [ ] Document CI/CD process"

echo "Creating Issue 40: Frontend - Responsive Design"
gh issue create \
  --repo "$REPO" \
  --title "Frontend: Responsive Design" \
  --label "frontend,ui,enhancement" \
  --body "**Type:** Frontend
**Priority:** Low

**Description:**
Ensure all pages are responsive and work on mobile devices.

**Acceptance Criteria:**
- [ ] Test all pages on mobile viewport
- [ ] Adjust layouts for small screens
- [ ] Ensure touch-friendly buttons
- [ ] Test on different screen sizes
- [ ] Use Tailwind responsive utilities
- [ ] Add mobile navigation menu if needed"

echo "Creating Issue 41: Frontend - Loading States and Skeletons"
gh issue create \
  --repo "$REPO" \
  --title "Frontend: Loading States and Skeletons" \
  --label "frontend,ui,enhancement" \
  --body "**Type:** Frontend
**Priority:** Low

**Description:**
Add loading skeletons and better loading states.

**Acceptance Criteria:**
- [ ] Create skeleton loader components
- [ ] Add loading skeletons for car list, setup list, dashboard
- [ ] Improve loading spinner designs
- [ ] Add transition animations"

echo "Creating Issue 42: Backend - Database Seeding"
gh issue create \
  --repo "$REPO" \
  --title "Backend: Database Seeding" \
  --label "backend,database,enhancement" \
  --body "**Type:** Backend
**Priority:** Low

**Description:**
Create database seeding for development/testing.

**Acceptance Criteria:**
- [ ] Create seed data script
- [ ] Add sample maintenance templates
- [ ] Add sample cars with maintenance items
- [ ] Add sample track changes
- [ ] Document how to run seeding
- [ ] Make seeding optional for production"

echo ""
echo "✅ All 42 issues have been created!"
echo ""
echo "You can view them at: https://github.com/$REPO/issues"
