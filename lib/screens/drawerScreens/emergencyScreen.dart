
import 'package:adhikar2_o/utils/colors.dart';
import 'package:adhikar2_o/widgets/emergencyCard.dart';
import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({super.key});

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  TextEditingController statecontroller = TextEditingController();

  TextEditingController citycontroller = TextEditingController();

  String selectedState = "";
  String selectedCity = "";
  final List<String> states = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra and Nagar Haveli and Daman and Diu",
    "Lakshadweep",
    "Delhi (National Capital Territory)",
    "Puducherry",
    "Ladakh",
    "Jammu and Kashmir",
  ];
  final List<String> city = ["Dahanu", "Boisar", "Palghar"];

  @override
  void dispose() {
    super.dispose();
    statecontroller.dispose();
    citycontroller.dispose();
  }

  List colors = [
    const Color.fromRGBO(93, 161, 204, 200),
    const Color.fromARGB(56, 241, 193, 130),
  ];

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
          'Emergency',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIcon: Image.asset(
                      'assets/icons/ic_search.png',
                      height: 20,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: primaryColor)),
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                  style: const TextStyle(
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'State',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: primaryColor)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: DropDownField(
                      enabled: true,
                      textStyle: const TextStyle(color: Colors.black, fontSize: 16),
                      controller: statecontroller,
                      hintText: 'Select your State',
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                      items: states,
                      itemsVisibleInDropdown: 5,
                      onValueChanged: (value) {
                        setState(() {
                          statecontroller.text = value;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'City',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: primaryColor)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: DropDownField(
                      enabled: true,
                      textStyle: const TextStyle(color: Colors.black, fontSize: 16),
                      controller: citycontroller,
                      hintText: 'Select your City',
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                      items: city,
                      itemsVisibleInDropdown: 3,
                      onValueChanged: (value) {
                        setState(() {
                          citycontroller.text = value;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      EmergencyCard(
                        color: colors[0],
                        number: '+91 90000 70060, +91 90080 36060',
                        text: 'SMC',
                      ),
                      EmergencyCard(
                        color: colors[1],
                        number: '2463939-40',
                        text: 'Police Commissioner',
                      ),
                      EmergencyCard(
                        color: colors[0],
                        number: '+91 90080 36060',
                        text: 'Doctor',
                      ),
                      EmergencyCard(
                        color: colors[1],
                        number: '2478680',
                        text: 'Ladies Police Station',
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
