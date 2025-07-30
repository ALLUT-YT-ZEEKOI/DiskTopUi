import 'package:disktopapp/reusable.dart';
import 'package:disktopapp/view/screens/active_process_table.dart';
import 'package:flutter/material.dart';

class SalesDataScreen extends StatelessWidget {
  const SalesDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [Icon(Icons.stacked_line_chart_sharp, color: Colors.white, size: 15), SizedBox(width: 5), Text("Sales", style: dastboardText)],
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              padding: const EdgeInsets.all(12),
              width: customWidth * 0.3,
              decoration: BoxDecoration(
                color: const Color.fromARGB(195, 4, 24, 36),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("SALES DATA", style: TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.w700)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color.fromARGB(137, 255, 255, 255)),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: const Text('Monthly View', style: TextStyle(color: Colors.white, fontSize: 10)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Data Columns
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      3,
                      (index) => Column(
                        children: [
                          const Text("TOTAL", style: salesDatafont_1),
                          const SizedBox(height: 8),
                          const Text("₹ 24.3K", style: salesDatafont_2),
                          const SizedBox(height: 5),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: const Text("Invoice", style: salesDatafont_3),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 40),
            Container(
              height: 150,
              width: customWidth * 0.20,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
              decoration: BoxDecoration(
                color: const Color.fromARGB(195, 4, 24, 36),
                borderRadius: BorderRadius.circular(13),
              ),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomerProcessItem(iconPath: 'assets/customer_process_icon.png', label: 'Customer Process'),
                      CustomerProcessItem(iconPath: 'assets/customer_process_icon.png', label: 'Enquiry Process'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomerProcessItem(iconPath: 'assets/customer_process_icon.png', label: 'Archive List'),
                      CustomerProcessItem(iconPath: 'assets/option.png', label: 'Options'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        const ActiveProcessTable()
      ],
    );
  }
}

class CustomerProcessItem extends StatelessWidget {
  final String iconPath;
  final String label;

  const CustomerProcessItem({
    super.key,
    required this.iconPath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(iconPath, width: 30),
        const SizedBox(height: 5),
        Text(label, style: dastboardText, textAlign: TextAlign.center),
      ],
    );
  }
}
