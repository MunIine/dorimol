enum OrderStatus {
  pending,
  confirmed,
  shipped,
  delivered,
  cancelled,
  unknown
}

extension OrderStatusExtension on OrderStatus {
  String get label {
    switch (this) {
      case OrderStatus.pending:
        return "В обработке";
      case OrderStatus.confirmed:
        return "Подтвержден";
      case OrderStatus.shipped:
        return "Отправлен";
      case OrderStatus.delivered:
        return "Доставлен";
      case OrderStatus.cancelled:
        return "Отменен";
      case OrderStatus.unknown:
        return "Неизвестно";
    }
  }
}