import 'package:adhikar2_o/models/userModel.dart';
import 'package:adhikar2_o/provider/userProvider.dart';
import 'package:adhikar2_o/screens/verfificationPendingScreen.dart';
import 'package:adhikar2_o/services/applyForlawyerService.dart';
import 'package:adhikar2_o/services/imagePckerServices.dart';
import 'package:adhikar2_o/utils/colors.dart';
import 'package:adhikar2_o/utils/snackbar.dart';
import 'package:adhikar2_o/widgets/customButton.dart';
import 'package:adhikar2_o/widgets/customTextfield.dart';
import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ApplyForLawyerScreen extends StatefulWidget {
  const ApplyForLawyerScreen({super.key});

  @override
  State<ApplyForLawyerScreen> createState() => _ApplyForLawyerScreenState();
}

class _ApplyForLawyerScreenState extends State<ApplyForLawyerScreen> {
  TextEditingController statecontroller = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController casesWonController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    statecontroller.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    dobController.dispose();
    address1Controller.dispose();
    address2Controller.dispose();
    cityController.dispose();
    casesWonController.dispose();
    experienceController.dispose();
    descriptionController.dispose();
  }

  PlatformFile? proofFile;
  PlatformFile? idFile;
  Uint8List? profImage;
  bool isloading = false;
  Future selectFileForProof() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        proofFile = result.files.first;
      });
      print(proofFile!.name);
    } else {
      showSnackbar(context, 'File not selected');
    }
  }

  Future selectFileForId() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        idFile = result.files.first;
      });
      print(idFile!.name);
    } else {
      showSnackbar(context, 'File not selected');
    }
  }

  void selectProfImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      profImage = im;
    });
  }

  @override
  Widget build(BuildContext context) {
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
    UserModel userModel = Provider.of<UserProvider>(context).getUser;
    emailController.text = userModel.email;
  firstNameController.text=userModel.firstName;
  lastNameController.text=userModel.lastName;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: primaryColor,
            statusBarIconBrightness: Brightness.light),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Apply for Adhikar Lawyer',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          profImage != null
                              ? CircleAvatar(
                                  radius: 70,
                                  backgroundColor: Colors.black,
                                  child: CircleAvatar(
                                      radius: 66,
                                      backgroundColor: Colors.white,
                                      backgroundImage: MemoryImage(profImage!)),
                                )
                              : const CircleAvatar(
                                  radius: 70,
                                  backgroundColor: Colors.black,
                                  child: const CircleAvatar(
                                    radius: 66,
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(
                                      'https://image.cdn2.seaart.me/2024-09-16/crjon2de878c739kmukg-2/363d4f7dce80aad62b4b1cdc12bb1ec6_high.webp',
                                    ),
                                  ),
                                ),
                          Positioned(
                              bottom: -0,
                              right: 10,
                              child: GestureDetector(
                                onTap: () {
                                  selectProfImage();
                                },
                                child: const CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Colors.black,
                                  child: const CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.edit,
                                        size: 20,
                                        color: Colors.grey,
                                      )),
                                ),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text('First name'),
                    CustomTextField(
                        controller: firstNameController,
                        hinttext: 'Jhon Doe',
                        keyboardType: TextInputType.text),
                    const SizedBox(
                      height: 10,
                    ),
                      const Text('Last name'),
                    CustomTextField(
                        controller: lastNameController,
                        hinttext: 'Jhon Doe',
                        keyboardType: TextInputType.text),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Email'),
                    CustomTextField(
                        controller: emailController,
                        hinttext: 'adhikar@gmail.com',
                        keyboardType: TextInputType.text),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Phone'),
                    CustomTextField(
                        controller: phoneController,
                        hinttext: '9999999999',
                        keyboardType: TextInputType.number),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Date of birth'),
                    CustomTextField(
                        controller: dobController,
                        hinttext: '04/03/2004',
                        keyboardType: TextInputType.datetime),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Address line 1'),
                    CustomTextField(
                        controller: address1Controller,
                        hinttext: 'Flat no / Building',
                        keyboardType: TextInputType.text),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Address line 2'),
                    CustomTextField(
                        controller: address2Controller,
                        hinttext: 'Area / Street',
                        keyboardType: TextInputType.text),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Address line 3'),
                    CustomTextField(
                        controller: cityController,
                        hinttext: 'City',
                        keyboardType: TextInputType.text),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Choose your State'),
                    Row(
                      children: [
                        Expanded(
                          child: DropDownField(
                            enabled: true,
                            textStyle: const TextStyle(
                                color: Colors.black, fontSize: 16),
                            controller: statecontroller,
                            hintText: 'Select your State',
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 14),
                            items: states,
                            itemsVisibleInDropdown: 5,
                            onValueChanged: (value) {
                              setState(() {
                                statecontroller.text = value!;
                              });
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: Text(
                            "*",
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Upload proof of beign Lawyer'),
                    GestureDetector(
                      onTap: () {
                        selectFileForProof();
                      },
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(
                              255,
                              240,
                              239,
                              239,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: proofFile != null
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/ic_pdf.png',
                                        height: 20,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        proofFile!.name,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  )
                                : const Text(
                                    'Upload',
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Upload identity proof'),
                    GestureDetector(
                      onTap: () {
                        selectFileForId();
                      },
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(
                              255,
                              240,
                              239,
                              239,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: idFile != null
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/ic_pdf.png',
                                        height: 20,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        idFile!.name,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  )
                                : const Text(
                                    'Upload',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Cases won'),
                    CustomTextField(
                        controller: casesWonController,
                        hinttext: 'Cases won',
                        keyboardType: TextInputType.number),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Experience (in years)'),
                    CustomTextField(
                        controller: experienceController,
                        hinttext: '10+',
                        keyboardType: TextInputType.number),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Add description about yourself'),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(
                            255,
                            240,
                            239,
                            239,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: descriptionController,
                        maxLength: 1000,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            suffixText: '*',
                            suffixStyle: const TextStyle(
                                color: Colors.red, letterSpacing: 10),
                            hintText: 'Describe yourself within 1000 letters',
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 14),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                        onTap: () async {
                          setState(() {
                            isloading = true;
                          });
                          if (emailController.text.isNotEmpty &&
                              firstNameController.text.isNotEmpty &&
                              lastNameController.text.isNotEmpty&&
                              phoneController.text.isNotEmpty &&
                              dobController.text.isNotEmpty &&
                              statecontroller.text.isNotEmpty &&
                              cityController.text.isNotEmpty &&
                              address1Controller.text.isNotEmpty &&
                              address2Controller.text.isNotEmpty &&
                              casesWonController.text.isNotEmpty &&
                              experienceController.text.isNotEmpty &&
                              descriptionController.text.isNotEmpty &&
                              profImage != null &&
                              idFile != null &&
                              proofFile != null) {
                            String res = await ApplyForLawyerService()
                                .submitForVerification(
                                    email: emailController.text,
                                    password: userModel.password,
                                    firstName: firstNameController.text,
                                    lastName:lastNameController.text,
                                    phone: phoneController.text,
                                    uid: userModel.uid,
                                    credits: userModel.credits,
                                    meetings: [],
                                    transactions: [],
                                    dob: dobController.text,
                                    state: statecontroller.text,
                                    city: cityController.text,
                                    address1: address1Controller.text,
                                    address2: address2Controller.text,
                                    proofDoc: proofFile!,
                                    idDoc: idFile!,
                                    casesWon: casesWonController.text,
                                    experience: experienceController.text,
                                    description: descriptionController.text,
                                    approved: 'pending',
                                    profImage: profImage!);

                                    
                            if (res == 'success') {
                              setState(() {
                                isloading = false;
                              });
                              Navigator.pop(context);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return VerificatoinPendingScreen();
                              }));
                            } else {
                              setState(() {
                                isloading = false;
                              });
                              showSnackbar(context, res);
                            }
                          } else {
                            setState(() {
                              isloading = false;
                            });
                            showSnackbar(context, 'Please fill all the fields');
                          }
                        },
                        child: const CustomButton(
                            text: 'Submit for verification')),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
