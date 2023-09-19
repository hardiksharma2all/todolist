import 'package:flutter/material.dart';
import 'package:todolist/screens/complete_tasks_screen.dart';
import 'package:todolist/screens/favourite_tasks_screen.dart';
import 'package:todolist/screens/pending_tasks_screen.dart';

import 'add_task_screen.dart';
import 'custom_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  static const id = 'tabs_Screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': const PendingTasksScreen(), 'title': 'To-Do List'},
    {'pageName': const CompleteTasksScreen(), 'title': 'Completed Tasks'},
    {'pageName': const FavouriteTasksScreen(), 'title': 'Favourite Tasks'}
  ];
  var _selectedPageIndex = 0;
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.viewInsetsOf(context).bottom),
                child: const AddTaskScreen(),
              ),
            ));
    // print(MediaQuery.sizeOf(context).height);
    // print(MediaQuery.sizeOf(context).width);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(_pageDetails[_selectedPageIndex]['title']),
        actions: _pageDetails[_selectedPageIndex]['title'] == 'To-Do List'
            ? []
            : [
                IconButton(
                    onPressed: () => _addTask(context),
                    icon: const Icon(Icons.add))
              ],
      ),
      drawer: const CustomDrawer(),
      body: _pageDetails[_selectedPageIndex]['pageName'],
      floatingActionButton:
          _pageDetails[_selectedPageIndex]['title'] == 'To-Do List'
              ? FloatingActionButton.extended(
                  onPressed: () => _addTask(context),
                  label: const Text('Add Task'),
                  icon: const Icon(Icons.add))
              : null,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.pending_actions_outlined), label: 'Pending'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_all_outlined), label: 'Completed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined), label: 'Favourite')
        ],
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
      ),
    );
  }
}
