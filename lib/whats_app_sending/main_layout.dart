import 'package:flutter/material.dart';

class WhatsApp extends StatelessWidget {
  const WhatsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.deepOrange,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
