import 'package:flutter/material.dart';
import 'package:jdoodle/constants/icons.dart';
import 'package:jdoodle/constants/text_styles.dart';
import 'package:jdoodle/models/execution_response.dart';
import 'package:jdoodle/providers/execution_provider.dart';
import 'package:jdoodle/services/execution_response_stream.dart';
import 'package:jdoodle/services/new_execution_response_stream.dart';

class ExecutionPage extends StatelessWidget {
  ExecutionPage({super.key});
  final executionResponseStream = ExecutionResponseStream();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBarRow(),
        body: StreamBuilder(
          stream: executionResponseStream.stream,
          builder: (context, AsyncSnapshot<ExecutionResponse> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            final data = snapshot.data;
            if (data is EndOfExecutionsResponse) {
              return Text(
                data.computeTime.toString(),
                style: const TextStyle(fontSize: 50, color: Colors.blue),
              );
            }
            if (data is StdOutReceivedResponse) {
              return Text(data.stdout);
            }
            return const Text("not compute time");
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBarRow() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Run'),
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
}

class NewExecutionPage extends StatefulWidget {
  NewExecutionPage({super.key});

  @override
  State<NewExecutionPage> createState() => _NewExecutionPageState();
}

class _NewExecutionPageState extends State<NewExecutionPage> {
  late NewExecutionResponseStream executionResponseStream;
  @override
  void initState() {
    executionResponseStream = NewExecutionResponseStream();
    super.initState();
  }

  @override
  void dispose() {
    // executionResponseStream.stream
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBarRow(),
        body: ColoredBox(
          color: Colors.black,
          child: StreamBuilder(
            stream: executionResponseStream.stream,
            builder: (context, AsyncSnapshot<ExecutionState> snapshot) {
              final data = snapshot.data;
              final d = data?.awaitingUserResponse ?? false;
              return Column(
                children: [
                  if (snapshot.connectionState == ConnectionState.waiting)
                    _buildLoadingBody(),
                  Text(
                      style: TextStyles.body,
                      '${d ? 'awaiting response' : 'not awaiting response'}, ${data?.body}, ${data?.executionTime} '),
                  if (data != null && data.awaitingUserResponse)
                    _buildStdInput(),
                  if (data != null && !data.awaitingUserResponse)
                    Text(
                      data.body,
                      style: TextStyles.body,
                    ),
                ],
              );
            },
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

  Widget _buildLoadingBody() {
    return const CircularProgressIndicator();
  }

  Widget _buildStdInput() {
    return Column(
      children: [
        Text(
          'STDIN',
          style: TextStyles.body,
        ),
        TextField(
          style: TextStyles.body,
        ),
      ],
    );
  }
}
