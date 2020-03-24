function search(data) {
    $('#autocomplete-ajax').autocomplete({
        lookup: data,
        onSelect: function (suggestion) {
            showSelectMsg(suggestion.data)
        },
        onHint: function (hint) {
            $('#autocomplete-ajax-x').val(hint);
        },
        onInvalidateSelection: function () {
            location.reload()
            $("#pageLine").show()
        }
    });
}

function pagiantion(data, pageSize) {
    $("#pageLine").pagination(data.length, {
        callback: function (num) {
            getPageData(num, pageSize)
        },
        prev_text: "上一页",
        next_text: "下一页",
        items_per_page: pageSize,
        num_display_entries: 3,
        current_page: 0,
        num_edge_entries: 2
    })
}