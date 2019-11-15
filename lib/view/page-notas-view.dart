import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:projeto_smc/model/infra/entity/feedback-entity.dart';
import 'package:projeto_smc/model/infra/repository/feedback/i-feedback-repository.dart';
import 'package:projeto_smc/view/splash-screen-view.dart';
import 'package:injector/injector.dart';

class PageNotasView extends StatefulWidget {
  @override
  _PageNotasViewState createState() => _PageNotasViewState();
}

class _PageNotasViewState extends State<PageNotasView> {
  IFeedbackRepository _feedbackRepository =
      Injector.appInstance.getDependency<IFeedbackRepository>();
  final _pageController = PageController();
  FeedbackEntity _feedbackEntity = new FeedbackEntity();
  String _tituloAppBar = "Distribuição de lixeiras";
  String _descricaoNota =
      "Qual nota você daria para a quantidade de lixeiras no local?";
  double _percent = 0.3;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: const Color(0xffeeeee4),
      appBar: AppBar(
        title: new Text(_tituloAppBar),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return new Column(
      children: <Widget>[
        new Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 10,
          child: new Container(
            padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            child: new Text(
              _descricaoNota,
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
          color: Colors.grey,
        ),
        new Container(
          margin: EdgeInsets.only(top: 4.0),
          child: new LinearPercentIndicator(
            animation: true,
            animationDuration: 1,
            animateFromLastPercent: true,
            lineHeight: 8.0,
            percent: _percent,
            backgroundColor: Colors.white,
            progressColor: Colors.blue,
          ),
        ),
        new Expanded(
            child: new PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: <Widget>[
            _notaDistribuicao(),
            _notaLixoRua(),
            _temSeparacao(),
          ],
        ))
      ],
    );
  }

  Widget _notaDistribuicao() {
    return new ListView(
      children: <Widget>[
        ListTile(
          onTap: () {
            _pageController.jumpToPage(1);
            _feedbackEntity.dispLixeiras = 0;
            _tituloAppBar = "Lixo no chão";
            _descricaoNota =
                "Qual nota você daria para a quantidade de lixo encontrada no chão?";
            _percent = 0.6;
            setState(() {});
          },
          trailing: new Text("0"),
        ),
        new Container(
          color: Colors.grey.withOpacity(0.2),
          height: 1,
        ),
        ListTile(
          trailing: new Text("1"),
          onTap: () {
            _pageController.jumpToPage(1);
            _feedbackEntity.dispLixeiras = 1;
            _tituloAppBar = "Lixo no chão";
            _percent = 0.6;
            _descricaoNota =
                "Qual nota você daria para a quantidade de lixo encontrada no chão?";

            setState(() {});
          },
        ),
        new Container(
          color: Colors.grey.withOpacity(0.2),
          height: 1,
        ),
        ListTile(
          trailing: new Text("2"),
          onTap: () {
            _pageController.jumpToPage(1);
            _feedbackEntity.dispLixeiras = 2;
            _tituloAppBar = "Lixo no chão";
            _descricaoNota =
                "Qual nota você daria para a quantidade de lixo encontrada no chão?";
            _percent = 0.6;
            setState(() {});
          },
        ),
        new Container(
          color: Colors.grey.withOpacity(0.2),
          height: 1,
        ),
        ListTile(
          trailing: new Text("3"),
          onTap: () {
            _pageController.jumpToPage(1);
            _feedbackEntity.dispLixeiras = 3;
            _percent = 0.6;
            _descricaoNota =
                "Qual nota você daria para a quantidade de lixo encontrada no chão?";
            _tituloAppBar = "Lixo no chão";
            setState(() {});
          },
        ),
        new Container(
          color: Colors.grey.withOpacity(0.2),
          height: 1,
        ),
        ListTile(
          trailing: new Text("4"),
          onTap: () {
            _pageController.jumpToPage(1);
            _feedbackEntity.dispLixeiras = 4;
            _tituloAppBar = "Lixo no chão";
            _descricaoNota =
                "Qual nota você daria para a quantidade de lixo encontrada no chão?";
            _percent = 0.6;
            setState(() {});
          },
        ),
        new Container(
          color: Colors.grey.withOpacity(0.2),
          height: 1,
        ),
        ListTile(
          trailing: new Text("5"),
          onTap: () {
            _pageController.jumpToPage(1);
            _feedbackEntity.dispLixeiras = 5;
            _tituloAppBar = "Lixo no chão";
            _descricaoNota =
                "Qual nota você daria para a quantidade de lixo encontrada no chão?";
            _percent = 0.6;
            setState(() {});
          },
        ),
        new Container(
          color: Colors.grey.withOpacity(0.2),
          height: 1,
        ),
        ListTile(
          trailing: new Text("6"),
          onTap: () {
            _pageController.jumpToPage(1);
            _feedbackEntity.dispLixeiras = 6;
            _tituloAppBar = "Lixo no chão";
            _percent = 0.6;
            _descricaoNota =
                "Qual nota você daria para a quantidade de lixo encontrada no chão?";
            setState(() {});
          },
        ),
        new Container(
          color: Colors.grey.withOpacity(0.2),
          height: 1,
        ),
        ListTile(
          trailing: new Text("7"),
          onTap: () {
            _pageController.jumpToPage(1);
            _feedbackEntity.dispLixeiras = 7;
            _tituloAppBar = "Lixo no chão";
            _descricaoNota =
                "Qual nota você daria para a quantidade de lixo encontrada no chão?";
            _percent = 0.6;
            setState(() {});
          },
        ),
        new Container(
          color: Colors.grey.withOpacity(0.2),
          height: 1,
        ),
        ListTile(
          trailing: new Text("8"),
          onTap: () {
            _pageController.jumpToPage(1);
            _feedbackEntity.dispLixeiras = 8;
            _tituloAppBar = "Lixo no chão";
            _percent = 0.6;
            _descricaoNota =
                "Qual nota você daria para a quantidade de lixo encontrada no chão?";

            setState(() {});
          },
        ),
        new Container(
          color: Colors.grey.withOpacity(0.2),
          height: 1,
        ),
        ListTile(
          trailing: new Text("9"),
          onTap: () {
            _pageController.jumpToPage(1);
            _feedbackEntity.dispLixeiras = 9;
            _tituloAppBar = "Lixo no chão";
            _descricaoNota =
                "Qual nota você daria para a quantidade de lixo encontrada no chão?";
            _percent = 0.6;
            setState(() {});
          },
        ),
        new Container(
          color: Colors.grey.withOpacity(0.2),
          height: 1,
        ),
        ListTile(
          trailing: new Text("10"),
          onTap: () {
            _pageController.jumpToPage(1);
            _feedbackEntity.dispLixeiras = 10;
            _tituloAppBar = "Lixo no chão";
            _descricaoNota =
                "Qual nota você daria para a quantidade de lixo encontrada no chão?";
            _percent = 0.6;
            setState(() {});
          },
        ),
      ],
    );
  }

