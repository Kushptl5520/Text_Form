import 'package:flutter/material.dart';
import 'package:text_form_ui/user_data.dart';
import 'details.dart';

class Form2 extends StatefulWidget {
  Form2({Key? key, this.personData}) : super(key: key);
  UserData? personData;
  @override
  State<Form2> createState() => _Form2State();
}

class _Form2State extends State<Form2> {
  String value = "";
  int _radioSelected = 0;
  String? gender = '';
  final textfieldcontroller = TextEditingController();

  List<String> selectedhobbies = [];
  List<String> selectedLanguage = [];

  void addHobby(String hobby) {
    setState(() {
      availableHobbies.add({
        "id": DateTime.now().microsecondsSinceEpoch,
        "isDone": false,
        "name": hobby
      });
    });
    textfieldcontroller.clear();
  }

  moveToHome(BuildContext context) {
    if (gender!.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title:
                  Text('Please Select Gender', style: TextStyle(fontSize: 17)),
            );
          });
    } else if (selectedLanguage.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Please Select Language',
                style: TextStyle(fontSize: 17),
              ),
            );
          });
    } else if (selectedhobbies.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Please Select Hobby',
                style: TextStyle(fontSize: 17),
              ),
            );
          });
    } else {
      widget.personData!.gender = gender;
      widget.personData!.selectedLanguage = selectedLanguage;
      widget.personData!.selectedhobbies = selectedhobbies;

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Details(
                personData: widget.personData!,
              )));
    }
  }

  List newLanguage = [
    {"id": 1, "name": "Gujarati", "valid": false},
    {"id": 2, "name": "English", "valid": false},
    {"id": 3, "name": "Hindi", "valid": false},
    {"id": 4, "name": "Tamil", "valid": false},
  ];
  List availableHobbies = [
    {"id": 1, "name": "Cricket", "isDone": false},
    {"id": 2, "name": "Football", "isDone": false},
    {
      "id": 3,
      "name": "Volleyball",
      "isDone": false,
    },
    {"id": 4, "name": "Music", "isDone": false},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            "Form2",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Gender",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    child: Row(
                      children: [
                        Radio(
                            activeColor: Colors.indigo,
                            value: 1,
                            groupValue: _radioSelected,
                            onChanged: (value) {
                              setState(() {
                                _radioSelected = value as int;
                                gender = 'Male';
                              });
                            }),
                        const Text('Male')
                      ],
                    ),
                  ),
                  Container(
                    width: 110,
                    child: Row(
                      children: [
                        Radio(
                            activeColor: Colors.indigo,
                            value: 2,
                            groupValue: _radioSelected,
                            onChanged: (value) {
                              setState(() {
                                _radioSelected = value as int;
                                gender = 'Female';
                              });
                            }),
                        const Text('Female')
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Radio(
                            activeColor: Colors.indigo,
                            value: 3,
                            groupValue: _radioSelected,
                            onChanged: (value) {
                              setState(() {
                                _radioSelected = value as int;
                                gender = 'others';
                              });
                            }),
                        const Text('Others')
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Language Known",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Column(
                  children: newLanguage.map((language) {
                return CheckboxListTile(
                    activeColor: Colors.indigo,
                    value: language["valid"],
                    title: Text(language["name"]),
                    onChanged: (newValue) {
                      setState(() {
                        language["valid"] = newValue;
                        if (newValue ?? false) {
                          selectedLanguage.add(language["name"]);
                        } else {
                          selectedLanguage.remove(language["name"]);
                        }
                      });
                    });
              }).toList()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Hobbies",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: FloatingActionButton(
                        autofocus: true,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('Add Hobby'),
                                    content: TextField(
                                      controller: textfieldcontroller,
                                      decoration: InputDecoration(
                                          hintText: 'Enter your hobby name'),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop;
                                            addHobby(textfieldcontroller.text);
                                          },
                                          child: Text('Submit'))
                                    ],
                                  ));
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                        backgroundColor: Colors.black,
                        child: const Icon(Icons.add),
                      ),
                    ),
                  )
                ],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Column(
                    children: availableHobbies.map((hobby) {
                  return CheckboxListTile(
                      activeColor: Colors.indigo,
                      value: hobby["isDone"],
                      title: Text(hobby["name"]),
                      onChanged: (newValue) {
                        setState(() {
                          hobby["isDone"] = newValue;
                          if (newValue ?? false) {
                            selectedhobbies.add(hobby["name"]);
                          } else {
                            selectedhobbies.remove(hobby["name"]);
                          }
                        });
                      });
                }).toList()),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Wrap(
                  children: availableHobbies.map((hobby) {
                    if (hobby["isDone"] == true) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Chip(
                            onDeleted: () {
                              setState(() {
                                for (int i = 0;
                                    i < availableHobbies.length;
                                    i++) {
                                  if (availableHobbies[i]["name"] ==
                                      hobby['name']) {
                                    availableHobbies[i]["isDone"] = false;
                                    break;
                                  }
                                }
                              });
                            },
                            label: Text(hobby["name"])),
                      );
                    }
                    return Container();
                  }).toList(),
                ),
                Center(
                  child: ElevatedButton(
                    autofocus: true,
                    onPressed: () => moveToHome(context),
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 100)),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
