


/*********************
 *** any addEventListener
 * @param {string | Element | NodeList} elements  - Function to execute when ready
 * @param {string} event - Event tpe
 * @param {function} callback - Execute function when triggered event
 * @returns {Element}
 *********************/
export const createEvent = (elements, event, callback) => {

    if (getElements(elements)) {
        getElements(elements).forEach((item) => {
            return item.addEventListener(event, callback, true);
        });
    }

};



export function isExist(elements, callback) {
    // if elements = its a "css sting"
    if (typeof elements === "string") {
        elements = document.querySelectorAll(elements);
    }

    if (!elements) return false;

    if (elements.length > 0) {
        return callback(elements);
    } else {
        return false;
    }
}

