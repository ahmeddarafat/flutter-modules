import 'package:flutter/material.dart';
import 'package:flutter_modules/modules/age_calculator/age.dart';

class AgeCalculatorPage extends StatefulWidget {
  const AgeCalculatorPage({super.key});

  @override
  State<AgeCalculatorPage> createState() => _AgeCalculatorPageState();
}

class _AgeCalculatorPageState extends State<AgeCalculatorPage> {
  late final TextEditingController mycontroller;
  var A = 0;

  @override
  void initState() {
    super.initState();
    mycontroller = TextEditingController();
  }

  @override
  void dispose() {
    mycontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Age Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Enter yours birth years',
                    labelStyle: const TextStyle(fontSize: 25),
                    hintText: 'for example  1980',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    )),
                controller: mycontroller,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'you are $A years old',
                style: const TextStyle(fontSize: 25, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Age.cal(int.parse(mycontroller.text));
                  A = Age.ages;
                });
              },
              child: const Text(
                'OK',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
