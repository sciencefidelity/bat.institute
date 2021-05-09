class Bat {
  final int id;
  String name;

  Bat(this.id, this.name);

  factory Bat.fromJson(Map<String, dynamic> bat) =>
      Bat(_toInt(bat['id']), bat['name']);

  Map toJson() => {'id': id, 'name': name};
}


int _toInt(id) => id is int ? id : int.parse(id);
