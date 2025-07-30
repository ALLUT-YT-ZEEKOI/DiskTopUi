import 'package:disktopapp/reusable.dart';

import 'package:flutter/material.dart';

class ActiveCustomerList extends StatelessWidget {
  const ActiveCustomerList({super.key});

  @override
  Widget build(BuildContext context) {
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
              // width: customWidth * .29 + 1,
              decoration: BoxDecoration(
                color: const Color.fromARGB(195, 4, 24, 36),
                borderRadius: BorderRadius.circular(13),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      CenteredProgressBar(progress: 9),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Text("Completed", style: salesText1),
                          Text("Pending", style: salesText1),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  // Data Columns
                ],
              ),
            ),
            const SizedBox(width: 40),
          ],
        ),
        const SizedBox(height: 15),
        const ActiveCustomerLists()
      ],
    );
  }
}

class ActiveCustomerLists extends StatefulWidget {
  const ActiveCustomerLists({super.key});

  @override
  State<ActiveCustomerLists> createState() => _ActiveCustomerListsState();
}

class _ActiveCustomerListsState extends State<ActiveCustomerLists> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(195, 4, 24, 36),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("SALES DATA", style: TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.w700)),
              const SizedBox(height: 10),
              Column(
                children: [
                  for (int i = 0; i < 5; i++)
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(195, 5, 53, 82),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Center(
                              child: Text(
                                "AM",
                                style: dastboardText,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'AKSHARA MOTORS A UNIT OF CAUVERY MOTORS PRIVATE LIMITED',
                            style: salesText1,
                          ),
                          IconButton(onPressed: () {}, icon: const Icon(Icons.question_mark_sharp, size: 15, color: Colors.white)),
                        ],
                      ),
                    ),
                ],
              )
            ],
          ),
        ));
  }
}

class CenteredProgressBar extends StatelessWidget {
  final double progress;

  const CenteredProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 5,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                    backgroundColor: Colors.grey[700],
                    strokeCap: StrokeCap.round,
                  ),
                ),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )));
  }
}
