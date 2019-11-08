import 'package:projeto_smc/model/infra/entity/feedback-entity.dart';
import 'package:z_components/infra/abstract-repository.dart';

import 'i-feedback-repository.dart';


class FeedbackRepository extends AbstractRepository<FeedbackEntity>

    implements IFeedbackRepository {
  @override
  Future<FeedbackEntity> findById(int id) async {
    try {
      var res = await db.queryFirstAsync("SELECT * FROM FEEDBACKLIXO WHERE ID = ?",
          arguments: [id]);

      return new FeedbackEntity()..fromMap(res);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<FeedbackEntity>> buscarBatidasPorTempo() async {
    try {
      var res = await db.queryMultipleAsync(
          "SELECT * FROM FEEDBACKLIXO",
        );

      return res.map((b) => new FeedbackEntity()..fromMap(b)).toList();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<FeedbackEntity> findLast() {
    // TODO: implement findLast
    return null;
  }

}
