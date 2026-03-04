import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: TodoList()));

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  final TextEditingController _controller = TextEditingController();
  List<String> tarefas = [];

  void _adicionarTarefa() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        tarefas.add(_controller.text);
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Minha Lista de Tarefas')),
      body: ListView.builder(
        itemCount: tarefas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tarefas[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => setState(() => tarefas.removeAt(index)),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(child: TextField(controller: _controller)),
            IconButton(icon: Icon(Icons.add), onPressed: _adicionarTarefa),
          ],
        ),
      ),
    );
  }
}