import 'package:flutter/material.dart';
import '../models/plant.dart';

class ViewKnowledgeScreen extends StatelessWidget {
  final Plant plant;

  ViewKnowledgeScreen({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAB8654),
      appBar: AppBar(
        title: Text(
          'Consultar Saberes',
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
        child: ListView.builder(
          itemCount: plant.knowledgeList.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(
                  plant.knowledgeList[index].title,
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  plant.knowledgeList[index].description,
                  style: TextStyle(color: Colors.white70),
                ),
                onTap: () {
                  // Ação ao clicar no saber (exibir detalhes, por exemplo)
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
