import React from 'react';
import { Building2, MapPin, Plus, ChevronRight } from 'lucide-react';

export const Factories = () => {
  const facilities = [
    {
      name: 'Apex Manufacturing Facility #1',
      code: 'FAC-APEX-01',
      location: 'Detroit Industrial Corridor, MI',
      plants: '4 Plants',
      depts: '12 Departments',
      status: 'Active',
    },
    {
      name: 'High-Precision Robotics Plant #2',
      code: 'FAC-ROBO-02',
      location: 'Austin High-Tech Zone, TX',
      plants: '2 Plants',
      depts: '8 Departments',
      status: 'Active',
    },
    {
      name: 'Foundry & Heavy Metal Unit',
      code: 'FAC-MET-03',
      location: 'Cleveland Logistics Park, OH',
      plants: '3 Plants',
      depts: '9 Departments',
      status: 'Active',
    },
  ];

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h3 className="text-xl font-bold font-display text-slate-100">Enterprise Facilities</h3>
          <p className="text-xs text-slate-400">Multi-location factory and plant configuration</p>
        </div>
        <button className="bg-sky-600 hover:bg-sky-500 text-white text-xs font-semibold px-4 py-2 rounded-lg flex items-center gap-2 transition-all shadow-lg shadow-sky-600/20">
          <Plus className="w-4 h-4" />
          <span>Add Facility</span>
        </button>
      </div>

      <div className="space-y-4">
        {facilities.map((fac, i) => (
          <div key={i} className="bg-slate-900 border border-slate-800 rounded-xl p-5 hover:border-slate-700 transition-colors flex items-center justify-between gap-4">
            <div className="flex items-center gap-4">
              <div className="p-3 bg-sky-500/10 text-sky-400 rounded-xl border border-sky-500/20">
                <Building2 className="w-6 h-6" />
              </div>
              <div>
                <div className="flex items-center gap-3">
                  <h4 className="font-semibold text-slate-100 text-base">{fac.name}</h4>
                  <span className="text-xs font-mono font-medium px-2 py-0.5 bg-slate-800 text-sky-400 rounded border border-slate-700">{fac.code}</span>
                </div>
                <div className="flex items-center gap-1.5 text-xs text-slate-400 mt-1">
                  <MapPin className="w-3.5 h-3.5" />
                  <span>{fac.location}</span>
                </div>
              </div>
            </div>

            <div className="flex items-center gap-4">
              <span className="text-xs font-medium px-3 py-1 bg-sky-500/10 text-sky-400 rounded-lg border border-sky-500/20">{fac.plants}</span>
              <span className="text-xs font-medium px-3 py-1 bg-purple-500/10 text-purple-400 rounded-lg border border-purple-500/20">{fac.depts}</span>
              <ChevronRight className="w-5 h-5 text-slate-500" />
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};
