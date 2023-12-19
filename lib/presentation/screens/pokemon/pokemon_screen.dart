import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PokemonView(),
    );
  }
}

class PokemonView extends ConsumerStatefulWidget {
  const PokemonView({super.key});

  @override
  ConsumerState<PokemonView> createState() => _PokemonViewState();
}

class _PokemonViewState extends ConsumerState<PokemonView> {
  final ScrollController _scrollController = ScrollController();

  void infinityScroll() {
    final currentPokemon = ref.read(pokemonIdsProvider);

    if (currentPokemon.length > 400) {
      _scrollController.removeListener(infinityScroll);
      return;
    }

    if (_scrollController.position.pixels + 200 >
        _scrollController.position.maxScrollExtent) {
      ref.read(pokemonIdsProvider.notifier).update((state) => [
            ...state,
            ...List.generate(30, (index) => state.length + index + 1),
          ]);
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(infinityScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          title: const Text('Pokemon'),
          floating: true,
          backgroundColor: Colors.white.withOpacity(0.8),
        ),
        const _PokemonGrid(),
      ],
    );
  }
}

class _PokemonGrid extends ConsumerWidget {
  const _PokemonGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonIds = ref.watch(pokemonIdsProvider);
    return SliverGrid.builder(
      itemCount: pokemonIds.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              Image.network(
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png',
                  fit: BoxFit.contain),
              Text('#${index + 1}')
            ],
          ),
        );
      },
    );
  }
}
