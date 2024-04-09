import 'package:flutter/material.dart';

enum Gender {
  male,
  female,
}

class InputWidgetExample extends StatefulWidget {
  const InputWidgetExample({super.key});

  @override
  State<InputWidgetExample> createState() => _InputWidgetExample();
}

class _InputWidgetExample extends State<InputWidgetExample> {
  final nameController = TextEditingController();
  bool checked = false;
  Gender gender = Gender.male;
  final countries = [
    'USA',
    'China',
    'Japan',
    'India',
    'Brazil',
  ];
  String? country;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Widgets'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(label: Text('Enter your name')),
            ),
            ElevatedButton(
              onPressed: () {
                // ignore: avoid_print
                print(nameController.text);
              },
              child: const Text("OK"),
            ),
            Row(
              children: [
                Checkbox(
                  value: checked,
                  onChanged: (value) {
                    setState(() {
                      checked = value!;
                    });
                  },
                ),
                const Text('Flutter'),
              ],
            ),
            Row(
              children: [
                Radio<Gender>(
                  value: Gender.male,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                const Text("Male"),
                Radio<Gender>(
                  value: Gender.female,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                const Text("Female"),
              ],
            ),
            DropdownButton<String>(
              isExpanded: true,
              hint: const Text("Select  country"),
              value: country,
              items: countries
                  .map((e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(e)))
                  .toList(),
              onChanged: (value){
                setState(() {
                  country = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
