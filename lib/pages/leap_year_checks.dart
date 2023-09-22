import 'package:flutter/material.dart';

class LeapYearChecks extends StatefulWidget {
  const LeapYearChecks({Key? key}) : super(key: key);

  @override
  State<LeapYearChecks> createState() => _LeapYearChecksState();
}

class _LeapYearChecksState extends State<LeapYearChecks> {
  TextEditingController controller = TextEditingController();
  String showText = '';

  @override
  void initState() {
    super.initState();
  }

  void leapYearCheck() {
    try {
      int year = int.parse(controller.text.toString());
      if ((year % 4 == 0) || (year % 100 == 0) || (year % 400 == 0)) {
        showText = "This is leap year";
      } else {
        showText = "This is not leap year";
      }
    } catch (e) {
      showText = "Input system is not valid";
    }
  }

  void checkLeap() {
    setState(() {});
    leapYearCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          'Leap Year check',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                label: const Text('Enter Your Number'),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          showText.isEmpty
              ? const Visibility(
                  visible: false,
                  child: Text(""),
                )
              : Text(showText),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.50,
            child: ElevatedButton(
              onPressed: () {
                checkLeap();
              },
              child: const Text(
                'check',
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
