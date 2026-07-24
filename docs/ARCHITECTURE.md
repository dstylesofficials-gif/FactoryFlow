# FactoryFlow Architecture & Design Guide

## 1. Clean Layered Architecture

FactoryFlow strictly segregates code into three core architectural layers:

```
┌─────────────────────────────────────────────────────────┐
│                    PRESENTATION                         │
│   Flutter Material 3 UI Screens | ViewModels | Riverpod │
└────────────────────────────┬────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────┐
│                       DOMAIN                            │
│   Entities | Use Cases | Abstract Repository Interfaces │
└────────────────────────────▲────────────────────────────┘
                             │
                             │ Implemented by
┌────────────────────────────┴────────────────────────────┐
│                    DATA / INFRASTRUCTURE                │
│  Supabase Client | SQL Mappers | Local Storage | API    │
└─────────────────────────────────────────────────────────┘
```

### Domain Layer (Pure Business Rules)
* Located under `lib/features/<feature>/domain/`.
* Contains pure Dart data structures (`UserEntity`, `FactoryEntity`) and contract interfaces (`IAuthRepository`).
* **Zero external infrastructure dependencies**. This allows swapping Supabase for any custom backend or microservices architecture in the future without touching business logic or UI screens.

### Data Infrastructure Layer
* Located under `lib/features/<feature>/data/`.
* Implements abstract domain repository interfaces (`AuthRepositoryImpl`).
* Maps raw JSON/Supabase database DTOs into strongly-typed domain entities.

### Presentation Layer
* Located under `lib/features/<feature>/presentation/`.
* Managed reactively using Riverpod state providers and declaratively routed via GoRouter.

---

## 2. Portability & Dependency Injection

All dependencies are injected via Riverpod providers (`authRepositoryProvider`, `supabaseClientProvider`). No singleton instances or hardcoded network endpoints are permitted inside UI widgets.
