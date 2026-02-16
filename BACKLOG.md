# Car Maintenance Tracker - Development Backlog

This backlog breaks down the Car Maintenance Tracker project into actionable issues, split by frontend and backend work. Each issue represents a complete feature that can be developed, tested, and deployed independently.

## Docker Infrastructure Setup

### Issue #0: Project Infrastructure & Docker Setup
**Priority:** CRITICAL (Must be completed first)
**Description:** Set up the basic project infrastructure with Docker containers for frontend, backend, and database.

#### Backend Work:
- Create backend project structure (choose tech stack: Node.js/Express, Python/Flask, etc.)
- Set up database schema and migrations (PostgreSQL recommended)
- Create `backend/Dockerfile`
- Configure database connection
- Set up basic error handling and logging
- Create health check endpoint: `GET /health`

#### Frontend Work:
- Create frontend project structure (React/Vue/Angular)
- Set up routing framework
- Create `frontend/Dockerfile`
- Set up base layout and navigation structure
- Configure API client for backend communication

#### DevOps Work:
- Create `docker-compose.yml` with services:
  - Frontend (port: 3000)
  - Backend (port: 8000)
  - Database (PostgreSQL, port: 5432)
- Configure environment variables
- Set up volume mounts for development
- Document startup commands in README

**Endpoints:**
- `GET /health` - Backend health check

**Docker URLs:**
- Frontend: `http://frontend:3000` (internal), `http://localhost:3000` (external)
- Backend: `http://backend:8000` (internal), `http://localhost:8000` (external)
- Database: `postgres://database:5432` (internal)

---

## Feature Set 1: Part Maintenance Templates (/setup page)

### Issue #1: List Part Maintenance Templates
**Priority:** HIGH
**Description:** Display all existing part maintenance templates on the setup page. This is the foundation for managing maintenance templates.

#### Backend Work:
- Create database table `MaintenanceItemTemplate`:
  - `id` (int, primary key, auto-increment)
  - `name` (string, not null)
  - `intervalType` (string, not null, values: 'km' or 'time')
  - `intervalValue` (int, not null)
  - `archived` (bool, default false)
  - `createdAt` (datetime, auto-generated)
- Create endpoint: `GET /setup`
  - Returns list of all templates (non-archived by default)
  - Sort by `createdAt` DESC (newest first)
  - Response format:
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

#### Frontend Work:
- Create `/setup` page component
- Add to navigation/routing
- Call `GET http://backend:8000/setup` on page load
- Display templates in a list/table view
- Show empty state: "There are no currently available parts' maintenance templates."
- Display template fields: name, interval type, interval value
- Add "Add New Template" button at the top (non-functional for now)
- Style the page according to design system

**API Integration:**
- Frontend calls: `GET http://backend:8000/setup`

---

### Issue #2: Create New Part Maintenance Template
**Priority:** HIGH
**Description:** Allow users to add new part maintenance templates with validation.

#### Backend Work:
- Create endpoint: `POST /setup`
  - Accept JSON body:
    ```json
    {
      "name": "string (required)",
      "intervalType": "km|time (required)",
      "intervalValue": "number (required, > 0)"
    }
    ```
  - Validate all required fields
  - Validate `intervalType` is either 'km' or 'time'
  - Validate `intervalValue` > 0
  - Return 400 with error messages if validation fails
  - Return 201 with created template on success
  - Error response format:
    ```json
    {
      "errors": {
        "name": "Name is obligatory field",
        "intervalType": "Interval type is obligatory field",
        "intervalValue": "Interval value is obligatory field"
      }
    }
    ```

#### Frontend Work:
- Implement "Add New Template" button functionality
- Show editable fields when button is clicked:
  - Name (text input)
  - Interval Type (dropdown: km / time)
  - Interval Value (number input, dynamic label: "km" or "days")
- Add Save/Cancel buttons
- Implement frontend validation:
  - All fields required
  - Interval value must be > 0
- Show validation errors in red with error messages
- On Save: call `POST http://backend:8000/setup`
- On success: refresh template list, hide form
- On Cancel: hide form without saving

