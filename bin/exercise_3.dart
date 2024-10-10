import 'dart:convert' as convert;

void main(List<String> arguments) {
  String json = '''
[
  {"first":"Reed", "last":"Richards", "email":"outofmind@algonquincollege.com"},
  {"first":"Sue", "last":"Storm", "email":"outofsight@algonquincollege.com"},
  {"first":"Johnny", "last":"Storm", "email":"hotguy@algonquincollege.com"},
  {"first":"Ben", "last":"Grimm", "email":"killedbypaper@algonquincollege.com"}
]
''';

  List<dynamic> decodedList = convert.jsonDecode(json);

  List<Map<String, String>> fantasticList = decodedList.map((item) {
    return Map<String, String>.from(item);
  }).toList();

  Students students = Students(fantasticList);

  print('Initial List: ');
  students.output();

  students.sort('first');
  print('Sorted by first name: ');
  students.output();

  students.plus({
    "first": "Valeria",
    "last": "Richards",
    "email": "spawn@algonquincollege.com"
  });
  print('Added a new student');
  students.output();

  students.remove('first', 'Valeria');
  print('Removing student by first name: ');
  students.output();
}

class Students {
  List<Map<String, String>> people;

  Students(this.people);

  sort(String field) {
    people.sort((a, b) => a[field]!.compareTo(b[field]!));
  }

  output() {
    for (var person in people) {
      print(person);
    }
  }

  plus(Map<String, String> person) {
    people.add(person);
  }

  remove(String field, String value) {
    people.removeWhere((person) => person[field] == value);
  }
}
