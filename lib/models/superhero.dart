class SuperHero {
    final String id;
    final String name;
    final String? imageUrl;

    final Map<String, dynamic> powerstats;
    final Map<String, dynamic> biography;
    final Map<String, dynamic> appearance;
    final Map<String, dynamic> work;
    final Map<String, dynamic> connections;

    SuperHero({
        required this.id,
        required this.name,
        required this.imageUrl,
        required this.powerstats,
        required this.biography,
        required this.appearance,
        required this.work,
        required this.connections,
    });

    factory SuperHero.fromJson(Map<String, dynamic> json) {
        return SuperHero(
            id: json["id"].toString(),
            name: json["name"] ?? "Unknown",
            imageUrl: json["image"]?["url"],
            powerstats: Map<String, dynamic>.from(json["powerstats"] ?? {}),
            biography: Map<String, dynamic>.from(json["biography"] ?? {}),
            appearance: Map<String, dynamic>.from(json["appearance"] ?? {}),
            work: Map<String, dynamic>.from(json["work"] ?? {}),
            connections: Map<String, dynamic>.from(json["connections"] ?? {}),
        );
    }
}