import 'package:disktopapp/view/screens/active_customer_list.dart';
import 'package:disktopapp/view/screens/dashboardscreen.dart';
import 'package:disktopapp/view/screens/sales_data_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(195, 6, 42, 65),
      body: Container(
        padding: const EdgeInsets.all(13),
        child: const Row(
          children: [
            Dashboardscreen(),
            // sales section
            Spacer(),
            // Sales section
            SalesDataScreen(),
            // Active customer List
            Spacer(),
            ActiveCustomerList()
          ],
        ),
      ),
    );
  }
}
