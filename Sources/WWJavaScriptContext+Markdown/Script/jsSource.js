function convertMarkdown(source) {
    let converter = new showdown.Converter()
    let htmlResult = converter.makeHtml(source)
    return htmlResult;
}