**API Integration:**
- Frontend calls: `POST http://backend:8000/setup`

---

### Issue #3: Edit Part Maintenance Template
**Priority:** MEDIUM
**Description:** Allow users to edit existing part maintenance templates inline.

#### Backend Work:
- Create endpoint: `PUT /setup/{id}`
  - Accept template ID in URL path
  - Accept same JSON body as POST
  - Validate all fields (same as create)
  - Return 404 if template not found
  - Return 400 with validation errors
  - Return 200 with updated template on success

#### Frontend Work:
- Add pencil/edit icon button to each template row
- On click: make fields editable inline
- Show Save/Cancel buttons
- Implement same validation as create
- On Save: call `PUT http://backend:8000/setup/{id}`
- On success: refresh template display, exit edit mode
- On Cancel: revert changes, exit edit mode
- Handle error responses from backend

**API Integration:**
- Frontend calls: `PUT http://backend:8000/setup/{id}`

---

### Issue #4: Archive and Restore Part Maintenance Templates
**Priority:** MEDIUM
**Description:** Allow users to archive and restore templates. Archived templates are hidden from UI and car assignments.

#### Backend Work:
- Create endpoint: `PUT /setup/{id}/archive`
  - Set `archived = true`
  - Return 200 on success
- Create endpoint: `PUT /setup/{id}/restore`
  - Set `archived = false`
  - Return 200 on success
- Modify `GET /setup` to exclude archived templates (or add query param `?include_archived=true`)
- When template is archived, all associated `CarMaintenanceItem` records should be marked as hidden/archived

#### Frontend Work:
- Add Archive/Restore button to each template based on current status
- On Archive click: show confirmation popup
  - Message: "Archiving this template will hide it from all cars. Continue?"
- On Restore click: restore without confirmation
- On Archive confirm: call `PUT http://backend:8000/setup/{id}/archive`
- On Restore: call `PUT http://backend:8000/setup/{id}/restore`
- Refresh list after successful operation
- Archived templates should not appear in the list (unless showing archived view)

**API Integration:**
- Frontend calls: `PUT http://backend:8000/setup/{id}/archive`
- Frontend calls: `PUT http://backend:8000/setup/{id}/restore`

---

## Feature Set 2: Car Management (/cars page)

### Issue #5: List All Cars
**Priority:** HIGH
**Description:** Display all registered cars with their associated maintenance items.

#### Backend Work:
- Create database table `Car`:
  - `id` (int, primary key, auto-increment)
  - `name` (string, not null)
  - `currentKm` (int, not null)
  - `createdAt` (datetime, auto-generated)
- Create database table `CarMaintenanceItem`:
  - `id` (int, primary key, auto-increment)
  - `carId` (int, foreign key to Car.id)
  - `maintenanceTemplateId` (int, foreign key to MaintenanceItemTemplate.id)
  - `lastServiceKm` (int, nullable)
  - `lastServiceDate` (datetime, nullable)
  - `intervalValue` (int, not null)
  - `intervalType` (string, not null)
  - `calculatedNextKm` (int, nullable)
  - `calculatedNextDate` (datetime, nullable)
- Create endpoint: `GET /cars`
  - Returns list of all cars
  - Include non-archived maintenance items for each car
  - Sort cars by `createdAt` DESC
  - Sort maintenance items by `createdAt` DESC
  - Calculate and include `nextDue` (km or date based on type)
  - Response format:
    ```json
    {
      "cars": [
        {
          "id": 1,
          "name": "Toyota Camry",
          "currentKm": 45000,
          "createdAt": "2026-01-10T12:00:00Z",
          "maintenanceItems": [
            {
              "id": 1,
              "templateId": 1,
              "templateName": "Oil Change",
              "intervalType": "km",
              "intervalValue": 10000,
              "lastServiceKm": 40000,
              "lastServiceDate": null,
              "calculatedNextKm": 50000,
              "calculatedNextDate": null
            }
          ]
        }
      ]
    }
    ```

