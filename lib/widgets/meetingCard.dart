import 'package:adhikar2_o/utils/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MeetingCard extends StatefulWidget {
  final String lawyerName;
  final String clientName;
  final String time;
  final String date;
  final String status;
  final String profImage;
  final String amountPaid;
  final bool isLawyer;

  const MeetingCard({
    super.key,
    required this.lawyerName,
    required this.time,
    required this.date,
    required this.status,
    required this.profImage,
    required this.amountPaid,
    required this.isLawyer,
    required this.clientName,
  });

  @override
  State<MeetingCard> createState() => _MeetingCardState();
}

class _MeetingCardState extends State<MeetingCard> {
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
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(15)),
              child: CachedNetworkImage(
                imageUrl: widget.profImage,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGkAznCVTAALTD1o2mAnGLudN9r-bY6klRFB35J2hY7gvR9vDO3bPY_6gaOrfV0IHEIUo&usqp=CAU',
                    fit: BoxFit.cover),
                height: 70,
                width: 70,
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
                    widget.isLawyer?widget.clientName:  widget.lawyerName,
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
                          '${widget.date} at ${widget.time}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Amount paid: ',
                          style: TextStyle(color: Colors.black87),
                        ),
                        Text(
                          '${widget.amountPaid}/-',
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Status: ',
                          style: TextStyle(color: Colors.black87),
                        ),
                        Text(
                          widget.status,
                          style: TextStyle(
                              color: widget.status.toLowerCase() == 'pending'
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
