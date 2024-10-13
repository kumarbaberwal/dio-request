import 'package:dioreq/common/bloc/display_data_cubit.dart';
import 'package:dioreq/common/bloc/display_data_state.dart';
import 'package:dioreq/domain/entity/todo_entity.dart';
import 'package:dioreq/domain/usecase/get_todo_use_case.dart';
import 'package:dioreq/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: BlocProvider(
        create: (context) =>
            DisplayDataCubit<List<TodoEntity>>()..getData(sl<GetTodoUseCase>()),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child:
              BlocBuilder<DisplayDataCubit<List<TodoEntity>>, DisplayDataState>(
            builder: (context, state) {
              if (state is DataLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is DataLoaded<List<TodoEntity>>) {
                final todos = state.data;
                return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("ID: ${todo.id}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text("Title: ${todo.title}"),
                            const SizedBox(height: 4),
                            Text("Completed: ${todo.completed}"),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              if (state is DataLoadFailure) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
