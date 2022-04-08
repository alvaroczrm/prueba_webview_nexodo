import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
//no appbar , solucion fondo gris
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';



class webviewActivity extends StatelessWidget {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black, //or set color with: Color(0xFF0000FF)
    ));*/

    return MaterialApp(
        home: Scaffold(
            body: WebView(
                //initialUrl: 'http://192.168.1.48:8080/#/diegoOficina',
                initialUrl: 'http://192.168.1.48:8080/#/diegoOficina',
                onWebViewCreated: (controller){
                  this.controller = controller;
                },
                onPageStarted: (url) async{
                  if(url.contains('/orders/')){
                    print('hola');
                    final message = 'Descarga';
                    Fluttertoast.showToast(msg: message, fontSize: 18);
                  }
                },
                javascriptMode: JavascriptMode.unrestricted,
                gestureNavigationEnabled: true,
                backgroundColor: const Color(0x00000000),

              ),
            )
        );
  }

}
/*FUNCIONAL BASE
class webviewActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black, //or set color with: Color(0xFF0000FF)
    ));
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
              child : const WebView(
                initialUrl: 'http://192.168.1.48:8080/#/diegoOficina',
                javascriptMode: JavascriptMode.unrestricted,
              ),
            )
        )
    );
  }
}*/
/*
    class webviewActivity extends StatelessWidget {
      const webviewActivity({Key? key}) : super(key: key);

      @override
      Widget build(BuildContext context) async {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.black, //or set color with: Color(0xFF0000FF)
        ));
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(

            colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: Colors.teal,
              onPrimary: Colors.white,
              // Colors that are not relevant to AppBar in LIGHT mode:
              primaryVariant: Colors.grey,
              secondary: Colors.grey,
              secondaryVariant: Colors.grey,
              onSecondary: Colors.grey,
              background: Colors.grey,
              onBackground: Colors.grey,
              surface: Colors.grey,
              onSurface: Colors.grey,
              error: Colors.grey,
              onError: Colors.grey,
            ),

          ),
          home: Scaffold(
            body: SafeArea(
              child: Center(
                child: WebView(
                  initialUrl: 'http://192.168.1.48:8080/#/diegoOficina',
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              ),

            ),
          ),

        );
      }
    }*/
