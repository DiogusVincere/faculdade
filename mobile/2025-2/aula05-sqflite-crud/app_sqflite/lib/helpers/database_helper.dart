import 'package:path/path.dart';
import '../models/aluno.dart'; // O modelo Aluno que criamos antes
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


class DatabaseHelper {
  static Database? _database;

  // Inicializa a fábrica para Flutter Web ou plataformas que não suportam SQLite nativamente
  static void initDatabaseFactory() {
    databaseFactory = databaseFactoryFfi;
  }

  // Criação do banco de dados
  static Future<Database> get database async {
    // Certifique-se de inicializar a fábrica antes de qualquer operação com o banco de dados
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase();
      return _database!;
    }
  }

  // Inicializa o banco de dados
  static Future<Database> _initDatabase() async {
    // Certifique-se de chamar a função de inicialização da fábrica
    initDatabaseFactory();
    String path = join(await getDatabasesPath(), 'alunos.db');
    return await openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE alunos(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            disciplina TEXT,
            nota REAL
          )
        ''');
      },
      version: 1,
    );
  }

  // Função para inserir um aluno no banco de dados
  static Future<void> insertAluno(Aluno aluno) async {
    final db = await database;
    await db.insert(
      'alunos',
      aluno.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Função para recuperar todos os alunos do banco de dados
  static Future<List<Aluno>> getAlunos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('alunos');

    return List.generate(maps.length, (i) {
      return Aluno.fromMap(maps[i]);
    });
  }

  // Função para atualizar os dados de um aluno
  static Future<void> updateAluno(Aluno aluno) async {
    final db = await database;
    await db.update(
      'alunos',
      aluno.toMap(),
      where: 'id = ?',
      whereArgs: [aluno.id],
    );
  }

  // Função para deletar um aluno
  static Future<void> deleteAluno(int id) async {
    final db = await database;
    await db.delete(
      'alunos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
