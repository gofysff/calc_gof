import 'package:calc_gof/logic/storage_results.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextPanel extends StatelessWidget {
  const TextPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // SizedBox(width: double.infinity),
          Consumer<StorageResults>(
            builder: (context, storageResults, child) => Text(
                storageResults.historyEvaluation,
                style: const TextStyle(color: Colors.white60, fontSize: 24),
                textAlign: TextAlign.end),
          ),
          Consumer<StorageResults>(
            builder: (context, storageResults, child) => Text(
                storageResults.currentStateEvaluation,
                style: const TextStyle(color: Colors.white, fontSize: 34),
                textAlign: TextAlign.end),
          ),
        ],
      ),
    );
  }
}
