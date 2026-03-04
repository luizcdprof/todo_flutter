import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: TodoList()));

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  List<String> tarefas = [];

  void _showAddTaskDialog() {
    final TextEditingController dialogController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Adicionar Tarefa'),
        content: TextField(
          controller: dialogController,
          decoration: InputDecoration(hintText: 'Digite a tarefa'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              if (dialogController.text.isNotEmpty) {
                setState(() {
                  tarefas.add(dialogController.text);
                });
              }
              Navigator.of(context).pop();
            },
            child: Text('Adicionar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Lista de Tarefas'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blue[50],
      body: ListView.builder(
        itemCount: tarefas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tarefas[index]),
            tileColor: index % 2 == 0 ? Colors.blue[50] : Colors.blue[100],
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => setState(() => tarefas.removeAt(index)),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}