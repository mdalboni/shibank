String emptyText(String text) {
  if (text.trim().isEmpty) {
    return 'Campo obrigatorio';
  }
  return null;
}

String minLengthText(String text, {int size = 3}) {
  if (text.trim().length < size) {
    return 'Muito curto';
  }
  return null;
}
