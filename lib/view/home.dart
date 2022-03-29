import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';
import '../widget/add_task.dart';
import '../widget/todo_content.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 20), vsync: this);
  }

  TabBar tabBar() {
    return const TabBar(
      tabs: [
        Tab(
          icon: Icon(Icons.home),
        ),
        Tab(
          icon: Icon(Icons.rss_feed),
        ),
        Tab(
          icon: Icon(Icons.perm_identity),
        ),
      ],
      labelColor: Colors.white,
      unselectedLabelColor: Colors.tealAccent,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorPadding: EdgeInsets.all(5.0),
      indicatorColor: Colors.red,
      // onTap: () {},
    );
  }

  TabBarView tabBarViewAndTodoContent() {
    return TabBarView(
      children: [
        const TodoContent(),
        Container(
          color: Colors.orange,
        ),
        Container(
          color: Colors.lightGreen,
        ),
      ],
    );
  }

  Container titleWithHero() {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      child: Column(
        children: [
          Container(
            width: 20,
          ),
          const Text(
            "Convrtx",
            style: TextStyle(fontSize: 35, color: Colors.white),
          ),
          Text(
            "${Provider.of<TaskData>(
              context,
            ).taskCount} tasks",
            style: const TextStyle(fontSize: 35, color: Colors.white),
          ),
          const Hero(
            tag: 'hero',
            child: Center(
              child: Icon(
                Icons.yard,
                color: Colors.tealAccent,
                size: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }

  floatingActionButton() {
    return Container(
      margin: const EdgeInsets.only(top: 165),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) => AddTask());
            },
            child: const Icon(
              Icons.add,
              size: 50,
            ),
            isExtended: true,
            backgroundColor: Colors.deepOrangeAccent,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        color: Colors.yellow,
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: Stack(children: [
              tabBarViewAndTodoContent(),
              titleWithHero(),
              floatingActionButton()
            ]),
            appBar: tabBar(),
            backgroundColor: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
