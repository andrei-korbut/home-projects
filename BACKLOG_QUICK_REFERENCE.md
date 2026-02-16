# Development Backlog - Quick Reference

## Summary
Total Issues: **13** (numbered #0 through #13)
- Infrastructure: 1 issue
- Setup Page: 4 issues
- Cars Page: 5 issues  
- Dashboard: 2 issues
- Cross-cutting: 2 issues

---

## Phase 0: Infrastructure (CRITICAL - Start Here)

| Issue | Title | Backend Endpoints | Frontend Pages |
|-------|-------|-------------------|----------------|
| #0 | Project Infrastructure & Docker Setup | `GET /health` | Base layout, routing |

**Deliverables:** 
- `docker-compose.yml` (frontend:3000, backend:8000, postgres:5432)
- `backend/Dockerfile`
- `frontend/Dockerfile`
- Database schema migrations
- Project structure

---

## Phase 1: Setup Page (Part Maintenance Templates)

| Issue | Title | Backend Endpoints | Frontend Features |
|-------|-------|-------------------|-------------------|
| #1 | List Part Maintenance Templates | `GET /setup` | Display templates list, empty state |
| #2 | Create New Part Maintenance Template | `POST /setup` | Add template form with validation |
| #3 | Edit Part Maintenance Template | `PUT /setup/{id}` | Inline edit with save/cancel |
| #4 | Archive and Restore Templates | `PUT /setup/{id}/archive`<br>`PUT /setup/{id}/restore` | Archive/restore buttons, confirmation popup |

**Models Created:**
- `MaintenanceItemTemplate` (id, name, intervalType, intervalValue, archived, createdAt)

---

## Phase 2: Cars Page (Car Management)

| Issue | Title | Backend Endpoints | Frontend Features |
|-------|-------|-------------------|-------------------|
| #5 | List All Cars | `GET /cars` | Display cars with maintenance items |
| #6 | Create New Car | `POST /cars` | Add car form with template customization |
| #7 | Edit Car Details | `PUT /cars/{id}` | Edit car and maintenance items |
| #8 | Track Maintenance Change | `POST /trackchange/{carMaintenanceItemId}` | Track change modal/form |
| #9 | Display Track Change History | `GET /cars` (enhanced) | Expandable history per item |

**Models Created:**
- `Car` (id, name, currentKm, createdAt)
- `CarMaintenanceItem` (id, carId, maintenanceTemplateId, lastServiceKm, lastServiceDate, intervalValue, intervalType, calculatedNextKm, calculatedNextDate)
- `TrackChange` (id, carMaintenanceItemId, km, date, createdAt)

---

## Phase 3: Dashboard

| Issue | Title | Backend Endpoints | Frontend Features |
|-------|-------|-------------------|-------------------|
| #10 | Dashboard - Car Selection and Status Display | `GET /dashboard/{carId}` | Status groups (overdue, due soon, OK), car dropdown |
| #11 | Dashboard - Update Car Mileage | `PATCH /cars/{id}/km` | Inline km edit on dashboard |

**Status Calculation Logic:**
- **Km-based:** Red (≥ nextKm), Yellow (< 300km), Green (≥ 300km)
- **Time-based:** Red (≥ nextDate), Yellow (< 30 days), Green (≥ 30 days)

---

## Phase 4: Polish & Testing

| Issue | Title | Backend Work | Frontend Work |
|-------|-------|--------------|---------------|
| #12 | Error Handling and User Feedback | Standardized errors, logging | Toast notifications, loading states |
| #13 | Testing and Documentation | Unit tests, API docs, migrations | Component tests, E2E tests, user guide |

---

## Complete API Endpoint Reference

### Setup / Templates
- `GET /setup` - List all maintenance templates
- `POST /setup` - Create new template
- `PUT /setup/{id}` - Update template
- `PUT /setup/{id}/archive` - Archive template
- `PUT /setup/{id}/restore` - Restore template

### Cars
- `GET /cars` - List all cars with maintenance items
- `POST /cars` - Create new car with initial maintenance items
- `PUT /cars/{id}` - Update car and maintenance items
- `PATCH /cars/{id}/km` - Update only current km/mileage

### Track Changes
- `POST /trackchange/{carMaintenanceItemId}` - Record maintenance service

### Dashboard
- `GET /dashboard/{carId}` - Get dashboard data with status groups

### Health
- `GET /health` - Backend health check

---

## Docker Service URLs

**Development:**
- Frontend: `http://localhost:3000` (external), `http://frontend:3000` (internal)
- Backend API: `http://localhost:8000` (external), `http://backend:8000` (internal)
- Database: `postgres://database:5432` (internal only)

**Frontend → Backend Communication:**
```javascript
// Frontend should use internal Docker service name
const API_BASE_URL = 'http://backend:8000';
```

---

## Key Validation Rules

### Frontend Validations
- **Date format:** `dd/mm/yyyy` (dd ≤ 31, mm ≤ 12, yyyy ≥ 2000)
- **Km values:** Must be ≥ 0
- **Interval values:** Must be > 0
- **Interval type:** Dropdown with `km` / `time` only
- **Required fields:** Name, Interval Type, Interval Value (for templates)
- **Required fields:** Name, Current Km (for cars)

### Backend Logic
- **Next service calculation:**
  - Km-based: `nextServiceKm = lastServiceKm + intervalValue`
  - Time-based: `nextServiceDate = lastServiceDate + intervalValue days`
- **Date parsing:** Convert `dd/mm/yyyy` string to datetime
- **Default sorting:** All lists sorted by `createdAt DESC` (newest first)
- **Archived templates:** Excluded from GET requests by default

---

## Data Flow Examples

### Creating a Car
1. Frontend: `GET http://backend:8000/setup` → Get available templates
2. User fills form with car details + customizes template intervals
3. Frontend: `POST http://backend:8000/cars` → Create car
4. Backend: Creates Car record + CarMaintenanceItem records + calculates next due dates
5. Frontend: Redirect to `/cars` list page

### Tracking a Maintenance Change
1. User clicks "Track Change" on a maintenance item
2. Frontend shows modal with current car km (or date field)
3. User enters service km/date and clicks Save
4. Frontend: `POST http://backend:8000/trackchange/{itemId}`
5. Backend: Creates TrackChange record + updates CarMaintenanceItem + recalculates next due
6. Frontend: Refreshes car list to show updated status

### Viewing Dashboard
1. Frontend: `GET http://backend:8000/cars` → Get cars for dropdown
2. User selects a car (or default first car)
3. Frontend: `GET http://backend:8000/dashboard/{carId}`
4. Backend: Calculates status for each maintenance item
5. Frontend: Displays items grouped by status (overdue/due soon/ok)

---

## Issue Dependencies

```
#0 (Infrastructure)
 ├─→ #1 (List Templates)
      ├─→ #2 (Create Template)
      ├─→ #3 (Edit Template)
      └─→ #4 (Archive/Restore Template)
           └─→ #5 (List Cars)
                ├─→ #6 (Create Car)
                ├─→ #7 (Edit Car)
                └─→ #8 (Track Change)
                     ├─→ #9 (Change History)
                     └─→ #10 (Dashboard)
                          └─→ #11 (Update Km)
```

**Note:** Issues #12 and #13 can be worked on at any time during development.

---

## Implementation Tips

1. **Start with Issue #0** - Nothing else can work without Docker infrastructure
2. **Complete Phase 1 first** - Templates must exist before creating cars
3. **Issue #6 depends on Issue #1-4** - Need templates to create cars
4. **Issue #10 depends on Issue #5-8** - Dashboard needs car and tracking data
5. **Test each issue independently** - Each issue is a complete, testable feature
6. **Frontend and Backend can be parallel** - For same issue, different developers can work simultaneously if they agree on API contract first

---

## Recommended Tech Stack

### Backend (Choose One)
- **Node.js:** Express/NestJS + PostgreSQL + TypeORM/Prisma
- **Python:** Flask/FastAPI + PostgreSQL + SQLAlchemy
- **Java:** Spring Boot + PostgreSQL + JPA

### Frontend (Choose One)
- **React:** + React Router + Axios/Fetch
- **Vue:** Vue 3 + Vue Router + Axios
- **Angular:** + HttpClient

### Database
- **PostgreSQL** (recommended for structured relational data)

---

## Estimated Timeline

Assuming 1 developer working full-time:

- **Phase 0:** 2-3 days
- **Phase 1:** 4-6 days (Issues #1-4)
- **Phase 2:** 7-10 days (Issues #5-9)
- **Phase 3:** 3-4 days (Issues #10-11)
- **Phase 4:** 3-5 days (Issues #12-13)

**Total:** ~3-4 weeks for MVP

With 2 developers (1 frontend, 1 backend) working in parallel: ~2-3 weeks

---

## Success Criteria

✅ **Phase 0 Complete:** Docker containers running, database connected, health endpoint responds  
✅ **Phase 1 Complete:** Can create, edit, archive templates via UI  
✅ **Phase 2 Complete:** Can create cars, assign maintenance items, track changes  
✅ **Phase 3 Complete:** Dashboard shows color-coded status, can update mileage  
✅ **Phase 4 Complete:** Tests passing, documentation complete, error handling robust  

---

For detailed implementation specifications, see [BACKLOG.md](./BACKLOG.md)
