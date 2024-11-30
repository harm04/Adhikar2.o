import 'package:adhikar2_o/screens/news/newsPage.dart';
import 'package:adhikar2_o/utils/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String imageUrl, title, time, description,url,content;
  const NewsCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.time,
      required this.description, required this.url, required this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return  Newspage(description: description,imageUrl: imageUrl,time: time,title: title,url: url,content: content,);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(color: primaryColor),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      placeholder:(context, url) =>const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url,error) =>Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGkAznCVTAALTD1o2mAnGLudN9r-bY6klRFB35J2hY7gvR9vDO3bPY_6gaOrfV0IHEIUo&usqp=CAU',fit: BoxFit.cover),
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          maxLines: 2,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          time,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
