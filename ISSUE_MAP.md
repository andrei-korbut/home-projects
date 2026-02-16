# Issue Organization Map

This document provides a visual map of how the 40 issues are organized and their dependencies.

## 📊 Issue Map by Feature Area

```
┌─────────────────────────────────────────────────────────────┐
│                    INFRASTRUCTURE (14)                       │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  Backend Setup (6)                    Frontend Setup (4)     │
│  ├─ Database & Models                 ├─ React + Vite       │
│  ├─ Swagger Docs                      ├─ Components Library │
│  ├─ CORS Config                       ├─ API Service Layer  │
│  ├─ Error Handling                    ├─ Validation Utils   │
│  ├─ Logging                           └─ Error Handling     │
│  └─ Unit Tests                                               │
│                                                               │
│  DevOps (3)                           Documentation (1)      │
│  ├─ Backend Dockerfile                └─ README             │
│  ├─ Frontend Dockerfile                                      │
│  └─ docker-compose.yml                                       │
│                                                               │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│              TEMPLATES/SETUP FEATURE (6)                     │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  Backend (3)                          Frontend (3)           │
│  ├─ GET /setup                        ├─ List Templates     │
│  ├─ POST /setup                       ├─ Add Template       │
│  ├─ PUT /setup/{id}                   ├─ Edit Template      │
│  ├─ PUT /setup/{id}/archive           └─ Archive/Restore    │
│  └─ PUT /setup/{id}/restore                                  │
│                                                               │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│                  CARS FEATURE (8)                            │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  Backend (4)                          Frontend (4)           │
│  ├─ GET /cars                         ├─ List Cars          │
│  ├─ POST /cars                        ├─ Add Car Page       │
│  ├─ PUT /cars/{id}                    ├─ Edit Car Page      │
│  └─ PUT /cars/{id}/km                 └─ Track Change Modal │
│                                                               │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│              TRACK CHANGE FEATURE (1)                        │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  Backend (1)                          Frontend               │
│  └─ POST /trackchange/{id}            └─ (Reuses modal)     │
│                                                               │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│                DASHBOARD FEATURE (3)                         │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  Backend (1)                          Frontend (2)           │
│  └─ GET /dashboard/{carId}            ├─ Dashboard View     │
│     (Status calculation)              └─ Inline Edit KM     │
│                                                               │
└─────────────────────────────────────────────────────────────┘
```

## 🔄 Development Flow & Dependencies

```
PHASE 1: FOUNDATION
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│   Database   │     │  React App   │     │    Docker    │
│    Setup     │────▶│    Setup     │────▶│    Setup     │
│    (1)       │     │    (1)       │     │    (3)       │
└──────────────┘     └──────────────┘     └──────────────┘
       │                    │                     │
       │                    │                     │
       ▼                    ▼                     ▼
┌──────────────────────────────────────────────────────────┐
│           All other issues can start here                │
└──────────────────────────────────────────────────────────┘

PHASE 2: TEMPLATES (Can work in parallel)
┌─────────────────┐                ┌─────────────────┐
│  Backend APIs   │───────────────▶│  Frontend UI    │
│  GET/POST/PUT   │                │  List/Add/Edit  │
│  /setup         │                │  Archive        │
└─────────────────┘                └─────────────────┘

PHASE 3: CARS (Depends on Templates)
┌─────────────────┐                ┌─────────────────┐
│  Backend APIs   │───────────────▶│  Frontend UI    │
│  GET/POST/PUT   │                │  List/Add/Edit  │
│  /cars          │                │  +Track Change  │
└─────────────────┘                └─────────────────┘

PHASE 4: DASHBOARD (Depends on Cars)
┌─────────────────┐                ┌─────────────────┐
│  Backend API    │───────────────▶│  Frontend View  │
│  GET /dashboard │                │  Status Groups  │
│  +Status Logic  │                │  Inline Edit    │
└─────────────────┘                └─────────────────┘

PHASE 5: POLISH (Throughout)
┌───────────────────────────────────────────────────────┐
│  Error Handling | Logging | Validation | Testing      │
│  Can be added incrementally as features are built     │
└───────────────────────────────────────────────────────┘
```

## 🎯 Parallel Work Opportunities

These issues can be worked on in parallel:

