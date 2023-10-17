import 'package:flutter/material.dart';

class TextLabel extends StatefulWidget {
  final String texto;
  const TextLabel({super.key, required this.texto});

  @override
  State<TextLabel> createState() => _TextLabelState();
}

class _TextLabelState extends State<TextLabel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(widget.texto,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
    );
  }
}
