import React, { useState } from 'react';
import { AuthProvider, useAuth } from './context/AuthContext';
import { Sidebar } from './components/Sidebar';
import { Header } from './components/Header';
import { Login } from './pages/Login';
import { Dashboard } from './pages/Dashboard';
import { Factories } from './pages/Factories';
import { Inventory } from './pages/Inventory';
import { Production } from './pages/Production';

const AppContent = () => {
  const { user, loading } = useAuth();
  const [activeTab, setActiveTab] = useState('dashboard');

  if (loading) {
    return (
      <div className="min-h-screen bg-slate-950 flex items-center justify-center">
        <div className="w-8 h-8 border-2 border-sky-500/30 border-t-sky-500 rounded-full animate-spin"></div>
      </div>
    );
  }

  if (!user) {
    return <Login />;
  }

  const renderTabContent = () => {
    switch (activeTab) {
      case 'dashboard':
        return <Dashboard />;
      case 'factories':
        return <Factories />;
      case 'inventory':
        return <Inventory />;
      case 'production':
        return <Production />;
      default:
        return <Dashboard />;
    }
  };

  const getHeaderInfo = () => {
    switch (activeTab) {
      case 'dashboard':
        return { title: 'Executive Dashboard', subtitle: 'Real-time overview across operational plants & stock' };
      case 'factories':
        return { title: 'Factories & Plants', subtitle: 'Multi-facility processing units' };
      case 'inventory':
        return { title: 'Inventory & Stock', subtitle: 'Raw material and finished goods tracking' };
      case 'production':
        return { title: 'Production Planning', subtitle: 'Work order scheduling and telemetry' };
      default:
        return { title: 'FactoryFlow Pro', subtitle: 'Enterprise ERP Portal' };
    }
  };

  const headerInfo = getHeaderInfo();

  return (
    <div className="flex min-h-screen bg-slate-950 text-slate-100">
      <Sidebar activeTab={activeTab} setActiveTab={setActiveTab} />
      <div className="flex-1 flex flex-col min-w-0">
        <Header title={headerInfo.title} subtitle={headerInfo.subtitle} />
        <main className="flex-1 p-6 overflow-y-auto">
          {renderTabContent()}
        </main>
      </div>
    </div>
  );
};

export function App() {
  return (
    <AuthProvider>
      <AppContent />
    </AuthProvider>
  );
}

export default App;
