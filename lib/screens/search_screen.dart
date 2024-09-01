import 'package:flutter/material.dart';
import '../models/plant.dart';
import 'plant_info_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Plant> _allPlants = [
    Plant(
      name: 'Pé de morango',
      description: 'Descrição: Planta que produz morangos.\n\n'
          'Usos Medicinais: Melhora a digestão e ajuda a manter a saúde dos olhos.\n\n'
          'Usos Gerais: Consumido como fruta, em sobremesas e sucos.\n\n'
          'Curiosidades: Os morangos são tecnicamente um "fruto agregado".',
      knowledgeList: [],
    ),
    Plant(
      name: 'Pé de alface',
      description: 'Descrição: Planta de alface popular em saladas.\n\n'
          'Usos Medicinais: Possui propriedades calmantes e ajuda na digestão.\n\n'
          'Usos Gerais: Consumido em saladas, sanduíches e pratos variados.\n\n'
          'Curiosidades: A alface é uma das primeiras plantas cultivadas na história.',
      knowledgeList: [],
    ),
    Plant(
      name: 'Pé de tomate',
      description: 'Descrição: Planta que dá tomates.\n\n'
          'Usos Medicinais: Rica em licopeno, que pode ajudar a reduzir o risco de doenças cardíacas.\n\n'
          'Usos Gerais: Usado em molhos, saladas e como ingrediente em diversos pratos.\n\n'
          'Curiosidades: O tomate foi originalmente cultivado como planta ornamental.',
      knowledgeList: [],
    ),
    Plant(
      name: 'Pé de manjericão',
      description: 'Descrição: Erva aromática usada em culinária.\n\n'
          'Usos Medicinais: Possui propriedades antibacterianas e anti-inflamatórias.\n\n'
          'Usos Gerais: Usado em molhos, pratos italianos e como tempero.\n\n'
          'Curiosidades: Manjericão é um símbolo de amor e riqueza em algumas culturas.',
      knowledgeList: [],
    ),
    Plant(
      name: 'Pé de hortelã',
      description: 'Descrição: Planta de hortelã usada para chás.\n\n'
          'Usos Medicinais: Alivia problemas digestivos e é um descongestionante natural.\n\n'
          'Usos Gerais: Usado em chás, sobremesas e como tempero.\n\n'
          'Curiosidades: A hortelã pode crescer rapidamente e se espalhar se não for controlada.',
      knowledgeList: [],
    ),
  ];
  List<Plant> _filteredPlants = [];

  @override
  void initState() {
    super.initState();
    _filteredPlants = [];
  }

  void _filterPlants(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredPlants = [];
      } else {
        _filteredPlants = _allPlants
            .where((plant) =>
                plant.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _navigateToPlantInfo(Plant plant) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlantInfoScreen(plant: plant),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAB8654),
      appBar: AppBar(
        title: Text(
          'Pesquisar Plantas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt, color: Colors.white),
            onPressed: () {
              // Ação ao clicar no ícone de câmera
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _filterPlants,
              decoration: InputDecoration(
                hintText: 'Digite o nome da planta',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (_searchController.text.isNotEmpty) // Verifica se o campo de pesquisa não está vazio
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredPlants.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(
                          _filteredPlants[index].name,
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          _navigateToPlantInfo(_filteredPlants[index]);
                        },
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

  

