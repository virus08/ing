module.exports = errorHandler;

function errorHandler(err, req, res, next) {
    if (typeof (err) === 'string') {
        // custom application error
        return res.status(400).json({error: true,message: err });
    }

    // default to 500 server error
    return res.status(500).json({error: true,message: err.message });
}