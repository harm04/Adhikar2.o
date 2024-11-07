import 'package:adhikar2_o/utils/colors.dart';
import 'package:adhikar2_o/widgets/formsCard.dart';
import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormsScreen extends StatefulWidget {
  const FormsScreen({super.key});

  @override
  State<FormsScreen> createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsScreen> {
  TextEditingController statecontroller = TextEditingController();
  List colors = [
    const Color.fromRGBO(93, 161, 204, 200),
    const Color.fromARGB(56, 241, 193, 130),
  ];
  String selectedState = "";
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

  @override
  void dispose() {
    super.dispose();

    statecontroller.dispose();
  }

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
          'Forms',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
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
                  hintText: 'Select your Role',
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
            Expanded(
              child: ListView(
                children: [
                  FormsCard(
                    color: colors[0],
                    text: 'Police Chargesheet',
                  ),
                  FormsCard(
                    color: colors[1],
                    text: 'HR forms',
                  ),
                  FormsCard(
                    color: colors[0],
                    text: 'Family Courts Act, 1984',
                  ),
                  FormsCard(
                    color: colors[1],
                    text: 'Acts and Rules (General)',
                  ),
                  FormsCard(
                    color: colors[0],
                    text: 'Salaries - Services Conditions',
                  ),
                  FormsCard(
                    color: colors[1],
                    text: 'Family Courts Act, 1984',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
