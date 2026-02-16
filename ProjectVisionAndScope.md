# Car Maintenance Tracker – Project Description

## 1️⃣ Project Idea / Overview
**Goal:** Build a simple MVP app to track car maintenance items (oil change, air filter, coolant, etc.) with both **time-based** and **km-based** intervals. 
For MVP there will be no registered users and authentication/authorization.

- User can define **part maintenance templates** (parts with interval type & value).  
- User can register **cars** and customize **part maintenance templates** for this car.
- In the UI/frontend each car will always show to user the set of created **part maintenance templates**.  
- Each maintenance item tracks **last service date/km** and calculates the **next due date/km**.  
- Users can record **track change** for each part.  
- Dashboard shows **parts grouped by status** (overdue, due soon, OK).  
- Unauthenticated user can created many cars.  
- No authentication initially; future iterations could support user registration/login.

**Generarl description/vision of features:**
User opens url for the /setup page, by default there's a list of existing maintenance templates. in whichever sorting backend returns. UI has a button at the top to add new maintenace template item. when we click it, frontend renders the fields for it. When user clicks save, frontend posts. For each template we have edit button in form of pencik icon. When we click, the fields of the item are transformed into editable fields, then when user inputs and clicks save, frontend puts this. we can probably also add archive button also for this, the pop-up window appears, asks for confirmation, then frontend sends put request the archive parameter and the it will affect all the connected user's maintenance items connected to this template, they will be hidden from UI. when an item is archived, it can be restoreed, when its not archived it can be archived. then we go to the list of cars. We have button to add car, it leads to a new page, there we add name of the car, plus frontend gets all the templates, renders them in edit mode. users fills changes or doesnt change the default interval for a part + for each part/item adds the latest change date or kms/mileage, clicks save, frontend posts. if its a date for mvp lets make a mask input field of dd/mm/yyyy that user has to follow and we add some frontend validation, maybe to avoid for now wiring in some calendar component and then we can use calendar in the second iteration. total current km/mileage on a car. then user is redirected back to the list page, get list called. each car is shown with all the parts on the page, for each part we have a button to track change. For tracking change of the part, the app asks if the change happened at current km-run aka mileage, or it happed at custom point, if custom, theres input field to input the km, then user clicks save/track and frontend sends the post query. the tracking is saved. i think all the changes to the part should be also shown in the car card in some kind of toggle for each part with datetime update and /kms and probably calculated date how much the part has been in use up to the point of change. then we have a pencil/edit button for the car, leads us to edit page, there we can edit fields of the parts as like the default interval for a part + latest track change that there is (either that was added when car was posted for the first time or the latest track change feature for the part, then we also need to change the date or km for that latest track change entity record) + edit name of the car + edit total mileage. 
General button to save. In success it redirects back to car list page. Then we have dashbaord page. We open dashboard page, by default it loads 3 groups that we discussed, dashboard is filtered by the dropdown of all cars user added. By default first car is selected and filter applied. Also the total km/mileage for a car is shown on the main page. we can click pencil/edit button and it will update just the km/mileage for this specific car, frontend sends put, updates the km thing on the page. for each part we also show in how many kms it must be changed or how many days left untill change in the dashboard thing.
The categories for dashboard will be decided by the backend like more than 1 month ahead change, less than 1 month ahead change, past the change time or if its in kms, then more than 300kms before, less than 300, past the km point.


---

## 2️⃣ Pages & Features

