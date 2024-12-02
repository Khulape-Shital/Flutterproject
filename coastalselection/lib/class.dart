class StateBeaches {
  final String stateName;
  final List<Beach> beaches;

  StateBeaches({required this.stateName, required this.beaches});

  factory StateBeaches.fromJson(Map<String, dynamic> json) {
    var beachesFromJson = json['beaches'] as List;
    List<Beach> beachesList = beachesFromJson.map((i) => Beach.fromJson(i)).toList();

    return StateBeaches(
      stateName: json['stateName'],
      beaches: beachesList,
    );
  }
}

class Beach {
  final String name;
  final String waveHeight;
  final String waterQuality;
  final String windSpeed;
  final String tideLevel;

  Beach({
    required this.name,
    required this.waveHeight,
    required this.waterQuality,
    required this.windSpeed,
    required this.tideLevel,
  });

  factory Beach.fromJson(Map<String, dynamic> json) {
    return Beach(
      name: json['name'],
      waveHeight: json['waveHeight'],
      waterQuality: json['waterQuality'],
      windSpeed: json['windSpeed'],
      tideLevel: json['tideLevel'],
    );
  }
}
