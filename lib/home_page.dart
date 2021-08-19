import 'package:flutter/material.dart';
import 'package:ignite_flutter_todo_list/builder_widget.dart';
import 'package:ignite_flutter_todo_list/home_controller.dart';

import 'screens/done_screen.dart';
import 'screens/task_screen.dart';
import 'shared/models/todo_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final _pageViewController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  var _selectedIndex = 0;

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageViewController,
        children: <Widget>[
          BuilderWidget<List<ToDoItem>>(
            controller: controller.listTaskPending,
            builder: (context, state) => TaskScreen(
              itemList: state,
              onAddItem: controller.onAddItem,
              onCompleteItem: controller.onCompleteItem,
              onRemoveItem: controller.onRemoveToDoItem,
            ),
          ),
          BuilderWidget<List<ToDoItem>>(
            controller: controller.listTaskConcluded,
            builder: (context, state) => DoneScreen(
              itemList: state,
              onRemoveItem: controller.onRemoveDoneItem,
              onResetItem: controller.onResetItem,
            ),
          ),
        ],
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);

          _pageViewController.animateToPage(
            _selectedIndex,
            duration: Duration(milliseconds: 350),
            curve: Curves.easeOut,
          );
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outline_blank),
            label: 'Pendentes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: 'Concluídas',
          ),
        ],
      ),
    );
  }
}
