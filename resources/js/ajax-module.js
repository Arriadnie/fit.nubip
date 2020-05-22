import {isExist} from "./delta-functions";


window.postConfig = {
    categoryId: 0,
    pageNumber: 1
};

document.querySelectorAll('.category-item').forEach(function(item) {
    item.addEventListener('click', categoryClick, true);
});

function categoryClick(categoryItem) {
    let item = categoryItem.target;
    let categoryId = item.getAttribute('data-category-id');
    let categorySlug = item.getAttribute('data-category-slug');

    //window.history.pushState({}, '', `posts/${categorySlug}`);
    window.postConfig = {
        categoryId: categoryId,
        pageNumber: 0
    };
    Helper.callService('post-service', {
            methodName: 'getPostByCategory',
            data: window.postConfig
        }, function(response) {
        document.querySelector('.news-wrapper').innerHTML = response && response.view;

        if (!response.existsMore) {
            if (!document.querySelector('.pagination-wrap').classList.contains('hidden')) {
                document.querySelector('.pagination-wrap').classList.add('hidden');
            }
        }
        else if (document.querySelector('.pagination-wrap').classList.contains('hidden')) {
            document.querySelector('.pagination-wrap').classList.remove('hidden');
        }

        window.postConfig.pageNumber++;
    })
}

global.showMoreClick = function(showMoreButton) {
    showMoreButton.preventDefault();

    let type = document.querySelector('[data-paginate]');
    if (!type) {
        return;
    }
    let data = type.getAttribute('data-paginate');

    if (showMores[data]) {
        showMores[data]();
    }
};
const showMores = {
    posts: function() {
        Helper.callService('post-service', {
            methodName: 'getPostByCategory',
            data: window.postConfig
        }, function(response) {
            document.querySelector('.news-wrapper')
                .insertAdjacentHTML('beforeend', response && response.view);
            if (!response.existsMore) {
                document.querySelector('.pagination-wrap').classList.add('hidden');
            }
            window.postConfig.pageNumber ++;
        })
    }
};

document.querySelectorAll('.rating-filter-button').forEach(function(item) {
    item.addEventListener('click', ratingFilter, true);
});

function ratingFilter(filterButton) {
    let button = filterButton.target;
    let pageMethod = button.getAttribute('data-page-method');
    const periodId = document.querySelector('[name="period"]')
        .slim.selected();

    Helper.callService('home/rating/get-personal', {
        methodName: pageMethod,
        data: {
            periodId: periodId
        }
    }, function(response) {
        updateTable('.rating-table table', response && response.view || '');
    })
}


export default function updateTable(selector, newHtml) {
    let oldTable = document.querySelector(selector);
    let wrapper = oldTable.parentElement;
    let header = oldTable.querySelectorAll('tr')[0];
    let newTable = document.createElement('table');
    let newBody= document.createElement('tbody');
    newBody.insertAdjacentElement('beforeEnd', header);
    newBody.insertAdjacentHTML('beforeEnd', newHtml);
    newTable.appendChild(newBody);
    wrapper.removeChild(oldTable);
    wrapper.insertAdjacentElement('afterBegin', newTable);
}