#### Frontend Work:
- Create `/cars` page component
- Add to navigation/routing
- Call `GET http://backend:8000/cars` on page load
- Display cars in card/list format
- For each car show:
  - Car name
  - Current mileage
  - List of maintenance items
  - For each item: name, interval, next due, track change button (non-functional)
- Add "Add New Car" button at the top (non-functional for now)
- Show empty state if no cars exist

**API Integration:**
- Frontend calls: `GET http://backend:8000/cars`

---

### Issue #6: Create New Car
**Priority:** HIGH
**Description:** Allow users to register a new car with customized maintenance items from templates.

#### Backend Work:
- Create endpoint: `POST /cars`
  - Accept JSON body:
    ```json
    {
      "name": "string (required)",
      "currentKm": "number (required, >= 0)",
      "maintenanceItems": [
        {
          "templateId": "number (required)",
          "intervalValue": "number (required, > 0)",
          "lastServiceKm": "number (optional, if intervalType=km)",
          "lastServiceDate": "string (optional, format: dd/mm/yyyy, if intervalType=time)"
        }
      ]
    }
    ```
  - Validate all required fields
  - Validate car name is not empty
  - Validate currentKm >= 0
  - Parse date string (dd/mm/yyyy) to datetime
  - Create Car record
  - For each maintenance item:
    - Create CarMaintenanceItem record
    - Copy intervalType from template
    - Calculate nextKm or nextDate based on type:
      - `calculatedNextKm = lastServiceKm + intervalValue` (if type=km)
      - `calculatedNextDate = lastServiceDate + intervalValue days` (if type=time)
  - Return 201 with created car and items
  - Return 400 with validation errors

#### Frontend Work:
- Create `/cars/new` page (or modal)
- Link "Add New Car" button to this page
- Fetch templates: `GET http://backend:8000/setup`
- Display form fields:
  - Car Name (required)
  - Current Mileage (required, number)
  - For each non-archived template:
    - Template name (read-only)
    - Interval value (editable, pre-filled from template)
    - Last service field (dynamic based on intervalType):
      - If km: number input for km
      - If time: masked date input (dd/mm/yyyy)
- Implement frontend validation:
  - All fields required
  - Current km >= 0
  - Interval values > 0
  - Date format: dd/mm/yyyy (dd ≤ 31, mm ≤ 12, yyyy ≥ 2000)
- On Save: call `POST http://backend:8000/cars`
- On success: redirect to `/cars` list page
- On error: show validation messages

**API Integration:**
- Frontend calls: `GET http://backend:8000/setup` (to get templates)
- Frontend calls: `POST http://backend:8000/cars`

---

### Issue #7: Edit Car Details
**Priority:** MEDIUM
**Description:** Allow users to edit car information and maintenance items.

#### Backend Work:
- Create endpoint: `PUT /cars/{id}`
  - Accept car ID in URL path
  - Accept same JSON body as POST (name, currentKm, maintenanceItems)
  - Validate all fields
  - Update Car record
  - Update CarMaintenanceItem records
  - Recalculate nextKm/nextDate for updated items
  - Return 404 if car not found
  - Return 400 with validation errors
  - Return 200 with updated car on success

#### Frontend Work:
- Create `/cars/{id}/edit` page
- Add edit button (pencil icon) to each car in list
- Pre-fill form with existing car data
- Call `GET http://backend:8000/cars` to get current data (or pass via route)
- Display editable fields:
  - Car name
  - Current km
  - For each maintenance item:
    - Interval value
    - Last service km/date (the most recent one)
- Implement same validation as create
- On Save: call `PUT http://backend:8000/cars/{id}`
- On success: redirect to `/cars` list page
- On error: show validation messages

**API Integration:**
- Frontend calls: `PUT http://backend:8000/cars/{id}`

---

### Issue #8: Track Maintenance Change
**Priority:** HIGH
**Description:** Record when a maintenance service is performed on a car part.

#### Backend Work:
- Create database table `TrackChange`:
  - `id` (int, primary key, auto-increment)
  - `carMaintenanceItemId` (int, foreign key)
  - `km` (int, nullable)
  - `date` (datetime, nullable)
  - `createdAt` (datetime, auto-generated)