### 2.1 Setup Page (`/setup`)
- **Features:**
  - UI/frontend on page load will display list of existing maintenance templates (sorted by datetime added, newest first) or empty components with text "There are no currently available parts' maintenance templates."
  - In UI there will be always a button to add a new part maintenance template.
  - When Add new part maintenance template button is clicked, UI/frontend renders editable fields to user and displays 2 buttons save/cancel. If user clicks save, validation check runs for  the fields, if they are valid, frontend/UI sends POST request to backend. If fields are invalid, the error messages are displayed for invalid fields and fields are highlighted in red. If user clicks cancel, frontend hides set of fields for part's maintenance templates and does not save any data that user input.
  - Add template:
    - Name (string) – required, error text - "Name is obligatory field"  
    - Interval Type (in frontend app dropdown: `km` / `time`) – required, error text - "Interval type is obligatory field" 
    - Interval Value (number, dynamic label: km if type=km, days if type=time) – required, error text - "Interval value is obligatory field" 
  - For each existing part's maintenance template frontend/ui renders pencil/edit button. When user clicks on it, the fields become editable and Cancel/Save buttons are rendered, Cancel/Save buttons are working the same way as for the creation feature.
  - Edit template (inline/modal) – all fields editable  
  - For each existing part's maintenance template frontend/ui renders archive or restore buttons, based on the current status of the template.
  - Archive / Restore template:
    - Archived templates hidden from UI and car assignments  
    - Keep in DB for history  
- **Endpoints:**
  - `GET /setup` → list templates  
  - `POST /setup` → create new template  
  - `PUT /setup/{id}` → edit template  
  - `PUT /setup/{id}/archive` → archive  
  - `PUT /setup/{id}/restore` → restore  

---

### 2.2 Cars Page (`/cars`)
- **Features:**
  - List all cars (sorted by backend by default datetime added, newest first)  
  - Add car (`/cars/new`):
    - Car Name – required, string, error text - "Name is obligatory field"  
    - Mileage – required, int, error text - "Mileage is obligatory field"  
    - For each maintenance template:
      - Interval (default from template, editable) – required, error text "Interval is obligatory field"  
      - "Last service (km/date)", this field is dynamic, its based on the Interval Type, if type=km then field is just input field for ints, if interval is time, then the field is the field with mask for date input of dd/mm/yyyy; required, error text "Last service km/date is obligatory field"    
      - Masked Date input field validation: dd/mm/yyyy for date (masked input, frontend validation)  
      - Backend always tries to parse the masked date input, into datetime field to store in database.
  - Edit car (`/cars/{id}/edit`):
    - Edit car name  
    - Edit current km
    - Edit maintenance items (interval, last service km/date)  
  - Track change for each maintenance item:
    - By default frontend/ui shows current car mileage in the field for 'Changed at 'mileage'' if the field is of Interval Type = km, if Interval Type = time, then it shows the field with mask for date input of dd/mm/yyyy, Masked Date input field validation: dd/mm/yyyy for date (masked input, frontend validation).
    - Sends `POST /trackchange/{carMaintenanceItemId}` → record km/date change. Backend always tries to parse the masked date input, into datetime field to store in database.
    - Updates CarMaintenanceItem + recalc next service  
- **Endpoints:**
  - `GET /cars` → list cars + attached non-archived maintenance items  
  - `POST /cars` → add new car + user maintenance items  
  - `PUT /cars/{id}` → edit car info + maintenance items    
  - `POST /trackchange/{carMaintenanceItemId}` → record km/date change  

---

### 2.3 Dashboard Page (`/dashboard`)
- **Features:**
  - The categories for dashboard will be decided by the backend like more than 1 month ahead change, less than 30 days month ahead change, past the change time or if its in kms, then more than 300kms before, less than 300, past the km point.
  - Dropdown to select car (default: first car returned)  
  - Shows current mileage for a car
  - Allows to click edit and change the current mileage number for this crrently selected car. Calls this endpoint `PUT /cars/{id}/km` → update only current km/mileage (dashboard)
  - Show total km (editable inline → PATCH `/cars/{id}/km`)  
  - Show maintenance items grouped by **status**:
    - 🔴 Overdue  (past the planned change km/date)
    - 🟡 Due soon (< 30 days / < 300 km)  
    - 🟢 OK  (more than 30 days / 300 kms ahead of planned change km/date)
  - For each item:
    - Name  
    - Interval info  
    - Next due date/km  
    - Track change button (same as Cars page)  
