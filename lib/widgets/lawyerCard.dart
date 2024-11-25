import 'package:adhikar2_o/utils/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LawyerCard extends StatelessWidget {
  final String profilePic;
  final String lawyerName;
  final String location;
  final String ratings;
  final String caseWon;
  final String fees;
  final String experience;

  const LawyerCard(
      {super.key,
      required this.profilePic,
      required this.lawyerName,
      required this.location,
      required this.ratings,
      required this.caseWon,
      required this.fees,
      required this.experience});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Row(
          children: [
            // Container(
              // width: 90,
              // height: 90,
            //   clipBehavior: Clip.antiAlias,
            //   decoration:
            //       BoxDecoration(borderRadius: BorderRadius.circular(15)),
            //   //
            //   child: Image.network(
            //     profilePic,
            //     fit: BoxFit.cover,
            //   ),
            // ),

            Container(
              width: 90,
              height: 90,
              decoration:  BoxDecoration(color: primaryColor,borderRadius: BorderRadius.circular(15)),
              child: CachedNetworkImage(
                
                imageUrl: profilePic,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              lawyerName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '($experience)',
                              style: const TextStyle(color: Colors.black87),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Text('4.0'),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              'assets/icons/ic_star.png',
                              height: 18,
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/ic_location.png',
                          height: 15,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          location,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Cases won : ',
                          style: TextStyle(color: Colors.black87),
                        ),
                        Text(
                          caseWon,
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Fees : ',
                          style: TextStyle(color: Colors.black87),
                        ),
                        Text(
                          fees,
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
