export default (fn) => {
    return (request, response, next) => {
        return Promise.resolve(fn(request, response, next)).catch(next);
    };
}