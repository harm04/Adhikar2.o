import 'package:flutter/material.dart';

class MeetingCard extends StatelessWidget {
  final String lawyerName;
  final String time;
  final String date;
  final String status;
  final String profImage;

  const MeetingCard(
      {super.key,
      required this.lawyerName,
      required this.time,
      required this.date,
      required this.status,
      required this.profImage});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 90,
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              //
              child: Image.network(
                profImage,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lawyerName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/ic_clock.png',
                          height: 15,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          '$date at $time',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          'Amount paid : ',
                          style: TextStyle(color: Colors.black87),
                        ),
                        Text(
                          '2409.78/-',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Status : ',
                          style: TextStyle(color: Colors.black87),
                        ),
                        Text(
                          status,
                          style: TextStyle(
                              color: status == 'pending'
                                  ? Colors.red
                                  : Colors.green),
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
    );
  }
}
