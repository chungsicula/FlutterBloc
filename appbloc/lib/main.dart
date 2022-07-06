import 'package:appbloc/bloc/myobject_bloc.dart';
import 'package:appbloc/bloc/myobject_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => MyobjectBloc(),
        child: const CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyobjectBloc _localBloc = BlocProvider.of<MyobjectBloc>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Screen 1')),
      body: Center(
        child: BlocBuilder<MyobjectBloc, MyobjectState>(
          builder: (context, state) {
            return Column(
              children: [
                Text(state.counter.toString(),
                    style: Theme.of(context).textTheme.headline1),
                ElevatedButton(
                    onPressed: () {
                      context.read<MyobjectBloc>().add(SubtractEvent());
                    },
                    child: const Text("Giảm")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return BlocProvider.value(
                              value: _localBloc,
                              child: const PassDataScreen(),
                            );
                          },
                        ),
                      );
                    },
                    child: const Text("Chuyển trang"))
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.read<MyobjectBloc>().add(AddEvent()),
      ),
    );
  }
}

class PassDataScreen extends StatefulWidget {
  const PassDataScreen({Key? key}) : super(key: key);

  @override
  State<PassDataScreen> createState() => _PassDataScreenState();
}

class _PassDataScreenState extends State<PassDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen 2')),
      body: Center(
        child: BlocBuilder<MyobjectBloc, MyobjectState>(
          builder: (context, state) {
            return Column(
              children: [
                Text(state.counter.toString(),
                    style: Theme.of(context).textTheme.headline1),
                ElevatedButton(
                    onPressed: () {
                      context.read<MyobjectBloc>().add(SubtractEvent());
                    },
                    child: const Text("Giảm"))
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.read<MyobjectBloc>().add(AddEvent()),
      ),
    );
  }
}
