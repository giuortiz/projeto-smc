import 'package:projeto_smc/model/infra/entity/feedback-entity.dart';
import 'package:z_components/infra/interfaces/i-command.dart';
import 'package:z_components/infra/interfaces/i-query.dart';

abstract class IFeedbackRepository
    implements ICommand<FeedbackEntity>, IQuery<FeedbackEntity> {
  Future<List<FeedbackEntity>> buscarBatidasPorTempo();
}
