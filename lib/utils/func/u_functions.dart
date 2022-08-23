String getOrderStatus(int status){
  switch (status) {
    case 0:
      return "pending";
    case 1:
      return "delivering";
    default:
      return "delivered";
  }
}