// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutterprueba/screens/WebViewExample.dart';

import 'package:flutterprueba/screens/webviewActivity.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() => runApp(App()); // initiate MyApp as  StatelessWidget
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NumierWebView',
      theme: ThemeData(
        primaryColor: Colors.orange, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
      ),
     home: exitApp(),
    );
  }
}
class exitApp extends StatelessWidget {
  DateTime timeBackPressed = DateTime.now();
  @override
  Widget build(BuildContext context) => WillPopScope(
    onWillPop:() async{
      final difference = DateTime.now().difference(timeBackPressed);
      final isExitWarning= difference >= Duration(seconds: 2);
      timeBackPressed = DateTime.now();

      if(isExitWarning){
        final message = 'Pulsa dos veces para salir';
        Fluttertoast.showToast(msg: message, fontSize: 18);
        return false;
      }else{
        Fluttertoast.cancel();
        return true;
      }

    }, child: webviewActivity()
  );
}