- Create endpoint: `POST /trackchange/{carMaintenanceItemId}`
  - Accept maintenance item ID in URL path
  - Accept JSON body:
    ```json
    {
      "km": "number (optional, if intervalType=km)",
      "date": "string (optional, format: dd/mm/yyyy, if intervalType=time)"
    }
    ```
  - Validate that km or date is provided based on intervalType
  - Parse date string to datetime
  - Create TrackChange record
  - Update CarMaintenanceItem:
    - Update `lastServiceKm` or `lastServiceDate`
    - Recalculate `calculatedNextKm` or `calculatedNextDate`
  - Return 200 with updated maintenance item
  - Return 400 with validation errors
  - Return 404 if item not found

#### Frontend Work:
- Add "Track Change" button to each maintenance item in car list
- On click: show modal/form
- Get item's intervalType to determine form fields:
  - If km: show number input, pre-filled with current car mileage
  - If time: show masked date input (dd/mm/yyyy), pre-filled with today
- Option to use current value or enter custom value
- Implement validation (same date rules as before)
- On Save: call `POST http://backend:8000/trackchange/{carMaintenanceItemId}`
- On success: refresh car list, show success message
- Show history of changes in expandable section (toggle for each part)

**API Integration:**
- Frontend calls: `POST http://backend:8000/trackchange/{carMaintenanceItemId}`

---

### Issue #9: Display Track Change History
**Priority:** LOW
**Description:** Show the history of all maintenance changes for each car part.

#### Backend Work:
- Modify endpoint: `GET /cars` to include track change history
  - For each CarMaintenanceItem, include array of TrackChange records
  - Sort by `createdAt` DESC (most recent first)
- Or create new endpoint: `GET /cars/{carId}/maintenance/{itemId}/history`

#### Frontend Work:
- Add expandable/toggle section for each maintenance item
- On expand: show list of all track changes with:
  - Date/time of change
  - Km at change (if applicable)
  - Date at change (if applicable)
  - How long the part was in use before change
- Calculate usage duration:
  - For km-based: difference in km
  - For time-based: difference in days

**API Integration:**
- Frontend uses data from: `GET http://backend:8000/cars`

---

## Feature Set 3: Dashboard (/dashboard page)

### Issue #10: Dashboard - Car Selection and Status Display
**Priority:** HIGH
**Description:** Display maintenance items grouped by status (overdue, due soon, OK) for a selected car.

#### Backend Work:
- Create endpoint: `GET /dashboard/{carId}`
  - Accept car ID in URL path
  - Get car details and all non-archived maintenance items
  - Calculate status for each item based on current date/km:
    - **Km-based logic:**
      - Red (overdue): `currentKm >= calculatedNextKm`
      - Yellow (due soon): `calculatedNextKm - currentKm <= 300`
      - Green (OK): `calculatedNextKm - currentKm > 300`
    - **Time-based logic:**
      - Red (overdue): `today >= calculatedNextDate`
      - Yellow (due soon): `calculatedNextDate - today <= 30 days`
      - Green (OK): `calculatedNextDate - today > 30 days`
  - Group items by status: overdue, dueSoon, ok
  - For each item include:
    - Days/km remaining until next service
  - Response format:
    ```json
    {
      "car": {
        "id": 1,
        "name": "Toyota Camry",
        "currentKm": 49700
      },
      "statusGroups": {
        "overdue": [],
        "dueSoon": [
          {
            "id": 1,
            "name": "Oil Change",
            "intervalType": "km",
            "intervalValue": 10000,
            "calculatedNextKm": 50000,
            "kmRemaining": 300
          }
        ],
        "ok": []
      }
    }
    ```

#### Frontend Work:
- Create `/dashboard` page component
- Add to navigation/routing
- Get all cars list for dropdown: `GET http://backend:8000/cars`
- Display car selection dropdown (default: first car)
- On car selection: call `GET http://backend:8000/dashboard/{carId}`
- Display current mileage for selected car (with edit button)
- Display three status groups with visual indicators:
  - 🔴 Overdue (red)
  - 🟡 Due Soon (yellow)
  - 🟢 OK (green)