- **Endpoints:**
  - `GET /dashboard/{carId}` → returns parts with status calculated on backend  
  - `PATCH /cars/{id}/km` → update only current km/mileage (dashboard)

---

## 3️⃣ Models

### 3.1 MaintenanceItemTemplate
- `id` (int, backend-generated) – Unique template ID  
- `name` (string, required) – Part name  
- `intervalType` (string, required, dropdown: km/time)  
- `intervalValue` (int, required) – km or days depending on type  
- `archived` (bool, optional, default false) – Hidden when true  
- `createdAt` (datetime, backend-generated) – Timestamp added  

---

### 3.2 Car
- `id` (int, backend-generated) – Car ID  
- `name` (string, required) – Car name  
- `currentKm` (int, required) – Total mileage/km  
- `createdAt` (datetime, backend-generated) – Timestamp added  

---

### 3.3 CarMaintenanceItem
- `id` (int, backend-generated) – Unique ID  
- `carId` (int, required) – Linked car  
- `maintenanceTemplateId` (int, required) – Linked template  
- `lastServiceKm` (int, optional) – Last km service  
- `lastServiceDate` (datetime, optional) – Last date service  
- `intervalValue` (int, required) – Interval copied from template  
- `intervalType` (string, required) – km / time  
- `calculatedNextKm` (int, backend) – Next km due  
- `calculatedNextDate` (datetime, backend) – Next date due  

---

### 3.4 TrackChange
- `id` (int, backend-generated) – Track change ID  
- `carMaintenanceItemId` (int, required) – Linked maintenance item  
- `km` (int, optional) – Km at which change happened  
- `date` (datetime, optional) – Date of service  

---

## 4️⃣ Planned Mechanics & Logic

- **Next service calculation:**  
  - If intervalType == km: `NextServiceKm = LastServiceKm + IntervalValue`  
  - If intervalType == time: `NextServiceDate = LastServiceDate + IntervalValue`  intervalue is days.
- **Status calculation (for dashboard):**  
  - Km-based:
    - Red: `CurrentKm >= NextServiceKm`  
    - Yellow: `NextServiceKm - CurrentKm <= 300`  
    - Green: `NextServiceKm - CurrentKm > 300`  
  - Time-based:
    - Red: `Today >= NextServiceDate`  
    - Yellow: `NextServiceDate - Today <= 30 days`  
    - Green: `NextServiceDate - Today > 30 days`  
- **TrackChange POST:**  
  - Updates `LastServiceKm` / `LastServiceDate` in CarMaintenanceItem  
  - Creates TrackChange record  
  - Backend recalculates next due km/date  
- **Archived templates:**  
  - Hidden in UI and cars list (archived templates are only shown on the setup page where templates are managed. All the CarMaintenanceItems are hidden from ui/are not sent from the backend, if they are archived.)
  - Archived templates are still editable on the setup page
- **Sorting:**  
  - Cars list → default newest added first  
  - Maintenance templates → default newest added first
  - CarMaintenanceItem list inside car → default newest added first  
  Default sortings are done on the backend

---

## 5️⃣ Frontend Validations

- **Date input** (`dd/mm/yyyy`)  
  - `dd` ≤ 31  
  - `mm` ≤ 12  
  - `yyyy` ≥ 2000  
- **Km input** → must be ≥ 0  
- **IntervalValue** → must be > 0  
- **IntervalType** → dropdown with `km` / `time`  
- **Dynamic label** for IntervalValue: `km` or `days` depending on IntervalType  

---

## 6️⃣ Notes / Future Iterations

- Multi-user / authentication  
- Pagination / filtering for long lists  
- Calendar UI for date inputs  
- Advanced dashboard filters / sorting  

## Technology Stack

### Backend
- .NET 8 Web API (C#)
- Entity Framework Core
- SqlServer database
- RESTful controllers
- Swagger enabled

### Frontend
- React (JavaScript)
- Vite for project scaffolding
- Tailwind CSS for styling
- react-router-dom for routing
- Axios or fetch for API calls