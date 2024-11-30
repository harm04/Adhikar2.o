import 'package:adhikar2_o/screens/auth/loginScreen.dart';
import 'package:adhikar2_o/screens/confirmConsultation/confirmConsultation.dart';
import 'package:adhikar2_o/utils/colors.dart';
import 'package:adhikar2_o/widgets/customButton.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LawyerProfileScreen extends StatefulWidget {
  final String profilePic;
  final String firstName;
  final String lastName;
  final String uid;
  final String location;
  final String ratings;
  final String caseWon;
  final String fees;
  final String profImage;
  final String experience;
  const LawyerProfileScreen(
      {super.key,
      required this.profilePic,
      required this.location,
      required this.ratings,
      required this.caseWon,
      required this.fees,
      required this.experience,
      required this.firstName,
      required this.lastName,
      required this.uid,
      required this.profImage});

  @override
  State<LawyerProfileScreen> createState() => _LawyerProfileScreenState();
}

class _LawyerProfileScreenState extends State<LawyerProfileScreen> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  DateTime _dateTime = DateTime.now();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _showTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) => {
              setState(() {
                _timeOfDay = value!;
              })
            });
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            firstDate:
                DateTime(2024, (DateTime.now().month), (DateTime.now().day)),
            lastDate: DateTime(2025),
            initialDate: DateTime.now())
        .then((value) => {
              setState(() {
                _dateTime = value!;
              })
            });
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.firstName} ${widget.lastName}",
              style: const TextStyle(color: Colors.white),
            ),
            Row(
              children: [
                Image.asset(
                  'assets/icons/ic_location.png',
                  height: 15,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  widget.location,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              children: [
                const Text('4.0',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                const SizedBox(
                  width: 5,
                ),
                Image.asset(
                  'assets/icons/ic_star.png',
                  height: 18,
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: const BoxDecoration(color: primaryColor),
                  child: CachedNetworkImage(
                    imageUrl: widget.profImage,
                    placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(color: primaryColor)),
                    errorWidget: (context, url, error) => Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGkAznCVTAALTD1o2mAnGLudN9r-bY6klRFB35J2hY7gvR9vDO3bPY_6gaOrfV0IHEIUo&usqp=CAU',
                        fit: BoxFit.cover),
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 20,
                    color: primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Cases won',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.caseWon,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Experience',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.experience,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Fees',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.fees,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                child: Wrap(
                  children: [
                    SizedBox(
                      height: 40,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5),
                          child: Text('Criminal'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5),
                          child: Text('Civil'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5),
                          child: Text('Finance'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5),
                          child: Text('Tax'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5),
                          child: Text('Property'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5),
                          child: Text('Commercial'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5),
                          child: Text('Divorce'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5),
                          child: Text('Family'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  'About ${widget.firstName} ${widget.lastName}',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 6),
                child: Text(
                    maxLines: 20,
                    overflow: TextOverflow.ellipsis,
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  'Select Date and time for Meeting',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showDatePicker();
                      },
                      child: Container(
                        height: 70,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: primaryColor),
                        child: Center(
                            child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Date',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${_dateTime.day.toString()}/${_dateTime.month.toString()}/${_dateTime.year.toString()}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _showTimePicker();
                      },
                      child: Container(
                        height: 70,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: primaryColor),
                        child: Center(
                            child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Time',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              _timeOfDay.format(context).toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return _auth.currentUser == null
                            ? const LoginScreen()
                            : ConfirmConsultation(
                                profImage: widget.profImage,
                                firstName: widget.firstName,
                                lastName: widget.lastName,
                                uid: widget.uid,
                                amount: widget.fees,
                                date:
                                    '${_dateTime.day.toString()}/${_dateTime.month.toString()}/${_dateTime.year.toString()}',
                                time: _timeOfDay.format(context).toString(),
                              );
                      }));
                    },
                    child: CustomButton(
                        text: _auth.currentUser == null
                            ? 'Login to book consultation'
                            : 'Book Consultation')),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
