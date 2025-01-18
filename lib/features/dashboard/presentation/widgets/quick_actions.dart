import 'package:flutter/material.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _ActionButton(
          icon: Icons.add_shopping_cart,
          label: 'Add Inventory',
          onTap: () {
            // Navigate to Add Inventory
          },
        ),
        _ActionButton(
          icon: Icons.receipt_long,
          label: 'Create Invoice',
          onTap: () {
            // Navigate to Create Invoice
          },
        ),
        _ActionButton(
          icon: Icons.group_add,
          label: 'Add Customer',
          onTap: () {
            // Navigate to Add Customer
          },
        ),
        _ActionButton(
          icon: Icons.analytics,
          label: 'View Reports',
          onTap: () {
            // Navigate to Reports
          },
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blueAccent,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
