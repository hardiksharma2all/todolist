import 'package:flutter/material.dart';
import 'package:todolist/screens/bin_screen.dart';
import 'package:todolist/screens/tabs_screen.dart';
import 'package:todolist/utils/dimensions.dart';

import '../blocs/bloc_exports.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'HamBurger Menu',
              style: TextStyle(fontSize: Dimension.font18),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Dimension.height25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
                    return ListTile(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, TabsScreen.id);
                      },
                      leading: const Icon(Icons.task_alt_outlined),
                      title: Text(
                        'My Tasks',
                        style: TextStyle(fontSize: Dimension.font15),
                      ),
                      trailing: Text(
                        '${state.pendingTasks.length}',
                        style: TextStyle(fontSize: Dimension.font15),
                      ),
                    );
                  }),
                  Divider(height: Dimension.height10),
                  BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
                    return ListTile(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, BinScreen.id);
                      },
                      leading: const Icon(Icons.delete_outline),
                      title: Text(
                        'Bin',
                        style: TextStyle(fontSize: Dimension.font15),
                      ),
                      trailing: Text(
                        '${state.removeTasks.length}',
                        style: TextStyle(fontSize: Dimension.font15),
                      ),
                    );
                  }),
                  BlocBuilder<SwitchBloc, SwitchState>(
                    builder: (context, state) {
                      return SwitchListTile.adaptive(
                        title: Text(
                          'Dark Mode',
                          style: TextStyle(fontSize: Dimension.font15),
                        ),
                        inactiveTrackColor: Colors.blueGrey,
                        value: state.switchValue,
                        onChanged: (value) {
                          value
                              ? context.read<SwitchBloc>().add(SwitchOnEvent())
                              : context
                                  .read<SwitchBloc>()
                                  .add(SwitchOffEvent());
                        },
                      );
                    },
                  ),
                  // Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
