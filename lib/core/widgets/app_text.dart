import 'package:flutter/material.dart';

class AppText extends StatelessWidget {

  const AppText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.maxLine,
    this.overflow,
    this.softWrap = true,
    this.textStyle = const TextStyle(),
  });
  final String? text;
  final TextAlign textAlign;
  final int? maxLine;
  final TextOverflow? overflow;
  final bool? softWrap;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: textStyle,
      maxLines: maxLine,
      overflow: overflow,
      softWrap: softWrap,
      textAlign: textAlign,
      textDirection: TextDirection.rtl,
    );
  }
}
