import 'knowledge.dart';

class Plant {
  final String name;
  final String description;
  final List<Knowledge> knowledgeList;

  Plant({
    required this.name,
    required this.description,
    required this.knowledgeList,
  });
}
