import 'package:flutter/material.dart';
import '../models/conversion_model.dart';
import '../utils/constants.dart';

class HistoryPanel extends StatelessWidget {
  final List<ConversionModel> history;
  final bool isCompact;

  const HistoryPanel({Key? key, required this.history, this.isCompact = false})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppConstants.historyLabel,
              style: TextStyle(
                fontSize: isCompact ? 16 : 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo.shade700,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: history.isEmpty
                  ? Center(
                      child: Text(
                        AppConstants.noConversionsMessage,
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: history.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Text(
                            history[index].formattedHistory,
                            style: TextStyle(
                              fontSize: isCompact ? 12 : 14,
                              fontFamily: 'monospace',
                              color: Colors.grey.shade700,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
