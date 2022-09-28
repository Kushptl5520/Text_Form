import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:text_form_ui/routes/routes.dart';

class Form1 extends StatefulWidget {
  const Form1({super.key});

  @override
  State<Form1> createState() => _Form1State();
}

class _Form1State extends State<Form1> {
  TextEditingController _name = new TextEditingController();
  TextEditingController _lastname = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  List<dynamic> countries = [];
  List<dynamic> statesMaster = [];
  List<dynamic> states = [];
  List<dynamic> cityMaster = [];
  List<dynamic> city = [];
  List cities = [];
  String? countryId;
  String? stateId;
  String? cityId;

  @override
  void initState() {
    setState(() {});
    super.initState();
    this.countries.add({"id": 1, "name": "India"});
    this.countries.add({"id": 2, "name": "USA"});
    this.countries.add({"id": 3, "name": "Canada"});
    this.countries.add({"id": 4, "name": "Australia"});
    this.countries.add({"id": 5, "name": "Japan"});
    this.countries.add({"id": 6, "name": "Chin"});

    this.statesMaster = [
      {"ID": 1, "Name": "Gujarat", "ParentId": 1},
      {"ID": 2, "Name": "MP", "ParentId": 1},
      {"ID": 3, "Name": "Shanghai", "ParentId": 1},
      {"ID": 4, "Name": "Melbourne", "ParentId": 1},
      {"ID": 5, "Name": "California", "ParentId": 1},
      {"ID": 6, "Name": "Ontario", "ParentId": 1},
      {"ID": 7, "Name": "Tokyo", "ParentId": 1},
      {"ID": 1, "Name": "Gujarat", "ParentId": 2},
      {"ID": 2, "Name": "MP", "ParentId": 2},
      {"ID": 3, "Name": "Shanghai", "ParentId": 2},
      {"ID": 4, "Name": "Melbourne", "ParentId": 2},
      {"ID": 5, "Name": "California", "ParentId": 2},
      {"ID": 6, "Name": "Ontario", "ParentId": 2},
      {"ID": 7, "Name": "Tokyo", "ParentId": 2},
      {"ID": 1, "Name": "Gujarat", "ParentId": 3},
      {"ID": 2, "Name": "MP", "ParentId": 3},
      {"ID": 3, "Name": "Shanghai", "ParentId": 3},
      {"ID": 4, "Name": "Melbourne", "ParentId": 3},
      {"ID": 5, "Name": "California", "ParentId": 3},
      {"ID": 6, "Name": "Ontario", "ParentId": 3},
      {"ID": 7, "Name": "Tokyo", "ParentId": 3},
      {"ID": 1, "Name": "Gujarat", "ParentId": 4},
      {"ID": 2, "Name": "MP", "ParentId": 4},
      {"ID": 3, "Name": "Shanghai", "ParentId": 4},
      {"ID": 4, "Name": "Melbourne", "ParentId": 4},
      {"ID": 5, "Name": "California", "ParentId": 4},
      {"ID": 6, "Name": "Ontario", "ParentId": 4},
      {"ID": 7, "Name": "Tokyo", "ParentId": 4},
      {"ID": 1, "Name": "Gujarat", "ParentId": 5},
      {"ID": 2, "Name": "MP", "ParentId": 5},
      {"ID": 3, "Name": "Shanghai", "ParentId": 5},
      {"ID": 4, "Name": "Melbourne", "ParentId": 5},
      {"ID": 5, "Name": "California", "ParentId": 5},
      {"ID": 6, "Name": "Ontario", "ParentId": 5},
      {"ID": 7, "Name": "Tokyo", "ParentId": 5},
      {"ID": 1, "Name": "Gujarat", "ParentId": 6},
      {"ID": 2, "Name": "MP", "ParentId": 6},
      {"ID": 3, "Name": "Shanghai", "ParentId": 6},
      {"ID": 4, "Name": "Melbourne", "ParentId": 6},
      {"ID": 5, "Name": "California", "ParentId": 6},
      {"ID": 6, "Name": "Ontario", "ParentId": 6},
      {"ID": 7, "Name": "Tokyo", "ParentId": 6},
    ];
    this.cityMaster = [
      {"ID": 1, "Name": "Ahmedabad", "ParentId": 1},
      {"ID": 2, "Name": "Surat", "ParentId": 1},
      {"ID": 3, "Name": "Austin", "ParentId": 1},
      {"ID": 4, "Name": "Chicago", "ParentId": 1},
      {"ID": 5, "Name": "Toronto", "ParentId": 1},
      {"ID": 6, "Name": "Beijing", "ParentId": 1},
      {"ID": 7, "Name": "Vancouver", "ParentId": 1},
      {"ID": 1, "Name": "Ahmedabad", "ParentId": 2},
      {"ID": 2, "Name": "Surat", "ParentId": 2},
      {"ID": 3, "Name": "Austin", "ParentId": 2},
      {"ID": 4, "Name": "Chicago", "ParentId": 2},
      {"ID": 5, "Name": "Toronto", "ParentId": 2},
      {"ID": 6, "Name": "Beijing", "ParentId": 2},
      {"ID": 7, "Name": "Vancouver", "ParentId": 2},
      {"ID": 1, "Name": "Ahmedabad", "ParentId": 3},
      {"ID": 2, "Name": "Surat", "ParentId": 3},
      {"ID": 3, "Name": "Austin", "ParentId": 3},
      {"ID": 4, "Name": "Chicago", "ParentId": 3},
      {"ID": 5, "Name": "Toronto", "ParentId": 3},
      {"ID": 6, "Name": "Beijing", "ParentId": 3},
      {"ID": 7, "Name": "Vancouver", "ParentId": 3},
      {"ID": 1, "Name": "Ahmedabad", "ParentId": 4},
      {"ID": 2, "Name": "Surat", "ParentId": 4},
      {"ID": 3, "Name": "Austin", "ParentId": 4},
      {"ID": 4, "Name": "Chicago", "ParentId": 4},
      {"ID": 5, "Name": "Toronto", "ParentId": 4},
      {"ID": 6, "Name": "Beijing", "ParentId": 4},
      {"ID": 7, "Name": "Vancouver", "ParentId": 4},
      {"ID": 1, "Name": "Ahmedabad", "ParentId": 5},
      {"ID": 2, "Name": "Surat", "ParentId": 5},
      {"ID": 3, "Name": "Austin", "ParentId": 5},
      {"ID": 4, "Name": "Chicago", "ParentId": 5},
      {"ID": 5, "Name": "Toronto", "ParentId": 5},
      {"ID": 6, "Name": "Beijing", "ParentId": 5},
      {"ID": 7, "Name": "Vancouver", "ParentId": 5},
      {"ID": 1, "Name": "Ahmedabad", "ParentId": 6},
      {"ID": 2, "Name": "Surat", "ParentId": 6},
      {"ID": 3, "Name": "Austin", "ParentId": 6},
      {"ID": 4, "Name": "Chicago", "ParentId": 6},
      {"ID": 5, "Name": "Toronto", "ParentId": 6},
      {"ID": 6, "Name": "Beijing", "ParentId": 6},
      {"ID": 7, "Name": "Vancouver", "ParentId": 6},
    ];
  }

