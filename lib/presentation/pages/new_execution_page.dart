import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/constants/colors.dart';
import 'package:jdoodle/constants/icons.dart';
import 'package:jdoodle/constants/text_stlyes.dart';
import 'package:jdoodle/models/code_execution_state.dart';
import 'package:jdoodle/providers/code_execution_state_provider.dart';
import 'package:jdoodle/providers/execution_provider.dart';
import 'package:jdoodle/services/code_execution_service.dart';

class NewExecutionPage extends ConsumerStatefulWidget {
  const NewExecutionPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewExecutionPageState();
}

class _NewExecutionPageState extends ConsumerState<NewExecutionPage> {
  _NewExecutionPageState();
  final focusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(codeExecutionStateProvider.notifier).resetState();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final executionState = ref.watch(codeExecutionStateProvider);
    final executionService = CodeExecutionService();
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBarRow(),
        body: Container(
          color: AppColors.backgroundColor,
          width: double.infinity,
          child: executionState is LoadingState
              ? _buildLoadingState(
                  executionState,
                )
              : Column(
                  children: [
                    if (executionState is ExecutionErrorState)
                      _buildExecutionErrorState(
                        executionState,
                      ),
                    if (executionState is SuccessState)
                      _buildSuccessState(
                        executionState,
                        executionService,
                        focusNode,
                      ),
                  ],
                ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBarRow() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Run',
            style: TextStyles.body,
          ),
          Row(
            children: const [
              playIcon,
              SizedBox(
                width: 8,
              ),
              filterIcon
            ],
          )
        ],
      ),
      // leading: Text('run'),
      backgroundColor: Colors.black,
    );
  }

  Widget _buildLoadingState(LoadingState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          state.waitMessage,
          style: TextStyles.body,
        ),
        const CircularProgressIndicator(),
      ],
    );
  }

  Widget _buildExecutionErrorState(ExecutionErrorState state) {
    return Text(state.errorMessage);
  }

  Widget _buildSuccessState(
    SuccessState state,
    CodeExecutionService executionService,
    FocusNode focusNode,
  ) {
    return Column(children: [
      Text(
        state.stdout,
        style: TextStyles.body,
      ),
      if (state.executionTime != null)
        Text(
          '${state.stdout} in ${state.executionTime}s',
          style: TextStyles.body,
        ),
      if (state.awaitingUserInput)
        TextField(
            focusNode: focusNode,
            style: TextStyles.body,
            onEditingComplete: () =>
                executionService.sendInputMessageToServer(input: '\n'),
            // onEditingComplete: ,
            onChanged: (value) =>
                executionService.sendInputMessageToServer(input: value))
    ]);
  }
}
