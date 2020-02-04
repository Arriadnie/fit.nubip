
document.querySelectorAll('.category-item').forEach(function(item) {
    item.addEventListener('click', categoryClick, true);
});

function categoryClick(categoryItem) {
    let item = categoryItem.target;
    let categoryId = item.getAttribute('data-category-id');
    let categorySlug = item.getAttribute('data-category-slug');

    //window.history.pushState({}, '', `posts/${categorySlug}`);

    Helper.callService('postService', {
            methodName: 'getPostByCategory',
            categoryId: categoryId
        }, function(s) {
        document.querySelectorAll('.news-wrapper')[0].innerHTML = s;
    })
}
