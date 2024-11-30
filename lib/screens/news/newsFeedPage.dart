import 'dart:convert';
import 'package:adhikar2_o/utils/colors.dart';
import 'package:adhikar2_o/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:adhikar2_o/widgets/newsCard.dart';
import 'package:flutter/material.dart';

class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({super.key});

  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  // ignore: prefer_typing_uninitialized_variables
  var data;
  // ignore: prefer_typing_uninitialized_variables
  var topdata;
  // ignore: prefer_typing_uninitialized_variables
  var num;

  Future<void> fetchNews() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?pageSize=100&q=indian-law&language=en&sortBy=publishedAt&apiKey=$api'));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: primaryColor,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: primaryColor,
              statusBarIconBrightness: Brightness.light),
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'News',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 7,
                    child: FutureBuilder(
                        future: fetchNews(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          return data.length == 0
                              ? const Center(child: Text('No result found'))
                              : ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: data['articles'].length,
                                  itemBuilder: (context, index) {
                                    return NewsCard(
                                        imageUrl: data['articles'][index]
                                                ['urlToImage'] ??
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGkAznCVTAALTD1o2mAnGLudN9r-bY6klRFB35J2hY7gvR9vDO3bPY_6gaOrfV0IHEIUo&usqp=CAU',
                                        title: data['articles'][index]
                                                ['title'] ??
                                            "",
                                        time: data['articles'][index]
                                                ['publishedAt'] ??
                                            "",
                                        description: data['articles'][index]
                                                ['description'] ??
                                            "",
                                        url: data['articles'][index]['url'] ??
                                            "",
                                        content: data['articles'][index]
                                                ['content'] ??
                                            "");
                                  });
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
