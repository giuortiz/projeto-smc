import 'package:injector/injector.dart';
import 'package:projeto_smc/model/infra/entity/feedback-entity.dart';
import 'package:projeto_smc/model/infra/repository/feedback/feedback-repository.dart';
import 'package:projeto_smc/model/infra/repository/feedback/i-feedback-repository.dart';
import 'package:z_components/infra/db/database.dart';


class AppConfiguration {
  static Future init() async {
    var injector = Injector.appInstance;

    injector.clearAll();

    var db = new ZDatabase(
        dbName: "FEEDBACKSMC",
        version: 1,
        entities: [
          FeedbackEntity()
        ]);

    try {
      await db.init();
      //banco
      injector.registerDependency<IFeedbackRepository>(
          (_) => new FeedbackRepository());

    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
