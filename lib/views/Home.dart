import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Media Facul'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }

  //WIDGETS
  Widget _textField({String hintText,onChanged,Function() errorText}){
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
        errorText: errorText == null? null : errorText()
      ),
      onChanged: onChanged,

    );
  }
}