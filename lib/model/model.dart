class SportsData {
  String id;
  String name;
  String image;

  SportsData({
    required this.name,
    required this.id,
    required this.image,
  });

  factory SportsData.fromMap({required dataVote}) {
    return SportsData(
      id: dataVote['id'],
      name: dataVote['name'],
      image: dataVote['image'],
    );
  }
}

class Food {
  String id;
  String name;
  String image;
  Food({
    required this.name,
    required this.id,
    required this.image,
  });

  factory Food.fromMap({required dataVote}) {
    return Food(
      id: dataVote['id'],
      name: dataVote['name'],
      image: dataVote['image'],
    );
  }
}

class Travel {
  String id;
  String name;
  String image;
  Travel({
    required this.name,
    required this.id,
    required this.image,
  });

  factory Travel.fromMap({required dataVote}) {
    return Travel(
      id: dataVote['id'],
      name: dataVote['name'],
      image: dataVote['image'],
    );
  }
}

class Music {
  String id;
  String name;
  String image;
  Music({
    required this.name,
    required this.id,
    required this.image,
  });

  factory Music.fromMap({required dataVote}) {
    return Music(
      id: dataVote['id'],
      name: dataVote['name'],
      image: dataVote['image'],
    );
  }
}
