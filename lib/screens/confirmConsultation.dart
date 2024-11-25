import 'package:adhikar2_o/models/userModel.dart';
import 'package:adhikar2_o/provider/userProvider.dart';
import 'package:adhikar2_o/screens/myMeetings.dart';
import 'package:adhikar2_o/utils/colors.dart';
import 'package:adhikar2_o/widgets/customButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ConfirmConsultation extends StatefulWidget {
  final String date;
  final String time;
  final String profImage;
  final String amount;
  final String uid;
  final String firstName;
  final String lastName;

  const ConfirmConsultation(
      {super.key,
      required this.date,
      required this.time,
      required this.amount,
      required this.uid,
      required this.firstName,
      required this.lastName,
      required this.profImage});

  @override
  State<ConfirmConsultation> createState() => _ConfirmConsultationState();
}

class _ConfirmConsultationState extends State<ConfirmConsultation> {
  late Razorpay _razorpay;

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const MyMeetingsScreen();
    }));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout(String totalAmount, String username, String description,
      String contact, String email) async {
    var options = {
      'key': 'rzp_test_rLY2CNgq2Qdge0',
      'amount': totalAmount,
      'name': username,
      'description': description,
      'prefill': {'contact': contact, 'email': email}
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double amount = double.parse(widget.amount);
    double totalAmount = amount * 0.21 + amount;
    double razorpayAmount = totalAmount * 100;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: primaryColor,
            statusBarIconBrightness: Brightness.light),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Confirm Payemnt',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 243, 242, 242),
                  borderRadius: BorderRadius.circular(20)),
              height: 270,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Online Consultation",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Date',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.date,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 18),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Time',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.time,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 18),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Amount',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${widget.amount} Rs',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 18),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'GST',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '21%',
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${totalAmount.toString()} Rs',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 18),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
                'Note :- Money will be deducted once you click on the Proceed to pay button.'),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: GestureDetector(
                onTap: () async {
                  UserModel userModel =
                      Provider.of<UserProvider>(context, listen: false).getUser;
                  // LawyerModel lawyerModel =
                  //     Provider.of<LawyerProvider>(context, listen: false)
                  //         .getLawyer;

                  //if we want all meetings to be visible in my meetings section then just change meetinguid to a random uid
                  String meetingUid =
                      '${userModel.uid.substring(userModel.uid.length - 5)}${widget.uid.substring(widget.uid.length - 5)}';
                  openCheckout(
                      razorpayAmount.toString(),
                      'Random',
                      'Consultation with lawyer',
                      '9999999999',
                      'har@gmail.com');
                  print('meeting id :$meetingUid');

                  //creating a collection named meetings
                  await FirebaseFirestore.instance
                      .collection('Meetings')
                      .doc(meetingUid)
                      .set({
                    "meetingUid": meetingUid,
                    "lawyerName": '${widget.firstName} ${widget.lastName}',
                    "clientName":
                        '${userModel.firstName} ${userModel.lastName}',
                    "time": widget.time,
                    "date": widget.date,
                    "status": "pending",
                    "profImage": widget.profImage,
                    "ratings": 3,
                    
                  });

                  //adding meeting uid in user collection
                  await FirebaseFirestore.instance
                      .collection('Users')
                      .doc(userModel.uid)
                      .update({
                    "meetings": FieldValue.arrayUnion([meetingUid]),
                  });
                  //adding meeting uid in lawyer collection
                  await FirebaseFirestore.instance
                      .collection('Lawyers')
                      .doc(widget.uid)
                      .update({
                    "meetings": FieldValue.arrayUnion([meetingUid]),
                  });
                },
                child: CustomButton(text: 'Proceed to pay $totalAmount Rs')),
          )
        ],
      ),
    );
  }
}