  final _dropkey = GlobalKey<FormState>();
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) {
    // Navigator.of(context).push(MaterialPageRoute(
    //     builder: (context) => Details(name: _name.text,lastname: _lastname.text, email: _email.text,)));
    if (_formkey.currentState!.validate())
      Navigator.pushNamed(context, MyRoutes.form2Route);
    if (_dropkey.currentState!.validate()) ;
    _formkey.currentState!.save();
    _dropkey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            "Login Form",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hintText: "First Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Firstname cannot be empty";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _lastname,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hintText: "Last Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Lastname cannot be empty";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _email,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "E-mail",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email cannot be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password length should be atleast 6";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "ConfirmPassword length should be atleast 6";
                        }

                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  FormHelper.dropDownWidget(
                    paddingLeft: 10,
                    paddingRight: 10,
                    contentPadding: 19,
                    hintFontSize: 16,
                    context,
                    "Selected Country",
                    this.countryId,
                    this.countries,
                    (onChangedval) {
                      this.countryId = onChangedval;
                      print("selected country: $onChangedval");
                      this.states = this
                          .statesMaster
                          .where((stateItem) =>
                              stateItem["ParentId"].toString() ==
                              onChangedval.toString())
                          .toList();
                      this.stateId = null;
                      this.cityId = null;
                      setState(() {});
                    },
                    (onValidateval) {
                      if (onValidateval == null) {
                        return "please select Country";
                      }
                      return null;
                    },
                    borderColor: Colors.grey,
                    borderFocusColor: Theme.of(context).primaryColor,
                    borderRadius: 10,
                  ),

                  const SizedBox(height: 10),
                  FormHelper.dropDownWidget(
                    paddingLeft: 10,
                    paddingRight: 10,
                    contentPadding: 19,
                    hintFontSize: 16,
                    context,
                    "Selected state",
                    this.stateId,
                    this.states,
                    (onChangedval) {
                      this.stateId = onChangedval;
                      print("Selected state: $onChangedval");
                      this.cities = this
                          .cityMaster
                          .where((cityItem) =>
                              cityItem["ParentId"].toString() ==
                              onChangedval.toString())
                          .toList();
                      this.cityId = null;
                      setState(() {});
                    },
                    (onValidateval) {
                      if (onValidateval == null) {
                        return "please select state";
                      }
                      return null;
                    },
                    borderColor: Colors.grey,
                    borderFocusColor: Theme.of(context).primaryColor,
                    borderRadius: 10,
                    optionValue: "ID",
                    optionLabel: "Name",
                  ),
                  const SizedBox(height: 10),
                  //city

                  FormHelper.dropDownWidget(
                    paddingLeft: 10,
                    paddingRight: 10,
                    contentPadding: 19,
                    hintFontSize: 16,
                    context,
                    "Selected city",
                    this.cityId,
                    this.cities,
                    (onChangedval) {
                      this.cityId = onChangedval;
                      print("Selected city: $onChangedval");
                      setState(() {});
                    },
                    (onValidate) {
                      if (onValidate == null) {
                        return "please select city";
                      }
                      return null;
                    },
                    borderColor: Colors.grey,
                    borderFocusColor: Theme.of(context).primaryColor,
                    borderRadius: 10,
                    optionValue: "ID",
                    optionLabel: "Name",
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 2,
              ),
              SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                autofocus: true,
                onPressed: () => moveToHome(context),
                child: const Text(
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
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
