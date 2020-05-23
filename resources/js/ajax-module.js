import {isExist} from "./delta-functions";
import $ from "jquery";


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


global.ratingFilter = function(filterButton) {
    let button = filterButton?.target || document.querySelector('.rating-filter-button');
    ;
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

document.querySelectorAll('.rating-filter-button').forEach(function(item) {
    item.addEventListener('click', global.ratingFilter, true);
});

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

global.ratingMethods = {
    universal: function(event, text) {
        let classList = event.target.classList;
        if (classList.contains('confirm')) {
            this.confirm(event);
        } else if (classList.contains('delete')) {
            this.delete(event);
        } else if (classList.contains('change')) {
            this.change(event);
        } else if (classList.contains('deny')) {
            this.deny(event);
        }
    },

    confirm: function(event) {
        let data = event.target.parentElement.getAttribute('data-item');
        data = JSON.parse(data);

        callModalConfirm(event, 'Підтвердити рейтинг?', function() {

            document.querySelector(`#confirm-form input[name="id"]`)
                .setAttribute('value', data.id);

            document.querySelector(`#confirm-form input[name="period-type-input"]`)
                .setAttribute('value', document.querySelector('[name="period-type"]').slim.selected());
            document.querySelector(`#confirm-form input[name="period-input"]`)
                .setAttribute('value', document.querySelector('[name="period"]').slim.selected());

            document.querySelector('#confirm-form')?.submit();;
        });
    },
    delete: function(event) {
        let data = event.target.parentElement.getAttribute('data-item');
        data = JSON.parse(data);

        callModalConfirm(event, 'Видалити рейтинг?', function() {

            document.querySelector(`#delete-form input[name="id"]`)
                .setAttribute('value', data.id);

            document.querySelector(`#delete-form input[name="period-type-input"]`)
                .setAttribute('value', document.querySelector('[name="period-type"]').slim.selected());
            document.querySelector(`#delete-form input[name="period-input"]`)
                .setAttribute('value', document.querySelector('[name="period"]').slim.selected());

            document.querySelector('#delete-form')?.submit();;
        });
    },
    change: function(event) {
        let data = event.target.parentElement.getAttribute('data-item');
        data = JSON.parse(data);

        $.fancybox.open({
            src: '#edit-rating',
            type: 'inline',
            opts: {
                afterShow: function (instance, current) {
                    let form = document.querySelector('#edit-rating');

                    for (let key in data) {
                        let input = document.querySelector(`#edit-form input[name=${key}]`);
                        let select = document.querySelector(`#edit-form select[name=${key}]`);
                        if (input) {
                            input.setAttribute('value', data[key]);
                        } else if (select) {
                            select.slim.set(data[key]);
                        }

                    }

                    document.querySelector(`#edit-form input[name="period-type-input"]`)
                        .setAttribute('value', document.querySelector('[name="period-type"]').slim.selected());
                    document.querySelector(`#edit-form input[name="period-input"]`)
                        .setAttribute('value', document.querySelector('[name="period"]').slim.selected());
                }
            }
        });
    },
    deny: function(event) {
        $.fancybox.open({
            src: '#deny-rating',
            type: 'inline',
        });
    }
}



global.callModalConfirm = function (event, text, yesCallback, noCalback) {
    event.preventDefault();

    let modalTemplate = `
    <div class="modal">
        <div class="modal-content">
            <p>${text}</p>
            <div class="modal-btn">
                <a href="#" class="main-btn modal-confirm">Підтвердити</a>
                <a href="#" class="main-btn light modal-reject" onclick="">Відмінити</a>
            </div>
       </div>
    </div>`;

    $.fancybox.open(
        modalTemplate,
        {
            afterShow: function (instance, current) {
                document.querySelector('.modal.fancybox-content .modal-confirm').addEventListener('click', function (e) {
                    e.preventDefault();
                    if (yesCallback) {
                        yesCallback();
                    }
                });
                document.querySelector('.modal.fancybox-content .modal-reject').addEventListener('click', function (e) {
                    e.preventDefault();
                    $.fancybox.close();
                    if (noCalback) {
                        noCalback();
                    }
                });
            }
        })



};



