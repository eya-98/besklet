import 'package:bisklet/common_widget/custom_raised_button.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

// ignore: camel_case_types
class signInButton extends CustomRaisedButton {
  signInButton({
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  }) : super(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 15.0),
          ),
          color: color,
          onPressed: onPressed,
  );

}