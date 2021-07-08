import 'package:flutter/material.dart';
import 'package:signin_form/src/data_storage/data_storage.dart';
import 'package:signin_form/src/mixins/validations.dart';
import 'package:signin_form/src/resuable/elevated_button.dart';
import 'package:signin_form/src/screens/dummy_screen.dart';

class FormScreen extends StatefulWidget with InputValidationMixin {
  // const FormScreen({ Key? key }) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  LocalDataStorage _dataStorage = LocalDataStorage();
  TextEditingController _k = TextEditingController();
  TextEditingController _rollnumber = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _address = TextEditingController();



  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text("Student Profile")),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 150.0,
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0),
                            bottomLeft: const Radius.circular(40.0),
                            bottomRight: const Radius.circular(40.0)),
                        image: DecorationImage(
                            image: AssetImage('images/fast.png'),
                            fit: BoxFit.cover))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Container(
                child: Column(children: [
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 50.0,
                          child: TextFormField(
                            readOnly: true,
                            controller: _k,
                            decoration: InputDecoration(
                              labelText: 'K',
                              hintText: 'K',
                            ),
                            // validator: (String value) {},
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: TextFormField(
                              controller: _rollnumber,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Roll Number',
                                hintText: 'Roll Number',
                              ),
                              validator: (String value) {
                                if (widget.isFieldEmpty(value)) {
                                  return 'Please enter roll number';
                                }
                                return null;
                              },
                            )),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: _name,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Name',
                      labelText: 'Full Name',
                    ),
                    validator: (String value) {
                      if (widget.isFieldEmpty(value)) {
                        return 'Please enter valid name';
                      }
                      return null;
                    },
                    readOnly: false,
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Email Here',
                      labelText: 'Email',
                    ),
                    validator: (String value) {
                      if (widget.isFieldEmpty(value) || !widget.isEmailValid(value)) {
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                    readOnly: false,
                  ),
                  TextFormField(
                    controller: _mobile,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Mobile Number Here',
                      labelText: 'Mobile Number',
                    ),
                    validator: (String value) {
                      if (widget.isFieldEmpty(value)) {
                        return 'Please enter valid number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _address,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Address Here',
                      labelText: 'Address',
                    ),
                    validator: (String value) {
                      if (widget.isFieldEmpty(value)) {
                        return 'Please enter valid address';
                      }
                      return null;
                    },
                  ),
                ]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    alignment: Alignment.bottomCenter,
                    height: 100.0,
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedBtn(
                      onPressed: () {
                        _dataStorage.saveItem(
                            'roll_number', 'k' + _rollnumber.text);
                        _dataStorage.saveItem('email', _email.text);
                        _dataStorage.saveItem('name', _name.text);
                        _dataStorage.saveItem('number', _mobile.text);
                        _dataStorage.saveItem('address', _address.text);

                        if (_formKey.currentState.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NextScreen()));
                        }
                      },
                      text: 'Submit ',
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
