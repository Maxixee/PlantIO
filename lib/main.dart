import 'package:flutter/material.dart';

void main() {
  runApp(PlantIOApp());
}

class Plant {
  final String name;
  final String description;

  Plant({
    required this.name,
    required this.description,
  });
}


class PlantIOApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAB8654), // Cor de fundo marrom
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'PlantIO',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/plant_image.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'Começar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
    ),
    Plant(
      name: 'Pé de alface',
      description: 'Descrição: Planta de alface popular em saladas.\n\n'
          'Usos Medicinais: Possui propriedades calmantes e ajuda na digestão.\n\n'
          'Usos Gerais: Consumido em saladas, sanduíches e pratos variados.\n\n'
          'Curiosidades: A alface é uma das primeiras plantas cultivadas na história.',
    ),
    Plant(
      name: 'Pé de tomate',
      description: 'Descrição: Planta que dá tomates.\n\n'
          'Usos Medicinais: Rica em licopeno, que pode ajudar a reduzir o risco de doenças cardíacas.\n\n'
          'Usos Gerais: Usado em molhos, saladas e como ingrediente em diversos pratos.\n\n'
          'Curiosidades: O tomate foi originalmente cultivado como planta ornamental.',
    ),
    Plant(
      name: 'Pé de manjericão',
      description: 'Descrição: Erva aromática usada em culinária.\n\n'
          'Usos Medicinais: Possui propriedades antibacterianas e anti-inflamatórias.\n\n'
          'Usos Gerais: Usado em molhos, pratos italianos e como tempero.\n\n'
          'Curiosidades: Manjericão é um símbolo de amor e riqueza em algumas culturas.',
    ),
    Plant(
      name: 'Pé de hortelã',
      description: 'Descrição: Planta de hortelã usada para chás.\n\n'
          'Usos Medicinais: Alivia problemas digestivos e é um descongestionante natural.\n\n'
          'Usos Gerais: Usado em chás, sobremesas e como tempero.\n\n'
          'Curiosidades: A hortelã pode crescer rapidamente e se espalhar se não for controlada.',
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

class PlantInfoScreen extends StatelessWidget {
  final Plant plant;

  PlantInfoScreen({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAB8654),
      appBar: AppBar(
        title: Text(
          'Informações de Planta',
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/plant_info_image.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              plant.name,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                plant.description,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Ação ao clicar no botão Adicionar saber
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  child: Text(
                    'Adicionar saber',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Ação ao clicar no botão Buscar
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  child: Text(
                    'Consultar saberes',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
