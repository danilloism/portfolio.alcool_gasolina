import 'package:alcool_gasolina/widgets/button.widget.dart';
import 'package:alcool_gasolina/widgets/input.widget.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

class SubmitForm extends StatelessWidget {
  final MoneyMaskedTextController _gasController;
  final MoneyMaskedTextController _alcController;
  final Function() _submitFnc;
  final bool _busy;

  const SubmitForm(
      {required MoneyMaskedTextController gasCtrl,
      required MoneyMaskedTextController alcCtrl,
      required Function() submitFnc,
      required bool busy})
      : _alcController = alcCtrl,
        _gasController = gasCtrl,
        _submitFnc = submitFnc,
        _busy = busy;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Input(
            titulo: "Gasolina",
            cntrler: _gasController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Input(
            titulo: "Álcool",
            cntrler: _alcController,
          ),
        ),
        const SizedBox(height: 20),
        LoadingButton(
          titulo: "Calcular",
          onPressed: _submitFnc,
          tamanhoFonte: 25,
          invert: false,
          busy: _busy,
        ),
      ],
    );
  }
}
