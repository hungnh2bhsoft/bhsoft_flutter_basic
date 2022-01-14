import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/sql_bloc.dart';

class SqlScreen extends StatelessWidget {
  const SqlScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SqlBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SQL'),
        ),
        body: DogList(),
        floatingActionButton: RefreshButton(),
      ),
    );
  }
}

class RefreshButton extends StatelessWidget {
  const RefreshButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<SqlBloc>().add(SqlUpdateEvent());
      },
      child: Icon(Icons.refresh),
    );
  }
}

class DogList extends StatelessWidget {
  const DogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SqlBloc, SqlState>(
      builder: (context, state) {
        if (state is SqlUpdating) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SqlUpdated) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final dog = state.dogs[index];
              return ListTile(
                title: Text(dog.name),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    context.read<SqlBloc>().add(
                          SqlDeleteEvent(dog: dog),
                        );
                  },
                ),
                subtitle: Text(dog.age.toString()),
                onTap: null,
              );
            },
            itemCount: state.dogs.length,
          );
        } else
          return Text("Loading");
      },
    );
  }
}
