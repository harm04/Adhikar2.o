
import 'package:adhikar2_o/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool? lawsChecked = false;
  bool? judgementsChecked = false;
  bool? actsChecked = false;
  bool? sectionsChecked = false;
  bool? chapterChecked = false;
  bool? rulesChecked = false;
  bool? detailsChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: primaryColor,
            statusBarIconBrightness: Brightness.light),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Filters',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text(
                      'Department',
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    color: Colors.black,
                    thickness: 1,
                  ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CheckboxListTile(
                  value: lawsChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      lawsChecked = newValue;
                    });
                  },
                  activeColor: primaryColor,
                  checkColor: Colors.white,
                  title: const Text(
                    'Laws',
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CheckboxListTile(
                  value: judgementsChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      judgementsChecked = newValue;
                    });
                  },
                  activeColor: primaryColor,
                  checkColor: Colors.white,
                  title: const Text('Judgements'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CheckboxListTile(
                  value: actsChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      actsChecked = newValue;
                    });
                  },
                  activeColor: primaryColor,
                  checkColor: Colors.white,
                  title: const Text('Acts'),
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text(
                      'Types',
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    color: Colors.black,
                    thickness: 1,
                  ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CheckboxListTile(
                  value: lawsChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      lawsChecked = newValue;
                    });
                  },
                  activeColor: primaryColor,
                  checkColor: Colors.white,
                  title: const Text(
                    'Laws',
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CheckboxListTile(
                  value: judgementsChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      judgementsChecked = newValue;
                    });
                  },
                  activeColor: primaryColor,
                  checkColor: Colors.white,
                  title: const Text('Judgements'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CheckboxListTile(
                  value: actsChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      actsChecked = newValue;
                    });
                  },
                  activeColor: primaryColor,
                  checkColor: Colors.white,
                  title: const Text('Acts'),
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text(
                      'Languages',
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    color: Colors.black,
                    thickness: 1,
                  ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CheckboxListTile(
                  value: lawsChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      lawsChecked = newValue;
                    });
                  },
                  activeColor: primaryColor,
                  checkColor: Colors.white,
                  title: const Text(
                    'Laws',
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CheckboxListTile(
                  value: judgementsChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      judgementsChecked = newValue;
                    });
                  },
                  activeColor: primaryColor,
                  checkColor: Colors.white,
                  title: const Text('Judgements'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CheckboxListTile(
                  value: actsChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      actsChecked = newValue;
                    });
                  },
                  activeColor: primaryColor,
                  checkColor: Colors.white,
                  title: const Text('Acts'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
