import 'package:flutter/material.dart';
import 'package:projeto_smc/model/infra/repository/feedback/i-feedback-repository.dart';
import 'package:projeto_smc/model/ioc/app-configuration.dart';
import 'home-view.dart';
import 'package:injector/injector.dart';

class SplashScreenView extends StatefulWidget {
  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  int nota = 0;
  int decimal = 00;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      AppConfiguration.init().then((_) async {
        await _calcularTotal();
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeView(
                    nota: nota,
                    decimal: decimal,
                  )),
        );
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new Center(
        child: new CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
          strokeWidth: 4.0,
        ),
      ),
    );
  }

  Future _calcularTotal() async {
    double total = 0.0;
    IFeedbackRepository _feedbackRepository =
        Injector.appInstance.getDependency<IFeedbackRepository>();
    var list = await _feedbackRepository.buscarBatidasPorTempo();
    if (list != null && list.length != 0) {
      for (int i = 0; i < list.length; i++) {
        total = total + double.parse(list[i].notaTotal);
      }
      total = (total / list.length);
      var totalString = total.toStringAsPrecision(3);
      var totalSplit = totalString.split(".");
      nota = int.parse(totalSplit[0]);
      decimal = int.parse(totalSplit[1]);
    }
  }
}
