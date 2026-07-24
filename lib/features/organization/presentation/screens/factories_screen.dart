import 'package:flutter/material.dart';
import '../../../dashboard/presentation/widgets/dashboard_sidebar.dart';

class FactoriesScreen extends StatelessWidget {
  const FactoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Row(
        children: [
          const DashboardSidebar(currentRoute: '/factories'),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    border: Border(
                      bottom: BorderSide(color: theme.dividerColor),
                    ),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Factories & Processing Plants',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Manage multi-location enterprise facilities and production units',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add, size: 16),
                        label: const Text('Add New Facility'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(24),
                    children: const [
                      _FacilityCard(
                        name: 'Apex Manufacturing Facility #1',
                        code: 'FAC-APEX-01',
                        location: 'Detroit Industrial Corridor, MI',
                        plantsCount: '4 Plants',
                        departmentsCount: '12 Departments',
                        status: 'Active',
                      ),
                      SizedBox(height: 16),
                      _FacilityCard(
                        name: 'High-Precision Robotics Plant #2',
                        code: 'FAC-ROBO-02',
                        location: 'Austin High-Tech Zone, TX',
                        plantsCount: '2 Plants',
                        departmentsCount: '8 Departments',
                        status: 'Active',
                      ),
                      SizedBox(height: 16),
                      _FacilityCard(
                        name: 'Foundry & Heavy Metal Processing Unit',
                        code: 'FAC-MET-03',
                        location: 'Cleveland Logistics Park, OH',
                        plantsCount: '3 Plants',
                        departmentsCount: '9 Departments',
                        status: 'Active',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FacilityCard extends StatelessWidget {
  final String name;
  final String code;
  final String location;
  final String plantsCount;
  final String departmentsCount;
  final String status;

  const _FacilityCard({
    required this.name,
    required this.code,
    required this.location,
    required this.plantsCount,
    required this.departmentsCount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.factory,
                color: theme.colorScheme.primary,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Chip(
                        label: Text(code, style: const TextStyle(fontSize: 10)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        location,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                _statBadge(plantsCount),
                const SizedBox(width: 8),
                _statBadge(departmentsCount),
                const SizedBox(width: 16),
                const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _statBadge(String label) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
      color: Colors.blue.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      label,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.blue,
      ),
    ),
  );
}
