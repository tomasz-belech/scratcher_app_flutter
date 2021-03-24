import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:scratcher_flutter/scratcherView.dart';
import 'package:scratcher_flutter/logIn.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool isChecked = false;

  void validate() {
    if (formkey.currentState.validate()) {
      print('Validated');
    } else {
      print('Not Validated');
    }
  }

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
                'I accept all the Lottery rules included in goverment law'),
            actions: <Widget>[
              TextButton(
                child: Text('Back'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lottery'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.login_rounded),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(LogIn.routeName);
            },
          )
        ]
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Email'),
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Required *'),
                    EmailValidator(errorText: 'Not A Valid Email'),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: MaterialButton(
                      color: Colors.amberAccent,
                      onPressed: () async {
                        await showInformationDialog(context);
                      },
                      child: Text(
                        'Terms Of Use',
                        style: TextStyle(fontSize: 16),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: Checkbox(
                    value: isChecked,
                    onChanged: (bool b) {
                      setState(() {
                        isChecked = b;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: MaterialButton(
                    onPressed: isChecked
                        ? () {
                            validate();
                            Navigator.of(context)
                                .pushNamed(ScratcherView.routeName);
                          }
                        : null,
                    child: Text(
                      'PLAY',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.blue,
                    disabledColor: Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
