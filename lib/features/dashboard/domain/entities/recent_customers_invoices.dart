// Model class for customer invoices
class RecentCustomersInvoices {
  final List<Invoice> invoices;

  RecentCustomersInvoices({required this.invoices});
}

// Model class for a single invoice
class Invoice {
  final String customerName;
  final String stockTaken;
  final String invoiceNumber;
  final DateTime date;

  Invoice({
    required this.customerName,
    required this.stockTaken,
    required this.invoiceNumber,
    required this.date,
  });
}
