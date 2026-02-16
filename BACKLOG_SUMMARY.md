# Backlog Summary - Car Maintenance Tracker

## 📋 Project Overview

This document provides a high-level summary of the 40 issues created from the ProjectVisionAndScope.md document. The backlog represents all the work needed to build the MVP of the Car Maintenance Tracker application.

## 🎯 Key Features Breakdown

### 1. Setup/Templates Management (6 issues: 3 backend + 3 frontend)
**Purpose**: Manage maintenance item templates (oil change, air filter, etc.)

**Backend:**
- GET /setup - Retrieve list of templates
- POST /setup - Create new template
- PUT /setup/{id} - Edit template
- PUT /setup/{id}/archive - Archive template
- PUT /setup/{id}/restore - Restore archived template

**Frontend:**
- List view with templates
- Add new template form
- Edit template inline
- Archive/Restore functionality with confirmation

### 2. Cars Management (8 issues: 4 backend + 4 frontend)
**Purpose**: Manage cars and their associated maintenance items

**Backend:**
- GET /cars - List all cars with maintenance items
- POST /cars - Create new car
- PUT /cars/{id} - Edit car details
- PUT /cars/{id}/km - Update car mileage only

**Frontend:**
- Cars list view showing all cars and their maintenance items
- Add new car page with template selection
- Edit car page
- Track Change modal/form (shared component)

### 3. Dashboard (3 issues: 1 backend + 2 frontend)
**Purpose**: View maintenance status grouped by urgency

**Backend:**
- GET /dashboard/{carId} - Get dashboard data with status calculation

**Frontend:**
- Dashboard main view with status groups (Overdue, Due Soon, OK)
- Inline edit for car mileage

### 4. Track Change (1 issue: 1 backend)
**Purpose**: Record when maintenance was performed

**Backend:**
- POST /trackchange/{carMaintenanceItemId} - Record maintenance change

**Frontend:**
- (Covered in Cars Management - Track Change modal is reusable)

### 5. Infrastructure & Setup (14 issues)
**Purpose**: Foundation, configuration, and deployment

**Backend (6):**
- Database schema and Entity Framework models
- Swagger documentation setup
- CORS configuration
- Error handling middleware
- Logging configuration
- Unit tests for business logic

**Frontend (4):**
- React app setup with Vite + Tailwind CSS
- Reusable components library
- Masked date input component
- API service layer
- Form validation utilities
- Error handling and loading states

**DevOps (3):**
- Backend Dockerfile
- Frontend Dockerfile
- docker-compose.yml
- .dockerignore files
- .gitignore

**Documentation (1):**
- Comprehensive README

## 📊 Work Distribution

| Category | Count | Percentage |
|----------|-------|------------|
| Backend | 18 | 45% |
| Frontend | 18 | 45% |
| DevOps | 3 | 7.5% |
| Documentation | 1 | 2.5% |
| **Total** | **40** | **100%** |

## 🏗️ Technology Stack Summary

