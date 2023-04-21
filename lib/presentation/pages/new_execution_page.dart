import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/constants/colors.dart';
import 'package:jdoodle/constants/icons.dart';
import 'package:jdoodle/constants/text_styles.dart';
import 'package:jdoodle/providers/code_execution_state_provider.dart';
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
    ref.read(codeExecutionStateProvider.notifier).addListener((state) {
      if (state is SuccessState && state.awaitingUserInput) {
        focusNode.requestFocus();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final executionState = ref.watch(codeExecutionStateProvider);
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
                      // _buildSuccessState(executionState, executionService,
                      //     focusNode, controller),
                      SuccessScreen(state: executionState),
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
}

class SuccessScreen extends ConsumerStatefulWidget {
  const SuccessScreen({
    required this.state,
    super.key,
  });
  final SuccessState state;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SuccessScreen();
}

class _SuccessScreen extends ConsumerState<SuccessScreen> {
  final executionService = CodeExecutionService();
  final focusNode = FocusNode();
  final controller = TextEditingController();
  @override
  void initState() {
    ref.read(codeExecutionStateProvider.notifier).addListener((state) {
      if (state is SuccessState && state.awaitingUserInput) {
        focusNode.requestFocus();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.state.executionTime != null)
          Container(
            width: double.infinity,
            color: AppColors.secondaryBackgroudColor,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Executed in ${widget.state.executionTime}s',
                  style: TextStyles.body,
                ),
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.state.stdout,
            style: TextStyles.body,
          ),
        ),
        if (widget.state.awaitingUserInput)
          TextField(
            controller: controller,
            focusNode: focusNode,
            style: TextStyles.body,
            onEditingComplete: () => executionService.sendInputMessageToServer(
              input: '${controller.text} \n',
            ),
          )
      ],
    );
  }
}
