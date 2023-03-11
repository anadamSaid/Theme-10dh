/* global $ */
$(document).ready(function () {
    var $searchWidget = $('#search_widget');
    var $searchBox    = $searchWidget.find('input[type=text]');
    var searchURL     = $searchWidget.attr('data-search-controller-url');
    var $clearButton  = $searchWidget.find('i.clear');
    $.widget('prestashop.psBlockSearchAutocomplete', $.ui.autocomplete, {
        _renderItem: function (ul, product) {
            var image = (product.cover) ? product.cover : prestashop.urls.no_picture_image;
            var $img = $('<img class="autocomplete-thumbnail" src="'+image.bySize.small_default.url+'">');
            return $("<li>")
                .append($("<a>")
                    .append($img)
                    .append($("<span>").html(product.name).addClass("product"))
                ).appendTo(ul)
            ;
        }
    });

    var isMobile = function() {
        return $(window).width() < 768;
    };
    var autocompletePosition = function() {
      return {
        my: 'right top',
        at: 'right bottom',
        of: isMobile() ? '.header-top' : '#search_widget',
      };
    };
    $('#searchbarid').on('submit',function(e) {
        e.preventDefault();
        $("#hide-on-loading").hide();
        $("#loadingbtnind").addClass("btn-loading");
        setTimeout(() => {
            e.currentTarget.submit();
            // $('#searchbarid').submit();
        }, 800);
    });
    $searchBox.psBlockSearchAutocomplete({
        position: autocompletePosition(),
        source: function (query, response) {
            // console.log("Loading");
                $("#hide-on-loading").hide();
                $("#loadingbtnind").addClass("btn-loading");

            $.post(searchURL, {
                s: query.term,
                resultsPerPage: 10
            }, null, 'json')
            .then(function (resp) {
                $("#loadingbtnind").removeClass("btn-loading");
                $("#hide-on-loading").show();
                response(resp.products);
                setTimeout(() => {
                    $('.searchbar-autocomplete').prepend('<div class="search-rt">Products</div>');
                    $('.searchbar-autocomplete').append('<button onclick="document.getElementById(\'searchbarid\').submit()" type="submit" class="btn search-show-all" title="Search">Show all results for "'+query.term.replace(/<[^>]+>/g, '')+'" <i class="material-icons-outlined">keyboard_arrow_right</i></button>');
                }, 300);
                // console.log(resp.products);
            })
            .fail(function(response){
                // console.log(response);
                $("#loadingbtnind").removeClass("btn-loading");
                $("#hide-on-loading").show();

            });
        },
        select: function (event, ui) {
            var url = ui.item.url;
            window.location.href = url;
        },
    }).psBlockSearchAutocomplete("widget").addClass('searchbar-autocomplete');

    $(window).resize(function() {
      $searchBox.psBlockSearchAutocomplete({
        position: autocompletePosition(),
      });
      $searchBox.keyup();
    });

    $clearButton.click(function() {
        $searchBox.val("");
        $clearButton.hide();
    });

    $searchBox.keyup(function() {
        $clearButton.toggle($searchBox.val() !== "" && isMobile());
    });
});
