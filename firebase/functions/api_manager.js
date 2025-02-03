const axios = require("axios").default;
const qs = require("qs");

async function _invitationSendGridCall(context, ffVariables) {
  var invitationId = ffVariables["invitationId"];
  var invitedEmail = ffVariables["invitedEmail"];
  var restaurantName = ffVariables["restaurantName"];
  var restaurantEmail = ffVariables["restaurantEmail"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    Authorization: `Bearer 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`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "from": {
    "email": "hello@ordernowpay.com"
  },
  "personalizations": [
    {
      "to": [
        {
          "email": "${invitedEmail}"
        }
      ],
      "dynamic_template_data": {
        "restaurantName": "${restaurantName}",
        "restaurantEmail": "${restaurantEmail}",
        "invitationId": "${invitationId}"
      }
    }
  ],
  "template_id": "d-457401c1053c4caea0efe60bb931624b"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _printTablesEmailCall(context, ffVariables) {
  var userId = ffVariables["userId"];
  var name = ffVariables["name"];
  var adress = ffVariables["adress"];
  var locality = ffVariables["locality"];
  var from = ffVariables["from"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    Authorization: `Bearer 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`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "from": {
    "email": "hello@ordernowpay.com"
  },
  "personalizations": [
    {
      "to": [
        {
          "email": "hello@ordernowpay.com"
        }
      ],
      "dynamic_template_data": {
        "userID": "${userId}",
        "name": "${name}",
        "adress": "${adress}",
        "locality": "${locality}"
      }
    }
  ],
  "template_id": "d-9ec477fbbe0c4830a76eec7314e5980f"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _factureRestaurantCall(context, ffVariables) {
  var orderId = ffVariables["orderId"];
  var date = ffVariables["date"];
  var total = ffVariables["total"];
  var netTotal = ffVariables["netTotal"];
  var emailTo = ffVariables["emailTo"];
  var iban = ffVariables["iban"];
  var beneficiaryName = ffVariables["beneficiaryName"];
  var beneficiaryAdress = ffVariables["beneficiaryAdress"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    Authorization: `Bearer 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`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "from": {
    "email": "hello@ordernowpay.com"
  },
  "personalizations": [
    {
      "to": [
        {
          "email": "${emailTo}"
        }
      ],
      "dynamic_template_data": {
        "IBAN": "${iban}",
        "beneficiaryName": "${beneficiaryName}",
        "beneficiaryAdress": "${beneficiaryAdress}",
        "orderId": "${orderId}",
        "date": "${date}",
        "total": "${total}",
        "netTotal": "${netTotal}"
      }
    }
  ],
  "template_id": "d-92bf947de0f1480d952ef1f168fc932d"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _welcomeEmailFRACall(context, ffVariables) {
  var name = ffVariables["name"];
  var restaurantName = ffVariables["restaurantName"];
  var adresse = ffVariables["adresse"];
  var codePostal = ffVariables["codePostal"];
  var email = ffVariables["email"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    Authorization: `Bearer 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`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "from": {
    "email": "hello@ordernowpay.com"
  },
  "personalizations": [
    {
      "to": [
        {
          "email": "${email}"
        }
      ],
      "dynamic_template_data": {
        "name": "${name}",
        "restaurantName": "${restaurantName}",
        "adresse": "${adresse}",
        "codePostal": "${codePostal}"
      }
    }
  ],
  "template_id": "d-05d692919bd448e597d4d809a36827ae"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _welcomeEmailDEUCall(context, ffVariables) {
  var name = ffVariables["name"];
  var restaurantName = ffVariables["restaurantName"];
  var adresse = ffVariables["adresse"];
  var codePostal = ffVariables["codePostal"];
  var email = ffVariables["email"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    Authorization: `Bearer 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`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "from": {
    "email": "hello@ordernowpay.com"
  },
  "personalizations": [
    {
      "to": [
        {
          "email": "${email}"
        }
      ],
      "dynamic_template_data": {
        "name": "${name}",
        "restaurantName": "${restaurantName}",
        "adresse": "${adresse}",
        "codePostal": "${codePostal}"
      }
    }
  ],
  "template_id": "d-b57b568a7e084664a96fcdce46bb2837"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _welcomeEmailENGCall(context, ffVariables) {
  var name = ffVariables["name"];
  var restaurantName = ffVariables["restaurantName"];
  var adresse = ffVariables["adresse"];
  var codePostal = ffVariables["codePostal"];
  var email = ffVariables["email"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    Authorization: `Bearer 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`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "from": {
    "email": "hello@ordernowpay.com"
  },
  "personalizations": [
    {
      "to": [
        {
          "email": "${email}"
        }
      ],
      "dynamic_template_data": {
        "name": "${name}",
        "restaurantName": "${restaurantName}",
        "adresse": "${adresse}",
        "codePostal": "${codePostal}"
      }
    }
  ],
  "template_id": "d-ab351c32a39e4712a23c46c76fac997a"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _welcomeEmailENGFreeUsersCall(context, ffVariables) {
  var name = ffVariables["name"];
  var email = ffVariables["email"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    Authorization: `Bearer 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`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "from": {
    "email": "hello@ordernowpay.com"
  },
  "personalizations": [
    {
      "to": [
        {
          "email": "${email}"
        }
      ],
      "dynamic_template_data": {
        "name": "${name}"
      }
    }
  ],
  "template_id": "d-809c04b71b8d46a0bfaf4d433a401baf"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _welcomeEmailFRAFreeUsersCall(context, ffVariables) {
  var name = ffVariables["name"];
  var email = ffVariables["email"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    Authorization: `Bearer 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`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "from": {
    "email": "hello@ordernowpay.com"
  },
  "personalizations": [
    {
      "to": [
        {
          "email": "${email}"
        }
      ],
      "dynamic_template_data": {
        "name": "${name}"
      }
    }
  ],
  "template_id": "d-353d068d22c24bb0a5ce1db74cd49f81"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _welcomeEmailDEUFreeUsersCall(context, ffVariables) {
  var name = ffVariables["name"];
  var email = ffVariables["email"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    Authorization: `Bearer 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`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "from": {
    "email": "hello@ordernowpay.com"
  },
  "personalizations": [
    {
      "to": [
        {
          "email": "${email}"
        }
      ],
      "dynamic_template_data": {
        "name": "${name}"
      }
    }
  ],
  "template_id": "d-097e6ff4d201461ba3c0c21e6d6d980b"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _factureStaffTipsCall(context, ffVariables) {
  var orderId = ffVariables["orderId"];
  var date = ffVariables["date"];
  var storeName = ffVariables["storeName"];
  var tips = ffVariables["tips"];
  var netTotal = ffVariables["netTotal"];
  var beneficiaryName = ffVariables["beneficiaryName"];
  var beneficiaryAdress = ffVariables["beneficiaryAdress"];
  var beneficiaryIBAN = ffVariables["beneficiaryIBAN"];
  var emailTo = ffVariables["emailTo"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    Authorization: `Bearer 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`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "from": {
    "email": "hello@ordernowpay.com"
  },
  "personalizations": [
    {
      "to": [
        {
          "email": "${emailTo}"
        }
      ],
      "dynamic_template_data": {
        "IBAN": "${beneficiaryIBAN}",
        "beneficiaryName": "${beneficiaryName}",
        "beneficiaryAdress": "${beneficiaryAdress}",
        "orderId": "${orderId}",
        "storeName": "${storeName}",
        "date": "${date}",
        "tips": "${tips}",
        "netTotal": "${netTotal}"
      }
    }
  ],
  "template_id": "d-b42733a1ce96404786679fcbe522f61d"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _getContactSendgridFreeUserCall(context, ffVariables) {
  var url = `https://api.sendgrid.com/v3/marketing/contacts`;
  var headers = {
    Authorization: `Bearer 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`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "contacts": [
    {
      "email": "lial@example.com",
      "first_name": "kaki",
      "last_name": "Osmani"
    }
  ]
}`;

  return makeApiRequest({
    method: "put",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

/// Helper functions to route to the appropriate API Call.

async function makeApiCall(context, data) {
  var callName = data["callName"] || "";
  var variables = data["variables"] || {};

  const callMap = {
    InvitationSendGridCall: _invitationSendGridCall,
    PrintTablesEmailCall: _printTablesEmailCall,
    FactureRestaurantCall: _factureRestaurantCall,
    WelcomeEmailFRACall: _welcomeEmailFRACall,
    WelcomeEmailDEUCall: _welcomeEmailDEUCall,
    WelcomeEmailENGCall: _welcomeEmailENGCall,
    WelcomeEmailENGFreeUsersCall: _welcomeEmailENGFreeUsersCall,
    WelcomeEmailFRAFreeUsersCall: _welcomeEmailFRAFreeUsersCall,
    WelcomeEmailDEUFreeUsersCall: _welcomeEmailDEUFreeUsersCall,
    FactureStaffTipsCall: _factureStaffTipsCall,
    GetContactSendgridFreeUserCall: _getContactSendgridFreeUserCall,
  };

  if (!(callName in callMap)) {
    return {
      statusCode: 400,
      error: `API Call "${callName}" not defined as private API.`,
    };
  }

  var apiCall = callMap[callName];
  var response = await apiCall(context, variables);
  return response;
}

async function makeApiRequest({
  method,
  url,
  headers,
  params,
  body,
  returnBody,
  isStreamingApi,
}) {
  return axios
    .request({
      method: method,
      url: url,
      headers: headers,
      params: params,
      responseType: isStreamingApi ? "stream" : "json",
      ...(body && { data: body }),
    })
    .then((response) => {
      return {
        statusCode: response.status,
        headers: response.headers,
        ...(returnBody && { body: response.data }),
        isStreamingApi: isStreamingApi,
      };
    })
    .catch(function (error) {
      return {
        statusCode: error.response.status,
        headers: error.response.headers,
        ...(returnBody && { body: error.response.data }),
        error: error.message,
      };
    });
}

const _unauthenticatedResponse = {
  statusCode: 401,
  headers: {},
  error: "API call requires authentication",
};

function createBody({ headers, params, body, bodyType }) {
  switch (bodyType) {
    case "JSON":
      headers["Content-Type"] = "application/json";
      return body;
    case "TEXT":
      headers["Content-Type"] = "text/plain";
      return body;
    case "X_WWW_FORM_URL_ENCODED":
      headers["Content-Type"] = "application/x-www-form-urlencoded";
      return qs.stringify(params);
  }
}

module.exports = { makeApiCall };
