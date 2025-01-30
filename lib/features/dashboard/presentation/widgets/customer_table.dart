import 'package:cloud_garage/core/constants/app_colors.dart';
import 'package:cloud_garage/core/utils/responsive.dart';
import 'package:flutter/material.dart';

import '../../../../common/components/default_text.dart';
import '../../domain/entities/recent_customers_invoices.dart';

class CustomerTable extends StatelessWidget {
  final RecentCustomersInvoices recentInvoices;
  final IResponsive responsive;

  const CustomerTable({
    required this.responsive,
    required this.recentInvoices,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      List<double> columnsFlex = [2, 2, 2, 2];

      double totalFlexs = columnsFlex.fold(
          0, (previousValue, number) => number + previousValue);
      totalFlexs = totalFlexs + totalFlexs / 12;
      return PaginatedDataTable(
        columns: [
          DataColumn(
            tooltip: "Ew3a el Tool Tip YABAAAA", //Todo: make it professional
            label: Container(
              width: constraint.maxWidth / totalFlexs * columnsFlex[0],
              padding: EdgeInsets.symmetric(horizontal: responsive.width(4)),
              child: DefaultText(
                "Customer Name",
                fontWeight: FontWeight.w600,
                responsive: responsive,
                textAlign: TextAlign.center,
                fontColor: AppColors.primaryPrimary.withValues(alpha: 0.7),
              ),
            ),
          ),
          DataColumn(
            //Todo: add tooltip here also
            label: Container(
              width: constraint.maxWidth / totalFlexs * columnsFlex[1],
              padding: EdgeInsets.symmetric(horizontal: responsive.width(4)),
              child: DefaultText(
                "Stock Taken",
                fontWeight: FontWeight.w600,
                responsive: responsive,
                textAlign: TextAlign.center,
                fontColor: AppColors.primaryPrimary.withValues(alpha: 0.7),
              ),
            ),
          ),
          DataColumn(
            //Todo: add tooltip here also
            label: Container(
              width: constraint.maxWidth / totalFlexs * columnsFlex[2],
              padding: EdgeInsets.symmetric(horizontal: responsive.width(4)),
              child: DefaultText(
                "Invoice",
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
                responsive: responsive,
                fontColor: AppColors.primaryPrimary.withValues(alpha: 0.7),
              ),
            ),
          ),
          DataColumn(
            //Todo: add tooltip here also
            label: Container(
              width: constraint.maxWidth / totalFlexs * columnsFlex[3],
              padding: EdgeInsets.symmetric(horizontal: responsive.width(4)),
              child: DefaultText(
                "Date",
                fontWeight: FontWeight.w600,
                responsive: responsive,
                textAlign: TextAlign.center,
                fontColor: AppColors.primaryPrimary.withValues(alpha: 0.7),
              ),
            ),
          ),
        ],
        source: _CustomerDataSource(
            recentInvoices: recentInvoices,
            responsive: responsive,
            constraint: constraint,
            columnsFlex: columnsFlex,
            totalFlexs: totalFlexs),
        rowsPerPage: 5,
        columnSpacing: 0, // it should still 0 for the blue color on the rows
        horizontalMargin: 16,
        dataRowMaxHeight: 48,
        headingRowHeight: 48,
      );
    });
  }
}

class _CustomerDataSource extends DataTableSource {
  final RecentCustomersInvoices recentInvoices;
  final IResponsive responsive;
  final BoxConstraints constraint;
  final List<double> columnsFlex;
  final double totalFlexs;

  _CustomerDataSource(
      {required this.constraint,
      required this.totalFlexs,
      required this.recentInvoices,
      required this.columnsFlex,
      required this.responsive});

  @override
  DataRow? getRow(int index) {
    if (index >= recentInvoices.invoices.length) return null;

    final invoice = recentInvoices.invoices[index];
    return DataRow.byIndex(
      index: index,
      color: WidgetStateProperty.resolveWith(
        (states) => Colors.white,
      ),
      cells: [
        DataCell(
          Container(
            width: constraint.maxWidth / totalFlexs * columnsFlex[0],
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    topLeft: Radius.circular(16)),
                color: index.isOdd ? AppColors.primaryPrimaryLight : null),
            child: Padding(
              padding: EdgeInsets.only(
                  left: responsive.width(8), right: responsive.width(2)),
              child: DefaultText(
                invoice.customerName,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        DataCell(
          Container(
            width: constraint.maxWidth / totalFlexs * columnsFlex[1],
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: index.isOdd ? AppColors.primaryPrimaryLight : null),
            child: DefaultText(
              invoice.stockTaken,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        DataCell(
          Container(
            width: constraint.maxWidth / totalFlexs * columnsFlex[2],
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: index.isOdd ? AppColors.primaryPrimaryLight : null),
            child: DefaultText(
              invoice.invoiceNumber,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        DataCell(
          Container(
            width: constraint.maxWidth / totalFlexs * columnsFlex[3],
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    topRight: Radius.circular(16)),
                color: index.isOdd ? AppColors.primaryPrimaryLight : null),
            child: Padding(
              padding: EdgeInsets.only(
                  right: responsive.width(8), left: responsive.width(2)),
              child: DefaultText(
                _formatDate(invoice.date),
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => recentInvoices.invoices.length;

  @override
  int get selectedRowCount => 0;

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}
