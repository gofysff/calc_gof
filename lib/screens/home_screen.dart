// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:calc_gof/constants/constant_colors.dart';
import 'package:calc_gof/constants/constant_colors.dart';
import 'package:calc_gof/logic/storage_results.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/calculator_panel_button.dart';
import '../widgets/gradient_line.dart';
import '../widgets/text_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right:20.0, top: 20.0),
            child: Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                  backgroundColor: kButtonEqualColor,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.card_giftcard_rounded),
                  onPressed: () =>
                      context.read<StorageResults>()..changeButtonPanel()),
            ),
          ),
          const Expanded(
            flex: 2,
            child: TextPanel(),
          ),
          const GradientLine(height: 10),

          //! Main field with buttons
          Expanded(
            flex: 5,
            child: Consumer<StorageResults>(
              builder: (context, storageResults, child) => CalcPanelButtons(
                  isIncludeTrigonometry: storageResults.isIncludeTrigonometry,
                  onTap: (bValue) =>
                      context.read<StorageResults>()..updateData(bValue)),
            ),
          ),
        ],
      ),
    );
  }
}