### Backend
- .NET 8 Web API (C#)
- Entity Framework Core
- SQL Server
- Swagger/OpenAPI
- RESTful architecture

### Frontend
- React (JavaScript)
- Vite (build tool)
- Tailwind CSS
- react-router-dom (routing)
- Axios (HTTP client)

### DevOps
- Docker & Docker Compose
- SQL Server in container
- Multi-stage Docker builds
- Environment-based configuration

## 🎨 Data Models

### MaintenanceItemTemplate
- Template for parts that need maintenance
- Fields: name, intervalType (km/time), intervalValue, archived status
- Example: "Oil Change" every 10,000 km

### Car
- Represents a user's car
- Fields: name, currentKm
- Has many CarMaintenanceItems

### CarMaintenanceItem
- Links a car to a maintenance template
- Fields: car, template, lastService (km/date), interval, calculated next service
- Tracks when maintenance was last done

### TrackChange
- History record of when maintenance was performed
- Fields: carMaintenanceItem, km/date of change
- Created when user records a maintenance action

## 🔄 API Endpoints Summary

### Setup/Templates
```
GET    /setup              - List templates
POST   /setup              - Create template
PUT    /setup/{id}         - Edit template
PUT    /setup/{id}/archive - Archive template
PUT    /setup/{id}/restore - Restore template
```

### Cars
```
GET    /cars               - List cars with maintenance items
POST   /cars               - Create car
PUT    /cars/{id}          - Edit car
PUT    /cars/{id}/km       - Update mileage
```

### Track Change
```
POST   /trackchange/{id}   - Record maintenance change
```

### Dashboard
```
GET    /dashboard/{carId}  - Get dashboard with status groups
```

## 🎯 User Flows

### 1. Setup Templates
1. User opens `/setup`
2. Sees list of existing templates
3. Can add new template (name, type, interval)
4. Can edit existing template
5. Can archive/restore templates

### 2. Add a Car
1. User goes to `/cars` and clicks "Add Car"
2. Enters car name and current mileage
3. System loads all templates
4. User customizes intervals for each part
5. User enters last service date/km for each part
6. System creates car and calculates next service dates

### 3. Track Maintenance
1. User views a car on `/cars` or `/dashboard`
2. Clicks "Track Change" for a maintenance item
3. Enters when change was done (km or date)
4. System records change and recalculates next service

### 4. View Dashboard
1. User opens `/dashboard`
2. Selects a car from dropdown
3. Sees maintenance items grouped by status:
   - 🔴 Overdue (past due date/km)
   - 🟡 Due Soon (< 30 days or < 300 km)
   - 🟢 OK (> 30 days or > 300 km)
4. Can update car mileage inline
5. Can track changes directly from dashboard

## 📝 Key Business Logic

### Next Service Calculation
- **KM-based**: nextServiceKm = lastServiceKm + intervalValue
- **Time-based**: nextServiceDate = lastServiceDate + intervalValue (days)

### Status Determination
- **Overdue**: Current km/date >= next service km/date
- **Due Soon**: Within 300 km or 30 days of next service
- **OK**: More than 300 km or 30 days until next service

### Date Validation
- Format: dd/mm/yyyy
- Day: 01-31
- Month: 01-12
- Year: >= 2000

## 🚦 Recommended Development Phases

### Phase 1: Foundation (Week 1-2)
- ✅ Database models and migrations
- ✅ React app setup
- ✅ Docker configuration
- ✅ Basic routing and navigation

### Phase 2: Templates (Week 2-3)
- ✅ Backend API for templates
- ✅ Frontend template management
- ✅ CRUD operations

### Phase 3: Cars (Week 3-5)
- ✅ Backend API for cars
- ✅ Frontend car management
- ✅ Integration with templates
- ✅ Track change functionality

### Phase 4: Dashboard (Week 5-6)
- ✅ Status calculation logic
- ✅ Dashboard backend API
- ✅ Dashboard frontend with grouping
- ✅ Inline mileage editing

### Phase 5: Polish (Week 6-7)
- ✅ Error handling
- ✅ Loading states
- ✅ Logging
- ✅ Documentation
- ✅ Testing

### Phase 6: Deployment (Week 7-8)
- ✅ Docker Compose testing
- ✅ Environment configuration
- ✅ Production optimization
- ✅ README and documentation

## 🎯 Success Criteria

The MVP is complete when:
- [ ] Users can create and manage maintenance templates
- [ ] Users can add and edit cars
- [ ] Users can customize maintenance intervals per car
- [ ] Users can track when maintenance is performed
- [ ] Dashboard shows maintenance status grouped by urgency
- [ ] All features work in Docker containers
- [ ] Frontend can communicate with backend API
- [ ] Basic error handling is in place
- [ ] Documentation is complete

## 🔗 Related Documents

- **ProjectVisionAndScope.md** - Original requirements document
- **backlog/README.md** - Detailed guide on using the backlog
- **backlog/issues.json** - Complete issue definitions

## 🚀 Next Steps

1. **Review this summary** to understand the scope
2. **Read the full backlog** in `backlog/README.md`
3. **Create GitHub issues** using the provided script
4. **Start with Phase 1** (Foundation work)
5. **Organize work** using GitHub Projects or similar tool

## 📞 Questions?

Refer to:
- ProjectVisionAndScope.md for detailed requirements
- backlog/README.md for backlog usage guide
- issues.json for complete issue descriptions

Happy coding! 🎉
