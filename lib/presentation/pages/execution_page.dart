import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jdoodle/constants/icons.dart';
import 'package:jdoodle/models/execution_response.dart';
import 'package:jdoodle/services/execution_response_stream.dart';

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
            if (data is ComputeTimeExecutionResponse) {
              return Text(
                data.computeTime.toString(),
                style: const TextStyle(fontSize: 50, color: Colors.blue),
              );
            }
            if (data is StdOutExecutionResponse) {
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
