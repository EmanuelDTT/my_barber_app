import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String location;
  final String address;
  final IconData icon;
  final VoidCallback? onReserve;

  const ServiceCard({
    super.key,
    required this.title,
    required this.location,
    required this.address,
    required this.icon,
    this.onReserve,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(location, style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(address),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: onReserve,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Reservar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
