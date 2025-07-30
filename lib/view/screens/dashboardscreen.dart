import 'package:flutter/material.dart';

class Dashboardscreen extends StatelessWidget {
  const Dashboardscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: const Color.fromARGB(195, 4, 24, 36),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        children: [
          Container(
            height: 50,
            decoration: const BoxDecoration(
              color: Color.fromARGB(230, 13, 10, 217),
              borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
            ),
            child: const Center(
              child: Icon(Icons.star, color: Colors.white),
            ),
          ),

          const SizedBox(height: 24),

          // Navigation Items
          const DashboardNavItem(
            icon: Icons.dashboard_customize_outlined,
            label: "Dashboard",
          ),
          const DashboardNavItem(
            icon: Icons.receipt_long_outlined,
            label: "Billing",
          ),
          const DashboardNavItem(
            icon: Icons.subscriptions_outlined,
            label: "Subscription",
          ),
          const DashboardNavItem(
            icon: Icons.bar_chart,
            label: "Sales",
          ),
          const DashboardNavItem(
            icon: Icons.settings_outlined,
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

class DashboardNavItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const DashboardNavItem({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
