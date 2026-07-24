import React from 'react';
import { Cpu, Plus, Clock, CheckCircle2 } from 'lucide-react';

export const Production = () => {
  const workOrders = [
    { id: 'WO-2026-0881', product: 'Planetary Gearbox Assembly V2', qty: '500 Units', plant: 'Plant #1 - Machining', status: 'In Progress', progress: 65 },
    { id: 'WO-2026-0882', product: 'Custom Aluminium Enclosure B', qty: '1,200 Units', plant: 'Plant #2 - Fabrication', status: 'Approved', progress: 10 },
    { id: 'WO-2026-0883', product: 'Heavy Duty Shaft Couplings', qty: '2,500 Units', plant: 'Plant #3 - Foundry', status: 'Completed', progress: 100 },
  ];

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h3 className="text-xl font-bold font-display text-slate-100">Production & Work Orders</h3>
          <p className="text-xs text-slate-400">Track job scheduling, execution status, and plant output</p>
        </div>
        <button className="bg-sky-600 hover:bg-sky-500 text-white text-xs font-semibold px-4 py-2 rounded-lg flex items-center gap-2 transition-all shadow-lg shadow-sky-600/20">
          <Plus className="w-4 h-4" />
          <span>Create Work Order</span>
        </button>
      </div>

      <div className="grid grid-cols-1 gap-4">
        {workOrders.map((wo, i) => (
          <div key={i} className="bg-slate-900 border border-slate-800 rounded-xl p-5 hover:border-slate-700 transition-colors">
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-3">
                <span className="font-mono font-bold text-sky-400 text-base">{wo.id}</span>
                <span className="text-xs px-2.5 py-0.5 rounded bg-slate-800 text-slate-300 border border-slate-700">{wo.plant}</span>
              </div>
              <span className={`text-xs font-semibold px-3 py-1 rounded-full border ${
                wo.status === 'Completed' ? 'bg-emerald-500/10 text-emerald-400 border-emerald-500/30' : wo.status === 'In Progress' ? 'bg-sky-500/10 text-sky-400 border-sky-500/30' : 'bg-slate-800 text-slate-400 border-slate-700'
              }`}>
                {wo.status}
              </span>
            </div>

            <div className="mt-3">
              <h4 className="font-semibold text-slate-100 text-sm">{wo.product}</h4>
              <p className="text-xs text-slate-400 mt-0.5">Quantity: {wo.qty}</p>
            </div>

            <div className="mt-4 pt-3 border-t border-slate-800/80">
              <div className="flex items-center justify-between text-xs mb-1.5">
                <span className="text-slate-400 font-medium">Job Completion</span>
                <span className="font-bold text-sky-400">{wo.progress}%</span>
              </div>
              <div className="w-full h-2 bg-slate-950 rounded-full overflow-hidden">
                <div className="h-full bg-sky-500 rounded-full transition-all duration-500" style={{ width: `${wo.progress}%` }}></div>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};
