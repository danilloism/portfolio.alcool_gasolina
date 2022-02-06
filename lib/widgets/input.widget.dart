import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String _titulo;
  final MoneyMaskedTextController _cntrllr;

  const Input(
      {required String titulo, required MoneyMaskedTextController cntrler})
      : _titulo = titulo,
        _cntrllr = cntrler;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Container(
            alignment: Alignment.centerRight,
            width: 100,
            child: Text(
              _titulo,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: "Big Shoulders Display",
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: _cntrllr,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 45,
                fontFamily: "Big Shoulders Display",
              ),
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
