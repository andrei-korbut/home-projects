# Backlog Summary & Quick Reference

## 📊 Overview

**Total Issues:** 42  
**Repository:** andrei-korbut/home-projects  
**Project:** Car Maintenance Tracker (React + .NET 8 + SQL Server)

---

## 📈 Issue Distribution

### By Type
- **Backend:** 18 issues (43%)
- **Frontend:** 18 issues (43%)
- **DevOps:** 3 issues (7%)
- **Documentation:** 2 issues (5%)
- **Testing:** 1 issue (2%)

### By Priority
- **High:** 26 issues (62%)
- **Medium:** 13 issues (31%)
- **Low:** 3 issues (7%)

---

## 🎯 Epic Breakdown

### Epic 1: Project Setup & Infrastructure (3 issues)
**Issues: 1-3**

| # | Title | Type | Priority |
|---|-------|------|----------|
| 1 | Initialize .NET 8 Web API Project | Backend | High |
| 2 | Initialize React + Vite Project | Frontend | High |
| 3 | Docker Configuration | DevOps | High |

**Goal:** Set up the development environment with all necessary infrastructure.

---

### Epic 2: Database Models & Migrations (2 issues)
**Issues: 4-5**

| # | Title | Type | Priority |
|---|-------|------|----------|
| 4 | Create Database Models | Backend | High |
| 5 | Create Initial Database Migration | Backend | High |

**Goal:** Define and implement the database schema with Entity Framework Core.

---

### Epic 3: Setup Page (/setup) - Maintenance Templates (8 issues)
**Issues: 6-13**

#### Backend (4 issues)
| # | Title | Endpoint |
|---|-------|----------|
| 6 | GET /setup Endpoint | GET /setup |
| 7 | POST /setup Endpoint | POST /setup |
| 8 | PUT /setup/{id} Endpoint | PUT /setup/{id} |
| 9 | PUT /setup/{id}/archive & restore | PUT /setup/{id}/archive, PUT /setup/{id}/restore |

#### Frontend (4 issues)
| # | Title | Feature |
|---|-------|---------|
| 10 | Setup Page UI Component | Display templates |
| 11 | Add New Maintenance Template | Create template with validation |
| 12 | Edit Maintenance Template | Inline editing |
| 13 | Archive/Restore Template | Archive/restore with confirmation |

**Goal:** Allow users to create and manage maintenance part templates.

---

### Epic 4: Cars Page (/cars) - Car Management (9 issues)
**Issues: 14-22**

#### Backend (4 issues)
| # | Title | Endpoint |
|---|-------|----------|
| 14 | GET /cars Endpoint | GET /cars |
| 15 | POST /cars Endpoint | POST /cars |
| 16 | PUT /cars/{id} Endpoint | PUT /cars/{id} |
| 17 | POST /trackchange Endpoint | POST /trackchange/{carMaintenanceItemId} |

#### Frontend (5 issues)
| # | Title | Feature |
|---|-------|---------|
| 18 | Cars List Page UI | Display all cars with maintenance items |
| 19 | Add New Car Page | Create car with maintenance config |
| 20 | Edit Car Page | Edit car and maintenance items |
| 21 | Track Change Feature | Record maintenance changes |
| 22 | Maintenance Item Change History | Display change history |

**Goal:** Enable users to manage cars and track their maintenance.

---

### Epic 5: Dashboard Page (/dashboard) (5 issues)
**Issues: 23-27**

#### Backend (2 issues)
| # | Title | Endpoint |
|---|-------|----------|
| 23 | GET /dashboard/{carId} | GET /dashboard/{carId} |
| 24 | PUT /cars/{id}/km | PUT /cars/{id}/km |

#### Frontend (3 issues)
| # | Title | Feature |
|---|-------|---------|
| 25 | Dashboard Page UI | Display status-grouped items |
| 26 | Dashboard Car Selection | Dropdown to filter by car |
| 27 | Dashboard Inline Mileage Update | Edit current km inline |

**Goal:** Provide an overview dashboard with status indicators (Overdue, Due Soon, OK).

---

### Epic 6: Backend Logic & Calculations (3 issues)
**Issues: 28-30**

| # | Title | Priority |
|---|-------|----------|
| 28 | Next Service Calculation Logic | High |
| 29 | Dashboard Status Calculation Logic | High |
| 30 | Template Archive Cascade Logic | Medium |

**Goal:** Implement core business logic for calculations and data management.

---

### Epic 7: Validation & Error Handling (3 issues)
**Issues: 31-33**

| # | Title | Type | Priority |
|---|-------|------|----------|
| 31 | Masked Date Input Component | Frontend | High |
| 32 | Comprehensive Input Validation | Backend | High |
| 33 | Global Error Handling | Frontend | Medium |

**Goal:** Ensure robust validation and user-friendly error handling.

---

### Epic 8: Testing & Quality Assurance (3 issues)
**Issues: 34-36**

| # | Title | Type | Priority |
|---|-------|------|----------|
| 34 | Unit Tests for Models and Logic | Backend | Medium |
| 35 | Integration Tests for API | Backend | Medium |
| 36 | Component Unit Tests | Frontend | Low |

**Goal:** Ensure code quality and reliability through comprehensive testing.

---

### Epic 9: Documentation & Deployment (3 issues)
**Issues: 37-39**

