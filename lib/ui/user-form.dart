import 'package:flutter/material.dart';
import 'package:innerve_hackathon/components/snack.dart';

import '../constants.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  TextEditingController dobController = TextEditingController();
  TextEditingController name1 = TextEditingController();
  TextEditingController name2 = TextEditingController();
  TextEditingController name3 = TextEditingController();
  TextEditingController name4 = TextEditingController();
  TextEditingController phone1 = TextEditingController();
  TextEditingController phone2 = TextEditingController();
  TextEditingController phone3 = TextEditingController();
  TextEditingController phone4 = TextEditingController();

  DateTime selectedDate = DateTime.now();
  String statusValue = 'Status';
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      lastDate: DateTime(2050),
      firstDate: DateTime(1950),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dobController.text = '${picked.day}-${picked.month}-${picked.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: Text(
                'Please provide your basic details',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
              child: TextField(
                minLines: 5,
                maxLines: 5,
                style: const TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Address',
                  hintStyle: kTextFieldHintTextStyle,
                  errorBorder: kOutlineInputBorder,
                  focusedBorder: kOutlineInputBorder,
                  border: kOutlineInputBorder,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: GestureDetector(
                onTap: () => _selectDate(context),
                child: TextField(
                  controller: dobController,
                  enabled: false,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Date of Birth',
                    hintStyle: kTextFieldHintTextStyle,
                    border: kOutlineInputBorder,
                    disabledBorder: kOutlineInputBorder,
                    focusedBorder: kOutlineInputBorder,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 5,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(10),
                    value: statusValue,
                    items: const [
                      DropdownMenuItem(
                        enabled: false,
                        value: 'Status',
                        child: Text('Status'),
                      ),
                      DropdownMenuItem(
                        value: 'Kid',
                        child: Text('Kid'),
                      ),
                      DropdownMenuItem(
                        value: 'Adult',
                        child: Text('Adult'),
                      ),
                      DropdownMenuItem(
                        value: 'Senior Citizen',
                        child: Text('Senior Citizen'),
                      ),
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        if (value != null) {
                          statusValue = value;
                        }
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'Enter emergency contact details',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: name1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Name #1',
                        hintStyle: kTextFieldHintTextStyle,
                        errorBorder: kOutlineInputBorder,
                        focusedBorder: kOutlineInputBorder,
                        border: kOutlineInputBorder,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: phone1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Phone #1',
                        hintStyle: kTextFieldHintTextStyle,
                        errorBorder: kOutlineInputBorder,
                        focusedBorder: kOutlineInputBorder,
                        border: kOutlineInputBorder,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: name2,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Name #2',
                        hintStyle: kTextFieldHintTextStyle,
                        errorBorder: kOutlineInputBorder,
                        focusedBorder: kOutlineInputBorder,
                        border: kOutlineInputBorder,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: phone2,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Phone #2',
                        hintStyle: kTextFieldHintTextStyle,
                        errorBorder: kOutlineInputBorder,
                        focusedBorder: kOutlineInputBorder,
                        border: kOutlineInputBorder,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: name3,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Name #3',
                        hintStyle: kTextFieldHintTextStyle,
                        errorBorder: kOutlineInputBorder,
                        focusedBorder: kOutlineInputBorder,
                        border: kOutlineInputBorder,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: phone3,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Phone #3',
                        hintStyle: kTextFieldHintTextStyle,
                        errorBorder: kOutlineInputBorder,
                        focusedBorder: kOutlineInputBorder,
                        border: kOutlineInputBorder,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: name4,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Name #4',
                        hintStyle: kTextFieldHintTextStyle,
                        errorBorder: kOutlineInputBorder,
                        focusedBorder: kOutlineInputBorder,
                        border: kOutlineInputBorder,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: phone4,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Phone #4',
                        hintStyle: kTextFieldHintTextStyle,
                        errorBorder: kOutlineInputBorder,
                        focusedBorder: kOutlineInputBorder,
                        border: kOutlineInputBorder,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: MaterialButton(
                height: 50,
                onPressed: () {
                  String name11 = name1.value.text;
                  String name12 = name2.value.text;
                  String name13 = name3.value.text;
                  String name14 = name4.value.text;
                  String phone11 = phone1.value.text;
                  String phone12 = phone2.value.text;
                  String phone13 = phone3.value.text;
                  String phone14 = phone4.value.text;

                  if (name11 == '' ||
                      name12 == '' ||
                      name13 == '' ||
                      name14 == '' ||
                      phone11 == '' ||
                      phone12 == '' ||
                      phone13 == '' ||
                      phone14 == '') {
                    Snack.show(context, 'Please complete the form');
                  } else {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/home-user', (route) => false,
                        arguments: {
                          'name1': name11,
                          'name2': name12,
                          'name3': name13,
                          'name4': name14,
                          'phone1': phone11,
                          'phone2': phone12,
                          'phone3': phone13,
                          'phone4': phone14,
                        });
                  }
                },
                color: Colors.teal,
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
