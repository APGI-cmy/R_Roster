# R-Roster Replacement Allocation App

## Overview

The **R-Roster Replacement Allocation App** is a **desktop-only, deterministic utility** designed to assist a single user in allocating **replacement teachers** when permanently allocated teachers are absent.

The app does **not** perform scheduling optimisation or timetable generation. Its sole purpose is to **fill existing, fixed roster slots** affected by absenteeism, following **explicit, hard-coded rules**.

There is **no AI, no machine learning, and no probabilistic logic** involved. All calculations, iterations, and decisions are rule-based and reproducible.

---

## Core Principles

- **Deterministic**: Same input → same output, every time
- **Replacement-only**: Only fills slots where a permanently allocated teacher is absent
- **Immutable roster structure**: Subjects, rooms, grades, and keys never change
- **Fair distribution**: Replacement duties are spread as evenly as possible
- **No room feasibility enforcement**: Rooms are informational only
- **Offline desktop tool**: No online hosting, no user accounts

---

## Data Sources

### 1. Main Roster (PDF)

- Imported once per year
- Exported from an existing system (PDF format)
- Contains **77 teacher rosters**, one per teacher
- Each roster is an **8 × 6 matrix**:
  - Columns: **6-day cycle** (Day 1 → Day 6)
  - Rows: **Periods** (Period 1 → Period 8)

#### Roster Rules

- The teacher name (Surname + Initials) appears once at the **top-left** of each roster
- Cell contents include subject, grade, room (kamer), and key
- **These contents are immutable** and must never be altered
- Blank cells represent empty periods and are ignored
- Cells marked `RU …` (Room Used) are treated as **empty periods**

The PDF is converted **once** into a structured internal model and cached. The app never re-parses or edits the PDF visually.

---

### 2. Available Teachers (Excel)

- Preloaded for the year
- Can be replaced when required
- Defines **period-level availability**

#### Layout

- **Rows (vertical)**: Periods (1–8)
- **Columns (horizontal)**: Cycle days (Day 1–Day 6)
- **Cell content**:
  - Teacher name → available for that day and period
  - Blank cell → unavailable

Availability is strictly respected during allocation.

---

## Teacher Database

A simple internal database containing:

- Teacher surname and initials
- Fixed classroom or floating status (informational only)

Room feasibility is **not enforced** by the app.

---

## Daily Inputs

Each day, the user provides:

1. **Cycle day** (Day 1–Day 6)
2. **List of absentees** (selected from a searchable dropdown)
3. **Start period** (periods before this are ignored)
4. **Run type**:
   - **First version for the day**
   - **Second version for the day** (midday adjustment)

Absentees are never considered available, even if listed in the availability file.

---

## Allocation Logic (Hard-Coded)

### General Rules

- Only slots affected by absenteeism are considered
- Only periods **at or after** the selected start period are included
- Empty or `RU` periods are ignored
- A replacement teacher name is written **above existing content**, in **bold red**, formatted as:

SURNAME INITIAL

yaml
Copy code

The underlying roster content remains unchanged.

---

### Fairness Rules

The app maintains a persistent allocation counter per teacher:

- Total historical allocations
- Allocations for the current day

Allocation order:

1. Lowest total allocation count
2. Fewest allocations today
3. Alphabetical surname + initials (tie-breaker)

Constraints:

- A teacher may be allocated **at most twice per day**
- Even if a teacher is far behind historically, they may not exceed two allocations in a single day

---

### First Version for the Day

- Applies to **all absentees**
- Scans **all 77 rosters**
- Allocates replacements across all affected slots
- Teachers may be allocated up to **two times**

This is the standard daily run.

---

### Second Version for the Day (Midday Adjustment)

Used when an additional absentee occurs after the roster has already been partially executed.

Additional constraints:

- Only **one teacher roster** is affected
- Only periods **after the selected start period** are affected
- Teachers already allocated earlier in the day are **completely excluded**, even if available
- Other rosters remain untouched

This prevents retroactive changes and double allocation.

---

## Edge Cases

- **Two absent teachers, same period, same room**: Impossible by design  
  Each room has only one permanently allocated teacher
- **Empty rooms**: Ignored entirely
- **Floating teachers**: Treated the same as fixed teachers for allocation

---

## Validation and Failure Conditions

Before execution, the app must validate:

- Sufficient available teachers exist for the affected slots
- Allocation limits (max two per teacher per day) are not exceeded

If allocation is impossible, the app must **fail loudly** with a clear warning.

---

## Audit Log

For every run, the app records:

- Date
- Cycle day
- Run type (First / Second)
- Absentees
- Start period
- Each allocation decision
- Allocation counters before and after

This ensures transparency, traceability, and reproducibility.

---

## UI Layout (Desktop)

### Main View

- Roster display
- Filters:
  - Teacher name
  - Day
  - Period

### Left Sidebar

- Absentee selection (searchable dropdown)
- Cycle day selector
- Start period selector
- Run type selector (radio buttons)
- Submit / Run button

---

## Explicit Non-Goals

The app deliberately does **not**:

- Optimise timetables
- Enforce room feasibility
- Fill empty periods
- Rebalance workloads dynamically
- Use AI, ML, or heuristics
- Support multiple users or online access

---

## Hosting & Deployment

- Desktop environment only
- Single-user tool
- No authentication
- No internet dependency

---

## Summary

The R-Roster App is a **rule-driven, predictable, and defensible replacement allocation tool** designed to mirror real-world school processes with minimal complexity and maximum trust.

All behaviour is explicitly coded, auditable, and repeatable.
