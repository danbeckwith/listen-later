'use strict'

const axios = require('axios');

exports.handler = async event => {
    
    const response = {
        statusCode: 301,
        headers: {
            Location: 'https://accounts.spotify.com/en/authorize?client_id=6aa76e948d424e93b1262ed96a9e0e4d&response_type=code&redirect_uri=https://test-web-api-bucket.s3-eu-west-1.amazonaws.com/index.html'
        }
    };
    
    return response;

    // const res = await axios.get('https://accounts.spotify.com/en/authorize?client_id=6aa76e948d424e93b1262ed96a9e0e4d&response_type=code&redirect_uri=https://test-web-api-bucket.s3-eu-west-1.amazonaws.com/dummy.html');
    // // const body = JSON.stringify(res.data) 

    // // console.log(body);

    // return {
    //     "statusCode": 200,
    //     "headers": {
    //         "Content-Type": "application/json"
    //     },
    //     "body": res.data,
    //     "isBase64Encoded": false
    // };
};