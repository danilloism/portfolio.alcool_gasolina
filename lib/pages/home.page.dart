import 'package:alcool_gasolina/widgets/logo.widget.dart';
import 'package:alcool_gasolina/widgets/submit-form.widget.dart';
import 'package:alcool_gasolina/widgets/success.widget.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MoneyMaskedTextController _gasCtrl = MoneyMaskedTextController();
  MoneyMaskedTextController _alcCtrl = MoneyMaskedTextController();
  bool _busy = false;
  bool _completed = false;
  String _resultText = "Compensa álcool";
  Color _color = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 1200),
        color: _color,
        child: ListView(
          children: [
            Logo(),
            _completed
                ? Success(
                    result: _resultText,
                    reset: _reset,
                  )
                : SubmitForm(
                    gasCtrl: _gasCtrl,
                    alcCtrl: _alcCtrl,
                    submitFnc: _calculate,
                    busy: _busy,
                  )
          ],
        ),
      ),
    );
  }

  Future _calculate() {
    double alc =
        double.parse(_alcCtrl.text.replaceAll(RegExp(r'[,.]'), '')) / 100;
    double gas =
        double.parse(_gasCtrl.text.replaceAll(RegExp(r'[,.]'), '')) / 100;
    double res = alc / gas;

    setState(() {
      _color = Colors.deepPurpleAccent;
      _completed = false;
      _busy = true;
    });

    if (alc <= 0 || gas <= 0) {
      return Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _resultText = "Dados inválidos! Tente novamente.";
          _busy = false;
          _completed = true;
        });
      });
    }

    return Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _resultText = res >= 0.7
            ? "Compensa utilizar a Gasolina!"
            : "Compensa utilizar Álcool!";
        _busy = false;
        _completed = true;
      });
    });
  }

  void _reset() {
    setState(() {
      _alcCtrl = MoneyMaskedTextController();
      _gasCtrl = MoneyMaskedTextController();
      _completed = false;
      _busy = false;
      _color = Colors.deepPurple;
    });
  }
}
