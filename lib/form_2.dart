import 'package:flutter/material.dart';
import 'package:text_form_ui/routes/routes.dart';
class Form2 extends StatefulWidget {
  const Form2({Key? key}) : super(key: key);

  @override
  State<Form2> createState() => _Form2State();
}

class _Form2State extends State<Form2> {
  String value = "";
  int _radioSelected = 0;
  String? gender;
  bool _isGujarati = false;
  bool _isHindi = false;
  bool _isEnglish = false;
  bool _isTamil = false;

  String? selectedSalutation;
  String? selectedSaluted;
  String? selectedSaluteded;
  final textfieldcontroller = TextEditingController();

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
    Navigator.pushNamed(context, MyRoutes.detailsRoute);
  }

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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Gender",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.indigo,
                        value: _isGujarati,
                        onChanged: (value) {
                          setState(() {
                            _isGujarati = value!;
                          });
                        },
                      ),
                      const Expanded(
                        child: Text(
                          'Gujarati',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.indigo,
                        value: _isEnglish,
                        onChanged: (value) {
                          setState(() {
                            _isEnglish = value!;
                          });
                        },
                      ),
                      const Expanded(
                          child: Text(
                        'English',
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Checkbox(
                            activeColor: Colors.indigo,
                            value: _isHindi,
                            onChanged: (value) {
                              setState(() {
                                _isHindi = value!;
                              });
                            },
                          ),
                          const Expanded(
                            child:
                                Text('Hindi', style: TextStyle(fontSize: 17)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 27),
                      child: Row(
                        children: [
                          Checkbox(
                            activeColor: Colors.indigo,
                            value: _isTamil,
                            onChanged: (value) {
                              setState(() {
                                _isTamil = value!;
                              });
                            },
                          ),
                          const Expanded(
                            child: Text('Tamil',
                                style: TextStyle(
                                  fontSize: 17,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Hobbies",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
                      borderRadius: BorderRadius.circular(20),
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
                            for (int i = 0; i < availableHobbies.length; i++) {
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
                  "Submit",
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
    );
  }
}
