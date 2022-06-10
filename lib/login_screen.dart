import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'dash_board_screen.dart';
class LoginScreen extends StatefulWidget{
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() =>LoginVisibilityState();
}
class LoginVisibilityState extends State<LoginScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  late String sessionId;
  bool _isInitial = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('RunWheelz-Login')),
        body:Center(child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Visibility(visible: _isInitial, child:
                 TextField(
                  controller: phoneNumberController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone Number',
                    ),keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]')),], maxLength: 10,
                ),),
                const SizedBox(height: 10),
                Visibility(visible: !_isInitial, child:
                 TextField(
                  controller: otpController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'OTP',
                    ), keyboardType: TextInputType.number, maxLength: 6
                ),),
                RaisedButton(
                  child:_isInitial? const Text(
                    'Generate OTP'):const Text(
                      'Verify OTP'),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: () async {
                    if(_isInitial){
                    if((phoneNumberController.text.isNotEmpty) && (phoneNumberController.text.length==10)) {
                      String apiKey = "b2fea6bd-aa7b-11ec-a4c2-0200cd936042";
                      String url = "https://2factor.in/API/V1/" + apiKey +
                          "/SMS/" + phoneNumberController.text + "/AUTOGEN";
                      http.Response response = await http.get(Uri.parse(url));
                      if (response.statusCode == 200) {
                        final data=jsonDecode(response.body);
                        setState(() {
                          _isInitial = false;
                          sessionId=data['Details'];
                        });
                        log("Get response:" + response.body);
                      }
                    }else {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) =>
                            AlertDialog(
                              title: const Text('Error'),
                              content: const Text('Invalid phone number'),
                              actions: <Widget>[
                                FlatButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                      );
                    }
                    }else{
                      if((otpController.text.isNotEmpty) && (otpController.text.length==6)) {
                        String apiKey = "b2fea6bd-aa7b-11ec-a4c2-0200cd936042";
                        String url = "https://2factor.in/API/V1/"+apiKey+"/SMS/VERIFY/"+sessionId+"/"+otpController.text;
                        http.Response response = await http.get(Uri.parse(url));
                        if (response.statusCode == 200) {
                          SharedPreferences prefs =  await SharedPreferences.getInstance();
                          prefs.setBool("isLogin", true);
                          setState(() {
                            _isInitial = true;
                          });
                          log("Get response otp:" + response.body);
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (BuildContext context) => const DashBoardScreen()));
                        }else{
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) =>
                                AlertDialog(
                                  title: const Text('Error'),
                                  content: const Text('Incorrect OTP'),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                          );
                        }
                      }else {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) =>
                              AlertDialog(
                                title: const Text('Error'),
                                content: const Text('Invalid OTP'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                        );
                      }
                      setState(() {
                        _isInitial = false;
                      });
                    }
                  },
                ),
              ],
            )
        )
        )
    );
  }
}