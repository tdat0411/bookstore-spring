//handle filter products
$('#btnFilter').click(function (event) {
    event.preventDefault();

    let categoryArr = [];
    let priceArr = [];
    //category filter
    $("#categoryFilter .form-check-input:checked").each(function () {
        categoryArr.push($(this).val());
    });

    //price filter
    $("#priceFilter .form-check-input:checked").each(function () {
        priceArr.push($(this).val());
    });

    //sort order
    let sortValue = $('input[name="radio-sort"]:checked').val();

    const currentUrl = new URL(window.location.href);
    const searchParams = currentUrl.searchParams;

    // Add or update query parameters
    searchParams.set('page', '1');
    searchParams.set('sort', sortValue);

    //reset
    searchParams.delete('category');
    searchParams.delete('price');

    if (categoryArr.length > 0) {
        searchParams.set('category', categoryArr.join(','));
    }
    if (priceArr.length > 0) {
        searchParams.set('price', priceArr.join(','));
    }

    // Update the URL and reload the page
    window.location.href = currentUrl.toString();

    //handle auto checkbox after page loading
    // Parse the URL parameters
    const params = new URLSearchParams(window.location.search);

    // Set checkboxes for 'factory'
    if (params.has('category')) {
        const categories = params.get('category').split(',');
        categories.forEach(category => {
            $(`#categoryFilter .form-check-input[value="${category}"]`).prop('checked', true);
        });
    }

    // Set checkboxes for 'price'
    if (params.has('price')) {
        const prices = params.get('price').split(',');
        prices.forEach(price => {
            $(`#priceFilter .form-check-input[value="${price}"]`).prop('checked', true);
        });
    }

    // Set radio buttons for 'sort'
    if (params.has('sort')) {
        const sort = params.get('sort');
        $(`input[type="radio"][name="radio-sort"][value="${sort}"]`).prop('checked', true);
    }
});