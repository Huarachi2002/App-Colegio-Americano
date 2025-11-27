import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RetryErrorMessageWidget extends StatelessWidget {
  final Function retryFunction;
  final String message;

  RetryErrorMessageWidget(this.retryFunction, this.message);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => retryFunction(),
      child: Container(
        padding: EdgeInsets.only(left: 2.0, right: 2.0),
        child: Center(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey[400],
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}
