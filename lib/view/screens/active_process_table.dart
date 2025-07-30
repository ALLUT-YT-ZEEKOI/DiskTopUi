import 'package:flutter/material.dart';
import 'package:disktopapp/reusable.dart';

class ActiveProcessTable extends StatefulWidget {
  const ActiveProcessTable({super.key});

  @override
  State<ActiveProcessTable> createState() => _ActiveProcessTableState();
}

class _ActiveProcessTableState extends State<ActiveProcessTable> {
  final List<Map<String, String>> processList = [
    {'id': '31', 'client': 'ANAMALLAIS AGENCIES STADIUM', 'date': '04 Jul 2025', 'days': '7'},
    {'id': '32', 'client': 'GREEN BUILDERS PVT LTD', 'date': '15 Jul 2025', 'days': '4'},
    {'id': '33', 'client': 'TITAN PROJECTS INDIA', 'date': '20 Jul 2025', 'days': '12'},
  ];

  late List<bool> _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = List.generate(processList.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    final customWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(12),
      width: customWidth * .5 + 45,
      decoration: BoxDecoration(
        color: const Color.fromARGB(195, 4, 24, 36),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("SALES DATA", style: TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.w700)),
              Text('Total 9 process', style: dastboardText),
            ],
          ),
          const SizedBox(height: 10),

          // Header Row
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: const Color.fromARGB(230, 13, 10, 217),
            child: const Row(
              children: [
                SizedBox(width: 40), // For checkbox
                Expanded(flex: 1, child: Text("Process ID", style: dastboardText)),
                Expanded(flex: 2, child: Text("Client", style: dastboardText)),
                Expanded(flex: 1, child: Text("Date", style: dastboardText)),
                SizedBox(width: 80, child: Text("Days", style: dastboardText)),
                SizedBox(width: 40),
              ],
            ),
          ),

          const SizedBox(height: 5),

          // Dynamic Rows
          ...List.generate(processList.length, (index) {
            final item = processList[index];
            return Column(
              children: [
                Container(
                  color: const Color.fromARGB(195, 5, 53, 82),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Checkbox(value: false, onChanged: (_) {}),
                      Expanded(flex: 1, child: Text(item['id']!, style: dastboardText)),
                      Expanded(flex: 2, child: Text(item['client']!, style: dastboardText)),
                      Expanded(flex: 1, child: Text(item['date']!, style: dastboardText)),
                      SizedBox(width: 80, child: Text(item['days']!, style: dastboardText)),
                      SizedBox(
                        width: 40,
                        child: IconButton(
                          icon: Icon(
                            _isExpanded[index] ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _isExpanded[index] = !_isExpanded[index];
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),

                // Dropdown Panel
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(100, 255, 255, 255),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.question_mark_outlined, color: Colors.white, size: 16),
                                SizedBox(width: 5),
                                Text("Client requirement", style: dastboardText),
                              ],
                            ),
                            Text("Enter Feedback", style: dastboardText),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Here you can show feedback text field or extra client details...",
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  crossFadeState: _isExpanded[index] ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                )
              ],
            );
          }),
        ],
      ),
    );
  }
}
