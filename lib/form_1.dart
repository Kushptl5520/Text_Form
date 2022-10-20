import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:text_form_ui/form_2.dart';
import 'package:text_form_ui/user_data.dart';

class Form1 extends StatefulWidget {
  const Form1({super.key});

  @override
  State<Form1> createState() => _Form1State();
}

class _Form1State extends State<Form1> {
  TextEditingController _name = new TextEditingController();
  TextEditingController _lastname = new TextEditingController();
  TextEditingController _email = new TextEditingController();

  String? countryvalue;
  String? statevalue;
  String? cityvalue;

  bool _passwordVisible = false;
  bool _conpasswordVisible = false;
  var confirmPass;
  var country = ['India', 'USA', 'Canada', 'Australia', 'Japan', 'Chin'];
  var State = [
    'Gujarat',
    'MP',
    'Shanghai',
    'Melbourne',
    'California',
    'New York',
    'Ontario',
    'Tokyo',
  ];
  var City = [
    'Ahmedabad',
    'Surat',
    'Austin',
    'Chicago',
    'Toronto',
    'Vancouver',
    'Beijing'
  ];

  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      var personData = UserData();
      personData.firstname = _name.text;
      personData.lastname = _lastname.text;
      personData.email = _email.text;
      personData.country = countryvalue;
      personData.state = statevalue;
      personData.city = cityvalue;
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Form2(
                personData: personData,
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            "Login Form",
            style: TextStyle(color: Colors.white),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: DoubleBackToCloseApp(
          snackBar: SnackBar(
            content: Text("Tap back again to Exit"),
          ),
          child: SingleChildScrollView(
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
                            textCapitalization: TextCapitalization.words,
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
                            textCapitalization: TextCapitalization.sentences,
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
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return "Please enter a valid email address";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            confirmPass = value;
                            if (value!.isEmpty) {
                              return "Please Enter a Password";
                            } else if (value.length < 6) {
                              return "Password must be atleast 6 characters long";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: !_conpasswordVisible,
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _conpasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  _conpasswordVisible = !_conpasswordVisible;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Confirm Password";
                            } else if (value.length < 6) {
                              return "Password must be atleast 6 characters long";
                            } else if (value != confirmPass) {
                              return "Password must be same as above";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        DropdownButtonFormField(
                          validator: (value) => value == null
                              ? 'Please Select Any Country'
                              : null,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          hint: Text("Select your Country"),
                          items: country.map((countryname) {
                            return DropdownMenuItem(
                              value: countryname,
                              child: Text(countryname),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              countryvalue = newValue.toString();
                            });
                          },
                          value: countryvalue,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DropdownButtonFormField(
                          validator: (value) =>
                              value == null ? 'Please Select Any State' : null,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          hint: Text("Select your State"),
                          items: State.map((statename) {
                            return DropdownMenuItem(
                              value: statename,
                              child: Text(statename),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              statevalue = newValue.toString();
                            });
                          },
                          value: statevalue,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DropdownButtonFormField(
                          validator: (value) =>
                              value == null ? 'Please Select Any City' : null,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          hint: Text("Select your City"),
                          items: City.map((cityname) {
                            return DropdownMenuItem(
                                value: cityname, child: Text(cityname));
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              cityvalue = newValue.toString();
                            });
                          },
                          value: cityvalue,
                        ),
                      ],
                    ),
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
                  FloatingActionButton(
                      onPressed:(){},
                     child: Icon(Icons.add),
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
        ),
      ),
    );
  }
}
