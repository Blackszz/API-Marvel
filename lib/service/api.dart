import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class HeroModel {
    final String id;
    final String name;
    final String fullName;
    final String imageUrl;

    HeroModel({
        required this.id,
        required this.name,
        required this.fullName,
        required this.imageUrl,
    });

    factory HeroModel.fromJson(Map<String, dynamic> json) {
        return HeroModel(
            id: json['id'] ?? '',
            name: json['name'] ?? '',
            fullName: json['biography']?['full-name'] ?? '',
            imageUrl: json['image']?['url'] ?? '',
        );
    }
}

class HeroApiService {
    final String _baseUrl = "https://superheroapi.com/api/${dotenv.env['SUPERHERO_TOKEN']}";

    Future<HeroModel?> getHeroById(int id) async {
        try {
            final response = await http.get(Uri.parse("$_baseUrl/$id"));
            if (response.statusCode != 200) return null;
            final data = json.decode(response.body);
            if (data["response"] == "error") return null;
            return HeroModel.fromJson(data);
        } catch (e) {
            return null;
        }
    }

    Future<List<HeroModel>> searchHeroByName(String query) async {
        try {
            final response = await http.get(Uri.parse("$_baseUrl/search/$query"));
            if (response.statusCode != 200) return [];
            final data = json.decode(response.body);
            if (data["response"] == "error") return [];
            List results = data["results"];
            return results.map((json) => HeroModel.fromJson(json)).toList();
        } catch (e) {
            return [];
        }
    }

    Future<List<HeroModel>> getHeroesRange(int start, int end) async {
        List<HeroModel> heroes = [];
        for (int id = start; id <= end; id++) {
            final hero = await getHeroById(id);
            if (hero != null) heroes.add(hero);
        }
        return heroes;
    }

    Future<List<HeroModel>> getAllHeroesSmart() async {
        List<HeroModel> heroes = [];
        int id = 1;
        int errors = 0;
        while (errors < 15) {
            final hero = await getHeroById(id);
            if (hero != null) {
                heroes.add(hero);
                errors = 0; // reset
            } else {
                errors++;
            }
            id++;
        }
        return heroes;
    }
}