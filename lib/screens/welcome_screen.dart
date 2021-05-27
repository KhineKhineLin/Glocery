import 'package:flutter/material.dart';
import 'package:glocery/screens/onboard_screen.dart';

class WelcomeScreen extends StatelessWidget {
  bool _validPhoneNumber = false;
  void showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) =>
            StatefulBuilder(builder: (context, StateSetter myState) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LOGIN',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Enter your phone number to proceed',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            prefixText: '+91',
                            labelText: '10 digit mobile number'),
                        autofocus: true,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        onChanged: (value) {
                          if (value.length == 10) {
                            myState(() {
                              _validPhoneNumber = true;
                            });
                          } else {
                            myState(() {
                              _validPhoneNumber = false;
                            });
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: AbsorbPointer(
                              absorbing: _validPhoneNumber ? false : true,
                              child: FlatButton(
                                  color: _validPhoneNumber
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey,
                                  onPressed: () {},
                                  child: Text(
                                    _validPhoneNumber
                                        ? 'CONTINUE'
                                        : 'ENTER PHONE NUMBER',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(children: [
          Positioned(
            right: 0.0,
            top: 10.0,
            child: FlatButton(
              child: Text(
                'SKIP',
                style: TextStyle(color: Colors.deepOrangeAccent),
              ),
              onPressed: () {},
            ),
          ),
          Column(
            children: [
              Expanded(child: OnBoardScreen()),
              Text(
                'Ready to order from your nearest shop?',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                color: Colors.deepOrangeAccent,
                child: Text(
                  'SET DELIVERY LOCATION',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
              FlatButton(
                child: RichText(
                  text: TextSpan(
                      text: 'Already a Customer ? ',
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                            text: 'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orangeAccent))
                      ]),
                ),
                onPressed: () {
                  showBottomSheet(context);
                },
              )
            ],
          ),
        ]),
      ),
    );
  }
}
