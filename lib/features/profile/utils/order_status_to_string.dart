String orderStatusToString(int status) {
  switch (status) {
    case 0:
      return 'Shipped';
    case 1:
      return 'Delivered';
    case 2:
      return 'Received';
    default:
      return 'Unknown';
  }
}
