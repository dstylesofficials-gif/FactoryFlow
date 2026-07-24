# FactoryFlow Enterprise - Factory Management System

FactoryFlow is an enterprise-grade, highly modular, scalable, and portable **Factory Management System** built with **Flutter (Material 3)** and **Supabase (PostgreSQL with RLS)**.

Designed for long-term maintainability, zero machine lock-in, and rapid developer onboarding (< 15 minutes).

---

## Key Features & Modules

* **Executive Dashboard**: Real-time KPI tracking, overall plant OEE metrics, active work orders, machine health monitoring, and system audit feed.
* **Multi-Facility Organization**: Hierarchical management of Factories, Plants, and Departments with localized timezones and access control.
* **Inventory & Warehouse**: Stock level monitoring, raw material tracking, finished goods management, and movement auditing.
* **Production Planning**: Work order scheduling, machine status tracking, job execution, and quality inspection workflows.
* **Security & Access Control**: PostgreSQL Row Level Security (RLS), Role-Based Access Control (RBAC), and global exception boundaries.
* **Portable Infrastructure**: Environment-driven configuration (`.env`), isolated repository interfaces (`IAuthRepository`), and GitHub Actions CI/CD.

---

## Quick Start (Onboarding in < 5 Minutes)

### Prerequisites
* Flutter SDK (3.22.x+ Stable)
* Git
* PowerShell (Windows) or Bash (macOS/Linux)

### Installation
1. **Clone Repository**:
   ```bash
   git clone https://github.com/your-org/factoryflow.git
   cd factoryflow
   ```

2. **Automated Environment Setup**:
   On Windows (PowerShell):
   ```powershell
   .\scripts\setup.ps1
   ```
   On macOS/Linux (Bash):
   ```bash
   chmod +x scripts/setup.ps1
   ./scripts/setup.ps1
   ```

3. **Run Application**:
   ```bash
   flutter run -d chrome
   ```

---

## Tech Stack & Architecture

* **Frontend Framework**: Flutter (Latest Stable) & Material 3 Design System.
* **Architecture Pattern**: Clean Architecture + MVVM (Model-View-ViewModel).
* **State Management**: Riverpod (`flutter_riverpod`).
* **Routing**: GoRouter with authentication route guards.
* **Database & Backend**: Supabase PostgreSQL with versioned SQL migrations under `supabase/migrations/`.
* **CI/CD Automation**: GitHub Actions pipeline (`.github/workflows/ci.yml`).

---

## Project Documentation

* [Architecture & Module Design](docs/ARCHITECTURE.md)
* [Developer Onboarding & Standards](docs/DEVELOPER_GUIDE.md)
* [Database Schema & Security Guide](docs/DATABASE_GUIDE.md)
