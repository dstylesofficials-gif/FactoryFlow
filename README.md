# FactoryFlow Pro - Enterprise React Factory Management System

FactoryFlow Pro is a high-performance, responsive, multi-device **Factory Management System (ERP)** built with **React**, **Vite**, **Tailwind CSS**, and **Supabase PostgreSQL**.

Designed for multi-PC cloud synchronization, low-latency real-time telemetry, and automated deployment via Git.

---

## Key Modules & Features

* **Multi-PC & Multi-Device Access**: Cloud-synced state powered by Supabase. Access from any PC, tablet, or browser simultaneously.
* **Executive KPI Dashboard**: Real-time Overall Plant OEE (87.4%), active work orders, stock valuation, plant telemetry, and audit logs.
* **Facilities & Multi-Plant Config**: Manage multi-location factories (`FAC-APEX-01`, `FAC-ROBO-02`), plants, and departments.
* **Inventory & Warehouse Tracking**: Raw materials and finished goods stock levels with low-stock warning indicators.
* **Production Work Orders**: Job execution monitoring, job completion progress bars, and machine allocation status.
* **Git CI/CD Automated Deployment**: Pre-configured GitHub Actions workflow (`.github/workflows/deploy.yml`) for automated deployment on push.

---

## Environment Setup & Supabase Connection

1. **Environment Configuration**:
   Copy `.env.example` to `.env`:
   ```bash
   VITE_SUPABASE_URL=https://your-supabase-project.supabase.co
   VITE_SUPABASE_ANON_KEY=your-supabase-anon-key
   ```

2. **Database Migration**:
   Apply SQL migration `supabase/migrations/20260724000000_initial_schema.sql` inside your Supabase SQL Editor.

---

## Deployment Instructions via Git

To deploy FactoryFlow to Vercel, Netlify, or GitHub Pages:

1. **Commit and Push to GitHub**:
   ```bash
   git add .
   git commit -m "feat: deploy FactoryFlow React application"
   git push origin main
   ```

2. **Connect Repository to Vercel / Netlify**:
   * Build Command: `npm run build`
   * Output Directory: `dist`
   * Environment Variables: `VITE_SUPABASE_URL`, `VITE_SUPABASE_ANON_KEY`
