import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jdoodle/constants/colors.dart';
import 'package:jdoodle/constants/icons.dart';
import 'package:jdoodle/constants/text_styles.dart';
import 'package:jdoodle/models/code_execution_state.dart';
import 'package:jdoodle/providers/code_execution_state_provider.dart';
import 'package:jdoodle/services/code_execution_service.dart';
import 'package:jdoodle/services/websocket_service.dart';

class ExecutionPage extends ConsumerStatefulWidget {
  const ExecutionPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExecutionPageState();
}

class _ExecutionPageState extends ConsumerState<ExecutionPage> {
  _ExecutionPageState();
  final focusNode = FocusNode();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(codeExecutionStateProvider.notifier).resetState();
    });
    ref.read(codeExecutionStateProvider.notifier).addListener((state) {
      if (state is ExecutionSuccessState && state.awaitingUserInput) {
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
              child: Builder(builder: (context) {
                if (executionState is ExecutionLoadingState) {
                  return _buildExecutionLoadingState(
                    executionState,
                  );
                } else if (executionState is ExecutionErrorState) {
                  return _buildExecutionErrorState(executionState);
                } else {
                  return SuccessScreen(
                      state: executionState as ExecutionSuccessState);
                }
              }),
            )));
  }

  PreferredSizeWidget _buildAppBarRow() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Run',
            style: TextStyles.header,
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

  Widget _buildExecutionLoadingState(ExecutionLoadingState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          state.waitMessage,
          style: TextStyles.body,
        ),
        const SizedBox(
          height: 10,
        ),
        const SpinKitChasingDots(
          color: AppColors.secondaryBackgroudColor,
        ),
      ],
    );
  }

  Widget _buildExecutionErrorState(ExecutionErrorState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          state.errorMessage,
          style: TextStyles.header,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            WebsocketService().reestablishConnection();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              Text(
                'Go back',
                style: TextStyles.header,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class SuccessScreen extends ConsumerStatefulWidget {
  const SuccessScreen({
    required this.state,
    super.key,
  });
  final ExecutionSuccessState state;
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
      if (state is ExecutionSuccessState && state.awaitingUserInput) {
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
          padding: const EdgeInsets.all(8),
          child: Text(
            widget.state.stdout,
            style: TextStyles.codeOutput,
          ),
        ),
        if (widget.state.awaitingUserInput)
          TextField(
            controller: controller,
            focusNode: focusNode,
            style: TextStyles.codeOutput,
            onEditingComplete: () => executionService.sendInputMessageToServer(
              input: '${controller.text} \n',
            ),
          )
      ],
    );
  }
}