| # | Title | Type | Priority |
|---|-------|------|----------|
| 37 | README and Setup Guide | Documentation | Medium |
| 38 | API Documentation | Documentation | Medium |
| 39 | CI/CD Pipeline Setup | DevOps | Low |

**Goal:** Document the project and automate deployment processes.

---

### Epic 10: Polish & Enhancements (3 issues)
**Issues: 40-42**

| # | Title | Type | Priority |
|---|-------|------|----------|
| 40 | Responsive Design | Frontend | Low |
| 41 | Loading States and Skeletons | Frontend | Low |
| 42 | Database Seeding | Backend | Low |

**Goal:** Improve user experience and add developer conveniences.

---

## 🚀 Implementation Roadmap

### Phase 1: Foundation (Week 1)
- **Epic 1:** Project Setup (Issues 1-3)
- **Epic 2:** Database Models (Issues 4-5)
- **Deliverable:** Running development environment with database

### Phase 2: Setup Page (Week 2)
- **Epic 3:** Setup Page (Issues 6-13)
- **Deliverable:** Functional maintenance template management

### Phase 3: Cars Management (Week 3-4)
- **Epic 4:** Cars Page (Issues 14-22)
- **Deliverable:** Car and maintenance tracking functionality

### Phase 4: Dashboard (Week 5)
- **Epic 5:** Dashboard (Issues 23-27)
- **Epic 6:** Backend Logic (Issues 28-30)
- **Deliverable:** Dashboard with status indicators

### Phase 5: Quality & Polish (Week 6-7)
- **Epic 7:** Validation (Issues 31-33)
- **Epic 8:** Testing (Issues 34-36)
- **Epic 9:** Documentation (Issues 37-39)
- **Epic 10:** Polish (Issues 40-42)
- **Deliverable:** Production-ready MVP

---

## 🔑 Key Features by Page

### Setup Page (`/setup`)
- ✅ Create maintenance part templates
- ✅ Edit existing templates
- ✅ Archive/restore templates
- ✅ View all templates

### Cars Page (`/cars`)
- ✅ List all cars
- ✅ Add new car with maintenance configuration
- ✅ Edit car details and maintenance items
- ✅ Track maintenance changes
- ✅ View change history

### Dashboard Page (`/dashboard`)
- ✅ Select car from dropdown
- ✅ View maintenance status (Overdue/Due Soon/OK)
- ✅ Update current mileage
- ✅ Track changes directly from dashboard

---

## 📝 Technical Stack

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
- Docker
- docker-compose
- GitHub Actions (CI/CD)

---

## 🏷️ Labels Reference

| Label | Purpose | Count |
|-------|---------|-------|
| `backend` | Backend API work | 18 |
| `frontend` | Frontend UI work | 18 |
| `setup` | Initial setup | 3 |
| `infrastructure` | Infrastructure setup | 3 |
| `database` | Database work | 4 |
| `api` | API endpoints | 11 |
| `ui` | User interface | 4 |
| `feature` | New feature | 9 |
| `validation` | Validation logic | 2 |
| `testing` | Testing work | 3 |
| `documentation` | Documentation | 2 |

---

## 📊 API Endpoints Summary

### Setup Page Endpoints
- `GET /setup` - List templates
- `POST /setup` - Create template
- `PUT /setup/{id}` - Update template
- `PUT /setup/{id}/archive` - Archive template
- `PUT /setup/{id}/restore` - Restore template

### Cars Page Endpoints
- `GET /cars` - List cars with maintenance items
- `POST /cars` - Create car
- `PUT /cars/{id}` - Update car
- `POST /trackchange/{carMaintenanceItemId}` - Track maintenance change

### Dashboard Endpoints
- `GET /dashboard/{carId}` - Get dashboard data with status grouping
- `PUT /cars/{id}/km` - Update current km/mileage

**Total Endpoints:** 10

---

## ✨ MVP Features Checklist

### Core Functionality
- [ ] Maintenance template management
- [ ] Car registration and management
- [ ] Maintenance tracking (km and time-based)
- [ ] Dashboard with status indicators
- [ ] Change history tracking

### Data Validation
- [ ] Frontend form validation
- [ ] Backend input validation
- [ ] Masked date input (dd/mm/yyyy)
- [ ] Error handling and user feedback

### User Experience
- [ ] Responsive design
- [ ] Loading states
- [ ] Empty states
- [ ] Success/error notifications

### Documentation
- [ ] Setup instructions
- [ ] API documentation
- [ ] Architecture overview

---

## 🎯 Success Criteria

The MVP will be considered complete when:

1. ✅ All 3 pages are functional (Setup, Cars, Dashboard)
2. ✅ Users can create and manage maintenance templates
3. ✅ Users can add cars and configure maintenance items
4. ✅ Users can track maintenance changes
5. ✅ Dashboard shows proper status grouping
6. ✅ All validation is working correctly
7. ✅ Application runs in Docker containers
8. ✅ Documentation is complete
9. ✅ Basic tests are passing

---

## 📞 Getting Started

1. **Review the backlog:** See `BACKLOG.md` for detailed issue descriptions
2. **Create issues:** Follow instructions in `CREATE_ISSUES_INSTRUCTIONS.md`
3. **Start development:** Begin with Epic 1 (Project Setup)

For questions or clarifications, refer to `ProjectVisionAndScope.md` for the original requirements.
