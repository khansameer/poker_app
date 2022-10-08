
import 'package:flutter/material.dart';
import 'package:poker/utils/app_constants.dart';

//ignore: must_be_immutable
class CustomTextWidget extends StatelessWidget {
  String? _text;
  Color? _textColor;
  double? _fontSize;
  FontWeight? _fontWeight;
  TextDecoration? _textDecoration;
  double? _letterSpacing;
  TextAlign? _textAlign;
  double? _margintopSize;
  double? _height;
  double? _widht;
  double? _left;
  double? _right;

  CustomTextWidget(
      {String? text,
      Color? textColor,
      double? fontSize,
      FontWeight? fontWeight,
      TextDecoration? textDecoration,
      double? letterSpacing,
      TextAlign? textAlign,
      bool? isClickable,
      double? margintopSize,
      double? height,
      double? widht,
      double? left,
      double? right,
      Key? key})
      : super(key: key) {
    _text = text;
    _textColor = textColor;
    _fontSize = fontSize;
    _fontWeight = fontWeight;
    _textDecoration = textDecoration;
    _letterSpacing = letterSpacing;
    _textAlign = textAlign;
    _height = height;
    _widht = widht;
    _margintopSize = margintopSize;
    _left = left;
    _right = right;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: _widht,
      margin: EdgeInsets.only(
        top: _margintopSize ?? AppConstants.zero,
        left: _left ?? AppConstants.zero,
        right: _right ?? AppConstants.zero,
      ),
      child: Text(
        _text ?? "",
        textAlign: _textAlign,
        style: TextStyle(
            fontFamily: 'SFProDisplay',
            letterSpacing: _letterSpacing ?? 0.1,
            fontSize: _fontSize,
            color: _textColor,
            fontWeight: _fontWeight,
            decoration: _textDecoration),
      ),
    );
  }
}
