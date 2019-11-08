import 'package:z_components/infra/db/database-utils.dart';
import 'package:z_components/infra/entities/z-entity.dart';
import 'package:z_components/infra/schema/z-column.dart';
import 'package:z_components/infra/schema/z-table.dart';

class FeedbackEntity extends ZEntity {
  bool temDifLixo;
  int dispLixeiras;
  int lixoNoChao;
  String notaTotal;

  FeedbackEntity(
      {this.dispLixeiras,
      this.notaTotal,
      this.lixoNoChao,
      this.temDifLixo,
      int id})
      : super(id: id);

  @override
  void buildTable() {
    setTableName();
    this.table = new ZTable(version: 1, columns: [
      new ZColumn(
          version: 1,
          name: "ID",
          type: DatabaseUtils.INTEGER,
          primaryKey: true,
          autoIncrement: true,
          notNull: true),
      new ZColumn(
          version: 1, name: "DISPLIXEIRAS", type: DatabaseUtils.INTEGER),
      new ZColumn(version: 1, name: "LIXONOCHAO", type: DatabaseUtils.INTEGER),
      new ZColumn(version: 1, name: "TEMDIFLIXO", type: DatabaseUtils.INTEGER),
      new ZColumn(version: 1, name: "NOTATOTAL", type: DatabaseUtils.TEXT),
    ]);
  }

  @override
  ZEntity fromMap(Map<String, dynamic> map) {
    this.id = map["ID"];
    this.dispLixeiras = map["DISPLIXEIRAS"];
    this.lixoNoChao = map["LIXONOCHAO"];
    this.temDifLixo = map["ORIGEMCONECTIVIDADE"] == 1;
    this.notaTotal = map["NOTATOTAL"];

    return this;
  }

  @override
  void setTableName() {
    tableName = "FEEDBACKLIXO";
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "ID": this.id,
      "DISPLIXEIRAS": this.dispLixeiras,
      "LIXONOCHAO": this.lixoNoChao,
      "TEMDIFLIXO": this.temDifLixo,
      "NOTATOTAL": this.notaTotal
    };
  }
}
