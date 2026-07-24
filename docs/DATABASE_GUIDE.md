# FactoryFlow PostgreSQL Database Schema & Security Architecture

## 1. Migration History

All database structural changes are versioned as SQL scripts in `supabase/migrations/`:
* `20260724000000_initial_schema.sql`: Initial enterprise schema including ENUMs, primary/foreign keys, indexes, triggers, and Row Level Security.

---

## 2. Table Hierarchy

* **Organization**: `factories` -> `plants` -> `departments`
* **Access Control**: `profiles` -> `user_role_type`
* **Inventory**: `warehouses`, `raw_materials`, `finished_goods`, `stock_movements`
* **Supply Chain**: `suppliers`, `customers`, `purchase_orders`, `sales_orders`
* **Production**: `machines`, `work_orders`, `quality_inspections`
* **Workforce**: `employees`, `attendances`, `payrolls`
* **Audit**: `audit_logs`, `notifications`

---

## 3. Row Level Security (RLS)

All tables enforce PostgreSQL RLS policies ensuring multi-tenant data boundaries.
