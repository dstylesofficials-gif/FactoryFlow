import React from 'react';
import { Boxes, AlertTriangle, ArrowUpRight, Plus } from 'lucide-react';

export const Inventory = () => {
  const stockItems = [
    { sku: 'RM-ALU-001', name: 'High-Grade Aluminium Sheets (3mm)', cat: 'Raw Material', stock: '4,250 SQM', status: 'Optimal', cost: '$48.50' },
    { sku: 'RM-STL-009', name: 'Structural Steel Rods 12mm', cat: 'Raw Material', stock: '850 Tons', status: 'Low Stock', cost: '$620.00' },
    { sku: 'FG-GEAR-88', name: 'Industrial Planetary Gearbox V2', cat: 'Finished Good', stock: '140 Units', status: 'Optimal', cost: '$1,450.00' },
    { sku: 'FG-VALVE-12', name: 'High-Pressure Pneumatic Valve', cat: 'Finished Good', stock: '620 Units', status: 'Optimal', cost: '$185.00' },
  ];

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h3 className="text-xl font-bold font-display text-slate-100">Inventory & Warehouse Stock</h3>
          <p className="text-xs text-slate-400">Real-time stock level monitoring across warehouses</p>
        </div>
        <button className="bg-sky-600 hover:bg-sky-500 text-white text-xs font-semibold px-4 py-2 rounded-lg flex items-center gap-2 transition-all shadow-lg shadow-sky-600/20">
          <ArrowUpRight className="w-4 h-4" />
          <span>Log Stock Movement</span>
        </button>
      </div>

      <div className="bg-slate-900 border border-slate-800 rounded-xl overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="border-b border-slate-800 bg-slate-950/50 text-[11px] font-bold text-slate-400 uppercase tracking-wider">
                <th className="p-4">SKU Code</th>
                <th className="p-4">Item Name</th>
                <th className="p-4">Category</th>
                <th className="p-4">Current Stock</th>
                <th className="p-4">Unit Cost</th>
                <th className="p-4 text-right">Status</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-800 text-xs">
              {stockItems.map((item, i) => (
                <tr key={i} className="hover:bg-slate-800/40 transition-colors">
                  <td className="p-4 font-mono font-bold text-sky-400">{item.sku}</td>
                  <td className="p-4 font-semibold text-slate-200">{item.name}</td>
                  <td className="p-4 text-slate-400">{item.cat}</td>
                  <td className="p-4 font-bold text-slate-100">{item.stock}</td>
                  <td className="p-4 text-slate-300">{item.cost}</td>
                  <td className="p-4 text-right">
                    <span className={`inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-[11px] font-semibold border ${
                      item.status === 'Low Stock' ? 'bg-amber-500/10 text-amber-400 border-amber-500/30' : 'bg-emerald-500/10 text-emerald-400 border-emerald-500/30'
                    }`}>
                      {item.status === 'Low Stock' && <AlertTriangle className="w-3 h-3" />}
                      {item.status}
                    </span>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};
