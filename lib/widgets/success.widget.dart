import 'package:flutter/material.dart';

import 'button.widget.dart';

class Success extends StatelessWidget {
  final String _result;
  final Function() _reset;

  const Success({required String result, required Function() reset})
      : _reset = reset,
        _result = result;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            _result,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 35,
              fontFamily: "Big Shoulders Display",
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          LoadingButton(
            titulo: "Calcular novamente",
            onPressed: _reset,
            tamanhoFonte: 25,
            invert: true,
            busy: false,
          )
        ],
      ),
    );
  }
}
