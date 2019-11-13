import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:projeto_smc/model/infra/entity/feedback-entity.dart';
import 'package:projeto_smc/model/infra/repository/feedback/i-feedback-repository.dart';
import 'package:injector/injector.dart';
import 'package:projeto_smc/view/page-notas-view.dart';

class HomeView extends StatefulWidget {
  int nota;
  int decimal;
  List<int> distribuicaoNotas = new List(4);

  HomeView({this.nota, this.decimal, this.distribuicaoNotas});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  IFeedbackRepository _feedbackRepository =
      Injector.appInstance.getDependency<IFeedbackRepository>();
  List<FeedbackEntity> _list;
  Animation animation;
  Animation animation2;

  AnimationController animationController;

  @override
  void initState() {
    _list = new List<FeedbackEntity>();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = IntTween(begin: 0, end: widget.nota).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    animation2 = IntTween(begin: 0, end: widget.decimal).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text("MEGA LIXO"),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PageNotasView()),
          );
        },
        backgroundColor: Colors.blue,
        child: new Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return new Container(
      margin: EdgeInsets.all(20.0),
      child: new Material(
        elevation: 4.0,
        child: new Center(
          child: new ListView(
            //   mainAxisSize: MainAxisSize.max,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                alignment: Alignment.center,
                color: Colors.transparent,
                height: MediaQuery.of(context).size.height / 5,
                child: new Text(
                  "ROCK IN RIO",
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black),
                ),
              ),
              new Container(
                  child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    child: new Text(
                      "NOTA:   ",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  new Container(
                    child: AnimatedBuilder(
                        animation: animationController,
                        builder: (context, child) {
                          return new Container(
                            child: new Text(animation.value.toString(),
                                style: TextStyle(fontSize: 70.0)),
                          );
                        }),
                  ),
                  new Text(
                    ",",
                    style: TextStyle(fontSize: 70.0),
                  ),
                  new Container(
                    child: AnimatedBuilder(
                        animation: animationController,
                        builder: (context, child) {
                          return new Container(
                            child: new Text(
                              animation2.value.toString(),
                              style: TextStyle(fontSize: 70.0),
                            ),
                          );
                        }),
                  )
                ],
              )),
              new Container(
                color: Colors.transparent,
                width: 1,
                height: MediaQuery.of(context).size.height / 8,
              ),
              new Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                child: new Material(
                    elevation: 4.0,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        AnimatedCircularChart(
                          holeLabel: 'NOTAS',
                          labelStyle:
                              TextStyle(fontSize: 16.0, color: Colors.black),
                          duration: Duration(milliseconds: 500),
                          size: Size.fromRadius(70.0),
                          initialChartData: <CircularStackEntry>[
                            new CircularStackEntry(
                              <CircularSegmentEntry>[
                                new CircularSegmentEntry(
                                  (widget.distribuicaoNotas[0] == null)
                                      ? 0
                                      : widget.distribuicaoNotas[0].toDouble(),
                                  Colors.red,
                                  rankKey: 'alert',
                                ),
                                new CircularSegmentEntry(
                                  (widget.distribuicaoNotas[1] == null)
                                      ? 0
                                      : widget.distribuicaoNotas[1].toDouble(),
                                  Colors.orange,
                                  rankKey: 'remaining',
                                ),
                                new CircularSegmentEntry(
                                  (widget.distribuicaoNotas[2] == null)
                                      ? 0
                                      : widget.distribuicaoNotas[2].toDouble(),
                                  Colors.grey,
                                  rankKey: 'remaining 2',
                                ),
                                new CircularSegmentEntry(
                                  (widget.distribuicaoNotas[3] == null)
                                      ? 0
                                      : widget.distribuicaoNotas[3].toDouble(),
                                  Colors.green,
                                  rankKey: 'complete',
                                ),
                              ],
                              rankKey: 'progress',
                            ),
                          ],
                        ),
                        new Container(
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Container(
                                child: new Row(
                                  children: <Widget>[
                                    new Container(
                                      width: 10.0,
                                      height: 10.0,
                                      color: Colors.green,
                                    ),
                                    new Container(
                                      child: new Text("  10 - 8"),
                                    )
                                  ],
                                ),
                              ),
                              new Container(
                                child: new Row(
                                  children: <Widget>[
                                    new Container(
                                      width: 10.0,
                                      height: 10.0,
                                      color: Colors.grey,
                                    ),
                                    new Container(
                                      child: new Text("  7 - 5"),
                                    )
                                  ],
                                ),
                              ),
                              new Container(
                                child: new Row(
                                  children: <Widget>[
                                    new Container(
                                      width: 10.0,
                                      height: 10.0,
                                      color: Colors.orange,
                                    ),
                                    new Container(
                                      child: new Text("  5 - 3"),
                                    )
                                  ],
                                ),
                              ),
                              new Container(
                                child: new Row(
                                  children: <Widget>[
                                    new Container(
                                      width: 10.0,
                                      height: 10.0,
                                      color: Colors.red,
                                    ),
                                    new Container(
                                      child: new Text("  < 2"),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
