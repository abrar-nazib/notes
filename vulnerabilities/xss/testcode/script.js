function escapeHTML(html) {
  // weak sanitization
  return html.replace("<", "&lt;").replace(">", "&gt;");
}
