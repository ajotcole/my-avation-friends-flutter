import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyAviationFriends());
}

class MyAviationFriends extends StatelessWidget {
  const MyAviationFriends({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Aviation Friends',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(widget.title),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
      ),
      body: Center(
        child: ListView( children: const <Widget>[
          Card(child: _SampleCard(cardName: "Card 1")),
          Card(child: _SampleCard(cardName: "Card name 2")),
          Card(child: _SampleCard(cardName: "Card name 3"))
        ],)
      )
    );
  }
}

class _SampleCard extends StatelessWidget {
  const _SampleCard({required this.cardName});
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 100,
      child: Center(child: Text(cardName)),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: "/settings",
      builder: (context, state) => const SettingsPage(),
    )
  ],
);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
      ),
      body: Center(
          child: ListView( children:  <Widget>[
            ElevatedButton(onPressed: () => context.go("/settings"), child: const Text("Go to Settings page"))
          ],)
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Settings"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go("/"),
          child: const Text("Go to home page"),),
      ),
    );
  }
}
