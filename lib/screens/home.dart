import 'package:flutter/material.dart';
import '../service/api.dart';
import '../widgets/character_card.dart';
import '../theme/app_theme.dart';

class HomePage extends StatefulWidget {
    const HomePage({Key? key}) : super(key: key);

    @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    final api = HeroApiService();
    late Future<List<HeroModel>> _heroesFuture;

    @override
    void initState() {
        super.initState();
        _heroesFuture = api.getAllHeroes();
    }

    @override
    Widget build(BuildContext context) {
        final t = Theme.of(context);
        return Scaffold(
            backgroundColor: t.colorScheme.background,
            appBar: AppBar(
                title: Text(
                    "SuperHero API",
                    style: t.textTheme.titleLarge?.copyWith(
                        color: AppTheme.textWhite,
                    ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
            ),
            body: FutureBuilder<List<HeroModel>>(
                future: _heroesFuture,
                builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child: CircularProgressIndicator(
                                color: t.colorScheme.primary,
                            ),
                        );
                    }
                    if (snapshot.hasError) {
                        return Center(
                            child: Text(
                                "Erro: ${snapshot.error}",
                                style: t.textTheme.bodyLarge,
                            ),
                        );
                    }
                    final heroes = snapshot.data ?? [];
                    return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView.builder(
                            itemCount: heroes.length,
                            itemBuilder: (context, index) {
                                return CharacterCard(hero: heroes[index]);
                            },
                        ),
                    );
                },
            ),
        );
    }
}
