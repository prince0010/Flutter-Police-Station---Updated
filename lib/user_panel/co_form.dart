import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:policesystem/api/barangay_api.dart';
import 'package:policesystem/api/co_panel_api.dart';

class CriminalOffenseForm extends StatefulWidget {
  const CriminalOffenseForm({Key? key}) : super(key: key);
  @override
  _CriminalOffenseFormState createState() => _CriminalOffenseFormState();
}

class _CriminalOffenseFormState extends State<CriminalOffenseForm> {
  final _formKey = GlobalKey<FormState>();

  String name = '';

  testWindowSize() async {
    await DesktopWindow.setMaxWindowSize(const Size(1600, 900));
    await DesktopWindow.setMinWindowSize(const Size(1280, 720));
  }

  @override
  void initState() {
    super.initState();
    testWindowSize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Zone'),
        backgroundColor: const Color.fromARGB(221, 8, 45, 211),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: SingleChildScrollView(
          //Scroll
          child: Form(
            key: _formKey, //Formid pag html
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 16),
                const Align(
                  alignment: Alignment
                      .centerLeft, // Align however you like (i.e .centerRight, centerLeft)
                  child: Text(
                    'Criminal offense name',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: "Enter Criminal Offense Name",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Input Criminal Offense Name";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(80, 50),
                      maximumSize: const Size(80, 50),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        createOffense(name)
                            .then((value) => Navigator.of(context).pop());
                      }
                    },
                    child: const Text('Save')),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}