String formatText(String text) {
  return text.split('\n').map((row) {
    if (row.isNotEmpty) {
      return row[0].toUpperCase() + row.substring(1);
    }
    return row;
  }).join('\n');
}