### Team A: Backend
```
Week 1-2: Foundation
├─ Issue #1: Database setup
├─ Issue #24: Swagger
├─ Issue #32: CORS
└─ Issue #33: Error handling

Week 2-3: Templates
├─ Issue #2: GET /setup
├─ Issue #3: POST /setup
├─ Issue #4: PUT /setup/{id}
├─ Issue #5: Archive
└─ Issue #6: Restore

Week 3-4: Cars
├─ Issue #12: GET /cars
├─ Issue #13: POST /cars
├─ Issue #14: PUT /cars/{id}
└─ Issue #15: PUT /cars/{id}/km

Week 4-5: Track Change & Dashboard
├─ Issue #16: POST /trackchange
└─ Issue #17: GET /dashboard
```

### Team B: Frontend
```
Week 1-2: Foundation
├─ Issue #7: React setup
├─ Issue #29: Components library
├─ Issue #30: Masked date input
└─ Issue #38: Form validation

Week 2-3: Templates
├─ Issue #8: List templates
├─ Issue #9: Add template
├─ Issue #10: Edit template
└─ Issue #11: Archive/Restore

Week 3-4: Cars
├─ Issue #18: List cars
├─ Issue #19: Add car page
├─ Issue #20: Edit car page
└─ Issue #21: Track change modal

Week 4-5: Dashboard
├─ Issue #22: Dashboard main view
├─ Issue #23: Inline edit mileage
└─ Issue #37: API service layer
```

### Team C: DevOps (Throughout)
```
Week 1: Docker Setup
├─ Issue #25: Backend Dockerfile
├─ Issue #26: Frontend Dockerfile
├─ Issue #27: docker-compose.yml
├─ Issue #39: .dockerignore
└─ Issue #40: .gitignore

Week 2-5: Documentation & Deployment
├─ Issue #28: README
└─ Testing & refinement
```

## 📋 Critical Path

These issues MUST be completed in order:

```
1. Database Setup (Issue #1)
   └─▶ All backend API issues depend on this

2. React Setup (Issue #7)
   └─▶ All frontend UI issues depend on this

3. Docker Setup (Issues #25, #26, #27)
   └─▶ Integration testing depends on this

4. Templates Backend (Issues #2-6)
   └─▶ Templates Frontend (Issues #8-11)
       └─▶ Cars Backend (Issues #12-15)
           └─▶ Cars Frontend (Issues #18-21)
               └─▶ Track Change (Issue #16)
                   └─▶ Dashboard Backend (Issue #17)
                       └─▶ Dashboard Frontend (Issues #22-23)
```

## 🏷️ Labels Legend

| Label | Meaning | Count |
|-------|---------|-------|
| `backend` | Backend API work | 18 |
| `frontend` | Frontend UI work | 18 |
| `api` | API endpoint | 12 |
| `ui` | User interface | 15 |
| `setup` | Setup/Templates feature | 8 |
| `cars` | Cars feature | 7 |
| `dashboard` | Dashboard feature | 4 |
| `forms` | Form handling | 7 |
| `database` | Database work | 1 |
| `devops` | DevOps/Docker | 5 |
| `docker` | Docker specific | 4 |
| `documentation` | Documentation | 2 |
| `testing` | Testing | 1 |
| `components` | Reusable components | 2 |

## 🎯 Suggested Milestones

Create these milestones in GitHub:

1. **Foundation** (Issues #1, #7, #25-27, #39-40)
   - Database, React, Docker setup
   - Target: Week 1-2

2. **Templates Feature** (Issues #2-6, #8-11)
   - Complete templates CRUD
   - Target: Week 2-3

3. **Cars Feature** (Issues #12-15, #18-21)
   - Complete cars management
   - Target: Week 3-4

4. **Dashboard & Track Change** (Issues #16-17, #22-23)
   - Advanced features
   - Target: Week 4-5

5. **Polish & Documentation** (Issues #24, #28-38)
   - Error handling, logging, docs
   - Target: Week 5-6

## 📊 Complexity Estimates

### Simple (1-2 hours)
- CORS configuration
- .gitignore setup
- Archive/Restore endpoints
- Masked date component

### Medium (3-6 hours)
- Basic CRUD endpoints
- List/form pages
- React setup
- Dockerfile creation

### Complex (1-2 days)
- Database setup & migrations
- Dashboard with status calculation
- Cars page with templates integration
- Docker compose configuration

### Very Complex (2-3 days)
- Track change with history
- API service layer
- Complete error handling
- Full component library

## 🎉 Ready to Start!

Use this map to:
1. ✅ Understand dependencies
2. ✅ Plan parallel work
3. ✅ Estimate timeline
4. ✅ Assign team members
5. ✅ Track progress

Now go create those issues! 🚀