  Widget _notaLixoRua() {
    return new ListView(
      children: <Widget>[
        ListTile(
          onTap: () {
            _pageController.jumpToPage(2);
            _feedbackEntity.lixoNoChao = 0;
            _tituloAppBar = "Diferenciação de lixos";
            _descricaoNota =
                "O evento em questão possui lixeiras para diferentes tipos de lixos??";

            _percent = 1.0;
            setState(() {});
          },
          trailing: new Text("0"),
        ),
        new Container(
          color: Colors.grey.withOpacity(0.2),
          height: 1,
        ),
        ListTile(
          trailing: new Text("1"),
          onTap: () {
            _pageController.jumpToPage(2);
            _feedbackEntity.lixoNoChao = 1;
            _descricaoNota =
                "O evento em questão possui lixeiras para diferentes tipos de lixos??";
            _tituloAppBar = "Diferenciação de lixos";
            _percent = 1.0;
            setState(() {});
          },
        ),
        new Container(
          color: Colors.grey.withOpacity(0.2),
          height: 1,
        ),
        ListTile(
          trailing: new Text("2"),
          onTap: () {
            _pageController.jumpToPage(2);
            _feedbackEntity.lixoNoChao = 2;
            _tituloAppBar = "Diferenciação de lixos";
            _descricaoNota =
                "O evento em questão possui lixeiras para diferentes tipos de lixos??";
            _percent = 1.0;
            setState(() {});
          },
        ),
        new Container(
          color: Colors.grey.withOpacity(0.2),
          height: 1,
        ),
        ListTile(
          trailing: new Text("3"),
          onTap: () {
            _pageController.jumpToPage(2);
            _feedbackEntity.lixoNoChao = 3;
            _tituloAppBar = "Diferenciação de lixos";
            _percent = 1.0;
            _descricaoNota =
                "O evento em questão possui lixeiras para diferentes tipos de lixos??";
            setState(() {});
          },
        ),
        new Container(
          color: Colors.grey.withOpacity(0.2),
          height: 1,
        ),
        ListTile(
          trailing: new Text("4"),
          onTap: () {
            _pageController.jumpToPage(2);
            _feedbackEntity.lixoNoChao = 4;
            _tituloAppBar = "Diferenciação de lixos";
            _percent = 1.0;
            _descricaoNota =
                "O evento em questão possui lixeiras para diferentes tipos de lixos??";
            setState(() {});
          },
        ),
        new Container(
          color: Colors.grey.withOpacity(0.2),
          height: 1,
        ),
        ListTile(
          trailing: new Text("5"),
          onTap: () {
            _pageController.jumpToPage(2);
            _feedbackEntity.lixoNoChao = 5;
            _descricaoNota =
                "O evento em questão possui lixeiras para diferentes tipos de lixos??";
            _tituloAppBar = "Diferenciação de lixos";
            _percent = 1.0;
            setState(() {});
          },
        ),
        new Container(
          color: Colors.grey.withOpacity(0.2),
          height: 1,
        ),
        ListTile(
          trailing: new Text("6"),
          onTap: () {
            _pageController.jumpToPage(2);
            _feedbackEntity.lixoNoChao = 6;
            _descricaoNota =
                "O evento em questão possui lixeiras para diferentes tipos de lixos??";
            _tituloAppBar = "Diferenciação de lixos";
            _percent = 1.0;
            setState(() {});
          },
        ),
        new Container(
          color: Colors.grey.withOpacity(0.2),
          height: 1,
        ),
        ListTile(
          trailing: new Text("7"),
          onTap: () {
            _pageController.jumpToPage(2);
            _feedbackEntity.lixoNoChao = 7;
            _tituloAppBar = "Diferenciação de lixos";
            _descricaoNota =
                "O evento em questão possui lixeiras para diferentes tipos de lixos??";
            _percent = 1.0;
            setState(() {});
          },
        ),
        new Container(
          color: Colors.grey.withOpacity(0.2),
          height: 1,
        ),
        ListTile(
          trailing: new Text("8"),
          onTap: () {
            _pageController.jumpToPage(2);
            _feedbackEntity.lixoNoChao = 8;
            _tituloAppBar = "Diferenciação de lixos";
            _descricaoNota =
                "O evento em questão possui lixeiras para diferentes tipos de lixos??";
            _percent = 1.0;
            setState(() {});
          },
        ),
        new Container(
          color: Colors.grey.withOpacity(0.2),
          height: 1,
        ),
        ListTile(
          trailing: new Text("9"),
          onTap: () {
            _pageController.jumpToPage(2);
            _feedbackEntity.lixoNoChao = 9;
            _tituloAppBar = "Diferenciação de lixos";
            _percent = 1.0;
            _descricaoNota =
                "O evento em questão possui lixeiras para diferentes tipos de lixos??";
            setState(() {});
          },
        ),
        new Container(
          color: Colors.grey.withOpacity(0.2),
          height: 1,
        ),
        ListTile(
          trailing: new Text("10"),
          onTap: () {
            _pageController.jumpToPage(2);
            _feedbackEntity.lixoNoChao = 10;
            _tituloAppBar = "Diferenciação de lixos";
            _descricaoNota =
                "O evento em questão possui lixeiras para diferentes tipos de lixos??";
            _percent = 1.0;
            setState(() {});
          },
        ),
      ],
    );
  }

  Widget _temSeparacao() {
    return new ListView(
      children: <Widget>[
        ListTile(
          trailing: new Text("Sim"),
          onTap: () {
            _feedbackEntity.temDifLixo = true;
            _percent = 1.0;
            setState(() {});
            _salvarFeedback();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SplashScreenView()),
            );
          },
        ),
        ListTile(
          trailing: new Text("Não"),
          onTap: () {
            _feedbackEntity.temDifLixo = false;
            _percent = 1.0;
            _salvarFeedback();
            setState(() {});
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SplashScreenView()),
            );
          },
        ),
      ],
    );
  }

  Future _salvarFeedback() async {
    double aux = (_feedbackEntity.temDifLixo) ? 2 : 0;
    double total = (_feedbackEntity.lixoNoChao.toDouble() +
            _feedbackEntity.dispLixeiras.toDouble() +
            aux) /
        2.2;
    _feedbackEntity.notaTotal = total.toStringAsPrecision(3);
    var res = await _feedbackRepository.insert(_feedbackEntity);
    if (res != null) {
      print("sucesso $res");
    }
  }
}
