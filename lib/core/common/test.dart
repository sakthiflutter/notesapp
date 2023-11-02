import 'package:flutter/material.dart';

class Txt extends StatelessWidget {
  final String text;
  final double fsize;
  final FontWeight weight;
  final int lines;
  final Color color;
  final bool defalutsize;
  final bool iscenter;
  final double hieght;
  final bool underline;
  const Txt(
      {Key? key,
        this.text = '',
        this.fsize = 0,
        this.iscenter = false,
        this.underline = false,
        this.lines = 1000,
        this.color = Colors.black87,
        this.defalutsize = false,
        this.hieght = 1.2,
        this.weight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      textAlign: iscenter ? TextAlign.center : TextAlign.start,
      style: TextStyle(
          fontSize: fsize == 0 ? 12 : fsize,
          fontWeight: weight,
          decoration:
          underline ? TextDecoration.underline : TextDecoration.none,
          color: color,
          height: hieght,
          letterSpacing: .7),
    );
  }
}
