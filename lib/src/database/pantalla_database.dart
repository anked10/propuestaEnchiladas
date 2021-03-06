import 'package:propuesta_enchiladas/src/database/database_provider.dart';
import 'package:propuesta_enchiladas/src/models/pantalla_model.dart';

class PantallaDatabase {
  final dbprovider = DatabaseProvider.db;

  insertarPantalla(PantallaModel pantalla) async {
    try {
      final db = await dbprovider.database;

      final res = await db.rawInsert("INSERT OR REPLACE INTO Pantalla (id_pantalla,pantalla_nombre,pantalla_orden,"
          "pantalla_foto,pantalla_estado,pantalla_categorias) "
          "VALUES ('${pantalla.idPantalla}','${pantalla.pantallaNombre}','${pantalla.pantallaOrden}',"
          "'${pantalla.pantallaFoto}','${pantalla.pantallaEstado}','${pantalla.pantallCategoria}'"
          ")");
      return res;
    } catch (exception) {
      print(exception);
    }
  }

  Future<List<PantallaModel>> obtenerPantallas() async {
    final db = await dbprovider.database;
    final res = await db.rawQuery("SELECT * FROM Pantalla where pantalla_estado='1' and id_pantalla <> '3'");

    List<PantallaModel> list = res.isNotEmpty ? res.map((c) => PantallaModel.fromJson(c)).toList() : [];

    return list;
  }

  Future<List<PantallaModel>> obtenerPantallaPorId(String id) async {
    final db = await dbprovider.database;
    final res = await db.rawQuery("SELECT * FROM Pantalla where id_pantalla='$id'");

    List<PantallaModel> list = res.isNotEmpty ? res.map((c) => PantallaModel.fromJson(c)).toList() : [];

    return list;
  }
}
