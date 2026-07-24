import React from 'react';
import { Gauge, ClipboardList, Boxes, CheckCircle2, Cpu, History, ArrowUpRight, ShieldCheck } from 'lucide-react';
import { StatCard } from '../components/StatCard';

export const Dashboard = () => {
  return (
    <div className="space-y-6">
      {/* KPI Stat Cards Grid */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        <StatCard
          title="Overall Plant OEE"
          value="87.4%"
          subtitle="Target: 85.0%"
          trend="+2.4%"
          icon={Gauge}
          color="sky"
        />
        <StatCard
          title="Active Work Orders"
          value="42 Orders"
          subtitle="8 On-time Schedule"
          trend="+5 Today"
          icon={ClipboardList}
          color="emerald"
        />
        <StatCard
          title="Raw Stock Value"
          value="$1,248,500"
          subtitle="12 Low stock alerts"
          trend="-1.2%"
          isPositive={false}
          icon={Boxes}
          color="amber"
        />
        <StatCard
          title="Quality Pass Rate"
          value="99.1%"
          subtitle="3 Defect reports"
          trend="+0.4%"
          icon={CheckCircle2}
          color="purple"
        />
      </div>

      {/* Machinery Status & Realtime Activity Grid */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Machinery Monitoring */}
        <div className="lg:col-span-2 bg-slate-900 border border-slate-800 rounded-xl p-6">
          <div className="flex items-center justify-between pb-4 border-b border-slate-800">
            <div className="flex items-center gap-2">
              <Cpu className="w-5 h-5 text-sky-400" />
              <h3 className="font-semibold text-slate-100 font-display">Plant Machinery Live Telemetry</h3>
            </div>
            <span className="text-xs text-slate-400">4 Stations Active</span>
          </div>

          <div className="mt-4 divide-y divide-slate-800/60">
            {[
              { name: 'CNC Milling Station A1', status: 'Operational', note: '98% efficiency rate', color: 'emerald' },
              { name: 'Hydraulic Press Unit B', status: 'Maintenance', note: 'Scheduled calibration', color: 'amber' },
              { name: 'Automated Assembly Line C', status: 'Operational', note: '100% efficiency rate', color: 'emerald' },
              { name: 'Robotic Welding Cell 4', status: 'Idle Queue', note: 'Awaiting batch assignment', color: 'sky' },
            ].map((machine, i) => (
              <div key={i} className="py-3.5 flex items-center justify-between">
                <div className="flex items-center gap-3">
                  <span className={`w-2.5 h-2.5 rounded-full ${machine.color === 'emerald' ? 'bg-emerald-400 shadow-sm shadow-emerald-400/50' : machine.color === 'amber' ? 'bg-amber-400' : 'bg-sky-400'}`}></span>
                  <div>
                    <p className="text-sm font-semibold text-slate-200">{machine.name}</p>
                    <p className="text-xs text-slate-400">{machine.note}</p>
                  </div>
                </div>
                <span className={`text-xs font-semibold px-2.5 py-1 rounded-full border ${
                  machine.color === 'emerald' ? 'bg-emerald-500/10 text-emerald-400 border-emerald-500/30' : machine.color === 'amber' ? 'bg-amber-500/10 text-amber-400 border-amber-500/30' : 'bg-sky-500/10 text-sky-400 border-sky-500/30'
                }`}>
                  {machine.status}
                </span>
              </div>
            ))}
          </div>
        </div>

        {/* Realtime Audit Feed */}
        <div className="bg-slate-900 border border-slate-800 rounded-xl p-6">
          <div className="flex items-center justify-between pb-4 border-b border-slate-800">
            <div className="flex items-center gap-2">
              <History className="w-5 h-5 text-sky-400" />
              <h3 className="font-semibold text-slate-100 font-display">System Audit Logs</h3>
            </div>
            <ShieldCheck className="w-4 h-4 text-emerald-400" />
          </div>

          <div className="mt-4 space-y-4">
            {[
              { action: 'Stock Dispatched', detail: '500 Units Aluminium Coils', time: '10 mins ago' },
              { action: 'Work Order Completed', detail: 'WO-2026-0099 Steel Frames', time: '25 mins ago' },
              { action: 'Maintenance Logged', detail: 'Oil Filter Change (Press B)', time: '1 hour ago' },
              { action: 'Quality Inspection', detail: 'Batch #881 Inspection Passed', time: '2 hours ago' },
            ].map((log, i) => (
              <div key={i} className="flex items-start gap-3 text-xs">
                <CheckCircle2 className="w-4 h-4 text-sky-400 shrink-0 mt-0.5" />
                <div className="flex-1">
                  <p className="font-semibold text-slate-200">{log.action}</p>
                  <p className="text-slate-400">{log.detail}</p>
                </div>
                <span className="text-slate-500 shrink-0">{log.time}</span>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
};
