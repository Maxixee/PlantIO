import 'package:flutter/material.dart';
import '../models/plant.dart';
import '../models/knowledge.dart';


class AddKnowledgeScreen extends StatefulWidget {
  final Plant plant;

  AddKnowledgeScreen({required this.plant});

  @override
  _AddKnowledgeScreenState createState() => _AddKnowledgeScreenState();
}

class _AddKnowledgeScreenState extends State<AddKnowledgeScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _saveKnowledge() {
    String title = _titleController.text;
    String description = _descriptionController.text;

    if (title.isNotEmpty && description.isNotEmpty) {
      // Adiciona o novo saber à lista de saberes da planta
      setState(() {
        widget.plant.knowledgeList.add(
          Knowledge(
            title: title,
            description: description,
          ),
        );
      });

      // Exibir um feedback ao usuário
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saber adicionado com sucesso!')),
      );

      // Limpar os campos após salvar
      _titleController.clear();
      _descriptionController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAB8654),
      appBar: AppBar(
        title: Text(
          'Adicionar Saber',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Título',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Descrição',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: _saveKnowledge,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  'Salvar Saber',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}