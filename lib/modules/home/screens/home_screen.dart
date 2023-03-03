import 'package:flutter/material.dart';
import 'package:labo001/modules/home/controller/home_controller.dart';
import 'package:labo001/modules/modules.dart';
import 'package:provider/provider.dart';

import '../home.dart';

///
class HomeScreen extends StatefulWidget {
  ///
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController homeController;

  @override
  void initState() {
    homeController = Provider.of<HomeController>(context, listen: false);
    Future<void>(() {
      homeController.getwWords();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthController>(context, listen: false);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeController.getwWords();
        },
        child: const Icon(Icons.refresh),
      ),
      body: Consumer<HomeController>(
        builder: (BuildContext context, HomeController controller, _) =>
            controller.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) =>
                        GestureDetector(
                      onTap: () async {
                        await auth.signOut();
                      },
                      child: ListTile(
                        title: Text(controller.words![index]),
                        style: ListTileStyle.list,
                      ),
                    ),
                    itemCount: controller.words?.length ?? 0,
                  ),
      ),
    );
  }
}
