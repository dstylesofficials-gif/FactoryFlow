import React from 'react';
import { 
  LayoutDashboard, 
  Building2, 
  Boxes, 
  Cpu, 
  CheckCircle2, 
  Truck, 
  ShoppingBag, 
  Users, 
  BarChart3, 
  ShieldCheck, 
  Settings, 
  LogOut,
  Factory
} from 'lucide-react';
import { useAuth } from '../context/AuthContext';

export const Sidebar = ({ activeTab, setActiveTab }) => {
  const { user, logout } = useAuth();

  const navItems = [
    { id: 'dashboard', label: 'Dashboard', icon: LayoutDashboard },
    { id: 'factories', label: 'Factories & Plants', icon: Building2 },
    { id: 'inventory', label: 'Inventory & Stock', icon: Boxes },
    { id: 'production', label: 'Production Work Orders', icon: Cpu },
    { id: 'quality', label: 'Quality Control', icon: CheckCircle2 },
    { id: 'suppliers', label: 'Suppliers & Purchasing', icon: Truck },
    { id: 'sales', label: 'Sales Orders', icon: ShoppingBag },
    { id: 'workforce', label: 'Workforce & Payroll', icon: Users },
    { id: 'reports', label: 'Analytics & Reports', icon: BarChart3 },
    { id: 'audit', label: 'Audit Logs', icon: ShieldCheck },
    { id: 'settings', label: 'Settings', icon: Settings },
  ];

  return (
    <aside className="w-64 bg-slate-900 border-r border-slate-800 flex flex-col h-screen sticky top-0 z-30">
      {/* Brand Header */}
      <div className="p-5 border-b border-slate-800 flex items-center gap-3">
        <div className="p-2 bg-sky-600 rounded-lg text-white shadow-lg shadow-sky-600/30">
          <Factory className="w-6 h-6" />
        </div>
        <div>
          <h1 className="font-display font-bold text-lg text-slate-100 tracking-tight">FactoryFlow</h1>
          <p className="text-xs text-slate-400 font-medium">Enterprise ERP</p>
        </div>
      </div>

      {/* Navigation List */}
      <nav className="flex-1 overflow-y-auto p-3 space-y-1">
        {navItems.map((item) => {
          const Icon = item.icon;
          const isActive = activeTab === item.id;
          return (
            <button
              key={item.id}
              onClick={() => setActiveTab(item.id)}
              className={`w-full flex items-center gap-3 px-3.5 py-2.5 rounded-lg text-sm font-medium transition-all ${
                isActive
                  ? 'bg-sky-600/15 text-sky-400 border border-sky-500/30 shadow-sm'
                  : 'text-slate-400 hover:text-slate-200 hover:bg-slate-800/60'
              }`}
            >
              <Icon className={`w-4 h-4 ${isActive ? 'text-sky-400' : 'text-slate-400'}`} />
              <span>{item.label}</span>
            </button>
          );
        })}
      </nav>

      {/* User Session Footer */}
      <div className="p-4 border-t border-slate-800 bg-slate-900/50">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3 overflow-hidden">
            <div className="w-9 h-9 rounded-full bg-sky-500/20 text-sky-400 flex items-center justify-center font-bold text-sm border border-sky-500/30">
              {user?.name?.[0] || 'A'}
            </div>
            <div className="overflow-hidden">
              <p className="text-sm font-semibold text-slate-200 truncate">{user?.name || 'Admin User'}</p>
              <p className="text-xs text-slate-400 truncate">{user?.role || 'Manager'}</p>
            </div>
          </div>
          <button
            onClick={logout}
            className="p-2 text-slate-400 hover:text-rose-400 hover:bg-rose-500/10 rounded-lg transition-colors"
            title="Sign Out"
          >
            <LogOut className="w-4 h-4" />
          </button>
        </div>
      </div>
    </aside>
  );
};