- For each item in each group show:
  - Part name
  - Interval info
  - Next due date/km
  - Days/km remaining
  - Track change button (reuse from cars page)

**API Integration:**
- Frontend calls: `GET http://backend:8000/cars` (for dropdown)
- Frontend calls: `GET http://backend:8000/dashboard/{carId}`

---

### Issue #11: Dashboard - Update Car Mileage
**Priority:** MEDIUM
**Description:** Allow quick update of current car mileage from dashboard.

#### Backend Work:
- Create endpoint: `PATCH /cars/{id}/km`
  - Accept car ID in URL path
  - Accept JSON body:
    ```json
    {
      "currentKm": "number (required, >= 0)"
    }
    ```
  - Validate currentKm >= 0
  - Update only the `currentKm` field of the car
  - Return 200 with updated car
  - Return 400 with validation errors
  - Return 404 if car not found

#### Frontend Work:
- Show current mileage on dashboard with pencil/edit icon
- On click: make field editable inline
- Show Save/Cancel buttons
- Implement validation: currentKm >= 0
- On Save: call `PATCH http://backend:8000/cars/{id}/km`
- On success: update displayed value, recalculate statuses
- Automatically refresh dashboard data after update

**API Integration:**
- Frontend calls: `PATCH http://backend:8000/cars/{id}/km`

---

## Additional Considerations

### Issue #12: Error Handling and User Feedback
**Priority:** MEDIUM
**Description:** Implement consistent error handling and user feedback across the application.

#### Backend Work:
- Standardize error response format
- Add proper HTTP status codes
- Log errors server-side
- Add request/response logging

#### Frontend Work:
- Add toast/notification system for success/error messages
- Implement loading states for API calls
- Add error boundaries for React (or equivalent)
- Show user-friendly error messages

---

### Issue #13: Testing and Documentation
**Priority:** LOW
**Description:** Add tests and documentation for the application.

#### Backend Work:
- Add unit tests for business logic
- Add integration tests for endpoints
- Document API endpoints (Swagger/OpenAPI)
- Add database migration scripts

#### Frontend Work:
- Add component tests
- Add E2E tests for critical flows
- Document component usage
- Add user guide/help section

---

## Development Sequence Recommendation

1. **Phase 0:** Infrastructure Setup (Issue #0)
2. **Phase 1:** Setup Page (Issues #1-4)
3. **Phase 2:** Cars Management (Issues #5-9)
4. **Phase 3:** Dashboard (Issues #10-11)
5. **Phase 4:** Polish (Issues #12-13)

## Docker Integration Notes

- All backend API calls from frontend should use the internal Docker service name: `http://backend:8000`
- Frontend will be accessible at `http://localhost:3000` for development
- Backend API will be accessible at `http://localhost:8000` for development/testing
- Database should only be accessible from backend container (no external port exposure in production)
- Use environment variables for configuration:
  - `BACKEND_URL` in frontend container
  - `DATABASE_URL` in backend container
- Consider using nginx as reverse proxy in production to route both frontend and backend through single entry point

## Technical Stack Suggestions

**Backend Options:**
- Node.js with Express/NestJS + PostgreSQL + TypeORM/Prisma
- Python with Flask/FastAPI + PostgreSQL + SQLAlchemy
- Java Spring Boot + PostgreSQL + JPA

**Frontend Options:**
- React with React Router + Axios/Fetch
- Vue 3 with Vue Router + Axios
- Angular with HttpClient

**Database:**
- PostgreSQL (recommended for structured data with relationships)

## Notes for Implementation

- Each issue can be worked on independently once dependencies are met
- Issues are sized to be completable in 1-3 days
- Frontend and backend work for same issue can be developed in parallel by different developers
- All issues include complete API contract specifications
- Date format is consistently dd/mm/yyyy across the application
- All dates are parsed and stored as datetime in backend database
- Sorting defaults are enforced on backend (newest first)
- Validation logic is duplicated on frontend for UX and backend for security
