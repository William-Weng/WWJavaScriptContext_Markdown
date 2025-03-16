function convertMarkdown(source, tables) {
    let converter = new showdown.Converter({ tables: tables, simpleLineBreaks: true });
    let htmlResult = converter.makeHtml(source)
    return htmlResult;
}
