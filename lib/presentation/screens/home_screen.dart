import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miscelaneos/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
               title: const Text('Miscelaneos'),
          actions: [
            IconButton(
              onPressed: () {
                context.push('/permissions');
              },
              icon: const Icon(Icons.settings),
            ),
          ],
            ),
            const MainMenu()],
        ),
      ),
    );
  }
}
