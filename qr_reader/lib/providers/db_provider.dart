import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_reader/models/scan_model.dart';
export 'package:qr_reader/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static dynamic _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    // Path de donde almacenaremos la BBDD
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'ScansDB.db');

    //Crear BBDD
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT
        );
        ''');
      },
    );
  }

  Future<int> nuevoScanRaw(ScanModel nuevoScan) async {
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;

    //Verificar la bbdd
    final db = await database;
    final res = await db.rawInsert('''
          INSERT INTO Scans(id, tipo, valor)
          VALUES($id, '$tipo', '$valor');
      ''');

    return res;
  }

  Future<int> nuevoScan(ScanModel nuevoScan) async {
    //Verificar que la bbdd está lista
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());

    return res;
  }

  Future<ScanModel> getScanById(int idScan) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [idScan]);

    return res.isNotEmpty
        ? ScanModel.fromJson(res.first)
        : ScanModel(valor: '');
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await database;
    final res = await db.query('Scans');

    return res.isNotEmpty
        ? res.map((s) => ScanModel.fromJson(s)).toList()
        : <ScanModel>[];
  }

  Future<List<ScanModel>> getScansByTipo(String tipo) async {
    final db = await database;
    final res = await db.rawQuery('''
      SELECT * FROM Scans WHERE tipo = '$tipo';
    ''');

    return res.isNotEmpty
        ? res.map((s) => ScanModel.fromJson(s)).toList()
        : <ScanModel>[];
  }

  Future<int> updateScan(ScanModel nuevoScan) async {
    final db = await database;

    final res = await db.update('Scans', nuevoScan.toJson(),
        where: 'id = ?', whereArgs: [nuevoScan.id]);

    return res;
  }

  Future<int> deleteScan(int idScan) async {
    final db = await database;

    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [idScan]);

    return res;
  }

  Future<int> deleteAllScans() async {
    final db = await database;

    final res = await db.rawDelete('''
      DELETE FROM Scans;
    ''');

    return res;
  }
}
