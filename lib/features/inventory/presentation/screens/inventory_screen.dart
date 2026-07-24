import 'package:flutter/material.dart';
import '../../../dashboard/presentation/widgets/dashboard_sidebar.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final items = [
      {
        'sku': 'RM-ALU-001',
        'name': 'High-Grade Aluminium Sheets (3mm)',
        'cat': 'Raw Material',
        'stock': '4,250 SQM',
        'status': 'Optimal',
        'cost': '\$48.50',
      },
      {
        'sku': 'RM-STL-009',
        'name': 'Structural Steel Rods 12mm',
        'cat': 'Raw Material',
        'stock': '850 Tons',
        'status': 'Low Stock',
        'cost': '\$620.00',
      },
      {
        'sku': 'FG-GEAR-88',
        'name': 'Industrial Planetary Gearbox V2',
        'cat': 'Finished Good',
        'stock': '140 Units',
        'status': 'Optimal',
        'cost': '\$1,450.00',
      },
      {
        'sku': 'FG-VALVE-12',
        'name': 'High-Pressure Pneumatic Valve',
        'cat': 'Finished Good',
        'stock': '620 Units',
        'status': 'Optimal',
        'cost': '\$185.00',
      },
    ];

    return Scaffold(
      body: Row(
        children: [
          const DashboardSidebar(currentRoute: '/inventory'),
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
                            'Inventory & Warehouse Stock',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Real-time tracking of raw materials and finished goods',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.north_east, size: 16),
                        label: const Text('Log Stock Movement'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: ListView.separated(
                          itemCount: items.length + 1,
                          separatorBuilder: (context, index) => const Divider(),
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 16,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'SKU CODE',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        'ITEM NAME',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'CATEGORY',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'CURRENT STOCK',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'UNIT COST',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }

                            final item = items[index - 1];
                            final isLow = item['status'] == 'Low Stock';

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 16,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      item['sku']!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      item['name']!,
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      item['cat']!,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      children: [
                                        Text(
                                          item['stock']!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: isLow
                                                ? Colors.orange
                                                : Colors.green,
                                          ),
                                        ),
                                        if (isLow)
                                          const Icon(
                                            Icons.warning_amber_rounded,
                                            size: 14,
                                            color: Colors.orange,
                                          ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      item['cost']!,
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
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
