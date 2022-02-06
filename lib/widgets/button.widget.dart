import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  final String _titulo;
  final Function() _onPressed;
  final double _tamanhoFonte;
  final bool _busy;
  final bool _invert;

  const LoadingButton(
      {required String titulo,
      required void Function() onPressed,
      required double tamanhoFonte,
      required bool invert,
      required bool busy})
      : _titulo = titulo,
        _tamanhoFonte = tamanhoFonte,
        _onPressed = onPressed,
        _busy = busy,
        _invert = invert;

  String getTitulo() => _titulo;
  void Function() getFunction() => _onPressed;
  double getTamanhoFont() => _tamanhoFonte;

  @override
  Widget build(BuildContext context) {
    return _busy
        ? Container(
            alignment: Alignment.center,
            height: 90,
            child: const CircularProgressIndicator(
              backgroundColor: Colors.white,
            ))
        : Container(
            height: 50,
            width: double.infinity,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: _invert
                  ? Theme.of(context).primaryColor.withOpacity(0.8)
                  : Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextButton(
              onPressed: _onPressed,
              child: Center(
                child: Text(
                  _titulo,
                  style: TextStyle(
                      color: _invert
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                      fontSize: _tamanhoFonte,
                      fontFamily: "Big Shoulders Display",
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          );
  }
}
