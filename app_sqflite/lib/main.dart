import 'package:flutter/material.dart';
import './models/aluno.dart';
import './helpers/database_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AlunoList(),
    );
  }
}

class AlunoList extends StatefulWidget {
  const AlunoList({super.key});

  @override
  _AlunoListState createState() => _AlunoListState();
}

class _AlunoListState extends State<AlunoList> {
  // Inicializando a variável com uma lista vazia
  List<Aluno> _alunos = [];

  @override
  void initState() {
    super.initState();
    _loadAlunos();
  }

  // Carregar todos os alunos do banco
  _loadAlunos() async {
    List<Aluno> alunos = await DatabaseHelper.getAlunos();
    setState(() {
      _alunos = alunos;
    });
  }

  // Exibir a tela de adicionar ou editar aluno
  _showAlunoForm([Aluno? aluno]) {
    TextEditingController nomeController =
        TextEditingController(text: aluno?.nome ?? '');
    TextEditingController disciplinaController =
        TextEditingController(text: aluno?.disciplina ?? '');
    TextEditingController notaController =
        TextEditingController(text: aluno?.nota.toString() ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(aluno == null ? 'Adicionar Aluno' : 'Editar Aluno'),
          content: Column(
            children: [
              TextField(
                controller: nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: disciplinaController,
                decoration: InputDecoration(labelText: 'Disciplina'),
              ),
              TextField(
                controller: notaController,
                decoration: InputDecoration(labelText: 'Nota'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (aluno == null) {
                  // Inserir novo aluno
                  DatabaseHelper.insertAluno(
                    Aluno(
                      nome: nomeController.text,
                      disciplina: disciplinaController.text,
                      nota: double.parse(notaController.text),
                    ),
                  );
                } else {
                  // Atualizar aluno
                  DatabaseHelper.updateAluno(
                    Aluno(
                      id: aluno.id,
                      nome: nomeController.text,
                      disciplina: disciplinaController.text,
                      nota: double.parse(notaController.text),
                    ),
                  );
                }
                Navigator.pop(context);
                _loadAlunos();
              },
              child: Text(aluno == null ? 'Salvar' : 'Atualizar'),
            ),
          ],
        );
      },
    );
  }

  // Exibir a lista de alunos
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alunos'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _showAlunoForm();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _alunos.length,
        itemBuilder: (context, index) {
          final aluno = _alunos[index];
          return ListTile(
            title: Text(aluno.nome),
            subtitle: Text('${aluno.disciplina} - ${aluno.nota}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                await DatabaseHelper.deleteAluno(aluno.id!);
                _loadAlunos();
              },
            ),
            onTap: () {
              _showAlunoForm(aluno);
            },
          );
        },
      ),
    );
  }
}
