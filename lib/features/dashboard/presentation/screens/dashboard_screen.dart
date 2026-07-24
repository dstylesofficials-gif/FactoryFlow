import 'package:flutter/material.dart';
import '../../../../core/widgets/stat_card.dart';
import '../widgets/dashboard_sidebar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Row(
        children: [
          const DashboardSidebar(currentRoute: '/dashboard'),
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
                            'Executive Dashboard',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Real-time overview across all operational plants & inventory',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Chip(
                        avatar: const Icon(
                          Icons.sensors,
                          size: 14,
                          color: Colors.green,
                        ),
                        label: const Text(
                          'Realtime Feed Connected',
                          style: TextStyle(fontSize: 12),
                        ),
                        backgroundColor: Colors.green.withValues(alpha: 0.1),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final crossAxisCount = constraints.maxWidth > 1100
                                ? 4
                                : constraints.maxWidth > 700
                                ? 2
                                : 1;

                            return GridView.count(
                              crossAxisCount: crossAxisCount,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 1.6,
                              children: const [
                                StatCard(
                                  title: 'Overall Plant OEE',
                                  value: '87.4%',
                                  subtitle: 'Target: 85.0%',
                                  trend: '+2.4%',
                                  icon: Icons.speed,
                                  iconColor: Color(0xFF0284C7),
                                ),
                                StatCard(
                                  title: 'Active Work Orders',
                                  value: '42 Orders',
                                  subtitle: '8 On-Time Schedule',
                                  trend: '+5 today',
                                  icon: Icons.assignment_outlined,
                                  iconColor: Color(0xFF10B981),
                                ),
                                StatCard(
                                  title: 'Raw Material Stock Value',
                                  value: '\$1,248,500',
                                  subtitle: '12 Low stock alerts',
                                  trend: '-1.2%',
                                  isPositiveTrend: false,
                                  icon: Icons.inventory_2_outlined,
                                  iconColor: Color(0xFFF59E0B),
                                ),
                                StatCard(
                                  title: 'Quality Pass Rate',
                                  value: '99.1%',
                                  subtitle: '3 Defect reports',
                                  trend: '+0.4%',
                                  icon: Icons.check_circle_outline,
                                  iconColor: Color(0xFF8B5CF6),
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Plant Machinery Status',
                                            style: theme.textTheme.titleLarge
                                                ?.copyWith(fontSize: 16),
                                          ),
                                          const Icon(Icons.memory, size: 18),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      _machineStatusTile(
                                        'CNC Milling Station A1',
                                        'Operational',
                                        '98% efficiency',
                                        Colors.green,
                                      ),
                                      _machineStatusTile(
                                        'Hydraulic Press Unit B',
                                        'Under Maintenance',
                                        'Scheduled calibration',
                                        Colors.orange,
                                      ),
                                      _machineStatusTile(
                                        'Automated Assembly Line C',
                                        'Operational',
                                        '100% efficiency',
                                        Colors.green,
                                      ),
                                      _machineStatusTile(
                                        'Robotic Welding Cell 4',
                                        'Idle',
                                        'Waiting batch queue',
                                        Colors.blue,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              flex: 2,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Recent Audit Logs',
                                            style: theme.textTheme.titleLarge
                                                ?.copyWith(fontSize: 16),
                                          ),
                                          const Icon(Icons.history, size: 18),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      _auditLogItem(
                                        'Stock Dispatched',
                                        '500 Units Aluminium Coils',
                                        '10 mins ago',
                                      ),
                                      _auditLogItem(
                                        'Work Order Completed',
                                        'WO-2026-0099 Steel Frames',
                                        '25 mins ago',
                                      ),
                                      _auditLogItem(
                                        'Maintenance Logged',
                                        'Routine Oil Filter Change (Press B)',
                                        '1 hour ago',
                                      ),
                                      _auditLogItem(
                                        'Quality Audit',
                                        'Inspection Batch #881 Passed',
                                        '2 hours ago',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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

Widget _machineStatusTile(
  String name,
  String status,
  String note,
  Color color,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              Text(
                note,
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            status,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _auditLogItem(String title, String desc, String time) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.check_circle_outline,
          size: 16,
          color: Color(0xFF0284C7),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              Text(
                desc,
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          ),
        ),
        Text(time, style: const TextStyle(fontSize: 10, color: Colors.grey)),
      ],
    ),
  );
}
