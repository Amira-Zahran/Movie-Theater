import 'package:flutter/material.dart';
import 'package:odc_interview/view/components/core/components.dart';
import 'package:odc_interview/view/components/core/style.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../components/constants_payment/constants.dart';
import 'Rejester/rejester.dart';



class VisaCardScreen extends StatelessWidget {
  const VisaCardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        InkWell(
          onTap: () {
            Exit(context);
          },
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.exit_to_app),
          ),
        )
      ],),
      body: WebView(
        initialUrl: 'https://accept.paymob.com/api/acceptance/iframes/442171?payment_token=$PaymentFinalTokenCard',
        javascriptMode: JavascriptMode.unrestricted,

        onProgress: (int progress) {
          print('WebView is loading (progress : $progress%)');
        },
        javascriptChannels: <JavascriptChannel>{
          _toasterJavascriptChannel(context),
        },

        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
        gestureNavigationEnabled: true,
        backgroundColor: const Color(0x00000000),
      ),
      );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  Exit(BuildContext context){
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Are you sure completed payment?',
          style: TextStyle(color: primary, fontSize: 16),),
          actions:[
            TextButton(onPressed: (){
              Navigator.pop(context);
              navigateAndFinish(context, RegisterScreen());
            }, child: const Text('Yes')),
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text('No')),

          ],
        );
      }
    );
  }
}
